import UIKit

//Step 1
let firstName:String = "Arailym"
let lastName = "Kabykеnova"
var age:Int = 19
let birthYear:Int = 2006
var isStudent = true
var height:Double = 1.63
var yearOfStudy:Int = 3
let myUniversity:String = "KBTU"
let currentYear=Calendar.current.component(.year,from:Date())
var myAgeNow=currentYear-birthYear


//Step 2
var favHobbyIsCreative:[String:Bool]=["reading":false,"coding":true,"watching movies":false,"singing":true,"cooking":true]
var numberOfFavHobbies:Int?
var favNumber=7
var favHobby:String?="singing"
let studyMode=true

numberOfFavHobbies=favHobbyIsCreative.count
func findFavHobby(favHobby:String?,favHobbyIsCreative:[String:Bool])->String{
    guard let hobby=favHobby,favHobbyIsCreative.keys.contains(hobby) else{
        return "nothing"
    }
    return hobby
}

func findHobbiesNumber(favHobbies:Int?)->Int{
    if let countHobbies=favHobbies{
        return countHobbies
    } else{
        return 0
    }
}
//Step 3,4
let story:String="""
        My name is \(firstName) \(lastName). I am \(age) years old.I am the \(yearOfStudy) year of study at \(myUniversity).My favourite hobby is \(findFavHobby(favHobby: favHobby,favHobbyIsCreative: favHobbyIsCreative))),and I have \(findHobbiesNumber(favHobbies:numberOfFavHobbies)) hobbies in total.Also my lucky number is \(favNumber)
        """
print(story)


let futureWork="iOS Senior developer🍏"
var futureHobby:String?
let futureLifeStyle="health and active🔋"
let hobby=futureHobby ?? "nothing"

func attractingFuture(){
    print("I am \(futureWork). My favourite hobby is \(hobby).Also I live \(futureLifeStyle) life.")
}
attractingFuture()



func printLifeStory(
    name:String,
    surname:String,
    myAge:Int,
    year:Int,
    university:String,
    favHobby:String?,
    hobbyAndCreativity:[String:Bool],
    numOfHobbies:Int?,
    favNum:Int
){
    let myFavHobby=findFavHobby(favHobby: favHobby,favHobbyIsCreative: hobbyAndCreativity)
    let hobbyNum=findHobbiesNumber(favHobbies:numOfHobbies)
    print("My name is \(name) \(surname). I am \(myAge) years old.I am the \(year) year of study at \(university).My favourite hobby is \(myFavHobby),and I have \(hobbyNum) hobbies in total.Also my lucky number is \(favNum).")
}

printLifeStory(name:firstName,surname:lastName,myAge:age,year:yearOfStudy,university:myUniversity,favHobby: favHobby,hobbyAndCreativity: favHobbyIsCreative,numOfHobbies:numberOfFavHobbies,favNum:favNumber)


/*
 В Playground весь верхнеуровневый код (глобальные переменные и функции)
 автоматически выполняется на главном потоке (MainActor).
 
 Функции, которые используют только глобальные переменные,
 тоже считаются частью MainActor и выполняются на нём.
 
 Функции с параметрами обычно "чистые" (pure functions),
 и они не зависят от MainActor, поэтому Swift их не считает глобальными.
 
 Главный поток (MainActor) нужен в первую очередь для работы с UI,
 чтобы интерфейс всегда был отзывчивым.
 */
