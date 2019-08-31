//
//  EndViewController.swift
//  BookCricket
//
//  Created by Rohit Mehta on 8/5/19.
//  Copyright © 2019 Rohit Mehta. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var winningScore: UILabel!
    @IBOutlet weak var player1ScoreLabel: UILabel!
    @IBOutlet weak var player2ScoreLabel: UILabel!
    var player1Score:String!
    var player2Score:String!
    var finalStatement:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        winningScore.text = finalStatement
        player1ScoreLabel.text = player1Score
        player2ScoreLabel.text = player2Score

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
