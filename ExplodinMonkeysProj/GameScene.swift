//
//  GameScene.swift
//  ExplodinMonkeysProj
//
//  Created by IACD-011 on 2022/05/30.
//

import SpriteKit

enum CollisionTypes: UInt32{
    case banana = 1
    case building = 2
    case player = 4
}

class GameScene: SKScene {
    
    var buildings = [BuildingNode]()
    
    override func didMove(to view: SKView) {
        
        backgroundColor = UIColor(hue: 0.669, saturation: 0.99, brightness: 0.67, alpha: 1)
        
        createBuildings()
       
    }
    
    func createBuildings(){
        var currentX: CGFloat = -15;
        
        while currentX < 1024{
            let size = CGSize(width: Int.random(in: 2...4)*40, height: Int.random(in: 300...600))
            currentX += size.width + 2
            
            let building = BuildingNode(color: UIColor.red, size: size)
            building.position = CGPoint(x: currentX - (size.width / 2), y: size.height / 2)
            building.setup()
            
            addChild(building)
            
            buildings.append(building)
        }
    }
}
