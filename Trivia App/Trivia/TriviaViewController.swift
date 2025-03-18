//
//  TriviaViewController.swift
//  Trivia
//
//  Created by vincent Jared on 3/18/25.
//

import UIKit

struct Question {
    let category: String
    let text: String
    let options: [String]
    let correctAnswer: String
}




class TriviaViewController: UIViewController {
    
    @IBOutlet weak var QuestionNumberLabel: UILabel!
    
    @IBOutlet weak var QuestionTypeLabel: UILabel!
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var ChoiceButton1: UIButton!
    
    
    @IBOutlet weak var ChoiceButton2: UIButton!
    
    
    @IBOutlet weak var ChoiceButton3: UIButton!
    
    
    @IBOutlet weak var ChoiceButton4: UIButton!
    
    
    @IBOutlet weak var RestartButton: UIButton!
    
    var questions: [Question] = [
            Question(category: "Geography", text: "What is the capital of France?",
                     options: ["Paris", "London", "Berlin", "Madrid"], correctAnswer: "Paris"),
            Question(category: "Science", text: "Which planet is known as the Red Planet?",
                     options: ["Earth", "Mars", "Jupiter", "Venus"], correctAnswer: "Mars"),
            Question(category: "Math", text: "What is 2 + 2?",
                     options: ["3", "4", "5", "6"], correctAnswer: "4")
        ]
    
    var currentQuestionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RestartButton.isHidden = true
        displayQuestion()
        
    }
    
    func displayQuestion() {
        if currentQuestionIndex < questions.count {
            let question = questions[currentQuestionIndex]
            QuestionTypeLabel.text = "Category: \(question.category)"
            QuestionLabel.text = question.text
            ChoiceButton1.setTitle(question.options[0], for: .normal)
            ChoiceButton2.setTitle(question.options[1], for: .normal)
            ChoiceButton3.setTitle(question.options[2], for: .normal)
            ChoiceButton4.setTitle(question.options[3], for: .normal)
            
            QuestionNumberLabel.text = "\(currentQuestionIndex + 1)/\(questions.count)"
        } else {
            
            QuestionLabel.text = "Game Over!"
            QuestionTypeLabel.text = ""
            QuestionNumberLabel.text = "\(questions.count)/\(questions.count)"
            
            ChoiceButton1.isHidden = true
            ChoiceButton2.isHidden = true
            ChoiceButton3.isHidden = true
            ChoiceButton4.isHidden = true
            
            RestartButton.isHidden = false
        }
    }
    

    @IBAction func answerSelected(_ sender: UIButton) {
            let selectedAnswer = sender.currentTitle!
            let correctAnswer = questions[currentQuestionIndex].correctAnswer
            
            if selectedAnswer == correctAnswer {
                print("✅ Correct!")
            } else {
                print("❌ Wrong! The correct answer was \(correctAnswer).")
            }
            
            currentQuestionIndex += 1
            displayQuestion()
        }
    
    @IBAction func restartGame(_ sender: UIButton) {
        currentQuestionIndex = 0
        RestartButton.isHidden = true
        ChoiceButton1.isHidden = false
        ChoiceButton2.isHidden = false
        ChoiceButton3.isHidden = false
        ChoiceButton4.isHidden = false
        displayQuestion()
    }
    
}


