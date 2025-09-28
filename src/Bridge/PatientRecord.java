/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Bridge;
import java.sql.ResultSet;
import security.PatientDataSource;
/**
 *
 * @author Savindi
 */
public abstract  class PatientRecord {
    protected PatientDataSource dataSource;

    public PatientRecord(PatientDataSource dataSource) {
        this.dataSource = dataSource;
    }

    public abstract void addPatient(String name, String dob, String gender, String mobile,
                                    String address, String regDate, int branch, String age) throws Exception;

    public abstract ResultSet getPatients() throws Exception;

    public abstract void editPatient(int id, String name, String dob, String gender, String mobile,
                                     String address,int branch, String age) throws Exception;

    public abstract ResultSet loadAppointments(int patientId) throws Exception;

    public abstract ResultSet loadDiagnoses(int patientId) throws Exception;

    public abstract ResultSet loadTreatments(int patientId) throws Exception;
    
    
    public abstract ResultSet serchPatients(String search) throws Exception;
    
    public abstract void addTreatment(int patientId, String date, String d_id, String name,
                                    String type, String description) throws Exception;
    
    public abstract void addDiagnoses(int patientId, String date, String test_type,
                                    String result, String description) throws Exception;
}
