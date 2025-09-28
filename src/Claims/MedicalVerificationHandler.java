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
public class MedicalVerificationHandler extends ClaimHandler {
    @Override
    public void handle(ClaimRequest request, int approved, String step) {
        if (step.equals("MEDICAL_VERIFICATION")) {
            if (approved == 2) {
                request.setStatus("MEDICAL_VERIFIED");
                Database.updateStatus(request.getClaimId(), request.getStatus());
                System.out.println("Medical verified → " + request.getClaimId());
            } else if(approved == 3) {
                request.setStatus("MEDICAL_REJECTED");
                Database.updateStatus(request.getClaimId(), request.getStatus());
                System.out.println("Medical rejected → " + request.getClaimId());
            }
        } else if (next != null) {
            next.handle(request, approved, step);
        }
    }
}

