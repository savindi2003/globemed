/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package security.Decorators;
import security.PatientDataSource;
import java.sql.ResultSet;
import java.util.Base64;
/**
 *
 * @author Savindi
 */
public class EncryptionDecorator implements PatientDataSource{
    private final PatientDataSource wrappee;

    public EncryptionDecorator(PatientDataSource wrappee) {
        this.wrappee = wrappee;
    }

    private String encrypt(String data) {
        return Base64.getEncoder().encodeToString(data.getBytes());
    }

    private String decrypt(String data) {
        return new String(Base64.getDecoder().decode(data));
    }

    @Override
    public void insertPatient(String name, String dob, String gender, String mobile, String address, String regDate, int branch, String age) throws Exception {
        // encrypt sensitive fields before saving
        wrappee.insertPatient(name, dob, gender, encrypt(mobile), encrypt(address), regDate, branch, age);
    }

    @Override
    public ResultSet loadPatients() throws Exception {
        ResultSet rs = wrappee.loadPatients();
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;
    }

    @Override
    public void updatePatient(int id, String name, String dob, String gender, String mobile, String address,int branch, String age) throws Exception {
        wrappee.updatePatient(id, name, dob, gender, encrypt(mobile), encrypt(address), branch, age);
    }

    @Override
    public ResultSet loadAppointments(int patientId) throws Exception {
        ResultSet rs = wrappee.loadAppointments(patientId);
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;
    }

    @Override
    public ResultSet loadDiagnoses(int patientId) throws Exception {
        ResultSet rs = wrappee.loadDiagnoses(patientId);
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;
    }

    @Override
    public ResultSet loadTreatments(int patientId) throws Exception {
        ResultSet rs = wrappee.loadTreatments(patientId);
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;
    }

    @Override
    public ResultSet searchPatientsByName(String search) throws Exception {
        ResultSet rs = wrappee.searchPatientsByName(search);
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;
    
    }

    @Override
    public void addTreatment(int id, String date, String d_id, String name, String type, String description) throws Exception {
      wrappee.addTreatment(id, date, d_id, name, type, description);
    }

    @Override
    public void addDiagnoses(int patientId, String date, String test_type, String result, String description) throws Exception {
        wrappee.addDiagnoses(patientId, date, test_type, result, description);
    }

    @Override
    public ResultSet loadAppoinmrnts() throws Exception {
        ResultSet rs = wrappee.loadAppoinmrnts();
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;
    }

    @Override
    public ResultSet searchById(String query) throws Exception {
        ResultSet rs = wrappee.searchById(query);
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;}

    @Override
    public ResultSet searchByName(String query) throws Exception {
        ResultSet rs = wrappee.searchByName(query);
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;}
    @Override
    public ResultSet searchByDoctor(String query) throws Exception {
        ResultSet rs = wrappee.searchByDoctor(query);
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;}

    @Override
    public ResultSet searchByReason(String query) throws Exception {
        ResultSet rs = wrappee.searchByReason(query);
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;}
    @Override
    public ResultSet searchByDate(String query) throws Exception {
        ResultSet rs = wrappee.searchByDate(query);
        // Normally you'd decrypt after fetching → Here you can decrypt inside UI loadTable()
        return rs;}

    @Override
    public void insertAppointment(String date, String time, String doc_app_id, String branch_id, String room_id, String patient_id, String status, String reason_id, String description, String appointment_id, String fee) throws Exception {
       wrappee.insertAppointment(date, time, doc_app_id, branch_id, room_id, patient_id, status, reason_id, description, appointment_id, fee);
    }

    @Override
    public ResultSet loadBills() throws Exception {
        ResultSet rs = wrappee.loadBills();
        return rs;
    }

    @Override
    public ResultSet searchBills(String query) throws Exception {
        ResultSet rs = wrappee.searchBills(query);
        return rs;
    }

    @Override
    public int insertBill(String total, String date, String time, String status, String app_id, String patiwnt_id, String base_amount, String extra_amount, String pre_amount, String Payment_method, String p_id, String s_id, String bill_no) throws Exception {
        int rs = wrappee.insertBill(total, date, time, status, app_id, patiwnt_id, base_amount, extra_amount, pre_amount, Payment_method, p_id, s_id, bill_no);
        return rs;
    }

    @Override
    public void submitClaim(String claim_no, String provider_id, String policy_no, String billing_id, String total, String date, String nic, String relationship, String status) throws Exception {
       wrappee.submitClaim(claim_no, provider_id, encrypt(policy_no), billing_id, total, date, encrypt(nic), encrypt(relationship), status);
    }

    @Override
    public void updateClaimStatus(String claim_id, String status) throws Exception {
        wrappee.updateClaimStatus(claim_id, status);
    }

    @Override
    public ResultSet loadInsuranceList() throws Exception {
        return wrappee.loadInsuranceList();
    }

    @Override
    public ResultSet loadInsuranceDetails(String id) throws Exception {
        return wrappee.loadInsuranceDetails(id);
    }

    
    //Staff Management
    
    @Override
    public ResultSet loadAllStaff() throws Exception {
        return wrappee.loadAllStaff();
    }

    @Override
    public ResultSet searchStaff(String query) throws Exception {
        return wrappee.searchStaff(query);
    }

    @Override
    public void addNewStaff(String name, String mobile, int job_role_id, int department_id, int branch_id, String username, String date) throws Exception {
        wrappee.addNewStaff(name, mobile, job_role_id, department_id, branch_id, encrypt(username), date);
    }

    @Override
    public void updateStaff(int id, String name, String mobile, int job_role_id, int department_id, int branch_id, String username) throws Exception {
        wrappee.updateStaff(id, name, mobile, job_role_id, department_id, branch_id, encrypt(username));
    }

    @Override
    public void setInactive(String id) throws Exception {
        wrappee.setInactive(id);
    }
    
    //Permissions

    @Override
    public void addJobRole(String name, String parent_id) throws Exception {
        wrappee.addJobRole(name, parent_id);
    }

    @Override
    public void deleteJobRole(String id) throws Exception {
        wrappee.deleteJobRole(id);
    }

    @Override
    public ResultSet loadPermissions() throws Exception {
        return wrappee.loadPermissions();
    }

    @Override
    public ResultSet searchPermissionByJobRole(int role_id) throws Exception {
        return wrappee.searchPermissionByJobRole(role_id);
    }

    @Override
    public void insertPermission(int role_id, String id) throws Exception {
        wrappee.insertPermission(role_id, id);
    }

    @Override
    public void deletePermission(int role_id, String id) throws Exception {
        wrappee.deletePermission(role_id, id);
    }
    
}
