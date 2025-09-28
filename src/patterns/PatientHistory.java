/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package patterns;

import java.util.ArrayDeque;
import java.util.Deque;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Savindi
 */
public class PatientHistory {
    


// Caretaker

    private Map<Integer, Deque<PatientMemento>> history = new HashMap<>();

    public void push(int id, PatientMemento m) {
        history.computeIfAbsent(id, k -> new ArrayDeque<>()).push(m);
    }

    public boolean canUndo(int id) {
        return history.containsKey(id) && !history.get(id).isEmpty();
    }

    public PatientMemento pop(int id) {
        return history.get(id).pop();
    }
}
