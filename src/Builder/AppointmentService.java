/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Builder;

import Builder.Appointment;
import Model.MySQL;
import java.sql.ResultSet;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import security.LoggedInUser;
import security.PatientDataSource;
import security.SecureDAOFactory;

public class AppointmentService {
    
    private PatientDataSource secureDao;
    
    

    // normalize "HH:mm" -> "HH:mm:ss"
    private String normalizeTime(String time) {
        if (time == null) return null;
        if (time.length() == 5) {
            LocalTime t = LocalTime.parse(time, DateTimeFormatter.ofPattern("HH:mm"));
            return t.format(DateTimeFormatter.ofPattern("HH:mm:ss"));
        }
        return time; // already HH:mm:ss
    }

    public boolean isSlotAvailable(String docAppId, String date, String time) throws Exception {
        String t = normalizeTime(time);
        ResultSet rs = MySQL.execute(
            "SELECT COUNT(*) AS c FROM `appoinment` " +
            "WHERE `doctor_app_id`='" + docAppId + "' " +
            "AND `date`='" + date + "' " +
            "AND `time`='" + t + "' " +
            "AND `appoinment_status`='BOOKED'"
        );
        if (rs.next()) {
            return rs.getInt("c") == 0;
        }
        return true;
    }

    public void book(Appointment ap) throws Exception {
        
        String username = "111";
        String role_s = "Doctor";

        LoggedInUser.setUser(username, role_s);

        this.secureDao = SecureDAOFactory.getDTO(LoggedInUser.getRole());
        
        
        // availability guard
        if (!isSlotAvailable(ap.getDocAppId(), ap.getDate(), ap.getTime())) {
            throw new IllegalStateException("Selected time slot is already booked");
        }

        secureDao.insertAppointment(ap.getDate(), ap.getTime(), ap.getDocAppId(), ap.getBranchId(), ap.getRoomId(), ap.getPatientId(), ap.getStatus(), ap.getReasonId(), ap.getDescription(), ap.getAppointmentId(), String.valueOf(ap.getPrice()));
        
    }
}
