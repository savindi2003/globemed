/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

/**
 *
 * @author Savindi
 */
public class Treatment implements ReportElement {
    private String type;
    private String description;
    private String date;

    public Treatment(String type, String description,String date) {
        this.type = type;
        this.description = description;
        this.date = date;
    }

    public String getType() { return type; }
    public String getDescription() { return description; }
    public String getDate() {
        return date;
    }

    @Override
    public void accept(ReportVisitor visitor) {
        visitor.visit(this);
    }

   

    
}
