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
public class FinanceApprovalHandler extends ClaimHandler {
    @Override
    public void handle(ClaimRequest request, int approved, String step) {
        if (step.equals("FINANCE_APPROVAL")) {
            if (approved == 2) {
                request.setStatus("FINANCE_APPROVED");
                Database.updateStatus(request.getClaimId(), request.getStatus());
                System.out.println("Finance approved → " + request.getClaimId());
            } else if(approved == 3) {
                request.setStatus("FINANCE_REJECTED");
                Database.updateStatus(request.getClaimId(), request.getStatus());
                System.out.println("Finance rejected → " + request.getClaimId());
            }
        } else if (next != null) {
            next.handle(request, approved, step);
        }
    }
}
