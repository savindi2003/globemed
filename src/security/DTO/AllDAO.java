package security.DTO;

import java.sql.ResultSet;
import security.PatientDataSource;
import Model.MySQL;
import Bridge.RecordStorage;
import security.PatientDataSource;

/**
 *
 * @author Savindi
 */
public class AllDAO implements PatientDataSource {

    //Patient Mng
    
    @Override
    public void insertPatient(String name, String dob, String gender, String mobile, String address, String regDate, int branch, String age) throws Exception {

        MySQL.execute("INSERT INTO `patient` (`name`,`dob`,`gender`,`mobile`,`address`,`registerd_date`,`branch_id`,`age`) "
                + "VALUES ('" + name + "' , '" + dob + "' , '" + gender + "','" + mobile + "','" + address + "','" + regDate + "','" + branch + "','" + age + "') ");

    }

    @Override
    public ResultSet loadPatients() throws Exception {
        return MySQL.execute("SELECT * FROM `patient` "
                + "INNER JOIN `branch` ON `patient`.`branch_id` = `branch`.`id`");

    }

    @Override
    public void updatePatient(int id, String name, String dob, String gender, String mobile, String address, int branch, String age) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet loadAppointments(int patientId) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet loadDiagnoses(int patientId) throws Exception {
        return MySQL.execute("SELECT  `diagnosis`.`date` AS `diagnosis_date`, `diagnosis`.`testType`, `diagnosis`.`result`, `diagnosis`.`description`"
                + " FROM `diagnosis` WHERE `patient_id`='" + patientId + "'");
    }

    @Override
    public ResultSet loadTreatments(int patientId) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ResultSet searchPatientsByName(String search) throws Exception {
        return MySQL.execute("SELECT * FROM `patient` "
                + "INNER JOIN `branch` ON `patient`.`branch_id` = `branch`.`id` WHERE `patient`.`name` LIKE '%" + search + "%'");

    }

