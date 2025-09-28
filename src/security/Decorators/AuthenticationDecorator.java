/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package security.Decorators;

import security.PatientDataSource;
import java.sql.ResultSet;

/**
 *
 * @author Savindi
 */
public class AuthenticationDecorator implements PatientDataSource {

    private final PatientDataSource wrappee;
    private final String currentRole;

    public AuthenticationDecorator(PatientDataSource wrappee, String role) {
        this.wrappee = wrappee;
        this.currentRole = role;
    }

    @Override
    public void insertPatient(String name, String dob, String gender, String mobile, String address, String regDate, int branch, String age) throws Exception {
        System.out.println("Current role" + currentRole);
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Doctor or Admin can insert new patients.");
        }
        wrappee.insertPatient(name, dob, gender, mobile, address, regDate, branch, age);
    }

    @Override
    public ResultSet loadPatients() throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can view patients.");
        }
        return wrappee.loadPatients();
    }

    @Override
    public void updatePatient(int id, String name, String dob, String gender, String mobile, String address, int branch, String age) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Doctor or Admin can update patient records.");
        }
        wrappee.updatePatient(id, name, dob, gender, mobile, address, branch, age);
    }

    @Override
    public ResultSet loadAppointments(int patientId) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can view appointments.");
        }
        return wrappee.loadAppointments(patientId);
    }

    @Override
    public ResultSet loadDiagnoses(int patientId) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can view diagnoses.");
        }
        return wrappee.loadDiagnoses(patientId);
    }

    @Override
    public ResultSet loadTreatments(int patientId) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can view treatments.");
        }
        return wrappee.loadTreatments(patientId);
    }

    @Override
    public ResultSet searchPatientsByName(String search) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can search patients.");
        }
        return wrappee.searchPatientsByName(search);
    }

    @Override
    public void addTreatment(int id, String date, String d_id, String name, String type, String description) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor or Nurse can add treatments.");
        }
        wrappee.addTreatment(id, date, d_id, name, type, description);
    }

    @Override
    public void addDiagnoses(int patientId, String date, String test_type, String result, String description) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor or Nurse can add diagnoses.");
        }
        wrappee.addDiagnoses(patientId, date, test_type, result, description);
    }

    @Override
    public ResultSet loadAppoinmrnts() throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Receptionist")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Receptionist can view all appointments.");
        }
        return wrappee.loadAppoinmrnts();
    }

    @Override
    public ResultSet searchById(String query) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can search patients by ID.");
        }
        return wrappee.searchById(query);
    }

    @Override
    public ResultSet searchByName(String query) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can search patients by Name.");
        }
        return wrappee.searchByName(query);
    }

    @Override
    public ResultSet searchByDoctor(String query) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can search patients by Doctor.");
        }
        return wrappee.searchByDoctor(query);
    }

    @Override
    public ResultSet searchByReason(String query) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can search patients by Reason.");
        }
        return wrappee.searchByReason(query);
    }

    @Override
    public ResultSet searchByDate(String query) throws Exception {
        if (!currentRole.equals("Doctor") && !currentRole.equals("Admin") && !currentRole.equals("Nurse")) {
            throw new SecurityException("Access Denied! Only Doctor/Admin/Nurse can search patients by Date.");
        }
        return wrappee.searchByDate(query);
    }

    @Override
    public ResultSet loadBills() throws Exception {
        if (!currentRole.equals("Admin") && !currentRole.equals("Receptionist")) {
            throw new SecurityException("Access Denied! Only Admin or Receptionist can view bills.");
        }
        return wrappee.loadBills();
    }

    @Override
    public ResultSet searchBills(String query) throws Exception {
        if (!currentRole.equals("Admin") && !currentRole.equals("Receptionist")) {
            throw new SecurityException("Access Denied! Only Admin or Receptionist can search bills.");
        }
        return wrappee.searchBills(query);
    }

    @Override
    public int insertBill(String total, String date, String time, String status, String app_id, String patiwnt_id, String base_amount, String extra_amount, String pre_amount, String Payment_method, String p_id, String s_id, String bill_no) throws Exception {
        if (!currentRole.equals("Admin") && !currentRole.equals("Receptionist")) {
            throw new SecurityException("Access Denied! Only Admin or Receptionist can insert bills.");
        }
        return wrappee.insertBill(total, date, time, status, app_id, patiwnt_id, base_amount, extra_amount, pre_amount, Payment_method, p_id, s_id, bill_no);
    }

    @Override
    public ResultSet loadInsuranceList() throws Exception {
        if (!currentRole.equals("Admin") && !currentRole.equals("Receptionist")) {
            throw new SecurityException("Access Denied! Only Admin or Receptionist can view insurance list.");
        }
        return wrappee.loadInsuranceList();
    }

    @Override
    public ResultSet loadInsuranceDetails(String id) throws Exception {
        if (!currentRole.equals("Admin") && !currentRole.equals("Receptionist")) {
            throw new SecurityException("Access Denied! Only Admin or Receptionist can view insurance details.");
        }
        return wrappee.loadInsuranceDetails(id);
    }

    @Override
    public ResultSet loadAllStaff() throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can view staff.");
        }
        return wrappee.loadAllStaff();
    }

    @Override
    public ResultSet searchStaff(String query) throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can search staff.");
        }
        return wrappee.searchStaff(query);
    }

    @Override
    public void addNewStaff(String name, String mobile, int job_role_id, int department_id, int branch_id, String username, String date) throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can add new staff.");
        }
        wrappee.addNewStaff(name, mobile, job_role_id, department_id, branch_id, username, date);
    }

    @Override
    public void updateStaff(int id, String name, String mobile, int job_role_id, int department_id, int branch_id, String username) throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can update staff details.");
        }
        wrappee.updateStaff(id, name, mobile, job_role_id, department_id, branch_id, username);
    }

    @Override
    public void setInactive(String id) throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can deactivate staff accounts.");
        }
        wrappee.setInactive(id);
    }

    @Override
    public void addJobRole(String name, String parent_id) throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can add job roles.");
        }
        wrappee.addJobRole(name, parent_id);
    }

    @Override
    public void deleteJobRole(String id) throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can delete job roles.");
        }
        wrappee.deleteJobRole(id);
    }

    @Override
    public ResultSet loadPermissions() throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can view permissions.");
        }
        return wrappee.loadPermissions();
    }

    @Override
    public ResultSet searchPermissionByJobRole(int role_id) throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can search permissions by job role.");
        }
        return wrappee.searchPermissionByJobRole(role_id);
    }

    @Override
    public void insertPermission(int role_id, String id) throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can insert permissions.");
        }
        wrappee.insertPermission(role_id, id);
    }

    @Override
    public void deletePermission(int role_id, String id) throws Exception {
        if (!currentRole.equals("Admin")) {
            throw new SecurityException("Access Denied! Only Admin can delete permissions.");
        }
        wrappee.deletePermission(role_id, id);
    }

    @Override
    public void insertAppointment(String date, String time, String doc_app_id, String branch_id, String room_id, String patient_id, String status, String reason_id, String description, String appointment_id, String fee) throws Exception {
        
        wrappee.insertAppointment(date, time, doc_app_id, branch_id, room_id, patient_id, status, reason_id, description, appointment_id, fee);
    }

    @Override
    public void submitClaim(String claim_no, String provider_id, String policy_no, String billing_id, String total, String date, String nic, String relationship, String status) throws Exception {
        wrappee.submitClaim(claim_no, provider_id, policy_no, billing_id, total, date, nic, relationship, status);
    }

    @Override
    public void updateClaimStatus(String claim_id, String status) throws Exception {
        wrappee.updateClaimStatus(claim_id, status);}

}
