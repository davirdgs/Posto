//
//  SpeedometerAnimationRight.swift
//  posto
//
//  Created by Matheus Santos Lopes on 19/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation


public class SpeedometerAnimationRight: SKScene {
   
    // Grab the path, make sure to add it to your project!
    var sound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("sound1", ofType: "wav")!)
    var audioPlayer = AVAudioPlayer()
    
    
    override public func didMoveToView(view: SKView) {
        var speedometerSprite: SKSpriteNode!
        backgroundColor = SKColor.whiteColor()
        
        speedometerSprite = SKSpriteNode(texture: SKTexture(imageNamed: "vel4"))
        speedometerSprite.xScale = 0.3
        speedometerSprite.yScale = 0.3
        speedometerSprite.position = CGPointMake(frame.width / 2, frame.height / 2.1)
        self.addChild(speedometerSprite)
        
        let moveRight = SKAction.animateWithTextures([
            SKTexture(imageNamed: "vel5"),
            SKTexture(imageNamed: "vel6"),
            SKTexture(imageNamed: "vel7")
            ], timePerFrame: 0.2)
        
        let run = SKAction.repeatAction(moveRight, count: 1)
        speedometerSprite.runAction(run, withKey: "runningRight")
        

        audioPlayer = AVAudioPlayer(contentsOfURL: sound, error: nil)
        audioPlayer.prepareToPlay()
        
        audioPlayer.play()
    }

    
}
