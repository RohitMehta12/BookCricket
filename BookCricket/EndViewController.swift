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
    var scoreData:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        winningScore.text = scoreData

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
