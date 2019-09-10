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
    var name1 = ""
    var name2 = ""

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        turnToRandomPage1.addTarget(self, action: #selector(roller1), for: .touchUpInside)
        turnToRandomPage2.addTarget(self, action: #selector(roller2), for: .touchUpInside)
        randomLabel1.text = ""
        randomLabel2.text = ""
        turnToRandomPage1.layer.cornerRadius = 4
        turnToRandomPage2.layer.cornerRadius = 4
        let singleTon = SingletonClass()
        let singleTon2 = SingletonClass2()
        teamLabel1.text = "Player 1: \(singleTon.sharedInstance.dataText)"
        teamLabel2.text = "Player 2: \(singleTon2.sharedInstance.dataText2)"
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
    
    var winningPlayer:Int = 0
    var winningScore:Int = 0
    var losingScore:Int = 0
    var wicketCheckerCount: Int = 0
    
    //MARK: Player 1 logic
    @objc func roller1(_ sender: UIButton) {
        //Generate random number
        //if you can get a random number in range [a, b] then all you have to do is get a random number in the range [(a+1)/2, b/2] and multiply it by 2 to get a random even number in range [a, b]
        let randomNumber = 2 * (Int.random(in: ((0+1)/2) ... ((upperBound ?? 1)/2)))
        randomLabel1.text = "\(randomNumber)"
        digit1 = randomNumber % 10
        let probability = probabilityClass()
        
        if digit1 == 0 {
            if probability.assignProbabilities() {
                scoringLabel1.text = "SURVIVES THE APPEAL! \r\n NO RUN"
            }
            else {
                wickets1 = wickets1 + 1
                scoringLabel1.text = "OUT!"
            }
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
        let probability = probabilityClass()
        
        if digit2 == 0 {
            if probability.assignProbabilities() {
                scoringLabel2.text = "SURVIVES THE APPEAL! \r\n NO RUN"
            }
            else {
                wickets2 = wickets2 + 1
                scoringLabel2.text = "OUT!"
            }
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
            losingScore = min(score1, score2)
            if winningScore == score1 {
                winningPlayer = 1
            }
            else if winningScore == losingScore {
                winningPlayer = 0
            }
            else {
                winningPlayer = 2
            }
            vc.player1Score = "Player 1: \(score1) all out"
            vc.player2Score = "Player 2: \(score2) all out"
            if winningPlayer == 0 {
                vc.finalStatement = "Player 1 has tied with Player 2!"
            }
            else {
                vc.finalStatement = "Player \(winningPlayer) wins by \(winningScore - losingScore) runs!"
            }
            vc.modalTransitionStyle = .crossDissolve
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.present(vc, animated: true, completion: nil)
            }
        }
    }

}

//add to the functionality for displaying winner
//add functionality to select team (preset team of 11). Start out with showing who two are batting, show best partnerships at the end. Table is too hard atm
//add overs
//add functionality for wins by wickets if one of the players finishes batting first
