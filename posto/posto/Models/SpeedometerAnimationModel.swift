//
//  SpeedometerAnimationModel.swift
//  posto
//
//  Created by Matheus Santos Lopes on 17/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import SpriteKit
import AVFoundation


class SpeedometerAnimationModel: SKScene {
    var speedometerSprite: SKSpriteNode!
    var speedometerMoveRight: SKAction!



    
    override func didMoveToView(view: SKView) {
        
        
        //controle de gravidade inicial
        self.physicsWorld.gravity = CGVectorMake(0.0, 0.0)
        
        backgroundColor = SKColor.whiteColor()
        
        speedometerSprite = SKSpriteNode(texture: SKTexture(imageNamed: "vel4"))
        speedometerSprite.xScale = 0.2
        speedometerSprite.yScale = 0.2
        speedometerSprite.position = CGPointMake(frame.width / 2.5, frame.height / 2.5)
        self.addChild(speedometerSprite)

        
        self.createSpeedometer()
       
    }
    
    
    func createSpeedometer()
    {
        
        //let speedometerAtlas = SKTextureAtlas(named: "speedometer")
        let moveSpeedometer = SKAction.animateWithTextures([
            SKTexture(imageNamed: "vel5"),
            SKTexture(imageNamed: "vel6"),
            SKTexture(imageNamed: "vel7"),
            ], timePerFrame: 0.5)
        
        let run = SKAction.repeatActionForever(moveSpeedometer)
        speedometerSprite.runAction(run, withKey: "running")
       // self.speedometerSprite = SKAction.animateWithTextures(speedometerAtlas, timePerFrame: 3)
        
             //   self.runAction(speedometerAtlas, withKey: "running")
    }
    
    
    
//    //animar velocimetro para direita
//    func moveSpeedometerToRight()
//    {
//        
//        
//        speedometerSprite=SKSpriteNode(texture: SKTexture(imageNamed: "vel5"))
//        speedometerSprite.xScale = 5
//        speedometerSprite.yScale = 5
//        speedometerSprite.position = CGPointMake(frame.width / 2.5, frame.height / 2.75)
//        self.addChild(speedometerSprite)
//        
//        speedometerMoveRight = SKAction.animateWithTextures([
//            textureAtlas.textureNamed("vel5"),
//            textureAtlas.textureNamed("vel6"),
//            textureAtlas.textureNamed("vel7")
//            ], timePerFrame: 0.7)
//        
//        //inicializar movimento
//        let run = SKAction.repeatAction(speedometerMoveRight, count: 100)
//        self.runAction(run, withKey: "running")
//        
//    }
    
}
