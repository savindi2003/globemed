/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package reports;

/**
 *
 * @author Savindi
 */
public interface ReportVisitor {
    void visit(Patient patient);
    void visit(Treatment treatment);
    void visit(Diagnosis diagnosis);
    void visit(Billing billing);
}
