/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

/**
 *
 * @author Savindi
 */
public class TreatmentSummaryReportVisitor implements ReportVisitor {
    private StringBuilder sb = new StringBuilder();
    
    @Override
    public void visit(Patient patient) {
        System.out.println("\n==== Treatment Summary Report ====");
        System.out.println("Patient: " + patient.getName() + " (DOB: " + patient.getPatientId()+ ")");
        
        sb.append("\n==== Treatment Summary Report ====\n");
        sb.append("Patient: ").append(patient.getName())
          .append(" (DOB: ").append(patient.getPatientId()).append(")\n");
    }

    @Override
    public void visit(Treatment treatment) {
        System.out.println(" Treatment: " + treatment.getType() + " (" + treatment.getDescription() + ")");
        
         sb.append(" - Treatment: ").append(treatment.getType())
          .append(" (").append(treatment.getDescription()).append(")\n");
         
    }

    @Override
    public void visit(Diagnosis diagnosis) { /* skip */ }
    @Override
    public void visit(Billing billing) { /* skip */ }
    
    public String getReportText() {
        return sb.toString();
    }
}
