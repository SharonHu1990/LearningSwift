//: Playground - noun: a place where people can play

import UIKit


//控制转移语句
//continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters{
    switch character{
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character);
    }
}
print(puzzleOutput);


//break 



var count = 1
repeat {
    print("count is \(count)")
    ++count
} while count < 3
// count is 1
// count is 2

count = 1
repeat {
    print("count is \(count)")
    ++count
} while count < 1
// count is 1

for var index = 0; index < 3; ++index {
    print("index is \(index)")
}


let numberOfLegs = ["spider": 8, "ant": 6, "cat":4]
for (animalName, legCount) in numberOfLegs{
    print("\(animalName)s have \(legCount) legs")
}


var optionalName: String? = "John"
var greeting = "Hello!"
if let name = optionalName{
    greeting = "Hello, \(name)"
}


let possibleNumber = "123"
if let actualNumber = Int(possibleNumber){
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
}else{
    print("\'\(possibleNumber)\' could not be convered to an integer")
}

var convertedNumber : Int? = 10
if convertedNumber != nil{
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status description is \(http200Status.description)")


let http404Error = (404, "Not Found")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")





let (statusCode, statusMessage) = http404Error
print(("The status code is \(statusCode)"))
print("The status message is \(statusMessage)")



var str = "Hello, playground"

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

let orangesAreOrange = true
let turnipsAreDelicious = false
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
}else {
    print("Eww, turnips are horrible.")
}

let minValue = UInt8.min
let maxValue = UInt8.max

let cat = "🐱";print(cat)
// 输出 "🐱"

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

//添加和删除
var days = ["mon", "thu"]
var firstDay = days[0]
days.insert("tue", atIndex: 1)
days[2] = "wen"
days.removeAtIndex(0)


//array1
var ratingList = ["Poor", "Fine", "Good", "Excellent"]
ratingList[1] = "k"
ratingList

// Creates an empty array.
let emptyArray = [String]()

var colors = ["red", "blue"]
var moreColors: [String] = ["orange", "purple"]
colors.append("green")
colors += ["yellow"]
colors += moreColors




var myString = "7"
var possibleInt = Int(myString)
print(possibleInt)


func iAdd(a:Int,b:Int,c:Int) -> Int{
    return a + b + c
}
iAdd(1, b: 2, c: 3)//return 6

func eitherSide(n:Int)-> (nMinusOne:Int, nPlusOne:Int){
    return(n-1, n+1)
}
eitherSide(5)//return(4, 6)


let optionalInt : Int? = 9;
let actualInt : Int = optionalInt!



