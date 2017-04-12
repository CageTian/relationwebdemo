package com.relation.admin.service;

import com.relation.admin.Dao.UserReqDao;
import com.relation.admin.domain.UserReq;
import com.relation.pager.PageBean;
import com.relation.scholar.domain.Scholar;

import java.sql.SQLException;

/**
 * Created by T.Cage on 2017/3/29.
 */
public class UserReqService {
    private UserReqDao userReqDao=new UserReqDao();
    public void addUserReq(UserReq userReq){
       userReqDao.addUserReq(userReq);
    }
    public PageBean<UserReq> showAllMes(int pc){
        try {
            return userReqDao.showAllMes(pc);
        } catch (SQLException e) {
            throw new RuntimeException();
        }
    }
}
