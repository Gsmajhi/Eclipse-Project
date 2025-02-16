package com.Array;

import java.util.Stack;

public class Removepar {
    public static String removePar(String s) {
        Stack<Character> stk = new Stack<>();
        StringBuilder sb = new StringBuilder();
        System.out.println("remove outermost parenthesis");
        for (int i = 0; i < s.length(); i++) {
            char ch = s.charAt(i);
            
            if (ch == '(') {
                // Add only non-outermost '(' to the result
                if (!stk.isEmpty()) {
                    sb.append(ch);
                }
                stk.push(ch);
            } else if (ch == ')') {
                // Pop the matching '(' from the stack
                if (!stk.isEmpty()) {
                    stk.pop();
                }
                // Add only non-outermost ')' to the result
                if (!stk.isEmpty()) {
                    sb.append(ch);
                }
            }
        }
        
        return sb.toString();
    }

    public static void main(String[] args) {
        // Test cases
        System.out.println(removePar("()()()()")); // Output: ""
        System.out.println(removePar("((()))"));   // Output: "(())"
        System.out.println(removePar("(()())"));   // Output: "()()"
        System.out.println(removePar(""));         // Output: ""
        System.out.println(removePar("((()(())))"));// Output: "(()(()))"
    }
}
