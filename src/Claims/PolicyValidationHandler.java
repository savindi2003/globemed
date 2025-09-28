/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Claims;

import Model.ClaimRequest;

/**
 *
 * @author Savindi
 */
public class PolicyValidationHandler extends ClaimHandler{

    @Override
    public void handle(ClaimRequest request, int approved, String step) {
        if (step.equals("POLICY_VALIDATION")) {
            if (approved == 2) {
                request.setStatus("POLICY_VALIDATED");
                Database.updateStatus(request.getClaimId(), request.getStatus());
                System.out.println("Policy validated → " + request.getClaimId());
            } else if(approved == 3) {
                request.setStatus("POLICY_REJECTED");
                Database.updateStatus(request.getClaimId(), request.getStatus());
                System.out.println("Policy rejected → " + request.getClaimId());
            }
        } else if (next != null) {
            next.handle(request, approved, step);
        }
    }
    
}
