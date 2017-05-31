package com.relation.scholar.service;

import com.relation.pager.PageBean;
import com.relation.pager.sqlExpression;
import com.relation.scholar.dao.ScholarDao;
import com.relation.scholar.domain.Scholar;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.Test;
import java.sql.SQLException;
import java.util.*;

/**
 * Created by T.Cage on 2017/1/21.
 */
public class ScholarService {
    private ScholarDao scholarDao=new ScholarDao();
    public PageBean<Scholar>findByAdvisee(String advisee, int pc){
        try {
            return scholarDao.findByAdvisee(advisee,pc);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
    public Scholar getScholarInfo(int advisee_id){
        try {
            return scholarDao.getScholarInfoByName(advisee_id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 得到学者的多层关系树
     * @param level
     * @param advisor
     * @return
     */
    public JSONObject getMentorTree(int level, String advisor){
        JSONObject tree=new JSONObject();
        if(1>=level)
        {
            tree.put("name", advisor);
            List<JSONObject> lsjo=new LinkedList<JSONObject>();
            for(String as: scholarDao.getMentorship(advisor))
                lsjo.add(JSONObject.fromObject("{name:\""+as+"\"}"));
            tree.put("children", lsjo);
            return tree;
        }
        else
        {
            tree.put("name", advisor);
            List<JSONObject>lsjo=new LinkedList<JSONObject>();
            for(String as: scholarDao.getMentorship(advisor))
                lsjo.add(getMentorTree(--level,as));
            tree.put("children", lsjo);
            return tree;
        }
    }
    /**
     * 得到学者合作网
     * @param level
     * @param advisor
     * @return
     * @throws SQLException
     */
    public JSONObject getCollaboratorNet(int level,String advisor) {
        List<sqlExpression>exprList=new ArrayList<sqlExpression>();
        exprList.add(new sqlExpression("all_author","like","%#"+advisor+"#% or all_author like"+advisor+"#%"));
        List<Map<String, Object>> mapList= null;
        try {
            mapList = scholarDao.getCollaborator(advisor);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //Creat Link&nodes list
        List<Map<String,Object>> link=new ArrayList<Map<String, Object>>();
        List<Map<String,Object>> nodes=new ArrayList<Map<String, Object>>();

        for(Map<String, Object> map:mapList){
            String[] tmp=map.get("all_author").toString().split("#");
            for(String name:tmp){
                if(!advisor.equals(name))
                {
                    Map<String, Object>map1=new HashMap<String,Object>();
                    map1.put("id",name);
                    map1.put("group",5);
                    if(!nodes.contains(map1)){
                        nodes.add(map1);
                    }
                }
            }

            List<Map<String,Object>>tmp_link=scholarDao.getCopLinkList(tmp);
            //System.out.println(tmp_link);
            //去重（未考虑键值互换）value求值

            link.removeAll(tmp_link);
            link.addAll(tmp_link);
        }
        Map<String, Object>map2=new HashMap<String,Object>();
        map2.put("id",advisor);
        map2.put("group",1);
        nodes.add(map2);

        JSONObject jsonObject=new JSONObject();
        jsonObject.put("nodes", JSONArray.fromObject(nodes));
        jsonObject.put("links",JSONArray.fromObject(link));
        System.out.println(jsonObject);
        return jsonObject;

    }
    public JSONObject getCollaboratorCir(String advisor) {
        List<sqlExpression>exprList=new ArrayList<sqlExpression>();
        exprList.add(new sqlExpression("all_author","like","%"+advisor+"%"));
        List<Map<String, Object>> mapList= null;
        try {
            mapList = scholarDao.getCollaborator(advisor);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        //Creat Link&nodes list
        List<Map<String,Object>> link=new ArrayList<Map<String, Object>>();
        List<Map<String,Object>> nodes=new ArrayList<Map<String, Object>>();

        for(Map<String, Object> map:mapList){
            String[] tmp=map.get("all_author").toString().split("#");
            for(String name:tmp){
                if(!advisor.equals(name))
                {
                    Map<String, Object>map1=new HashMap<String,Object>();
                    map1.put("id",name);
                    map1.put("group",2);
                    if(!nodes.contains(map1)){
                        nodes.add(map1);

                        Map<String, Object>map3=new HashMap<String,Object>();
                        map3.put("source",advisor);
                        map3.put("target",name);
                        map3.put("value",3);
                        link.add(map3);

                    }
                }
            }
        }
        Map<String, Object>map2=new HashMap<String,Object>();
        map2.put("id",advisor);
        map2.put("group",1);
        nodes.add(map2);

        JSONObject jsonObject=new JSONObject();
        jsonObject.put("nodes", JSONArray.fromObject(nodes));
        jsonObject.put("links",JSONArray.fromObject(link));
        return jsonObject;
    }
    public JSONArray getPaperDetail(int advisee_id){
        JSONArray jsonArray=new JSONArray();
        Map map=scholarDao.getPaperDetail(advisee_id);
        String s=(String) map.get("paper_detail");
        String[] year=s.split(",");
        for(String y:year){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("year",y.substring(0,4));
            jsonObject.put("number",Integer.parseInt(y.substring(5)));
            jsonArray.add(jsonObject);
        }
        return jsonArray;//第一个jsonObeject是开始年份和总论文数
    }
    public JSONArray getAdvisorDetail(int advisee_id){
        JSONArray jsonArray=new JSONArray();
        Map map=scholarDao.getAdviseeCopDetail(advisee_id);
        String s=(String) map.get("advisor_cop_detail");
        String[] year=s.split(",");
        for(String y:year){
            JSONObject jsonObject=new JSONObject();
            jsonObject.put("year",y.substring(0,4));
            jsonObject.put("number",Integer.parseInt(y.substring(5)));
            jsonArray.add(jsonObject);
        }
        return jsonArray;
    }
    public JSONArray getColDetail(int advisee_id){
        JSONArray jsonArray=new JSONArray();
        Map map=scholarDao.getColCopDetail(advisee_id);
        String s=(String) map.get("col_cop_detail");
        String[] year=s.split(",");
        int count=0;
        for(String y:year){
            if(count<=20){
                count++;
                JSONObject jsonObject=new JSONObject();
                jsonObject.put("coworker",y.substring(0,y.indexOf(":")));
                jsonObject.put("times",Integer.parseInt(y.substring(y.indexOf(":")+1)));
                jsonArray.add(jsonObject);
            }
            else break;
        }
        return jsonArray;
    }

    /**
     * 获得学者合作圈
     * 未完成：合作次数
     * @param cop_name
     * @return
     * @throws SQLException
     */
    public JSONObject getCollaboratorCircle(String cop_name) throws SQLException {
        List<sqlExpression>exprList=new ArrayList<sqlExpression>();
        exprList.add(new sqlExpression("all_author","like","%"+cop_name+"%"));
        List<Map<String, Object>> mapList=scholarDao.getCollaborator(cop_name);

        Map<String,String> cop=new HashMap<String, String>();
        for(Map<String, Object> map:mapList){
            String[] tmp=map.get("all_author").toString().split("#");
            for(String name:tmp){
                if(!cop_name.equals(name))
                {
                    cop.put(name,map.get("year").toString().substring(0,4));
                }
            }
        }
        return JSONObject.fromObject(cop);
    }
    @Test
    public void MentorTreeTest(){
        System.out.println(getMentorTree(3,"feng xia"));
    }
    @Test
    public void copNetTest() throws SQLException {
        getCollaboratorNet(2,"Sanjeev Saxena");
    }
    @Test
    public void copCircleTest() throws SQLException {
        String name="feng xia";
        System.out.println(getCollaboratorCir(name));
    }
    @Test
    public void paperTest(){
        System.out.println(getColDetail(123));
    }
}
