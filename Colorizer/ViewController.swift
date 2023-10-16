//
//  ViewController.swift
//  Colorizer
//
//  Created by XE on 16.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet var coloredView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    
    var timer: Timer?
    var counter: Int = 6
    var defaultBgColor: UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerLabel.text = ""
        defaultBgColor = coloredView.backgroundColor
    }

    @IBAction func redButtonPressed(_ sender: Any) {
        turnTimerOn()

        coloredView.backgroundColor = redButton.tintColor
    }
    
    @IBAction func greenButtonPressed(_ sender: Any) {
        turnTimerOn()

        coloredView.backgroundColor = greenButton.tintColor
    }
    
    @IBAction func blueButtonPressed(_ sender: Any) {
        turnTimerOn()

        coloredView.backgroundColor = blueButton.tintColor
            }
    
    func turnTimerOn() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounts), userInfo: nil, repeats: true)
    }
    
    @objc func timerCounts() {
        counter -= 1
        timerLabel.text = "\(counter)"
        
        if counter < 0 {
            timer?.invalidate()
            timer = nil
            counter = 6
            timerLabel.text = ""
            coloredView.backgroundColor = defaultBgColor
        }
    }
}

