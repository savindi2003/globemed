# 🏥 Globemed - Healthcare Management System (Java SE)

[![Platform](https://img.shields.io/badge/platform-Desktop-blue)]()
[![Language](https://img.shields.io/badge/language-Java-orange)]()
[![Database](https://img.shields.io/badge/database-MySQL-green)]()
[![Reporting](https://img.shields.io/badge/reports-JasperReports-purple)]()
[![Design](https://img.shields.io/badge/design-OO_Design_Patterns-lightgrey)]()
[![License](https://img.shields.io/badge/license-MIT-blue)]()

**GlobeMed** Healthcare Management System is a robust Java SE-based desktop application designed for secure and efficient management of patient data and clinical operations.

The core distinction of this project lies in its strict adherence to **Object-Oriented Design Patterns (OODP)**. This approach ensures maximum modularity, flexibility, and security, particularly in handling diverse data access methods and applying layered security controls.

---

## ✨ Features

- 👨‍⚕️ Patient registration and record management  
- 📅 Appointment scheduling and tracking  
- 💰 Billing and payment management  
- 📊 Generate patient, billing, and appointment reports using **JasperReports**  
- 🔍 Search patients by name, ID, or date  
- 🗃️ Store all data in **MySQL Database**  
- 🧾 Printable invoices and medical summaries

---

## 🛠️ Tech Stack

| Component | Technology |
|------------|-------------|
| Language | Java SE |
| Database | MySQL (`globemed_db`) |
| Reporting Tool | JasperReports |
| IDE | NetBeans |
| UI Framework | Java Swing |

---

## ⚙️ Requirements

- ✅ **JDK 17** or higher  
- ✅ **MySQL Server**  
- ✅ **NetBeans IDE** (or IntelliJ IDEA)  
- ✅ **JasperReports** library configured  
- ✅ Database created (use provided `.sql` file if available)

---

## 🚀 Setup & Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/Globemed.git

   ```
2. Create the MySQL database `globemed_db` . Import `globemed_db.sq`l file if provided.
   
4. Update database connection in Java code:
   ```bash
   String url = "jdbc:mysql://localhost:3306/globemed_db";
   String user = "root";
   String password = "yourpassword";
   ```
5. Build and run the application.

---

## 🧩 Design Patterns

**Globemed** is built following **Object-Oriented Design Principles** and uses **Design Patterns** to ensure clean, maintainable, and scalable code.  

 ### 🩺 Patient Record Management (Bridge Pattern)
 
- This part uses the Bridge Pattern to decouple the UI and business logic from different data storage implementations (**MySQL, Cloud, File**).
It allows flexible switching between data sources without changing the core logic.
Additionally, the Decorator Pattern is applied to add authentication, encryption, and logging features for enhanced data security.

 ### 🧩 Managing Roles & Permissions (Composite Pattern)
 
- Used the Composite Design Pattern to manage medical staff roles and permissions.
Each role (Doctor, Nurse, Receptionist, Admin) has its own permissions and inherits from a parent role.

 ### 🏗️ Appointment Scheduling (Builder Pattern)
 - This module of the project handles appointment scheduling (booking doctor appointments) using the Builder Design Pattern.
The Builder pattern allows flexible and step-by-step creation of appointment objects without using long constructors.

 ### 🔒 Security Considerations (Decorator Pattern)
 - In this project, sensitive healthcare data (patients’ names, addresses, mobile numbers, billing info) must be protected.
To achieve this, I used the Decorator Design Pattern to add extra security layers to the DAO (Data Access Objects) dynamically, without modifying their core logic.

 - Implemented Decorators :
    - **EncryptionDecorator** → Encrypts/decrypts sensitive fields before storing/retrieving from the database.
    - **AuthenticationDecorator** → Performs role-based access control (e.g., only Doctor/Admin can insert patients, Guests cannot view records).
    - **LoggingDecorator** → Maintains an audit trail of all operations (who accessed what, and when).

  ### 💵 Billing and Insurance Claims (Chain of Responsibility)

 - This module uses the **Chain of Responsibility (CoR)** design pattern to handle insurance claim approvals.  
 - Each claim passes through several steps:
    - Submission  
    - Policy Validation  
    - Medical Verification  
    - Finance Approval  
    - Final Settlement  

  - Each step is implemented as a handler class. If approved, the claim moves to the next step; if rejected, the process stops. The UI integrates with these handlers through ComboBoxes, updating the database status and refreshing the claim list.

  ### 🧾 Report Generation (Visitor Pattern)
  - Instead of putting the report generation logic in our GlobeMed system directly into the core patient data classes, we used the Visitor Design Pattern. The Visitor Pattern allows you to separate operations (reports) and data structures (patient data).  Data classes like Patient, Treatment, Diagnosis, Billing have only one responsibility: to handle data.  The report generation logic is in Visitors. To add a new report, simply create a new visitor class.

---

## 👩‍💻 Author
**Savindi Duleesha**  
📧 savindiduleesha@gmail.com
🌐 [Portfolio](https://savindi2003.github.io/my-portfolio/)

---

## 📜 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

