package com.relation.admin.web.servlet;

import com.relation.admin.domain.UserReq;
import com.relation.admin.service.UserReqService;
import com.relation.pager.PageBean;
import com.relation.utils.BaseServlet;
import com.relation.utils.Common.CommonUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by T.Cage on 2017/3/29.
 */
@WebServlet(name = "UserReqServlet",urlPatterns = "/UserReqServlet")
public class UserReqServlet extends BaseServlet {
    private UserReqService userReqService = new UserReqService();

    public void feedback(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserReq userMes = CommonUtils.toBean(request.getParameterMap(), UserReq.class);
        Map<String, String> errors = validateRegist(userMes, request.getSession());
        if (errors.size() > 0) {
            request.setAttribute("form", userMes);
            request.setAttribute("errors", errors);
            //System.out.println("erro...");
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("/jsps/scholarInfo/feedback.jsp");
            requestDispatcher.forward(request, response);
            return;
        }

        userReqService.addUserReq(userMes);

        request.setAttribute("code", "success");
        request.setAttribute("msg", "feedback succes!we will get it done soon!");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/jsps/msg.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private Map<String, String> validateRegist(UserReq formUser, HttpSession session) {
        Map<String, String> errors = new HashMap<String, String>();

		/*
		 * 1. 校验email
		 */
        String email = formUser.getReply_email();
        if (email == null || email.trim().isEmpty()) {
            errors.put("email", "Email不能为空！");
        } else if (!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")) {
            errors.put("email", "Email格式错误！");
        }

		/*
		 * 2. 验证码校验
		 */
            String verifyCode = formUser.getVerifyCode();
            String vcode = (String) session.getAttribute("verCode");
            if (verifyCode == null || verifyCode.trim().isEmpty()) {
                errors.put("verifyCode", "验证码不能为空！");
            } else if (!verifyCode.equalsIgnoreCase(vcode)) {
                errors.put("verifyCode", "验证码错误！");
            }

            return errors;
        }
    public void adminLogin(){

    }
    private int getPageCount(HttpServletRequest request){
        int pc=1;
        String param=request.getParameter("pc");
        if(param!=null&&!param.trim().isEmpty()){
            try{
                pc=Integer.parseInt(param);
            }catch (RuntimeException e){}
        }
        return pc;
    }
    private String getUrl(HttpServletRequest req) {
        String url = req.getRequestURI() + "?" + req.getQueryString();
		/*
		 * 如果url中存在pc参数，截取掉，如果不存在那就不用截取。
		 */
        int index = url.lastIndexOf("&pc=");
        if(index != -1) {
            url = url.substring(0, index);
        }
        return url;
    }
    public void showAllMes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         /*
		 * 1. 得到pc：如果页面传递，使用页面的，如果没传，pc=1
		 */
        int pc = getPageCount(request);
		/*
		 * 2. 得到url：...
		 */
        String url = getUrl(request);
		/*
		 * 3. 获取查询条件，本方法就是cid，即分类的id
		 */
        //Scholar criteria = CommonUtils.toBean(request.getParameterMap(), Scholar.class);
		/*
		 * 4. 使用pc和cid调用service#findByCategory得到PageBean
		 */
        PageBean<UserReq> pb = userReqService.showAllMes(pc);
		/*
		 * 5. 给PageBean设置url，保存PageBean，转发到/jsps/book/list.jsp
		 */
        pb.setUrl(url);
        System.out.println("this url"+url);
        request.setAttribute("pb", pb);
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("/jsps/admin/message.jsp");
        requestDispatcher.forward(request,response);
    }
}

