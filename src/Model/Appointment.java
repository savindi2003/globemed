/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.time.LocalTime;

/**
 *
 * @author Savindi
 */
public class Appointment {
    
    int id;
    LocalTime time;
    int docAppId;
    String patientName;
    String patientMobile;
    String roomName;
    
    public Appointment(int id, LocalTime time, int docAppId, String patientName, String patientMobile, String roomName) {
        this.id = id;
        this.time = time;
        this.docAppId = docAppId;
        this.patientName = patientName;
        this.patientMobile = patientMobile;
        this.roomName = roomName;
    }
    
    
}
