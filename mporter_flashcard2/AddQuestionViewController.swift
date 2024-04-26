//
//  AddQuestionViewController.swift
//  mporter_flashcard2
//
//  Created by Michael Ray Porter, Jr on 3/21/24.
//

import UIKit

class AddQuestionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var questionIn: UITextField!
    @IBOutlet weak var answerIn: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        questionIn.delegate = self
        answerIn.delegate = self
    }
    
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addCard(_ sender: Any) {
        questionIn.resignFirstResponder()
        answerIn.resignFirstResponder()    //these 2 make the software keyboard disappear
        
        //checks if the card is ready to be added
        if questionIn.text == "" && answerIn.text == ""{//the card's not ready
            displayAlert(msgTitle: "Addition Failed", msgContent: "Everything is missing.")
            return
        }else if questionIn.text == ""{
            displayAlert(msgTitle: "Addition Failed", msgContent: "The question is missing.")
            return
        }else if answerIn.text == ""{
            displayAlert(msgTitle: "Addition Failed", msgContent: "The answer is missing.")
            return
        }
        
        questions.append(questionIn.text!)
        answers.append(answerIn.text!)
        questionIn.text = ""
        answerIn.text = ""
        displayAlert(msgTitle: "Success", msgContent: "Card added successfully.")
        
    }
    
}
