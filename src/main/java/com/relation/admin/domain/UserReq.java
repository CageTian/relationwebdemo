package com.relation.admin.domain;

/**
 * Created by T.Cage on 2017/3/29.
 */
public class UserReq {
    private String username;
    private String reply_email;
    private String content;
    private String advisor;
    private String verifyCode;

    public String getVerifyCode() {
        return verifyCode;
    }

    public void setVerifyCode(String verifyCode) {
        this.verifyCode = verifyCode;
    }

    @Override
    public String toString() {
        return "UserReq{" +
                "username='" + username + '\'' +
                ", reply_email='" + reply_email + '\'' +
                ", content='" + content + '\'' +
                ", advisor='" + advisor + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getReply_email() {
        return reply_email;
    }

    public void setReply_email(String reply_email) {
        this.reply_email = reply_email;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAdvisor() {
        return advisor;
    }

    public void setAdvisor(String advisor) {
        this.advisor = advisor;
    }
}
