/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

import java.util.ArrayList;
import java.util.List;


public class Patient implements ReportElement{
    
    private int patientId;
    private String name;
    
    private List<Treatment> treatments = new ArrayList<>();
    private List<Diagnosis> diagnoses = new ArrayList<>();
    private List<Billing> bills = new ArrayList<>();
    
    public Patient(int patientId, String name) {
        this.patientId = patientId;
        this.name = name;
        
    }
    
    public int getPatientId() { return patientId; }
    public String getName() { return name; }
    
    public void addTreatment(Treatment t) { treatments.add(t); }
    public void addDiagnosis(Diagnosis d) { diagnoses.add(d); }
    public void addBill(Billing b) { bills.add(b); }

    public List<Treatment> getTreatments() { return treatments; }
    public List<Diagnosis> getDiagnoses() { return diagnoses; }
    public List<Billing> getBills() { return bills; }

   

    @Override
    public void accept(ReportVisitor visitor) {
        visitor.visit(this);
        for (Treatment t : treatments) t.accept(visitor);
        for (Diagnosis d : diagnoses) d.accept(visitor);
        for (Billing b : bills) b.accept(visitor);
    }
    
    
}
