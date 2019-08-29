//
//  ViewController3.swift
//  BookCricket
//
//  Created by Rohit Mehta on 8/1/19.
//  Copyright © 2019 Rohit Mehta. All rights reserved.
//

import UIKit

class ViewController3: UIViewController, UITextFieldDelegate {
    
    //MARK: Properties
    @IBOutlet weak var numberOfPages2: UITextField!
    
    
    @IBOutlet weak var player1TeamButton: UIButton!
    @IBOutlet weak var player2TeamButton: UIButton!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    
    var teamList1 = ["India", "England", "Australia", "New Zealand", "South Africa", "Pakistan", "Bangladesh", "Sri Lanka", "West Indies", "Afghanistan"]
    
    var teamList2 = ["India", "England", "Australia", "New Zealand", "South Africa", "Pakistan", "Bangladesh", "Sri Lanka", "West Indies", "Afghanistan"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView1.isHidden = true
        tableView2.isHidden = true
        // Handle the text field’s user input through delegate callbacks
        numberOfPages2.delegate = self
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
    
    //prepareforsegue to transfer upperBound to ViewController4
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //make sure some number is entered
        if numberOfPages2.text == ""{
            print("Please enter number")
            return
        }
        //declare variable for upper bound
        let upperBound: Int? = Int(numberOfPages2.text ?? "0")
        
        if upperBound != 0 {
            if segue.identifier == "segue2" {
                let destinationViewController = segue.destination as! ViewController4
                destinationViewController.upperBound = upperBound
            }
        }
    }
    
    @IBAction func onClickDropPlayer1(_ sender: Any) {
        if tableView1.isHidden {
            animate(toggle: true, type: player1TeamButton)
        }
        else {
            animate(toggle: false, type: player1TeamButton)
        }
    }
    
    @IBAction func onClickDropPlayer2(_ sender: Any) {
        if tableView2.isHidden {
            animate(toggle: true, type: player2TeamButton)
        }
        else {
            animate(toggle: false, type: player2TeamButton)
        }
    }
    
