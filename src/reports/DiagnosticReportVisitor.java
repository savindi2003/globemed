/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

/**
 *
 * @author Savindi
 */
public class DiagnosticReportVisitor implements ReportVisitor {
    
    private StringBuilder sb = new StringBuilder();
    
    
    @Override
    public void visit(Patient patient) {
        System.out.println("\n==== Diagnostic Report ====");
        System.out.println("Patient: " + patient.getName());
        
        sb.append("\n==== Diagnostic Report ====\n");
        sb.append("Patient: ").append(patient.getName());
          
        
    }

    @Override
    public void visit(Treatment treatment) { /* skip */ }

    @Override
    public void visit(Diagnosis diagnosis) {
        System.out.println(" - Test: " + diagnosis.getTestType() +
                " | Result: " + diagnosis.getResult() +
                " | Date: " + diagnosis.getDate());
        
        sb.append(" Test: ").append(diagnosis.getTestType())
          .append(" | Result: ").append(diagnosis.getResult())
          .append(" | Date: ").append(diagnosis.getDate())
          .append("\n");
        
    }

    @Override
    public void visit(Billing billing) { /* skip */ }
    
    public String getReportText() {
        return sb.toString();
    }
}
