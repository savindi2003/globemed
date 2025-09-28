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
public class PatientRecordManager extends PatientRecord{
    public PatientRecordManager(PatientDataSource dataSource) {
        super(dataSource);
    }

    @Override
    public void addPatient(String name, String dob, String gender, String mobile,
                           String address, String regDate, int branch, String age) throws Exception {
        dataSource.insertPatient(name, dob, gender, mobile, address, regDate, branch, age);
    }

    @Override
    public ResultSet getPatients() throws Exception {
        return dataSource.loadPatients();
    }

    @Override
    public void editPatient(int id, String name, String dob, String gender, String mobile,
                            String address,int branch, String age) throws Exception {
        dataSource.updatePatient(id, name, dob, gender, mobile, address,branch, age);
    }


    public void insertPatient(String name, String birthdayStr, String gender, String mobile, String address, String registerd_date, int branch, String age) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet serchPatients(String search) throws Exception {
         return dataSource.searchPatientsByName(search);
    }

    @Override
    public ResultSet loadAppointments(int patientId) throws Exception {
        return dataSource.loadAppointments(patientId);
    }

    @Override
    public ResultSet loadDiagnoses(int patientId) throws Exception {
        return dataSource.loadDiagnoses(patientId);
    }

    @Override
    public ResultSet loadTreatments(int patientId) throws Exception {
        return dataSource.loadTreatments(patientId);
    }

    @Override
    public void addTreatment(int id, String date, String d_id, String name, String type, String description) throws Exception {
        dataSource.addTreatment(id, date, d_id, name, type, description);
    }

    @Override
    public void addDiagnoses(int patientId, String date, String test_type, String result, String description) throws Exception {
        dataSource.addDiagnoses(patientId, date, test_type, result, description);
    }
}