    func animate(toggle: Bool, type: UIButton) {
        if type == player1TeamButton {
            if toggle {
                UIView.animate(withDuration: 0.3) {
                    self.tableView1.isHidden = false
                }
            }
            else {
                UIView.animate(withDuration: 0.3) {
                    self.tableView1.isHidden = true
                }
            }
        }
        else {
            if toggle {
                UIView.animate(withDuration: 0.3) {
                    self.tableView2.isHidden = false
                }
            }
            else {
                UIView.animate(withDuration: 0.3) {
                    self.tableView2.isHidden = true
                }
            }
        }
    }
    
    
    func assignColor(typeOfButton: UIButton) {
        let singleTon = SingletonClass()
        let singleTon2 = SingletonClass2()
        let type: UIButton = typeOfButton
        if "\(singleTon.sharedInstance.dataText)" == "England" {
            type.backgroundColor = UIColor(red: 182/255, green: 210/255, blue: 231/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "England" {
            type.backgroundColor = UIColor(red: 182/255, green: 210/255, blue: 231/255, alpha: 0.5)
        }
            
        if "\(singleTon.sharedInstance.dataText)" == "India" {
            type.backgroundColor = UIColor(red: 66/255, green: 130/255, blue: 231/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "India" {
            type.backgroundColor = UIColor(red: 66/255, green: 130/255, blue: 231/255, alpha: 0.5)
        }
            
        if "\(singleTon.sharedInstance.dataText)" == "Australia" {
            type.backgroundColor = UIColor(red: 242/255, green: 210/255, blue: 97/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "Australia" {
            type.backgroundColor = UIColor(red: 242/255, green: 210/255, blue: 97/255, alpha: 0.5)
        }
            
        if "\(singleTon.sharedInstance.dataText)" == "New Zealand" {
            type.backgroundColor = UIColor(red: 49/255, green: 49/255, blue: 43/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "New Zealand" {
            type.backgroundColor = UIColor(red: 49/255, green: 49/255, blue: 43/255, alpha: 0.5)
        }
            
        if "\(singleTon.sharedInstance.dataText)" == "South Africa" {
            type.backgroundColor = UIColor(red: 1/255, green: 108/255, blue: 88/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "South Africa" {
            type.backgroundColor = UIColor(red: 1/255, green: 108/255, blue: 88/255, alpha: 0.5)
        }
            
        if "\(singleTon.sharedInstance.dataText)" == "Pakistan" {
            type.backgroundColor = UIColor(red: 6/255, green: 120/255, blue: 90/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "Pakistan" {
            type.backgroundColor = UIColor(red: 6/255, green: 120/255, blue: 90/255, alpha: 0.5)
        }
            
        if "\(singleTon.sharedInstance.dataText)" == "Bangladesh" {
            type.backgroundColor = UIColor(red: 2/255, green: 137/255, blue: 78/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "Bangladesh" {
            type.backgroundColor = UIColor(red: 2/255, green: 137/255, blue: 78/255, alpha: 0.5)
        }
            
        if "\(singleTon.sharedInstance.dataText)" == "Sri Lanka" {
            type.backgroundColor = UIColor(red: 49/255, green: 84/255, blue: 151/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "Sri Lanka" {
            type.backgroundColor = UIColor(red: 49/255, green: 84/255, blue: 151/255, alpha: 0.5)
        }
            
        if "\(singleTon.sharedInstance.dataText)" == "West Indies" {
            type.backgroundColor = UIColor(red: 131/255, green: 13/255, blue: 45/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "West Indies" {
            type.backgroundColor = UIColor(red: 131/255, green: 13/255, blue: 45/255, alpha: 0.5)
        }
            
        if "\(singleTon.sharedInstance.dataText)" == "Afghanistan" {
            type.backgroundColor = UIColor(red: 66/255, green: 117/255, blue: 225/255, alpha: 0.5)
        }
        
        if "\(singleTon2.sharedInstance.dataText2)" == "Afghanistan" {
            type.backgroundColor = UIColor(red: 66/255, green: 117/255, blue: 225/255, alpha: 0.5)
        }
    }
    
}

extension ViewController3: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == self.tableView1) {
            return self.teamList1.count
        }
        else {
            return self.teamList2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellOne = tableView1.dequeueReusableCell(withIdentifier: "cellPlayer1", for: indexPath) as? Player1TableViewCell
        cellOne?.player1TeamLabel.text = self.teamList1[indexPath.row]
        let cellTwo = tableView2.dequeueReusableCell(withIdentifier: "cellPlayer2", for: indexPath) as? Player2TableViewCell
        cellTwo?.player2TeamLabel.text = self.teamList2[indexPath.row]
        if tableView == tableView1 {
            return cellOne!
        }
        else if tableView == tableView2 {
            return cellTwo!
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == tableView1) {
            player1TeamButton.setTitle("\(teamList1[indexPath.row])", for: .normal)
        }
        else {
            player2TeamButton.setTitle("\(teamList2[indexPath.row])", for: .normal)
        }
        let singleTon = SingletonClass()
        let singleTon2 = SingletonClass2()
        if (tableView == tableView1) {
            singleTon.sharedInstance.dataText = "\(teamList1[indexPath.row])"
            assignColor(typeOfButton: player1TeamButton)
        }
        else if (tableView == tableView2) {
            singleTon2.sharedInstance.dataText2 = "\(teamList2[indexPath.row])"
            assignColor(typeOfButton: player2TeamButton)
        }
        
        animate(toggle: false, type: player1TeamButton)
        animate(toggle: false, type: player2TeamButton)
    }
}

//make playing page more aesthetic and fix layout a bit
//make endpage aesthetic, fix "player _ wins"
//make single player playing page more aesthetic
