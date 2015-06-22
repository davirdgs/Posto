//
//  SpeedometerAnimationCenter.swift
//  posto
//
//  Created by Matheus Santos Lopes on 22/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation


public class SpeedometerAnimationCenter: SKScene {
    
    
    override public func didMoveToView(view: SKView) {
        var speedometerSprite: SKSpriteNode!
        backgroundColor = SKColor.whiteColor()
        
        speedometerSprite = SKSpriteNode(texture: SKTexture(imageNamed: "vel4"))
        speedometerSprite.xScale = 0.3
        speedometerSprite.yScale = 0.3
        speedometerSprite.position = CGPointMake(frame.width / 2, frame.height / 2.1)
        self.addChild(speedometerSprite)
    }
    
    
}