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
public class FinalSettlementHandler extends ClaimHandler {
    @Override
    public void handle(ClaimRequest request, int approved, String step) {
        if (step.equals("FINAL_SETTLEMENT")) {
            if (approved == 2) {
                request.setStatus("SETTLED");
                Database.updateStatus(request.getClaimId(), request.getStatus());
                System.out.println("Final settlement done → " + request.getClaimId());
            } else if(approved == 3) {
                System.out.println("Settlement rejected → " + request.getClaimId());
            }
        } else if (next != null) {
            next.handle(request, approved, step);
        }
    }
}
