package com.relation.scholar.domain;

/**
 * Created by T.Cage on 2017/1/21.
 */
public class Scholar {
    private int advisee_id;
    private String advisee;
    private String advisor;
    private double possibility;
    private int advisee_cop_times;
    private int start_year;
    private int paper_start_year;
    private int paper_num;
    private int col_cop_times;
    private String institution;

    public int getAdvisee_id() {
        return advisee_id;
    }


    public void setAdvisee_id(int advisee_id) {
        this.advisee_id = advisee_id;
    }

    public String getAdvisee() {
        return advisee;
    }

    public void setAdvisee(String advisee) {
        this.advisee = advisee;
    }

    public String getAdvisor() {
        return advisor;
    }

    public void setAdvisor(String advisor) {
        this.advisor = advisor;
    }

    public double getPossibility() {
        return possibility;
    }

    public void setPossibility(double possibility) {
        this.possibility = possibility;
    }

    public int getAdvisee_cop_times() {
        return advisee_cop_times;
    }

    public void setAdvisee_cop_times(int advisee_cop_times) {
        this.advisee_cop_times = advisee_cop_times;
    }

    public int getStart_year() {
        return start_year;
    }

    public void setStart_year(int start_year) {
        this.start_year = start_year;
    }

    public int getPaper_start_year() {
        return paper_start_year;
    }

    public void setPaper_start_year(int paper_start_year) {
        this.paper_start_year = paper_start_year;
    }

    public int getPaper_num() {
        return paper_num;
    }

    public void setPaper_num(int paper_num) {
        this.paper_num = paper_num;
    }

    public int getCol_cop_times() {
        return col_cop_times;
    }

    public void setCol_cop_times(int col_cop_times) {
        this.col_cop_times = col_cop_times;
    }

    public String getInstitution() {
        return institution;
    }

    public void setInstitution(String institution) {
        this.institution = institution;
    }

    @Override
    public String toString() {
        return "Scholar{" +
                "advisee_id=" + advisee_id +
                ", advisee='" + advisee + '\'' +
                ", advisor='" + advisor + '\'' +
                ", possibility=" + possibility +
                ", advisee_cop_times=" + advisee_cop_times +
                ", start_year=" + start_year +
                ", paper_start_year=" + paper_start_year +
                ", paper_num=" + paper_num +
                ", col_cop_times=" + col_cop_times +
                ", institution='" + institution + '\'' +
                '}';
    }

}
