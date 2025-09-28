/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package patterns;


// Memento
public class PatientMemento {
    private final int id;
    private final String name;
    private final String age;
    private final String gender;
    private final String mobile;
    private final String address;
    private final String dob;
//    private final String ins_pro;
//    private final String ins_no;
//    private final String nic;

    public PatientMemento(int id, String name, String age, String gender, String mobile, String address, String dob) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.mobile = mobile;
        this.address = address;
        this.dob = dob;
        
    }

    
    // getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getAge() { return age; }
    public String getGender() { return gender; }
    public String getMobile() { return mobile; }
    public String getAddress() { return address; }
    public String getDob() { return dob; }

   
}

