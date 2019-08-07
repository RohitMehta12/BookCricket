//
//  ViewController2.swift
//  BookCricket
//
//  Created by Rohit Mehta on 7/26/19.
//  Copyright © 2019 Rohit Mehta. All rights reserved.
//ANYTIME YOU GET SIGBRT ERROR GO TO MAIN.STORYBOARD AND TWOCLICK ON VIEWCONTROLLER, REMOVE ERRORS

import UIKit

class ViewController2: UIViewController {
    //Button to go to random page
    @IBOutlet weak var turnToRandomPage: UIButton!
    //Displays random generated number
    @IBOutlet weak var randomLabel: UILabel!
    //Displays # of runs
    @IBOutlet weak var runsLabel: UILabel!
    //Displays # of wickets
    @IBOutlet weak var wicketsLabel: UILabel!
    //to display when 10 wickets fall
    @IBOutlet weak var endingLabel: UILabel!
    //display after each "ball"
    @IBOutlet weak var scoringLabel: UILabel!
    //button to go back to home page
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var teamLabel: UILabel!
    
    var upperBound: Int?
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        turnToRandomPage.addTarget(self, action: #selector(roller), for: .touchUpInside)
        randomLabel.text = ""
        returnButton.isHidden = true
        teamLabel.text = "\(name)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Mark: Actions
    var digit: Int = 0
    var score: Int = 0
    var wickets: Int = 0
    
    @objc func roller(_ sender: UIButton) {
        //Generate random number
        //if you can get a random number in range [a, b] then all you have to do is get a random number in the range [(a+1)/2, b/2] and multiply it by 2 to get a random even number in range [a, b]
        let randomNumber = 2 * (Int.random(in: ((0+1)/2) ... ((upperBound ?? 1)/2)))
        randomLabel.text = "\(randomNumber)"
        digit = randomNumber % 10
        
        if digit == 0 {
            wickets = wickets + 1
            scoringLabel.text = "OUT!"
        }
        else if digit == 8 {
            scoringLabel.text = "NO RUN"
        }
        else {
            score = score + digit
            if digit == 2 {
                scoringLabel.text = "TWO RUNS"
            }
            if digit == 4 {
                scoringLabel.text = "FOUR RUNS!"
            }
            if digit == 6 {
                scoringLabel.text = "SIX RUNS!"
            }
        }
        runsLabel.text = "\(score)"
        wicketsLabel.text = "\(wickets)"
        if wickets == 10 {
            endingLabel.text = "Your final score is \(score). Well played!"
            //Remove turn to page button, reinstate with a return to home page button
            turnToRandomPage.isHidden = true
            returnButton.isHidden = false
        }
        else {
            return
        }
    }
}
