package com.relation.scholar.dao;

import com.relation.pager.PageBean;
import com.relation.pager.sqlExpression;
import com.relation.scholar.domain.Scholar;
import com.relation.utils.JDBC.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.*;

import java.sql.SQLException;
import java.util.*;

/**
 * Created by T.Cage on 2017/1/21.
 */
public class ScholarDao{
    private QueryRunner qr = new TxQueryRunner();
    private PageBean<Scholar> findByCriteria(List<sqlExpression>exprList, int pageCount) throws SQLException {
        int pageSize=10;
        StringBuilder whereSql=new StringBuilder(" WHERE 1=1 ");
        List<Object> params=new ArrayList<Object>();
        for(sqlExpression expr:exprList){
            whereSql.append(" and ").append(expr.getName()).append(" ").append(expr.getOperator()).append(" ");
            if(!expr.getOperator().equals("is null")) {
                whereSql.append("?");
                params.add(expr.getValue());
            }
        }

        /*
		 * 3. 总记录数
		 */
        String sql = "select count(*) from mentorship" + whereSql;
        Number number = (Number)qr.query(sql, new ScalarHandler(), params.toArray());
        int totalRecord = number.intValue();//得到了总记录数
        System.out.println(totalRecord);
		/*
		 * 4. 得到beanList，即当前页记录
		 */
        sql = "select * from mentorship" + whereSql + " order by advisee limit ?,?";
        params.add((pageCount - 1) * pageSize);//当前页首行记录的下标
        params.add(pageSize);//一共查询几行，就是每页记录数

        List<Scholar> beanList = qr.query(sql, new BeanListHandler<Scholar>(Scholar.class),
                params.toArray());
        System.out.println(beanList);

		/*
		 * 5. 创建PageBean，设置参数
		 */
        PageBean<Scholar> pb = new PageBean<Scholar>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
        pb.setBeanList(beanList);
        pb.setPageCount(pageCount);
        pb.setPageSize(pageSize);
        pb.setTotalRecord(totalRecord);

        return pb;
    }
    /**
     * 按书名模糊查询
     * @param advisee
     * @param pc
     * @return
     * @throws SQLException
     */

    public PageBean<Scholar> findByAdvisee(String advisee, int pc) throws SQLException {
        List<sqlExpression> exprList = new ArrayList<sqlExpression>();
        exprList.add(new sqlExpression("advisee", "like", "%" + advisee + "%"));
        return findByCriteria(exprList, pc);
    }
    public Scholar  getScholarInfoByName(String bid) throws SQLException {
        String sql="SELECT * FROM mentorship WHERE bid=?";
        return qr.query(sql,new BeanHandler<Scholar>(Scholar.class),bid);
    }



    /**
     * 获得合作者List（所有合作者，合作时间）
     * @param advisor
     * @return
     * @throws SQLException
     */
    public List<Map<String, Object>> getCollaborator(String advisor) throws SQLException {

        String sql = "select * from collaborator WHERE all_author like ? or all_author like ? order by year DESC limit ?,?";
        //System.out.println(sql);
        List<Object> params=new ArrayList<Object>();
        params.add("%#"+advisor+"#%");
        params.add(advisor+"#%");
        params.add(0);
        params.add(20);
        List<Map<String, Object>> list  = qr.query(sql, new MapListHandler(), params.toArray());

        //System.out.println(list.size());
        return list;
    }

    /**
     * 数据库获得老师的所有学生list
     * @param advisor
     * @return
     */
    public List<String> getMentorship(String advisor) {
        String sql = "select * from mentorship where advisor= ? order by possibilities DESC";
        List<String>advisee_list=new ArrayList<String>();
        try {
            advisee_list= (List<String>) qr.query(sql, new ColumnListHandler(),advisor);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return advisee_list;
    }


    public List<Map<String,Object>> getCopLinkList(String[]cop_arr){
        List<Map<String,Object>>mapList=new ArrayList<Map<String, Object>>();
        for(int i=0;i<cop_arr.length-1;i++){
            for(int j=i+1;j<cop_arr.length;j++){
                Map<String,Object>map=new HashMap();
                map.put("source",cop_arr[i]);
                map.put("target",cop_arr[j]);
                map.put("value",4);
                mapList.add(map);
            }
        }
        //System.out.println(mapList);
        return mapList;
    }

    /**
     * 获得学者年份与发表论文数目
     * @param advisee
     * @return
     */
    public Map<String, Object> getPaperDetail(String advisee){
        String sql="select paper_detail from advisee where advisee=? ";
        try {
            return qr.query(sql,new MapHandler(),advisee);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 学者与其老师合作次数
     * @param advisee
     * @return
     */
    public Map<String, Object> getAdviseeCopDetail(String advisee){
        String sql="select advisor_cop_detail from advisee where advisee=? ";
        try {
            return qr.query(sql,new MapHandler(),advisee);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 学者与其合作者合作情况
     * @param advisee
     * @return
     */
    public Map<String, Object> getColCopDetail(String advisee){
        String sql="select col_cop_detail from advisee where advisee=? ";
        try {
            return qr.query(sql,new MapHandler(),advisee);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
