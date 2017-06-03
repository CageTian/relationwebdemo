package com.relation.user.web.servlet;

import com.relation.user.domain.User;
import com.relation.user.service.UserException;
import com.relation.user.service.UserService;
import com.relation.utils.BaseServlet;
import com.relation.utils.Common.CommonUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by T.Cage on 2016/12/19.
 */
@WebServlet(name = "LoginServlet",urlPatterns = "/LoginServlet")
public class LoginServlet extends BaseServlet {
    private UserService userService=new UserService();
    /**
     * 修改密码　
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String updatePassword(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

		/*
		 * 1. 封装表单数据到user中
		 * 2. 从session中获取uid
		 * 3. 使用uid和表单中的oldPass和newPass来调用service方法
		 *   > 如果出现异常，保存异常信息到request中，转发到pwd.jsp
		 * 4. 保存成功信息到rquest中
		 * 5. 转发到msg.jsp
		 */
        User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
        User user = (User)req.getSession().getAttribute("sessionUser");
        // 如果用户没有登录，返回到登录页面，显示错误信息
        if(user == null) {
            req.setAttribute("msg", "您还没有登录！");
            System.out.println("您还没有登录！");
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/jsps/user/login.jsp");
            requestDispatcher.forward(req,resp);
            return "f:/jsps/user/login.jsp";
        }

        try {
            userService.updatePassword(user.getId(), formUser.getNewpassword(),
                    formUser.getPassword());
            req.setAttribute("msg", "修改密码成功");
            req.setAttribute("code", "success");
            System.out.println("修改密码成功");
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/jsps/msg.jsp");
            requestDispatcher.forward(req,resp);
            return "f:/jsps/msg.jsp";
        } catch (UserException e) {
            req.setAttribute("msg", e.getMessage());//保存异常信息到request
            req.setAttribute("user", formUser);//为了回显
            System.out.println(e.getMessage());
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/jsps/msg.jsp");
            requestDispatcher.forward(req,resp);
            return "f:/jsps/user/pwd.jsp";
        }
    }

    /**
     * 退出功能
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String logout(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getSession().invalidate();
        RequestDispatcher requestDispatcher=req.getRequestDispatcher("/jsps/welcome.jsp");
        requestDispatcher.forward(req,resp);
        return "r:/jsps/user/login.jsp";
    }

    /**
     * 登录功能
     * @param req
     * @param resp
     * @return
     * @throws ServletException
     * @throws IOException
     */
    public String login(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到User
		 * 2. 校验表单数据
		 * 3. 使用service查询，得到User
		 * 4. 查看用户是否存在，如果不存在：
		 *   * 保存错误信息：用户名或密码错误
		 *   * 保存用户数据：为了回显
		 *   * 转发到login.jsp
		 * 5. 如果存在，查看状态，如果状态为false：
		 *   * 保存错误信息：您没有激活
		 *   * 保存表单数据：为了回显
		 *   * 转发到login.jsp
		 * 6. 登录成功：
		 * 　　* 保存当前查询出的user到session中
		 *   * 保存当前用户的名称到cookie中，注意中文需要编码处理。
		 */
		/*
		 * 1. 封装表单数据到user
		 */
        User formUser = CommonUtils.toBean(req.getParameterMap(), User.class);
		/*
		 * 2. 校验
		 */
        Map<String,String> errors = validateLogin(formUser, req.getSession());
        if(errors.size() > 0) {
            req.setAttribute("form", formUser);
            req.setAttribute("errors", errors);
            System.out.println("loginerrors");
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/jsps/user/login.jsp");
            requestDispatcher.forward(req,resp);
            return "f:/jsps/user/login.jsp";
        }

		/*
		 * 3. 调用userService#login()方法
		 */
        User user = userService.login(formUser);
		/*
		 * 4. 开始判断
		 */
        if(user == null) {
            req.setAttribute("msg", "用户名或密码错误！");
            req.setAttribute("user", formUser);
            System.out.println("用户名或密码错误！");
            RequestDispatcher requestDispatcher=req.getRequestDispatcher("/jsps/user/login.jsp");
            requestDispatcher.forward(req,resp);
            return "f:/jsps/user/login.jsp";
        } else {
            if(user.getState()==0) {
                req.setAttribute("msg", "您还没有激活！");
                req.setAttribute("user", formUser);
                System.out.println("您还没有激活！");
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("/jsps/user/login.jsp");
                requestDispatcher.forward(req,resp);
                return "f:/jsps/user/login.jsp";
            } else {
                // 保存用户到session
                req.getSession().setAttribute("sessionUser", user);
                // 获取用户名保存到cookie中
                String loginname = user.getUsername();
                loginname = URLEncoder.encode(loginname, "utf-8");
                Cookie cookie = new Cookie("username", loginname);
                cookie.setMaxAge(60 * 60 * 24 * 10);//保存10天
                resp.addCookie(cookie);
                System.out.println("loginsccuess");
                RequestDispatcher requestDispatcher=req.getRequestDispatcher("/jsps/welcome.jsp");
                requestDispatcher.forward(req,resp);
                return "r:/index.jsp";//重定向到主页
            }
        }
    }

    /*
     * 登录校验方法，内容等你自己来完成
     */
    private Map<String,String> validateLogin(User formUser, HttpSession session) {
        Map<String,String> errors = new HashMap<String,String>();
        /*
		 * 1. 校验登录名
		 */
        String username = formUser.getUsername();
        if(username == null || username.trim().isEmpty()) {
            errors.put("username", "用户名不能为空！");
        } else if(username.length() < 3 || username.length() > 20) {
            errors.put("username", "用户名长度必须在3~20之间！");
        }

		/*
		 * 2. 校验登录密码
		 */
        String password = formUser.getPassword();
        if(password == null || password.trim().isEmpty()) {
            errors.put("password", "密码不能为空！");
        } else if(password.length() < 3 || password.length() > 20) {
            errors.put("password", "密码长度必须在3~20之间！");
        }
        /*
		 * 3. 验证码校验
		 */
        String verifyCode = formUser.getVerifyCode();
        String vcode = (String) session.getAttribute("verCode");
        if(verifyCode == null || verifyCode.trim().isEmpty()) {
            errors.put("verifyCode", "验证码不能为空！");
        } else if(!verifyCode.equalsIgnoreCase(vcode)) {
            errors.put("verifyCode", "验证码错误！");
        }
        return errors;
    }

}
