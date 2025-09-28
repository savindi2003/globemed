/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

/**
 *
 * @author Savindi
 */
public class Billing implements ReportElement {
    private double amount;
    private String date;
    private double service_amount;
    private double base_amount;
    private double pre_amount;
    private String datetime;
    private String paymenth_method;
    private String bill_number;
    private String reason;  //clinic... , 
    private String doctor; 
    private String appoinment_num; 

    public Billing(double amount, String date,double base_amount, double service_amount, double pre_amount, String datetime, String paymenth_method, String bill_number, String reason, String doctor, String appoinment_num) {
        this.amount = amount;
        this.date = date;
        this.base_amount = base_amount;
        this.service_amount = service_amount;
        this.pre_amount = pre_amount;
        this.datetime = datetime;
        this.paymenth_method = paymenth_method;
        this.bill_number = bill_number;
        this.reason = reason;
        this.doctor = doctor;
        this.appoinment_num = appoinment_num;
    }

    

//    public Billing(double amount, String date) {
//        this.amount = amount;
//        this.date = date;
//    }

    public double getAmount() { return amount; }
    public String getDate() { return date; }

    

    public double getService_amount() {
        return service_amount;
    }

    public double getPre_amount() {
        return pre_amount;
    }

    public String getDatetime() {
        return datetime;
    }

    public String getPaymenth_method() {
        return paymenth_method;
    }

    public String getBill_number() {
        return bill_number;
    }

    public String getReason() {
        return reason;
    }

    public String getDoctor() {
        return doctor;
    }

    public String getAppoinment_num() {
        return appoinment_num;
    }
    
    @Override
    public void accept(ReportVisitor visitor) {
        visitor.visit(this);
    }
}
