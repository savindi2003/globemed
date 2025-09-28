/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Bridge;

import java.sql.ResultSet;
import Model.MySQL;

/**
 *
 * @author Savindi
 */
public class MySQLPatientDAO implements security.PatientDataSource {

    @Override
    public void insertPatient(String name, String dob, String gender, String mobile,
            String address, String regDate, int branch, String age) throws Exception {
        MySQL.execute("INSERT INTO `patient` (`name`,`dob`,`gender`,`mobile`,`address`,`registerd_date`,`branch_id`,`age`) "
                + "VALUES ('" + name + "' , '" + dob + "' , '" + gender + "','" + mobile + "','"
                + address + "','" + regDate + "','" + branch + "','" + age + "') ");
    }

    @Override
    public ResultSet loadPatients() throws Exception {
        return MySQL.execute("SELECT * FROM `patient` "
                + "INNER JOIN `branch` ON `patient`.`branch_id` = `branch`.`id`");
    }

    @Override
    public void updatePatient(int id, String name, String dob, String gender, String mobile,
            String address,int branch, String age) throws Exception {
        MySQL.execute("UPDATE `patient` SET "
                + "`name`='" + name + "',"
                + "`dob`='" + dob + "',"
                + "`gender`='" + gender + "',"
                + "`mobile`='" + mobile + "',"
                + "`address`='" + address + "',"
                + "`branch_id`='" + branch + "',"
                + "`age`='" + age + "' "
                + "WHERE `id`='" + id + "'");
    }

    @Override
    public ResultSet searchPatientsByName(String search) throws Exception {
        return MySQL.execute("SELECT * FROM `patient` "
                + "INNER JOIN `branch` ON `patient`.`branch_id` = `branch`.`id` WHERE `patient`.`name` LIKE '%" + search + "%'");

    }
    
   


    @Override
    public ResultSet loadDiagnoses(int patientId) throws Exception {
        return MySQL.execute(
                "SELECT diagnosis.id AS id, "
                + "diagnosis.date AS diagnosis_date, "
                + "diagnosis.testType AS testType, "
                + "diagnosis.result AS result, "
                + "diagnosis.description AS description "
                + "FROM diagnosis "
                + "WHERE diagnosis.patient_id='" + patientId + "'"
        );
    }

    @Override
    public ResultSet loadTreatments(int patientId) throws Exception {
        return MySQL.execute(
                "SELECT treatment.id AS id, "
                + "treatment.date AS treat_date, "
                + "treatment.name AS treat_name, "
                + "treatment.type AS treat_type, "
                + "treatment.description AS treat_description "
                + "FROM treatment "
                + "WHERE treatment.patient_id='" + patientId + "'"
        );
    }

    @Override
    public ResultSet loadAppointments(int patientId) throws Exception {
        return MySQL.execute(
                "SELECT appoinment.id AS appoinment_id, "
                + "appoinment.date AS app_date, "
                + "appoinment.time AS app_time, "
                + "reasons.name AS reason_name, "
                + "staff.name AS staff_name "
                + "FROM appoinment "
                + "INNER JOIN reasons ON appoinment.reason_id = reasons.id "
                + "INNER JOIN doctor_app ON doctor_app.id = appoinment.doctor_app_id "
                + "INNER JOIN staff ON doctor_app.doc_id = staff.id "
                + "WHERE appoinment.patient_id='" + patientId + "'"
        );
    }

    @Override
    public void addTreatment(int id, String date, String d_id, String name, String type, String description) throws Exception {
        MySQL.execute("INSERT INTO `treatment` (`date`,`patient_id`,`doctor_id`,`name`,`type`,`description`) "
                        + "VALUES ('" + date + "' , '" + id + "' , '" + d_id + "','" + name + "','"+type+"','" + description + "') ");

    }

    @Override
    public void addDiagnoses(int patientId, String date, String test_type, String result, String description) throws Exception {
        MySQL.execute("INSERT INTO `diagnosis` (`date`,`patient_id`,`testType`,`result`,`description`) "
                        + "VALUES ('" + date + "' , '" + patientId + "' , '" + test_type + "','" + result + "','" + description + "') ");

    }

    @Override
    public ResultSet loadAppoinmrnts() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet searchById(String query) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet searchByName(String query) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet searchByDoctor(String query) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet searchByReason(String query) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet searchByDate(String query) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insertAppointment(String date, String time, String doc_app_id, String branch_id, String room_id, String patient_id, String status, String reason_id, String description, String appointment_id, String fee) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet loadBills() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet searchBills(String query) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public int insertBill(String total, String date, String time, String status, String app_id, String patiwnt_id, String base_amount, String extra_amount, String pre_amount, String Payment_method, String p_id, String s_id, String bill_no) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void submitClaim(String claim_no, String provider_id, String policy_no, String billing_id, String total, String date, String nic, String relationship, String status) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updateClaimStatus(String claim_id, String status) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet loadInsuranceList() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet loadInsuranceDetails(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet loadAllStaff() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet searchStaff(String query) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void addNewStaff(String name, String mobile, int job_role_id, int department_id, int branch_id, String username, String date) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void updateStaff(int id, String name, String mobile, int job_role_id, int department_id, int branch_id, String username) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void setInactive(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void addJobRole(String name, String parent_id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void deleteJobRole(String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet loadPermissions() throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet searchPermissionByJobRole(int role_id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insertPermission(int role_id, String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void deletePermission(int role_id, String id) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
