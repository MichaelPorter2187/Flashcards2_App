//
//  ViewController.swift
//  mporter_flashcard2
//
//  Created by Michael Ray Porter, Jr on 3/19/24.
//

import UIKit

    var questions: [String] = []
    var answers: [String] = []
    var currentQuestion: Int = 0

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentQuestion = -1
        
        
        //These are preloaded questions to make testing and troubleshooting easier.
        
        /*
        questions.append("What's the capital of Japan?")
        answers.append("Tokyo")
        
        questions.append("What's the name of the ship that sank in 1912?")
        answers.append("Titanic")
        
        questions.append("How many ways can you make change for 1 US dollar?")
        answers.append("293")
        
        questions.append("How many compartments are in a cow's stomach?")
        answers.append("4")
        
        questions.append("Which planet rotates clockwise?")
        answers.append("Venus")
        
        questions.append("How many blue stripes are there on the US flag?")
        answers.append("0")
        
        questions.append("Which country held the 2016 Olympics?")
        answers.append("Tokyo")
        
        questions.append("According to Forrest Gump, life is like...")
        answers.append("A box of chocolates")
        
        questions.append("How many bones are there in the human body?")
        answers.append("206")
        
        questions.append("Fe is the chemical symbol for...")
        answers.append("Iron")
        
        questions.append("How many hearts does an octopus have?")
        answers.append("3")
        
        questions.append("What does the E in Chuck E. Cheese stand for?")
        answers.append("Entertainment")
        
        questions.append("Which astrological sign is a crab?")
        answers.append("Cancer")
        
        questions.append("What's the complementary color of green?")
        answers.append("Red")
        
        questions.append("How many elements are on the periodic table?")
        answers.append("118")
        
        questions.append("Which water sport is the official sport for the state of Hawaii?")
        answers.append("Surfing")
        */
       
        
        
        questions.append("Hot Ham")
        answers.append("Cheese")
        
        questions.append("ABC")
        answers.append("Easy as 1 2 3")
        
        questions.append("With great power...")
        answers.append("...comes not so great responsibility.")
         
    }

    
    
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    @IBAction func deleteQuestion(_ sender: Any) {
        
        if questions.count == 0{
            displayAlert(msgTitle: "No Cards", msgContent: "There are no cards to delete.")
        }else if questions.count == 1{
            questions.remove(at: currentQuestion)
            answers.remove(at: currentQuestion)
            currentQuestion = -1
            questionLabel.text = "Question"
            answerLabel.text = "Answer"
            displayAlert(msgTitle: "Deleted", msgContent: "The card was successfully deleted. You have no more cards.")
        }else{
            
            displayAlert(msgTitle: "Deleted", msgContent: "This card has been deleted.")
            questionLabel.text = questions[currentQuestion]
            answerLabel.text = "?????"
        }
        
    }
    
    
    @IBAction func nextQuestion(_ sender: Any) {
        if questions.count == 0 {//if there are no cards
            displayAlert(msgTitle: "No Cards", msgContent: "There are no flash cards.")
        }else{
            currentQuestion += 1
            if currentQuestion == questions.count{//if it's the last card, loop back to the first card
                currentQuestion = 0
            }
            
            questionLabel.text = questions[currentQuestion]
            answerLabel.text = "?????"
            
        }
    }
    
    @IBAction func addQuestion(_ sender: Any) {
        performSegue(withIdentifier: "AddQuestionView", sender: nil)
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        if questions.count == 0{
         displayAlert(msgTitle: "No Cards", msgContent: "There are no flash cards.")
        }else{
            answerLabel.text = answers[currentQuestion]
        }
    }
    
    
    
}

