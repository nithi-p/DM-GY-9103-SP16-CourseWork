//: Playground - noun: a place where people can play

import UIKit
import Foundation
var str = "Hello, playground"

print(str)


class SurveyQuestion {
	let text: String
	var response: String?
	init(text2: String) {
		self.text = text2
	}
	func ask() {
		print(text)
	}
}
let beetsQuestion = SurveyQuestion(text2: "How about beets?")
beetsQuestion.ask()
// prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"




