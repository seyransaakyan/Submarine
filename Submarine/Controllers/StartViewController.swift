//
//  StartViewController.swift
//  Submarine
//
//  Created by Seyran Saakyan on 24.04.2022.
//

import UIKit
import Foundation

class StartViewController: UIViewController {
    
    @IBOutlet weak var rockView: UIImageView!
    @IBOutlet weak var oxygenBar: UIProgressView!
    let fishView = UIImageView(frame: CGRect(x: 1000, y: 230, width: 60, height: 45))
    @IBOutlet weak var shipView: UIImageView!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var submarineView: UIImageView!
    @IBOutlet weak var sandView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createFish()
        self.movingThings()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func upButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            if self.submarineView.frame.origin.y > 110 {
                self.submarineView.frame.origin.y -= 10
            }
        }
    }
    @IBAction func downButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.submarineView.frame.origin.y += 10
            if self.submarineView.frame.origin.y > 327{
                self.gameOver()
            }
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    private func gameOver(){
        let gameOver = UILabel(frame: CGRect(x: 286, y: 174, width: 328, height: 72))
        gameOver.text = "GAME OVER"
        gameOver.textAlignment = .center
        gameOver.font = gameOver.font.withSize(60)
        view.addSubview(gameOver)
        upButton.isEnabled = false
        downButton.isEnabled = false
        submarineView.image = UIImage(named: "submarineDestroyed")
        UIView.animate(withDuration: 0.6) {
            self.submarineView.frame.origin.y = 340
        }
    }
    func movingThings(){
        UIView.animate(withDuration: 0.01875) {
            self.oxygenBar.progress -= 0.001
            self.fishView.frame.origin.x -= 2
            self.shipView.frame.origin.x -= 2
            self.rockView.frame.origin.x -= 1
        } completion: { _ in
            if self.shipView.frame.origin.x < -300{
                self.shipView.frame.origin.x = self.view.frame.width
            }
            if self.fishView.frame.origin.x < -300{
                self.fishView.frame.origin.x = self.view.frame.width
            }
            if self.rockView.frame.origin.x < -300{
                self.rockView.frame.origin.x = self.view.frame.width
            }
            if self.shipView.frame.intersects(self.submarineView.frame){
                self.gameOver()
                return
            }
            if self.rockView.frame.intersects(self.submarineView.frame){
                self.gameOver()
                return
            }
            if self.fishView.frame.intersects(self.submarineView.frame){
                self.gameOver()
                return
            }
            if self.submarineView.frame.origin.y < 120{
                self.oxygenBar.progress += 1
            }
            if self.oxygenBar.progress == 0{
                self.gameOver()
                return
            }
            self.movingThings()
        }
    }
    
    func createFish(){
        fishView.image = UIImage(named: "fish")
        self.view.addSubview(fishView)
    }
}
    
