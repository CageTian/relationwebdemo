package com.relation.scholar.domain;

/**
 * Created by T.Cage on 2017/1/21.
 */
public class Scholar {
    private int advisee_id;
    private String advisee;
    private String advisor;
    private double possibility;

    public int getAdvisor_cop_times() {
        return advisor_cop_times;
    }

    public void setAdvisor_cop_times(int advisor_cop_times) {
        this.advisor_cop_times = advisor_cop_times;
    }

    private int advisor_cop_times;
    private int start_year;
    private int paper_start_year;
    private int paper_num;
    private int col_cop_times;
    private String institution;
    private String avantar;

    public String getAvantar() {
        return avantar;
    }

    public void setAvantar(String avantar) {
        this.avantar = avantar;
    }

    public int getStatue() {
        return statue;
    }

    public void setStatue(int statue) {
        this.statue = statue;
    }

    private int statue;//0:无tree无net，1：有tree无net，2：无tree有net，3：有tree有net
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
                ", advisee_cop_times="  +
                ", start_year=" + start_year +
                ", paper_start_year=" + paper_start_year +
                ", paper_num=" + paper_num +
                ", col_cop_times=" + col_cop_times +
                ", institution='" + institution + '\'' +
                '}';
    }

}
