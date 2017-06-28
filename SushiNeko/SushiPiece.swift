//
//  SushiPiece.swift
//  SushiNeko
//
//  Created by Andrew Tsukuda on 6/27/17.
//  Copyright © 2017 Andrew Tsukuda. All rights reserved.
//

import SpriteKit

class SushiPiece: SKSpriteNode {
    
    /* Chopsticks object */
    var rightChopstick: SKSpriteNode!
    var leftChopstick: SKSpriteNode!
    
    /* Sushi type */
    var side: Side = .none {
        didSet {
            switch side {
            case .left:
                /* Show your left chopstick */
                leftChopstick.isHidden = false
                
            case .right:
                /* Show your right chopstick */
                rightChopstick.isHidden = false
                
            case .none:
                /* Hide all chopsticks */
                leftChopstick.isHidden = true
                rightChopstick.isHidden = true
            }
        }
    }
    
    /* You are require to implement this for your subclass to work */
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }
    
    /* You are required to impleement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func connectChopsticks() {
        /* Connect our child chopstick nodes */
        rightChopstick = childNode(withName: "rightChopstick") as! SKSpriteNode
        leftChopstick = childNode(withName: "leftChopstick") as! SKSpriteNode
        
        /* Set default side */
        side = .none
    }
    
    func flip(_ side: Side) {
        /* Flip the sushi out of the screen */
        
        var actionName: String = ""
        
        if side == .right {
            actionName = "FlipRight"
        } else if side == .left {
            actionName = "FlipLeft"
        }
        
        /* Load Appropriate Action */
        let flip = SKAction(named: actionName)!
        
        /* Create a node removal action */
        let remove = SKAction.removeFromParent()
        
        /* Build sequence, flip then remove from scene */
        let sequence = SKAction.sequence([flip, remove])
        run(sequence)
        
        
        
    }
}


