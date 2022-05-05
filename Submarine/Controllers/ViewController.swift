//
//  ViewController.swift
//  Submarine
//
//  Created by Seyran Saakyan on 24.04.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
//        self.view.addGestureRecognizer(recognizer)
    }

//    @IBAction func tapDetected(){
//        let controller = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
//        controller.modalPresentationStyle = .fullScreen
//        controller.modalTransitionStyle = .coverVertical
//        self.present(controller, animated: true, completion: nil)
//    }
    
    
    @IBAction func startButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "StartViewController") as! StartViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func leaderboardButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "LeaderboardViewController") as! LeaderboardViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true, completion: nil)
    }
    @IBAction func settingsButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .coverVertical
        self.present(controller, animated: true, completion: nil)
    }
}

