/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package security.Decorators;

import java.sql.ResultSet;
import security.PatientDataSource;
import Model.MySQL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
/**
 *
 * @author Savindi
 */
public class LoggingDecorator implements PatientDataSource {

    private final PatientDataSource wrappee;

    public LoggingDecorator(PatientDataSource wrappee) {
        this.wrappee = wrappee;
    }

    // 🔑 Reusable logger
    private void log(String message) throws Exception {
        String currentTime = java.time.LocalDateTime.now()
                .format(java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        // Console log
        System.out.println(message + " at " + currentTime);

        // DB log
        MySQL.execute("INSERT INTO `logs` (`description`,`datetime`) "
                + "VALUES ('" + message + " at " + currentTime + "','" + currentTime + "')");
    }

    @Override
    public void insertPatient(String name, String dob, String gender, String mobile,
                              String address, String regDate, int branch, String age) throws Exception {
        log("[LOG] Insert Patient -> " + name);
        wrappee.insertPatient(name, dob, gender, mobile, address, regDate, branch, age);
    }

    @Override
    public ResultSet loadPatients() throws Exception {
        log("[LOG] Load all patients");
        return wrappee.loadPatients();
    }

    @Override
    public void updatePatient(int id, String name, String dob, String gender,
                              String mobile, String address, int branch, String age) throws Exception {
        log("[LOG] Update Patient -> " + name);
        wrappee.updatePatient(id, name, dob, gender, mobile, address, branch, age);
    }

    @Override
    public ResultSet loadAppointments(int patientId) throws Exception {
        log("[LOG] Load appointments for patientId = " + patientId);
        return wrappee.loadAppointments(patientId);
    }

    @Override
    public ResultSet loadDiagnoses(int patientId) throws Exception {
        log("[LOG] Load diagnoses for patientId = " + patientId);
        return wrappee.loadDiagnoses(patientId);
    }

    @Override
    public ResultSet loadTreatments(int patientId) throws Exception {
        log("[LOG] Load treatments for patientId = " + patientId);
        return wrappee.loadTreatments(patientId);
    }

    @Override
    public ResultSet searchPatientsByName(String search) throws Exception {
        log("[LOG] Search patients by name -> " + search);
        return wrappee.searchPatientsByName(search);
    }

    @Override
    public void addTreatment(int id, String date, String d_id, String name,
                             String type, String description) throws Exception {
        log("[LOG] Add treatment for patientId = " + id);
        wrappee.addTreatment(id, date, d_id, name, type, description);
    }

    @Override
    public void addDiagnoses(int patientId, String date, String test_type,
                             String result, String description) throws Exception {
        log("[LOG] Add diagnosis for patientId = " + patientId);
        wrappee.addDiagnoses(patientId, date, test_type, result, description);
    }

    @Override
    public ResultSet loadAppoinmrnts() throws Exception {
        log("[LOG] Load all appointments");
        return wrappee.loadAppoinmrnts();
    }

    @Override
    public ResultSet searchById(String query) throws Exception {
        log("[LOG] Search appointments by ID -> " + query);
        return wrappee.searchById(query);
    }

    @Override
    public ResultSet searchByName(String query) throws Exception {
        log("[LOG] Search appointments by patient name -> " + query);
        return wrappee.searchByName(query);
    }

    @Override
    public ResultSet searchByDoctor(String query) throws Exception {
        log("[LOG] Search appointments by doctor -> " + query);
        return wrappee.searchByDoctor(query);
    }

    @Override
    public ResultSet searchByReason(String query) throws Exception {
        log("[LOG] Search appointments by reason -> " + query);
        return wrappee.searchByReason(query);
    }

    @Override
    public ResultSet searchByDate(String query) throws Exception {
        log("[LOG] Search appointments by date -> " + query);
        return wrappee.searchByDate(query);
    }

    @Override
    public void insertAppointment(String date, String time, String doc_app_id,
                                  String branch_id, String room_id, String patient_id,
                                  String status, String reason_id, String description,
                                  String appointment_id, String fee) throws Exception {
        log("[LOG] Insert appointment ID = " + appointment_id);
        wrappee.insertAppointment(date, time, doc_app_id, branch_id, room_id,
                patient_id, status, reason_id, description, appointment_id, fee);
    }

    @Override
    public ResultSet loadBills() throws Exception {
        log("[LOG] Load all bills");
        return wrappee.loadBills();
    }

    @Override
    public ResultSet searchBills(String query) throws Exception {
        log("[LOG] Search bills by -> " + query);
        return wrappee.searchBills(query);
    }

    @Override
    public int insertBill(String total, String date, String time, String status,
                          String app_id, String patient_id, String base_amount,
                          String extra_amount, String pre_amount, String payment_method,
                          String p_id, String s_id, String bill_no) throws Exception {
        log("[LOG] Insert bill no = " + bill_no);
        return wrappee.insertBill(total, date, time, status, app_id, patient_id,
                base_amount, extra_amount, pre_amount, payment_method, p_id, s_id, bill_no);
    }

    @Override
    public void submitClaim(String claim_no, String provider_id, String policy_no,
                            String billing_id, String total, String date, String nic,
                            String relationship, String status) throws Exception {
        log("[LOG] Submit insurance claim = " + claim_no);
        wrappee.submitClaim(claim_no, provider_id, policy_no, billing_id, total, date, nic, relationship, status);
    }

    @Override
    public void updateClaimStatus(String claim_id, String status) throws Exception {
        log("[LOG] Update claim " + claim_id + " to status " + status);
        wrappee.updateClaimStatus(claim_id, status);
    }

    @Override
    public ResultSet loadInsuranceList() throws Exception {
        log("[LOG] Load insurance list");
        return wrappee.loadInsuranceList();
    }

    @Override
    public ResultSet loadInsuranceDetails(String id) throws Exception {
        log("[LOG] Load insurance details for id = " + id);
        return wrappee.loadInsuranceDetails(id);
    }

    @Override
    public ResultSet loadAllStaff() throws Exception {
        log("[LOG] Load all staff");
        return wrappee.loadAllStaff();
    }

    @Override
    public ResultSet searchStaff(String query) throws Exception {
//        log("[LOG] Search staff by -> " + query);
        return wrappee.searchStaff(query);
    }

    @Override
    public void addNewStaff(String name, String mobile, int job_role_id,
                            int department_id, int branch_id, String username,
                            String date) throws Exception {
        log("[LOG] Add new staff -> " + name);
        wrappee.addNewStaff(name, mobile, job_role_id, department_id, branch_id, username, date);
    }

    @Override
    public void updateStaff(int id, String name, String mobile, int job_role_id,
                            int department_id, int branch_id, String username) throws Exception {
        log("[LOG] Update staff -> " + name);
        wrappee.updateStaff(id, name, mobile, job_role_id, department_id, branch_id, username);
    }

    @Override
    public void setInactive(String id) throws Exception {
        log("[LOG] Set inactive staff ID = " + id);
        wrappee.setInactive(id);
    }

    @Override
    public void addJobRole(String name, String parent_id) throws Exception {
        log("[LOG] Add job role -> " + name);
        wrappee.addJobRole(name, parent_id);
    }

    @Override
    public void deleteJobRole(String id) throws Exception {
        log("[LOG] Delete job role ID = " + id);
        wrappee.deleteJobRole(id);
    }

    @Override
    public ResultSet loadPermissions() throws Exception {
        log("[LOG] Load all permissions");
        return wrappee.loadPermissions();
    }

    @Override
    public ResultSet searchPermissionByJobRole(int role_id) throws Exception {
        log("[LOG] Load permissions for role_id = " + role_id);
        return wrappee.searchPermissionByJobRole(role_id);
    }

    @Override
    public void insertPermission(int role_id, String id) throws Exception {
        log("[LOG] Insert permission " + id + " for role_id = " + role_id);
        wrappee.insertPermission(role_id, id);
    }

    @Override
    public void deletePermission(int role_id, String id) throws Exception {
        log("[LOG] Delete permission " + id + " for role_id = " + role_id);
        wrappee.deletePermission(role_id, id);
    }
}
