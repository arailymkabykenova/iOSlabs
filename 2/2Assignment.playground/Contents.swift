/*All the tasks completed in one playground except 4,9,they was written on clt ,but here i also put them
 but commented.Also all the print moments are commented */
import UIKit

//problem1
func printOneToHundred(){
    for index in 1...100{
        if index%3==0 && index%5==0{
            print("FizzBuzz")
        }else if index%5==0{
            print("Buzz")
        }else if index%3==0{
            print("Fizz")
        }else{
            print(index)
        }
    }
}
//printOneToHundred( )



//problem2
func isPrime(_ number:Int)->Bool{
    let x:Int=Int(sqrt(Double(number)))
    if number<2{
        return false
    }
    if [2,3].contains(number){
        return true
    }
    for i in 2...x{
        if number%i==0 {
            return false
        }
        
    }
    return true
}
//print(isPrime(25))
func check(){
    for i in 1...100{
        print("\(i):\(isPrime(i))" )
    }
}
//check()




//problem3
func celciumToFarhenheit(_ celsius:Double)->Double{
    return (celsius*1.8)+32
}
func celciumToKelvin(_ celsius:Double)->Double{
    return celsius+273.15
}
func farhenheitToCelcium(_ farhenheit:Double)->Double{
    return (farhenheit-32)/1.8
}
func farhenheitToKelvin(_ farhenheit:Double)->Double{
    return ((farhenheit-32)/1.8)+273.15
}
func kelvinToCelcium(_ kelvin:Double)->Double{
    return kelvin-273.15
}
func kelvinToFarhenheit(_ kelvin:Double)->Double{
    return (kelvin-273.15)*1.8+32
}

func convertTemperature(value:Double,measure:String){
    let char = measure.uppercased()
    switch char{
    case "C":
        print(celciumToFarhenheit(value),char)
        print(celciumToKelvin(value),char)
    case "F":
        print(farhenheitToCelcium(value),char)
        print(farhenheitToKelvin(value),char)
    case "K":
        print(kelvinToCelcium(value),char)
        print(kelvinToFarhenheit(value),char)
    default:
        print()
    }
}
//convertTemperature(value: 100, measure: "c")
    

//print("Value of temperature: ")
//if let input=readLine(),let value=Double(input){
//    print("c,f,k")
//    if let measure=readLine(){
//        convertTemperature(value: value, measure: measure)
//    }
//}





//problem4
//import Foundation
//enum Operation{
//    case add
//    case remove
//    case show
//    case end
//}
//print("Welcome to our shopping list app!")
//
//var flag=true
//
//var listOfShopping:[String]=[]
//
//var command:String? = nil
//
//while flag{
//    print("Write a command:add,remove,end")
//    command=readLine()
//    switch command{
//    case "add":
//        print("Which product you want to add?")
//        addProduct(readLine()!)
//        
//    case "remove":
//        print("Which product you want to remove?")
//        if let product=readLine(),!product.isEmpty{
//            removeProduct(product)
//        }else{
//            print("write a product name")
//        }
//        
//    case "end":
//        print("Have a good day!")
//    default:
//        print("Something wrong! Try again!")
//    }
//    if command=="end"{
//        flag=false
//    }
//}
//
//
//func addProduct(_ product:String){
//    listOfShopping.append(product)
//    print(listOfShopping)
//    //list.insert(product, at:0)
//}
//
//func removeProduct(_ product:String){
//    if listOfShopping.contains(product){
//        //listOfShopping.removeAll{$0==product}
//        let removeProduct=listOfShopping.firstIndex(of: product)!
//        listOfShopping.remove(at:removeProduct)
//        print(listOfShopping)
//    }else{
//        print("we don't have such product for remove")
//    }
//}



//problem5
var wordBook:[String:Int]=[:]
//lead to right format without excess symbols
func rightFormat(_ sentence:String)->[String.SubSequence]{
    var text=""
    for char in sentence{
        
        if char.isLetter || char.isWhitespace{
            
            text.append(char)
        }
    }
    
    var finalText=text.lowercased()
    
    var words=finalText.split(separator:" ")
    
    return words
}

func countWordFrequency(_ words:[String.SubSequence],_ dict:[String:Int])->[String:Int]{
    var diction=dict
    for word in words{
        let w=String(word)
        
        if let count=diction[w]{
            diction[w]=count+1
        }else{
            diction[w]=1
        }
    }
    return diction
}

let sentence="Hello !elen, How??/ ARE you. Helen what you do? how you?"

//print the result
//let result=countWordFrequency(rightFormat(sentence), wordBook)
//    
//for (key, value) in result {
//    print("\(key): \(value)")
//}




//problem 6

func fibonacci(_ n:Int){
    var fibArray:[Int]=[0,1,1]
    for i in 2...n-1{
        let next=fibArray[i-1]+fibArray[i]
        fibArray.append(next)
        print(next)
    }
}
//fibonacci(13)



//problem 7
func studentScoreCalculator( _ journal:[String:Int]){
    var averScore:Double
    var sum:Int=0
    //detect min max
    if let first=journal.first{
        var minScore=first.value
        var maxScore=first.value
        
        for (_,score) in journal{
            if score<minScore{
                minScore=score
            }
            if score>maxScore{
                maxScore=score
            }
        }
        print("Min score is \(minScore) .Max score is \(maxScore).")
    }
    
    // averScore
    for i in journal.keys{
        if let score=journal[i]{
            sum+=score
        }
    }
    averScore = Double(sum) / Double(journal.count)
    print(averScore)
    
    //detect is above or below
    for (name,score) in journal{
        if score>Int(averScore){
            print("\(name) is above of average result")
        }
        else if score<Int(averScore){
            print("\(name) is below of average result")
        }
        else{
            print("\(name) took average result")
        }
    }
}
let jour:[String:Int]=["Ali":80,"Veli":90,"Mehmet":70]

//studentScoreCalculator(jour)




//problem 8
func isPalindrome(_ text: String) -> Bool{
    var newText=""
    for ch in text{
        if ch.isLetter{
            if ch.isUppercase{
                newText.append(String(ch).lowercased())
            }
            else{
                newText.append(String(ch))
            }
        }
    }
    let reversedNewText=String(newText.reversed())
    if newText==reversedNewText{
        return true
    }
    return false
}
let word="ara"
//print(isPalindrome(word))



//problem 9
//print("Enter num1:")
//var lhs:Int=Int(readLine()!)!
////var num1=readLine()
////if let lhs=Int(num1!) {
////
////}
//print("Enter num2:")
//var rhs:Int=Int(readLine()!)!
//var flag=true
//func miniCalculator(_ lhs:Int,_ rhs:Int){
//    while flag{
//        print("Choose the operation (+, -, *, /,end):")
//        let operation=readLine()
//
//        switch operation{
//        case "+":
//            print(lhs+rhs)
//        case "-":
//            print(lhs-rhs)
//        case "*":
//            print(lhs*rhs)
//        case "/":
//            if rhs==0{
//                print("Error: Division by zero")
//                return
//            }
//            print(lhs/rhs)
//        case "end":
//            print("The End")
//            flag=false
//        default:
//            print("Invalid operation")
//        }
//    }
//}
//
//miniCalculator(lhs,rhs)





//problem 10
func hasUniqueCharacters(_ text: String) -> Bool{
    var charSet:Set<Character>=[]
    for ch in text{
        charSet.insert(ch)
    }
    if charSet.count==text.count{
        return true
    }else{
        return false
    }
    
}
//print(hasUniqueCharacters("Wkfjfjf"))
