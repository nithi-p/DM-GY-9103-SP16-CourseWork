//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Playground"

str = "hello, Swift"

let constStr = str

let number = 42
let StringofNumber = String(number)


let fmStation = 91.1

var countingUP = ["one","two"]
let secondElement = countingUP[1]
countingUP.count
countingUP.append("three")
countingUP.count


for var i = 0; i < countingUP.count; ++i {
	let string = countingUP[i]
}

let range = 0..<countingUP.count

for i in range {
let string = countingUP[i]
}


for string in countingUP {
	print(string)
}

for (i, string) in countingUP.enumerate() {
	// (0, "one"), (1,"two")
	print(i)
	print(string)
}





var anOptionalFloat : Float?
var anOptionalArrayOfStrings: [String]?
var anOptionalArrayOfOptionalString: [String?]?

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

var test = ("reading1 = \(reading1!)")



//let avgReading = (reading1! + reading2! + reading3!) / 3

if let r1 = reading1,
	   r2 = reading2,
	   r3 = reading3 {
			let avgReading = (r1 + r2 + r3)/3
	}else{
		let errorString = "Instrument reported a reading that was nil."
	}




let emptyString = String()
emptyString.isEmpty

let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let availableRooms = Set([205,211,412])
let defaultFloat = Float()
let floatFromliteral = Float(3.14)

let easyPi = 3.14
let floatFromDouble = Float(easyPi)
let floatingPi : Float = 3.14


let nameByParkingSpace = [13: "Alice", 27:"Bob"]
for (space,name) in nameByParkingSpace {
	let permit = "Space \(space): \(name)"
}


//let space13Assignee: String? = nameByParkingSpace[13]
let space42Assignee: String? = nameByParkingSpace[42]


if let space13Assignee = nameByParkingSpace[13] {
	print("Key 13 is assigned in the dictionary!")
}


var nextYear: Int
var bodyTemp: Float
var haspet: Bool

var arrayOfInts: [Int]
var dictionaryOfCapitalsByCountry: [String:String]
var winningLotteryNumbers: Set<Int>




enum PieType: Int{
	case Apple = 1
	case Cherry
	case Pecan
}
let pieRawValue = PieType.Pecan.rawValue
if let PieType = PieType(rawValue: pieRawValue) {
	// got a valid 'pietype'
}

var favoritePie = PieType.Cherry




let name: String
switch favoritePie {
case .Apple:
	name = "Apple"
case .Cherry:
	name = "Cherry"
case .Pecan:
	name = "Pecan"
}


print(name)



