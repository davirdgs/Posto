//
//  GasCalculatorModel.swift
//  posto
//
//  Created by Matheus Santos Lopes on 09/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import SpriteKit
import Foundation

class GasCalculatorModel: NSObject{
    var formatter = NSNumberFormatter()
    var valGas: Float
    var valEtn: Float
    
    var speedometer: SKSpriteNode!
  
    
    //retorna porcentagem da divisão Etn por Gas
    var valResultGasOrEtn: Float{
        get{
            var result = (valGas / valEtn) * 100
            formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
            formatter.stringFromNumber(result)
            
            return (result)
        }
    }
    
    
    init(valGas: Float, valEnt: Float){
        formatter.numberStyle = .DecimalStyle
        formatter.stringFromNumber(valGas)
        formatter.stringFromNumber(valEnt)
        
        self.valGas = valGas
        self.valEtn = valEnt
    }
    
    
    func returnResultGasOrEtn() -> String{
        

                //speedometer = SKSpriteNode(texture: SKTexture(imageNamed: "vel4"))
        
        
                //speedometer.position = CGPointMake(280, 200)
        
        
                //speedometer.addChild(speedometer)
        
           moveSpeedometerToRight()
        
        if valResultGasOrEtn >= 70.0 {
            
            
            

            

             moveSpeedometerToRight()
            
            return "Abasteça com Gasolina"

            
            
        }else{
         
            return "Abasteça com Etanol"
        }
    }
    
    
    
    
    //animar velocimetro para direita
    func moveSpeedometerToRight()
    {
        
        let speedometerRight = SKAction.animateWithTextures([
            SKTexture(imageNamed: "vel5"),
            SKTexture(imageNamed: "vel6"),
            SKTexture(imageNamed: "vel7"),
            
            ], timePerFrame: 0.30)
        
        //inicializar movimento
        let run = SKAction.repeatAction(speedometerRight, count: 3)
        //speedometer.runAction(run, withKey: "running")
        
    }
    
    
}



