//
//  ViewController4.swift
//  BookCricket
//
//  Created by Rohit Mehta on 8/1/19.
//  Copyright © 2019 Rohit Mehta. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    //Player1
    
    //Button to go to random page
    @IBOutlet weak var turnToRandomPage1: UIButton!
    //Displays random generated number
    @IBOutlet weak var randomLabel1: UILabel!
    //Displays # of runs
    @IBOutlet weak var runsLabel1: UILabel!
    //Displays # of wickets
    @IBOutlet weak var wicketsLabel1: UILabel!
    //display after each "ball"
    @IBOutlet weak var scoringLabel1: UILabel!
    //"Score" label
    @IBOutlet weak var theScore1: UILabel!
    
    //Player2
    //Button to go to random page
    @IBOutlet weak var turnToRandomPage2: UIButton!
    //Displays random generated number
    @IBOutlet weak var randomLabel2: UILabel!
    //Displays # of runs
    @IBOutlet weak var runsLabel2: UILabel!
    //Displays # of wickets
    @IBOutlet weak var wicketsLabel2: UILabel!
    //display after each "ball"
    @IBOutlet weak var scoringLabel2: UILabel!
    //"Score" label
    @IBOutlet weak var theScore2: UILabel!
    
    
    @IBOutlet weak var teamLabel1: UILabel!
    @IBOutlet weak var teamLabel2: UILabel!
    
    var upperBound: Int?

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        turnToRandomPage1.addTarget(self, action: #selector(roller1), for: .touchUpInside)
        turnToRandomPage2.addTarget(self, action: #selector(roller2), for: .touchUpInside)
        randomLabel1.text = ""
        randomLabel2.text = ""
        let singleTon = SingletonClass()
        teamLabel1.text = "\(singleTon.sharedInstance.dataText)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: Actions
    var digit1: Int = 0
    var score1: Int = 0
    var wickets1: Int = 0
    
    var digit2: Int = 0
    var score2: Int = 0
    var wickets2: Int = 0
    
    var winningScore:Int = 0
    var wicketCheckerCount: Int = 0
    
    //MARK: Player 1 logic
    @objc func roller1(_ sender: UIButton) {
        //Generate random number
        //if you can get a random number in range [a, b] then all you have to do is get a random number in the range [(a+1)/2, b/2] and multiply it by 2 to get a random even number in range [a, b]
        let randomNumber = 2 * (Int.random(in: ((0+1)/2) ... ((upperBound ?? 1)/2)))
        randomLabel1.text = "\(randomNumber)"
        digit1 = randomNumber % 10
        
        if digit1 == 0 {
            wickets1 += 1
            scoringLabel1.text = "OUT!"
        }
        else if digit1 == 8 {
            scoringLabel1.text = "NO RUN"
        }
        else {
            score1 += digit1
            if digit1 == 2 {
                scoringLabel1.text = "TWO RUNS"
            }
            if digit1 == 4 {
                scoringLabel1.text = "FOUR RUNS!"
            }
            if digit1 == 6 {
                scoringLabel1.text = "SIX RUNS!"
            }
        }
        runsLabel1.text = "\(score1)"
        wicketsLabel1.text = "\(wickets1)"
        if wickets1 == 10 {
            //Remove turn to page button, reinstate with a return to home page button
            turnToRandomPage1.isHidden = true
            //change 'score' to 'final score'
            theScore1.text = "Final Score"
            wicketCheckerCount += 1
            wicketChecker()
        }
        else {
            return
        }
    }
    //MARK: Player 2 logic
    @objc func roller2(_ sender: UIButton) {
        //Generate random number
        //if you can get a random number in range [a, b] then all you have to do is get a random number in the range [(a+1)/2, b/2] and multiply it by 2 to get a random even number in range [a, b]
        let randomNumber = 2 * (Int.random(in: ((0+1)/2) ... ((upperBound ?? 1)/2)))
        randomLabel2.text = "\(randomNumber)"
        digit2 = randomNumber % 10
        
        if digit2 == 0 {
            wickets2 += 1
            scoringLabel2.text = "OUT!"
        }
        else if digit2 == 8 {
            scoringLabel2.text = "NO RUN"
        }
        else {
            score2 += digit2
            if digit2 == 2 {
                scoringLabel2.text = "TWO RUNS"
            }
            if digit2 == 4 {
                scoringLabel2.text = "FOUR RUNS!"
            }
            if digit2 == 6 {
                scoringLabel2.text = "SIX RUNS!"
            }
        }
        runsLabel2.text = "\(score2)"
        wicketsLabel2.text = "\(wickets2)"
        if wickets2 == 10 {
            //Remove turn to page button, reinstate with a return to home page button
            turnToRandomPage2.isHidden = true
            //change 'score' to 'final score'
            theScore2.text = "Final Score"
            wicketCheckerCount += 1
            wicketChecker()
        }
        else {
            return
        }
    }
    func wicketChecker() {
        if wicketCheckerCount == 2 {
            //transit to final page
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "EndViewController") as! EndViewController
            winningScore = max(score1, score2)
            vc.scoreData = "\(winningScore)"
            self.present(vc, animated: true, completion: nil)
        }
    }

}
//add to the functionality for displaying winner
//add functionality to select team (preset team of 11). Start out with showing who two are batting, show best partnerships at the end. Table is too hard atm
//add overs
//FOCUS ON THIS 1ST bias: generate 1 more random #, 1-20. Check ranking of team. Eg: if team ranking is 10, if the 2nd rand # is more than 18, try one more time if out. 10% of time they will get one more chance, roll 1st random thing again
