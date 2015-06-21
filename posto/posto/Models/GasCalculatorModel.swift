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




public class GasCalculatorModel: NSObject{

    var formatter = NSNumberFormatter()
    var valGas: Float = 0.0
    var valEtn: Float = 0.0
    var result: Float = 0.0
    
    //Calcular viabilidade dos combustíveis
    public func returnResultGasOrEtn(valGas: Float, valEtn: Float) -> Bool{
        
        formatter.numberStyle = .DecimalStyle
        formatter.stringFromNumber(valGas)
        formatter.stringFromNumber(valEtn)
        
        self.valGas = valGas
        self.valEtn = valEtn
        
        
        result = (self.valGas / self.valEtn) * 100
        formatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        formatter.stringFromNumber(result)
        
        if result >= 70.0 {
            return false
        }else{
            return true
          
        }
    }
}