    @Override
    public void addTreatment(int id, String date, String d_id, String name, String type, String description) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void addDiagnoses(int patientId, String date, String test_type, String result, String description) throws Exception {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    //apointmnets
    @Override
    public ResultSet loadAppoinmrnts() throws Exception {
        return MySQL.execute("SELECT  * FROM `appoinment` "
                + "INNER JOIN `reasons` ON `appoinment`.`reason_id` = `reasons`.`id` "
                + "INNER JOIN `doctor_app` ON `doctor_app`.`id` = `appoinment`.`doctor_app_id` "
                + "INNER JOIN `staff` ON `doctor_app`.`doc_id` = `staff`.`id` "
                + "INNER JOIN `patient` ON `patient`.`id` = `appoinment`.`patient_id` "
                + "INNER JOIN `room` ON `room`.`id` = `appoinment`.`room_id`");
    }

    @Override
    public ResultSet searchById(String query) throws Exception {
        return MySQL.execute("SELECT  * FROM `appoinment` "
                + "INNER JOIN `reasons` ON `appoinment`.`reason_id` = `reasons`.`id` "
                + "INNER JOIN `doctor_app` ON `doctor_app`.`id` = `appoinment`.`doctor_app_id` "
                + "INNER JOIN `staff` ON `doctor_app`.`doc_id` = `staff`.`id` "
                + "INNER JOIN `patient` ON `patient`.`id` = `appoinment`.`patient_id` "
                + "INNER JOIN `room` ON `room`.`id` = `appoinment`.`room_id` WHERE `appoinment`.`appoinment_id` LIKE '%" + query + "%' ");
    }

    @Override
    public ResultSet searchByName(String query) throws Exception {
        return MySQL.execute("SELECT  * FROM `appoinment` "
                + "INNER JOIN `reasons` ON `appoinment`.`reason_id` = `reasons`.`id` "
                + "INNER JOIN `doctor_app` ON `doctor_app`.`id` = `appoinment`.`doctor_app_id` "
                + "INNER JOIN `staff` ON `doctor_app`.`doc_id` = `staff`.`id` "
                + "INNER JOIN `patient` ON `patient`.`id` = `appoinment`.`patient_id` "
                + "INNER JOIN `room` ON `room`.`id` = `appoinment`.`room_id` WHERE `patient`.`name` LIKE '%" + query + "%' ");
    }

    @Override
    public ResultSet searchByDoctor(String query) throws Exception {
        return MySQL.execute("SELECT  * FROM `appoinment` "
                + "INNER JOIN `reasons` ON `appoinment`.`reason_id` = `reasons`.`id` "
                + "INNER JOIN `doctor_app` ON `doctor_app`.`id` = `appoinment`.`doctor_app_id` "
                + "INNER JOIN `staff` ON `doctor_app`.`doc_id` = `staff`.`id` "
                + "INNER JOIN `patient` ON `patient`.`id` = `appoinment`.`patient_id` "
                + "INNER JOIN `room` ON `room`.`id` = `appoinment`.`room_id` WHERE `doctor_app`.`doc_id` = '" + query + "' ");
    }

    @Override
    public ResultSet searchByReason(String query) throws Exception {
        return MySQL.execute("SELECT  * FROM `appoinment` "
                + "INNER JOIN `reasons` ON `appoinment`.`reason_id` = `reasons`.`id` "
                + "INNER JOIN `doctor_app` ON `doctor_app`.`id` = `appoinment`.`doctor_app_id` "
                + "INNER JOIN `staff` ON `doctor_app`.`doc_id` = `staff`.`id` "
                + "INNER JOIN `patient` ON `patient`.`id` = `appoinment`.`patient_id` "
                + "INNER JOIN `room` ON `room`.`id` = `appoinment`.`room_id` WHERE `appoinment`.`reason_id` = '" + query + "' ");
    }

    @Override
    public ResultSet searchByDate(String query) throws Exception {
        return MySQL.execute("SELECT  * FROM `appoinment` "
                + "INNER JOIN `reasons` ON `appoinment`.`reason_id` = `reasons`.`id` "
                + "INNER JOIN `doctor_app` ON `doctor_app`.`id` = `appoinment`.`doctor_app_id` "
                + "INNER JOIN `staff` ON `doctor_app`.`doc_id` = `staff`.`id` "
                + "INNER JOIN `patient` ON `patient`.`id` = `appoinment`.`patient_id` "
                + "INNER JOIN `room` ON `room`.`id` = `appoinment`.`room_id` WHERE `appoinment`.`date` = '" + query + "' ");
    }

    @Override
    public void insertAppointment(String date, String time, String doc_app_id, String branch_id, String room_id, String patient_id, String status, String reason_id, String description, String appointment_id, String fee) throws Exception {
      String sql = "INSERT INTO `appoinment` " +
                "(`date`,`time`,`doctor_app_id`,`branch_id`,`room_id`,`patient_id`,`appoinment_status`,`reason_id`,`description`,`appoinment_id`,`fee`) " +
                "VALUES ('" + date + "','" + time + "','" + doc_app_id + "','" + branch_id + "','" +
                room_id + "','" + patient_id + "','" + status + "','" + reason_id + "','" +
                description + "','" + appointment_id + "','" + fee + "')";
        MySQL.execute(sql);  
    }
    
    //Billing

    @Override
    public ResultSet loadBills() throws Exception {
        return MySQL.execute("SELECT * FROM `billing`  "
                    + "INNER JOIN `appoinment` ON `billing`.`appoinment_id` = `appoinment`.`id` "
                    + "INNER JOIN `patient` ON `patient`.`id` = `billing`.`patient_id`");
    }

    @Override
    public ResultSet searchBills(String query) throws Exception {
        return MySQL.execute("SELECT * FROM `billing`  "
                    + "INNER JOIN `appoinment` ON `billing`.`appoinment_id` = `appoinment`.`id` "
                    + "INNER JOIN `patient` ON `patient`.`id` = `billing`.`patient_id` WHERE "+query);
    
    }

    @Override
    public int insertBill(String total, String date, String time, String status, String app_id, String patiwnt_id, String base_amount, String extra_amount, String pre_amount, String Payment_method, String p_id, String s_id, String bill_no) throws Exception {
      String billingSql = "INSERT INTO `billing` (`total_amount`,`billing_date`,`billing_time`,`status`,`appoinment_id`,`patient_id`,`base_amount`,`extra_amount`,`pre_amount`,`payment_method`,`prescription_id`,`services_id`,`bill_number`) "
                    + "VALUES ('" + total + "',"
                    + "'" + date + "',"
                    + "'" + time + "' ,"
                    + "'" + status + "',"
                    + "'" + app_id + "',"
                    + "'" + patiwnt_id + "',"
                    + "'" + base_amount + "',"
                    + "'" + extra_amount + "',"
                    + "'" + pre_amount + "',"
                    + "'" + Payment_method + "',"
                    + "'" + p_id + "',"
                    + "'" + s_id + "',"
                    + "'" + bill_no + "') ";
            
            int new_billing_id = MySQL.executeInsert(billingSql);
            
            return new_billing_id;
    }
    
    //Insurance

    @Override
    public void submitClaim(String claim_no, String provider_id, String policy_no, String billing_id, String total, String date, String nic, String relationship, String status) throws Exception {
        MySQL.execute("INSERT INTO `insurance_claim` (`claim_number`,`insurancepro_id`,`policy_number`,`billing_id`,`amount`,`date`,`p_nic`,`p_relationship`,`approval_status`) "
                    + "VALUES ('" + claim_no + "',"
                    + "'" + provider_id + "',"
                    + "'" + policy_no + "' ,"
                    + "'" + billing_id + "',"
                    + "'" + total + "',"
                    + "'" + date + "',"
                    + "'" + nic + "',"
                    + "'" + relationship + "',"
                    + "'"+status+"') ");
    }

    @Override
    public void updateClaimStatus(String claim_id, String status) throws Exception{
        MySQL.execute("UPDATE `insurance_claim` SET `approval_status` ='" + status + "' WHERE `id`='" + claim_id + "' ");
        
    }

    @Override
    public ResultSet loadInsuranceList() throws Exception {
        return MySQL.execute("SELECT * FROM `insurance_claim` "
                    + "INNER JOIN `insurance_providers` ON `insurance_providers`.`id` = `insurance_claim`.`insurancepro_id`");
    }

    @Override
    public ResultSet loadInsuranceDetails(String id) throws Exception {
     return MySQL.execute("SELECT * FROM `appoinment`  "
                    + "INNER JOIN `reasons` ON `reasons`.`id` = `appoinment`.`reason_id` "
                    + "INNER JOIN `room` ON `room`.`id` = `appoinment`.`room_id` "
                    + "INNER JOIN `doctor_app` ON `doctor_app`.`id` = `appoinment`.`doctor_app_id` "
                    + "INNER JOIN `staff` ON `staff`.`id` = `doctor_app`.`doc_id` "
                    + "INNER JOIN `branch` ON `branch`.`id` = `appoinment`.`branch_id` "
                    + "INNER JOIN `billing` ON `billing`.`appoinment_id` =  `appoinment`.`id` "
                    + "INNER JOIN `patient` ON `appoinment`.`patient_id` = `patient`.`id` "
                    + "INNER JOIN `insurance_claim` ON `insurance_claim`.`billing_id` = `billing`.`id` "
                    + "WHERE `insurance_claim`.`id` = '"+id+"'");   
    }

    //Staff 
    
    @Override
    public ResultSet loadAllStaff() throws Exception {
        return MySQL.execute("SELECT * FROM `staff` "
                + "INNER JOIN `branch` ON `staff`.`branch_id` = `branch`.`id` "
                    + "INNER JOIN `department` ON `staff`.`department_id` = `department`.`id` "
                    + "INNER JOIN `job_role` ON `staff`.`job_role_id` = `job_role`.`id` WHERE `staff`.`status` = 'ACTIVE' ");
    }

    @Override
    public ResultSet searchStaff(String query) throws Exception {
        return MySQL.execute("SELECT * FROM `staff`  "
                    + "INNER JOIN `branch` ON `staff`.`branch_id` = `branch`.`id` "
                    + "INNER JOIN `department` ON `staff`.`department_id` = `department`.`id` "
                    + "INNER JOIN `job_role` ON `staff`.`job_role_id` = `job_role`.`id` "+query);
    }

    @Override
    public void addNewStaff(String name, String mobile, int job_role_id, int department_id, int branch_id, String username, String date) throws Exception {
        MySQL.execute("INSERT INTO `staff` (`name`,`mobile`,`job_role_id`,`department_id`,`branch_id`,`username`,`registerd_date`) "
                        + "VALUES ('" + name + "' , '" + mobile + "' , '" + job_role_id + "','" + department_id + "','" + branch_id + "','" + username + "','" + date + "')");

    }

    @Override
    public void updateStaff(int id, String name, String mobile, int job_role_id, int department_id, int branch_id, String username) throws Exception {
        MySQL.execute(" UPDATE `staff` SET "
                        + " `name` = '" + name + "' , "
                        + "`mobile` = '" + mobile + "' , "
                        + "`job_role_id` = '" + job_role_id + "' , "
                        + "`department_id` = '" + department_id + "' ,"
                        + " `branch_id` = '" + branch_id + "' , "
                        + "`username` = '" + username + "' WHERE `id` = '" + id + "'  ");
    }

    @Override
    public void setInactive(String id)throws Exception {
        MySQL.execute(" UPDATE `staff` SET "
                    + "`status` = 'INACTIVE' WHERE `id` = '" + id + "'  ");
    }
    
    //Permissions

    @Override
    public void addJobRole(String name, String parent_id) throws Exception {
        MySQL.execute("INSERT INTO `job_role` (`name`,`parent_id`) VALUES ('" + name + "','"+parent_id+"') ");
    }

    @Override
    public void deleteJobRole(String id) throws Exception {
        MySQL.execute("DELETE FROM `job_role` WHERE `id` = '" + id + "' ");
    }

    @Override
    public ResultSet loadPermissions() throws Exception {
        return MySQL.execute("SELECT * FROM `permissions`");
    }

    @Override
    public ResultSet searchPermissionByJobRole(int role_id) throws Exception {
        return MySQL.execute("SELECT * FROM `role_permission` "
                    + "INNER JOIN `permissions` ON `permissions`.`id` = `role_permission`.`permission_id` "
                    + "WHERE `role_permission`.`role_id` = '" + role_id + "'");
    }

    @Override
    public void insertPermission(int role_id, String id) throws Exception {
        MySQL.execute("INSERT INTO `role_permission` (`role_id`,`permission_id`) VALUES ('" + role_id + "','"+id+"') ");
    }

    @Override
    public void deletePermission(int role_id, String id) throws Exception {
        MySQL.execute("DELETE FROM `role_permission` WHERE `role_id` = '" + role_id + "' AND `permission_id` = '" + id + "' ");
    }
    

}
