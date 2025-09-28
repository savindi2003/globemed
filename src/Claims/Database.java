/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Claims;

import Model.MySQL;
import java.sql.ResultSet;
import security.LoggedInUser;
import security.PatientDataSource;
import security.SecureDAOFactory;

public class Database {

    private static PatientDataSource secureDao;

    public static void updateStatus(String claimId, String status) {

        String username = "111";
        String role_s = "Doctor";

        LoggedInUser.setUser(username, role_s);

        secureDao = SecureDAOFactory.getDTO(LoggedInUser.getRole());

        try {
//            String sql = "UPDATE `insurance_claim` SET `approval_status` ='" + status + "' WHERE `id`='" + claimId + "'";
//        MySQL.execute(sql);

            secureDao.updateClaimStatus(claimId, status);

            if (status.equals("SETTLED")) {

                ResultSet rs = MySQL.execute("SELECT `billing`.`id` FROM `insurance_claim` "
                        + "INNER JOIN `billing` ON `billing`.`id` = `insurance_claim`.`billing_id`"
                        + " WHERE `insurance_claim`.`id` = '1'");

                if (rs.next()) {

                    String billing_id = rs.getString("id");

                    MySQL.execute("UPDATE `billing` SET `status` ='SETTLED' WHERE `id`='" + billing_id + "'");
                    System.out.println("Billing status changesd");

                }

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
