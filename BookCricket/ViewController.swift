//
//  ViewController.swift
//  BookCricket
//
//  Created by Rohit Mehta on 7/26/19.
//  Copyright © 2019 Rohit Mehta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    
@IBOutlet weak var numberOfPages: UITextField!
    
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Handle the text field’s user input through delegate callbacks.
        numberOfPages.delegate = self
    
}
    
//MARK: UITextFieldDelegate
func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // Hide the keyboard.
    textField.resignFirstResponder()
    return true
}

func textFieldDidEndEditing(_ textField: UITextField) {
    //Save number entered and then randomly select a number within bounds
}


//MARK: Actions
    
//prepareforsegue to transfer upperBound to ViewController2
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //make sure some number is entered
    if numberOfPages.text == ""{
        print("Please enter number")
        return
    }
    //declare variable for upper bound
    let upperBound: Int? = Int(numberOfPages.text ?? "0")
    
    if upperBound != 0 {
        if segue.identifier == "segue1" {
            let destinationViewController = segue.destination as! ViewController2
            destinationViewController.upperBound = upperBound
        }
    }
}
    
}
