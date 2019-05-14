//
//  ResultsViewController.swift
//  Crypt App
//
//  Created by David Velez on 5/4/19.
//  Copyright © 2019 VelezCorp. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    // Answer Labels
    @IBOutlet weak var resultsAnswerLabel1: UILabel!
    @IBOutlet weak var resultsAnswerLabel2: UILabel!
    @IBOutlet weak var resultsAnswerLabel3: UILabel!
    
    // Retrieve data from CryptoViewController
    var responses: [String]!
    var indexes: [Int]!

    // Upon view, render the new answers
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load in the encrypted values 
        if indexes.contains(0) && indexes.contains(1) && indexes.contains(2) {
            resultsAnswerLabel1.text = responses[0]
            resultsAnswerLabel2.text = responses[1]
            resultsAnswerLabel3.text = responses[2]
        }
        else if ((indexes.contains(1) && indexes.contains(2)) || (indexes.contains(0) && indexes.contains(2))
            || (indexes.contains(0) && indexes.contains(1))) {
            resultsAnswerLabel1.text = responses[0]
            resultsAnswerLabel2.text = responses[1]
            resultsAnswerLabel3.isHidden = true
        }
        else if ((indexes.contains(0)) || (indexes.contains(1)) || (indexes.contains(2))) {
            resultsAnswerLabel1.text = responses[0]
            resultsAnswerLabel2.isHidden = true
            resultsAnswerLabel3.isHidden = true
        }
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
