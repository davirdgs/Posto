//
//  SpeedometerAnimationLeft.swift
//  posto
//
//  Created by Matheus Santos Lopes on 19/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

public class SpeedometerAnimationLeft: SKScene {
   
    override public func didMoveToView(view: SKView) {
        var speedometerSprite: SKSpriteNode!
        backgroundColor = SKColor.whiteColor()
        
        speedometerSprite = SKSpriteNode(texture: SKTexture(imageNamed: "vel4"))
        speedometerSprite.xScale = 0.3
        speedometerSprite.yScale = 0.3
        speedometerSprite.position = CGPointMake(frame.width / 2, frame.height / 2.1)
        self.addChild(speedometerSprite)
        
        let moveLeft = SKAction.animateWithTextures([
            SKTexture(imageNamed: "vel3"),
            SKTexture(imageNamed: "vel2"),
             SKTexture(imageNamed: "vel1")
            ], timePerFrame: 0.2)
        
        let run = SKAction.repeatAction(moveLeft, count: 1)
        speedometerSprite.runAction(run, withKey: "runningLeft")
        
    }
    
}
