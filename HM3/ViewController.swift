//
//  ViewController.swift
//  HM3
//
//  Created by Daniel on 16.11.2022.
//

import UIKit

class ViewController: UIViewController {
    var guesslabel: UILabel!
    var helloLabel: UILabel!
    var additionLabel: UILabel!
    
    
    private let guessButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(guessAction), for: .touchUpInside)
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.layer.borderColor = UIColor.green.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.backgroundColor = .white
        button.setTitle("Add numbers", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        helloLabel = UILabel(frame: CGRect(x: 0, y: 120, width: view.frame.width, height: 50))
        view.addSubview(helloLabel)
        helloLabel.textAlignment = .center
        helloLabel.font = UIFont.systemFont(ofSize: 24)
        helloLabel.text = "Hello, "
        helloLabel.textColor = .brown
        helloLabel.layer.shadowColor = UIColor.orange.cgColor
        helloLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        helloLabel.layer.shadowOpacity = 15
        
        guesslabel = UILabel(frame: CGRect(x: view.frame.width - 160 , y: view.frame.height - 290, width: 150, height: 30))
        view.addSubview(guesslabel)
        guesslabel.textAlignment = .center
        guesslabel.font = UIFont.systemFont(ofSize: 18)
        guesslabel.text = "Guess Number "
        guesslabel.textColor = .systemCyan
        guesslabel.backgroundColor = .darkGray
        guesslabel.numberOfLines = 0
        guesslabel.layer.shadowColor = UIColor.blue.cgColor
        guesslabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        guesslabel.layer.shadowOpacity = 15
        guesslabel.layer.shadowRadius = 10
        
        additionLabel = UILabel(frame: CGRect(x: -5, y: view.frame.height - 300, width: 150, height: 57))
        view.addSubview(additionLabel)
        additionLabel.textAlignment = .center
        additionLabel.font = UIFont.systemFont(ofSize: 18)
        additionLabel.text = "Result is: "
        additionLabel.numberOfLines = 3
        additionLabel.textColor = .darkGray
        additionLabel.layer.shadowColor = UIColor.green.cgColor
        additionLabel.layer.shadowOffset = CGSize(width: 0, height: 2)
        additionLabel.layer.shadowOpacity = 10
        additionLabel.layer.shadowRadius = 10
        
        view.addSubview(addButton)
        view.addSubview(guessButton)
        
        NSLayoutConstraint.activate([
           guessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -5),
           guessButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
           guessButton.widthAnchor.constraint(equalToConstant: 120),
           guessButton.heightAnchor.constraint(equalToConstant: 40),
            
           addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  5),
           addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
           addButton.widthAnchor.constraint(equalToConstant: 130),
           addButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
        welcomealert()
    }

    @objc func guessAction() {
        guessNumAlert(title: "Enter a number from 1 to 10", message: "Guess a number", prefferedStyle: .alert)
        self.guesslabel.text = "Guess a number"
    }
     
    //MARK: ADDNUMBER FUNC
    @objc func addAction() {
        addNumbersAlert(title: "Enter two numbers", message: "Add two numbers", prefferedStyle: .alert)
        self.additionLabel.text = "Result is: "
    }
    
    //MARK: GUESSNUMBER FUNC
    func guessNum(num: Int?) {
        let correctAnswer = Int.random(in: 1...3)
        if let num = num {
            
        if num == correctAnswer {
            self.guesslabel.text = "You win 🥇"
            self.guesslabel.layer.shadowColor = UIColor.green.cgColor
        } else {
            self.guesslabel.text = "Try Again!"
            self.guesslabel.layer.shadowColor = UIColor.red.cgColor
        }
       }
    }
    
     //MARK: WELCOMEALERT FUNC
    func welcomealert() {
        
        let allert = UIAlertController(title: "Welcome!", message: "Enter your name", preferredStyle: .alert)
        allert.addTextField { textField1 in
            textField1.placeholder = "Name"
        }
        
        let action = UIAlertAction(title: "Ok", style: .default) { action in
            let firstField = allert.textFields?.first
            
               
            if self.helloLabel.text?.isEmpty != nil  {
                self.helloLabel.text = "Hi there!"
            } else {
                self.helloLabel.text! += firstField?.text ?? " user!"
            }
        }
        
        allert.addAction(action)
        self.present(allert, animated: false, completion: nil)
    }
    
    
     //MARK: ADDNUM ALERT FUNC
     func addNumbersAlert(title: String, message: String, prefferedStyle: UIAlertController.Style) {
         
         let allert = UIAlertController(title: title, message: message, preferredStyle: prefferedStyle)
         allert.addTextField { textField1 in
         }
         
         allert.addTextField { textField1 in
         }
         
         let action = UIAlertAction(title: "Calculate", style: .default) { action in
             let numberOne = allert.textFields?.first
             let numberTwo = allert.textFields?[1]
             
             self.additionLabel.text! += String(Int(numberOne?.text ?? "0")! + Int(numberTwo?.text ?? "0")!)
         }
         
         allert.addAction(action)
         self.present(allert, animated: false, completion: nil)
     }
     
    //MARK: GUESS ALERT FUNC
    func guessNumAlert(title: String, message: String, prefferedStyle: UIAlertController.Style) {
        let allertController = UIAlertController(title: title, message: message, preferredStyle: prefferedStyle)
        allertController.addTextField { textField1 in
            textField1.placeholder = "First number"
        }
        
        let action = UIAlertAction(title: "Ok", style: .default) { action in
            let firstField = allertController.textFields?.first
            
            self.guessNum(num: Int(firstField?.text ?? "0"))
        }
        
        allertController.addAction(action)
        self.present(allertController, animated: false, completion: nil)
    }
}

