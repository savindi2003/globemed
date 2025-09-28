/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Builder;



public class Appointment {
    private final String appointmentId;
    private final String patientId;
    private final String doctorId;
    private final String date;        // yyyy-MM-dd
    private final String time;        // HH:mm:ss
    private final String docAppId;    // doctor_app table id
    private final String branchId;
    private final String roomId;
    private final String status;      // BOOKED / Canceled / Pause / Done
    private final String reasonId;    // appointment type id
    private final String description;
    private final double price;

    private Appointment(Builder b) {
        this.appointmentId = b.appointmentId;
        this.patientId = b.patientId;
        this.doctorId = b.doctorId;
        this.date = b.date;
        this.time = b.time;
        this.docAppId = b.docAppId;
        this.branchId = b.branchId;
        this.roomId = b.roomId;
        this.status = b.status;
        this.reasonId = b.reasonId;
        this.description = b.description;
        this.price = b.price;
    }

    public static class Builder {
        private String appointmentId;
        private String patientId;
        private String doctorId;
        private String date;
        private String time;
        private String docAppId;
        private String branchId;
        private String roomId;
        private String status = "BOOKED";
        private String reasonId;
        private String description;
        private double price = 0.0;

        public Builder appointmentId(String id) { this.appointmentId = id; return this; }
        public Builder patient(String id)       { this.patientId = id; return this; }
        public Builder doctor(String id)        { this.doctorId = id; return this; }
        public Builder date(String d)           { this.date = d; return this; }
        public Builder time(String t)           { this.time = t; return this; }
        public Builder docApp(String id)        { this.docAppId = id; return this; }
        public Builder branch(String id)        { this.branchId = id; return this; }
        public Builder room(String id)          { this.roomId = id; return this; }
        public Builder status(String s)         { this.status = s; return this; }
        public Builder reason(String id)        { this.reasonId = id; return this; }
        public Builder description(String d)    { this.description = d; return this; }
        public Builder price(double p)          { this.price = p; return this; }

        public Appointment build() {
            if (patientId == null || patientId.isEmpty())
                throw new IllegalStateException("Patient is required");
            if (doctorId == null || doctorId.isEmpty())
                throw new IllegalStateException("Doctor is required");
            if (date == null || date.isEmpty())
                throw new IllegalStateException("Date is required");
            if (time == null || time.isEmpty())
                throw new IllegalStateException("Time is required");
            if (docAppId == null || docAppId.isEmpty() || "0".equals(docAppId))
                throw new IllegalStateException("Invalid doctor appointment (doc_app_id)");
            if (branchId == null || branchId.isEmpty() || "0".equals(branchId))
                throw new IllegalStateException("Invalid branch");
            if (roomId == null || roomId.isEmpty() || "0".equals(roomId))
                throw new IllegalStateException("Invalid room");
            if (reasonId == null || reasonId.isEmpty() || "0".equals(reasonId))
                throw new IllegalStateException("Invalid reason/type");
            if (description == null || description.isEmpty())
                throw new IllegalStateException("Description is required");

            if (appointmentId == null || appointmentId.isEmpty()) {
                appointmentId = String.valueOf(System.currentTimeMillis());
            }
            return new Appointment(this);
        }
    }

    public String getAppointmentId() { return appointmentId; }
    public String getPatientId() { return patientId; }
    public String getDoctorId() { return doctorId; }
    public String getDate() { return date; }
    public String getTime() { return time; }
    public String getDocAppId() { return docAppId; }
    public String getBranchId() { return branchId; }
    public String getRoomId() { return roomId; }
    public String getStatus() { return status; }
    public String getReasonId() { return reasonId; }
    public String getDescription() { return description; }
    public double getPrice() { return price; }

    @Override
    public String toString() {
        return "Appointment{" +
                "appointmentId='" + appointmentId + '\'' +
                ", patientId='" + patientId + '\'' +
                ", doctorId='" + doctorId + '\'' +
                ", date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", docAppId='" + docAppId + '\'' +
                ", branchId='" + branchId + '\'' +
                ", roomId='" + roomId + '\'' +
                ", status='" + status + '\'' +
                ", reasonId='" + reasonId + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                '}';
    }
}

