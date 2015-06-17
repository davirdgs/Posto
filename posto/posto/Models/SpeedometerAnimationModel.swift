//
//  SpeedometerAnimationModel.swift
//  posto
//
//  Created by Matheus Santos Lopes on 17/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import SpriteKit

class SpeedometerAnimationModel: SKScene {
    
    let textureAtlas = SKTextureAtlas(named:"speedometer.atlas")

    
    override func didMoveToView(view: SKView) {
        view.scene!.anchorPoint = CGPoint(x: 0.5,y: 0.5)
        
        let sprite=SKSpriteNode(texture:textureAtlas.textureNamed("vel4.png"))
        sprite.xScale = 8
        sprite.yScale = 8
        self.addChild(sprite)
    }
    
    
    
    //animar velocimetro para direita
    func moveSpeedometerToRight()
    {
        
        let speedometerRight = SKAction.animateWithTextures([
            textureAtlas.textureNamed("vel5"),
            textureAtlas.textureNamed("vel6"),
            textureAtlas.textureNamed("vel7")
            ], timePerFrame: 0.7)
        
        //inicializar movimento
        let run = SKAction.repeatAction(speedometerRight, count: 3)
        self.runAction(run, withKey: "running")
        
    }
    
}
