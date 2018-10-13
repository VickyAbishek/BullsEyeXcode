//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Vicky Abishek on 13/10/18.
//  Copyright © 2018 Vicky Abishek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var targetValue: Int = 0
    var selectedValue: Int = 0
    var currentScore: Int = 0
    var currentRound: Int = -1
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentRound += 1
        // Don't call updateScore as this will be called on OnCreate
    }
    
    func updateScore() {
        currentScore = getScore()
    }
    
    func getScore()-> Int{
        let scoreDifference: Int = abs(targetValue-selectedValue)
        return (100-scoreDifference)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(currentScore)
        roundLabel.text = String(currentRound)
    }

    @IBAction func showAlert() {
        
        let roundedValue: Float = slider.value.rounded()
        let displayValue: Int = Int(roundedValue)
        
        let alert = UIAlertController(title: "Title String", message: "\(displayValue)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Cool", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        updateScore()
        updateLabels()
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
//        currentValue = Int(slider.value.rounded())
    }

}

