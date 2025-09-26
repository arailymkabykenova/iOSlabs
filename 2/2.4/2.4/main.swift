//
//  main.swift
//  2.4
//
//  Created by Арайлым Кабыкенова on 25.09.2025.
//

import Foundation
enum Operation{
    case add
    case remove
    case show
    case end
}
print("Welcome to our shopping list app!")

var flag=true

var listOfShopping:[String]=[]

var command:String? = nil

while flag{
    print("Write a command:add,remove,end")
    command=readLine()
    switch command{
    case "add":
        print("Which product you want to add?")
        addProduct(readLine()!)
        
    case "remove":
        print("Which product you want to remove?")
        if let product=readLine(),!product.isEmpty{
            removeProduct(product)
        }else{
            print("write a product name")
        }
        
    case "end":
        print("Have a good day!")
    default:
        print("Something wrong! Try again!")
    }
    if command=="end"{
        flag=false
    }
}


func addProduct(_ product:String){
    listOfShopping.append(product)
    print(listOfShopping)
    //list.insert(product, at:0)
}

func removeProduct(_ product:String){
    if listOfShopping.contains(product){
        //listOfShopping.removeAll{$0==product}
        let removeProduct=listOfShopping.firstIndex(of: product)!
        listOfShopping.remove(at:removeProduct)
        print(listOfShopping)
    }else{
        print("we don't have such product for remove")
    }
}




