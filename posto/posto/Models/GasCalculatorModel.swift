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
        
        var teste: SpeedometerAnimationModel = SpeedometerAnimationModel()
       
         teste.moveSpeedometerToRight()
        

        if valResultGasOrEtn >= 70.0 {
            
            
            return "Abasteça com Gasolina"
        }else{
         
            return "Abasteça com Etanol"
        }
    }
    
    
    
    

    
    
}



