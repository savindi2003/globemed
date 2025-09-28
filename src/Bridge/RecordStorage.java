/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Bridge;
import java.sql.ResultSet;
/**
 *
 * @author Savindi
 */
public interface RecordStorage {
    ResultSet loadPatients() throws Exception;
    void insertPatient(String name, String dob, String gender, String mobile,
                       String address, String registeredDate, int branch, String age) throws Exception;
    ResultSet loadAppointments(int patientId) throws Exception;

    ResultSet loadDiagnoses(int patientId) throws Exception;

    ResultSet loadTreatments(int patientId) throws Exception;
}
