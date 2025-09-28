/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package security;

import security.PatientDataSource;

import security.Decorators.AuthenticationDecorator;
import security.Decorators.EncryptionDecorator;
import security.Decorators.LoggingDecorator;
import security.LoggedInUser;
import Bridge.MySQLPatientDAO;
import Bridge.*;
import security.DTO.AllDAO;

/**
 *
 * @author Savindi
 */
public class SecureDAOFactory {

    public static PatientDataSource getSecureDAO(String role, String storageType) {

        PatientDataSource base;

        switch (storageType) {
            case "MYSQL":
                base = new MySQLPatientDAO();
                break;
            case "CLOUD":
                base = new CloudPatientDAO();
                break;

            default:
                throw new IllegalArgumentException("Invalid storage type: " + storageType);
        }

// Wrap with decorators
        return new LoggingDecorator(
                new AuthenticationDecorator(
                        new EncryptionDecorator(base),
                        role
                )
        );
    }
    
    public static PatientDataSource getDTO(String role) {
        return new LoggingDecorator(
                   new AuthenticationDecorator(
                       new EncryptionDecorator(new AllDAO()),
                       role
                   )
               );
    }

}
