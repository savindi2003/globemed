/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

/**
 *
 * @author Savindi
 */
public class FinancialReportVisitor implements ReportVisitor {
    
    private StringBuilder sb = new StringBuilder();
    private double total = 0;

    @Override
    public void visit(Patient patient) {
        System.out.println("\n==== Financial Report ====");
        System.out.println("Patient: " + patient.getName());
        
        sb.append("\n==== Financial Report ====\n");
        sb.append("Patient: ").append(patient.getName());
          
        
        
    }

    @Override
    public void visit(Treatment treatment) { /* skip */ }
    @Override
    public void visit(Diagnosis diagnosis) { /* skip */ }

    @Override
    public void visit(Billing billing) {
        total += billing.getAmount();
        System.out.println(" - Bill: " + billing.getAmount() + " (Date: " + billing.getPaymenth_method()+ ")");
        
        sb.append(" Bill No: ").append(billing.getBill_number())
          .append(" | Date: ").append(billing.getDate())
          .append(" | Amount: ").append(billing.getAmount())
          .append(" | Method: ").append(billing.getPaymenth_method())
          .append(" | Reason: ").append(billing.getReason())
          .append(" | Doctor: ").append(billing.getDoctor())
          .append("\n");

        total += billing.getAmount();
        
        
    }

    public void printTotal() {
        System.out.println("Total Billing: " + total);
    }
    
    public String getReportText() {
        sb.append("Total Amount: ").append(total).append("\n");
        return sb.toString();
    }
}
