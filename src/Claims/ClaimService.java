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
public class ClaimService {
    private static ClaimHandler buildChain() {
        ClaimHandler chain = new SubmissionHandler();
        chain.setNext(new PolicyValidationHandler())
             .setNext(new MedicalVerificationHandler())
             .setNext(new FinanceApprovalHandler())
             .setNext(new FinalSettlementHandler());
        return chain;
    }
    
    public static void processStep(String claimId, String step, int approved) {
        ClaimRequest request = new ClaimRequest(claimId, "PENDING");
        ClaimHandler chain = buildChain();
        chain.handle(request, approved, step);
    }
    
}
