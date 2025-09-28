/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

/**
 *
 * @author Savindi
 */
public class Diagnosis implements ReportElement {
    private String testType;
    private String result;
    private String date;

    public Diagnosis(String testType, String result, String date) {
        this.testType = testType;
        this.result = result;
        this.date = date;
    }

    public String getTestType() { return testType; }
    public String getResult() { return result; }
    public String getDate() { return date; }

    @Override
    public void accept(ReportVisitor visitor) {
        visitor.visit(this);
    }

}
