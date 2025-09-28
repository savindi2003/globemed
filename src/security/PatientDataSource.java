/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package security;
import java.sql.ResultSet;
/**
 *
 * @author Savindi
 */
public interface PatientDataSource {
    
    //Patients Mng
    
    void insertPatient(String name, String dob, String gender, String mobile, String address, String regDate, int branch, String age) throws Exception;
    ResultSet loadPatients() throws Exception;
    ResultSet searchPatientsByName(String search) throws Exception;
    
    void updatePatient(int id, String name, String dob, String gender, String mobile,
                       String address,int branch, String age) throws Exception;

    ResultSet loadAppointments(int patientId) throws Exception;

    ResultSet loadDiagnoses(int patientId) throws Exception;

    ResultSet loadTreatments(int patientId) throws Exception;
    
    void addTreatment (int id, String date, String d_id, String name, String type, String description) throws Exception;
    void addDiagnoses (int patientId, String date, String test_type, String result, String description) throws Exception;
    
    //apointment
    ResultSet loadAppoinmrnts() throws Exception;
    
    ResultSet searchById(String query) throws Exception;
    ResultSet searchByName(String query) throws Exception;
    ResultSet searchByDoctor(String query) throws Exception;
    ResultSet searchByReason(String query) throws Exception;
    ResultSet searchByDate(String query) throws Exception;
    
    void insertAppointment(String date,String time,String doc_app_id,String branch_id,String room_id,String patient_id,String status,String reason_id,String description,String appointment_id,String fee) throws Exception;
    
    //bill
    ResultSet loadBills() throws Exception;
    ResultSet searchBills(String query) throws Exception;
    
    int insertBill(String total,String date,String time,String status,String app_id,String patiwnt_id,String base_amount,String extra_amount,String pre_amount,String Payment_method,String p_id,String s_id,String bill_no) throws Exception;
    
    //insurance
    void submitClaim(String claim_no,String provider_id,String policy_no,String billing_id,String total,String date,String nic,String relationship,String status) throws Exception;
    void updateClaimStatus(String claim_id,String status) throws Exception;
    ResultSet loadInsuranceList() throws Exception;
    ResultSet loadInsuranceDetails(String id) throws Exception;
    
    //satff management
    ResultSet loadAllStaff() throws Exception;
    ResultSet searchStaff(String query) throws Exception;
    void addNewStaff(String name,String mobile,int job_role_id,int department_id,int branch_id,String username,String date) throws Exception;
    void updateStaff(int id,String name,String mobile,int job_role_id,int department_id,int branch_id,String username) throws Exception;
    void setInactive(String id) throws Exception;
    
    //Permissions
    void addJobRole(String name , String parent_id) throws Exception;
    void deleteJobRole(String id) throws Exception;
    
    ResultSet loadPermissions() throws Exception;
    ResultSet searchPermissionByJobRole(int role_id) throws Exception;
    void insertPermission(int role_id,String id) throws Exception;
    void deletePermission(int role_id,String id) throws Exception;
    
    
    
}

