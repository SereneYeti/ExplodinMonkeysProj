//
//  GameViewController.swift
//  ExplodinMonkeysProj
//
//  Created by IACD-011 on 2022/05/30.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var angelSlider: UISlider!
    @IBOutlet weak var angelLabel: UILabel!
    @IBOutlet weak var velocitySlider: UISlider!
    @IBOutlet weak var velocityLabel: UILabel!
    @IBOutlet weak var btnLaunch: UIButton!
    @IBOutlet weak var playerNumber: UILabel!
    var currentGame: GameScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        angleChanged(angelSlider)
        velocityChanged(velocitySlider)
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                currentGame = scene as? GameScene
                currentGame.viewController = self
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
    }

    override var shouldAutorotate: Bool {
        return true
    }
    @IBAction func angleChanged(_ sender: Any) {
        angelLabel.text = "Angle: \(Int(angelSlider.value))"
    }
    @IBAction func velocityChanged(_ sender: Any) {
        velocityLabel.text = "Velocity: \(Int(velocitySlider.value))"
    }
    @IBAction func launch(_ sender: Any) {
        angelSlider.isHidden = true;
        angelLabel.isHidden = true;
        
        velocitySlider.isHidden = true;
        velocityLabel.isHidden = true;
        
        btnLaunch.isHidden = true;
        
        currentGame.launch(angle: Int(angelSlider.value), velocity: Int(velocitySlider.value))
    }
    
    func activatePlayer(number: Int){
        if(number == 1){
            playerNumber.text = "<<< Player One"
        } else {
            playerNumber.text = ">>> Player Two"
        }
        
        angelSlider.isHidden = false;
        angelLabel.isHidden = false;
        
        velocitySlider.isHidden = false;
        velocityLabel.isHidden = false;
        
        btnLaunch.isHidden = false;
        
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
