package com.relation.admin.Dao;

import com.relation.admin.domain.UserReq;
import com.relation.pager.PageBean;
import com.relation.scholar.domain.Scholar;
import com.relation.utils.JDBC.TxQueryRunner;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by T.Cage on 2017/3/22.
 */
public class UserReqDao {
    private QueryRunner qr = new TxQueryRunner();
    public PageBean<UserReq> showAllMes(int pageCount) throws SQLException {
        int pageSize = 2;
        /*
		 * 3. 总记录数
		 */
        String sql = "select count(*) from message" ;
        Number number = (Number)qr.query(sql, new ScalarHandler());
        int totalRecord = number.intValue();//得到了总记录数
		/*
		 * 4. 得到beanList，即当前页记录
		 */
        sql = "select * from message" + " order by time limit ?,?";

        List<Object> params=new ArrayList<Object>();
        params.add((pageCount - 1) * pageSize);//当前页首行记录的下标
        params.add(pageSize);//一共查询几行，就是每页记录数

        List<UserReq> beanList = qr.query(sql, new BeanListHandler<UserReq>(UserReq.class),
                params.toArray());

		/*
		 * 5. 创建PageBean，设置参数
		 */
        PageBean<UserReq> pb = new PageBean<UserReq>();
		/*
		 * 其中PageBean没有url，这个任务由Servlet完成
		 */
        pb.setBeanList(beanList);
        pb.setPageCount(pageCount);
        pb.setPageSize(pageSize);
        pb.setTotalRecord(totalRecord);

        return pb;
    }
    public void addUserReq(UserReq userReq){
        String sql="INSERT INTO message (time,username,reply_email,content,advisor) VALUES(?,?,?,?,?)";
        Object[] params={new Timestamp(Calendar.getInstance().getTime().getTime()),
                userReq.getUsername(),userReq.getReply_email(),userReq.getContent(),userReq.getAdvisor()};
        try {
            qr.update(sql, params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public int del_Info_Req(Scholar scholar){return 0;}
    public int upd_Info_Req(Scholar scholar){
        return 0;
    }
    public int del_Scho_Req(Scholar scholar){return 0;}
}
