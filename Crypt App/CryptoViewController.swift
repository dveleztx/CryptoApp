//
//  CryptoViewController.swift
//  Crypt App
//
//  Created by David Velez on 5/4/19.
//  Copyright © 2019 VelezCorp. All rights reserved.
//

import UIKit

class CryptoViewController: UIViewController {
    
    @IBAction func unwindToCryptoMainView(segue: UIStoryboardSegue) {
        
    }
    
    // TextField
    @IBOutlet weak var plainTextMsg: UITextField!
    
    var plaintext: UITextField!
    
    // Switches
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    // List of answers chosen and encryptions used
    var answersChosen: [String] = []
    var encryptionsChosen: [Int] = []
    
    // Encode String in Base64
    func convertToBase64(_ s: String) -> String {
        let data = (s).data(using: String.Encoding.utf8)
        let base64 = data!.base64EncodedString(options: NSData.Base64EncodingOptions(rawValue: 0))
        return base64
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //updateUI()
    }
    
    // Every time the screen appears, update UI
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
    
    // Reset arrays
    func updateUI() {
        answersChosen.removeAll()
        encryptionsChosen.removeAll()
    }

    // When you hit encryption button, execute logic
    @IBAction func multipleAnswerButtonPressed() {
        plaintext = plainTextMsg
        
        // Check which switches are on
        if multiSwitch1.isOn {
            answersChosen.append(convertToBase64(plaintext.text!))
            encryptionsChosen.append(0)
        }
        if multiSwitch2.isOn {
            answersChosen.append(plaintext.text!.rot13())
            encryptionsChosen.append(1)
        }
        if multiSwitch3.isOn {
            let plain = convertToBase64(plaintext.text!)
            answersChosen.append(plain.rot13())
            encryptionsChosen.append(2)
        }
        
        // Go to next screen
        performSegue(withIdentifier: "ResultsSegue", sender: nil)
    }

    // Pass data to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
            resultsViewController.indexes = encryptionsChosen
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
