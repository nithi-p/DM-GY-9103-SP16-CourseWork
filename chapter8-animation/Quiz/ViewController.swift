//
//  ViewController.swift
//  Quiz
//
//  Created by Nithi Prasanpanich on 2/2/16.
//  Copyright © 2016 Nithi Prasanpanich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	



	@IBOutlet var currentQuestionLabel: UILabel!
	@IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
	@IBOutlet var nextQuestionLabel: UILabel!
	@IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
	@IBOutlet var answerLabel: UILabel!

	
	

	
	
	
	let questions: [String] = ["From what is cognac made?", "What is 7+7?","What is the capital of Vermont?"]
	let answers: [String] = ["Grapes","14","Montpelier"]
	var currentQuestionIndex: Int = 0
	
	
	
	@IBAction func showNextQuestion(sender : AnyObject ) {
		++currentQuestionIndex
		if currentQuestionIndex == questions.count {
			currentQuestionIndex = 0
		}
		
		let question: String = questions[currentQuestionIndex]
		nextQuestionLabel.text = question
		answerLabel.text = "???"
		
		animateLabelTransitions()
	}
	@IBAction func showAnswer(sender: AnyObject) {
		let answer: String = answers[currentQuestionIndex]
		answerLabel.text = answer
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		let question: String = questions[currentQuestionIndex]
		currentQuestionLabel.text = question
		updateOffScreenLabel()
		
	}
	
	func updateOffScreenLabel() {
		let screenWidth = view.frame.width
		nextQuestionLabelCenterXConstraint.constant = -screenWidth
	}
	
	
	func animateLabelTransitions() {
		

		
		// Animate the alpha
		// and the Center X constraints
		let screenWidth = view.frame.width
		self.nextQuestionLabelCenterXConstraint.constant = 0
		self.currentQuestionLabelCenterXConstraint.constant += screenWidth
		UIView.animateWithDuration(0.5,
			delay: 0,
			options: [],
			animations: {
			self.currentQuestionLabel.alpha = 0
			self.nextQuestionLabel.alpha = 1
			self.view.layoutIfNeeded()
		},
			completion: { _ in
				swap(&self.currentQuestionLabel,
					&self.nextQuestionLabel)
			}
		)
	}
	
	override func viewWillAppear(animated: Bool) {
		super.viewWillAppear(animated)
		
		//Set the label's initial alpha
		nextQuestionLabel.alpha = 0
	}
	
	
	
}

