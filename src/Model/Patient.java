/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashMap;
import java.util.Map;
import patterns.PatientMemento;

public class Patient {
    
    private int id;
    private String name;
    private String age;
    private String gender;
    private String mobile;
    private String address;
    private String dob;
    private String ins_p;
    private String ins_no;
    private String nic;

    public Patient(int id, String name, String age, String gender, String mobile, String address, String dob) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.mobile = mobile;
        this.address = address;
        this.dob = dob;
        
    }

    public Patient() {
    }

    
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getIns_p() {
        return ins_p;
    }

    public void setIns_p(String ins_p) {
        this.ins_p = ins_p;
    }

    public String getIns_no() {
        return ins_no;
    }

    public void setIns_no(String ins_no) {
        this.ins_no = ins_no;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }
    
    
    public PatientMemento createSnapshot() {
        return new PatientMemento(id, name, age, gender, mobile, address, dob);
    }
    
    public void restore(PatientMemento m) {
        this.name = m.getName();
        this.age = m.getAge();
        this.gender = m.getGender();
        this.mobile = m.getMobile();
        this.address = m.getAddress();
        this.dob = m.getDob();
    }
    
    
    
}



