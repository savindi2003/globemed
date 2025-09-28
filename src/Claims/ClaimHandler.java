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
public abstract class ClaimHandler {
    
    protected ClaimHandler next;

    public ClaimHandler setNext(ClaimHandler next) {
        this.next = next;
        return next;
    }

    public abstract void handle(ClaimRequest request, int approved, String step);
    
}
