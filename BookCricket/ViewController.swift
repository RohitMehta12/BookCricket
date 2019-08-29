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
    @IBOutlet weak var teamButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var teamList = ["India", "England", "Australia", "New Zealand", "South Africa", "Pakistan", "Bangladesh", "Sri Lanka", "West Indies", "Afghanistan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.isHidden = true
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
        if ((numberOfPages.text ?? "").isEmpty) {
            print("Please enter number")
            return
            //fix this, print only returns in the command line, not to the user. Also add verification that team has been selected
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
    
    //clicking team button to reveal teams
    @IBAction func onClickDropButton(_ sender: Any) {
        if tableView.isHidden {
            animate(toggle: true)
        }
        else {
            animate(toggle: false)
        }
    }
    
    func animate(toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.tableView.isHidden = false
            }
        }
        else {
            UIView.animate(withDuration: 0.3) {
                self.tableView.isHidden = true
            }
        }
    }
    
}

class SingletonClass {
    var sharedInstance: SingletonClass {
        struct Static {
            static let instance = SingletonClass()
        }
        return Static.instance
    }
    var dataText : String = ""
    
}

class SingletonClass2 {
    var sharedInstance: SingletonClass2 {
        struct Static {
            static let instance = SingletonClass2()
        }
        return Static.instance
    }
    var dataText2: String = ""
}

//for the table of teams
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as? CellTableViewCell
        cell?.teamLabel.text = teamList[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Controller2") as? ViewController2
        vc?.name = teamList[indexPath.row]
        teamButton.setTitle("\(teamList[indexPath.row])", for: .normal)
        
        let singleTon = SingletonClass()
        singleTon.sharedInstance.dataText = "\(teamList[indexPath.row])"
        let thirdView = ViewController3()
        thirdView.assignColor(typeOfButton: teamButton)
        animate(toggle: false)
    }
}
