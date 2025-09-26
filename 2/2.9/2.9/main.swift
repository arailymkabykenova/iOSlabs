//
//  main.swift
//  2.9
//
//  Created by Арайлым Кабыкенова on 26.09.2025.
//

import Foundation
print("Enter num1:")
var lhs:Int=Int(readLine()!)!
//var num1=readLine()
//if let lhs=Int(num1!) {
//    
//}
print("Enter num2:")
var rhs:Int=Int(readLine()!)!
var flag=true
func miniCalculator(_ lhs:Int,_ rhs:Int){
    while flag{
        print("Choose the operation (+, -, *, /,end):")
        let operation=readLine()
        
        switch operation{
        case "+":
            print(lhs+rhs)
        case "-":
            print(lhs-rhs)
        case "*":
            print(lhs*rhs)
        case "/":
            if rhs==0{
                print("Error: Division by zero")
                return
            }
            print(lhs/rhs)
        case "end":
            print("The End")
            flag=false
        default:
            print("Invalid operation")
        }
    }
}

miniCalculator(lhs,rhs)
