//
//  GasCalculatorModel.swift
//  posto
//
//  Created by Matheus Santos Lopes on 09/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

class GasCalculatorModel: NSObject {
   
    var valGas: Double
    var valEtn: Double
   // var valGnv: Double
    
    //retorna porcentagem da divisão Etn por Gas
    var valResultGasOrEtn: Double{
        get{
            return (valEtn / valGas) * 100
        }
    }
    
    
    init(valGas: Double, valEnt: Double){
        self.valGas = valGas
        self.valEtn = valEnt
      //  self.valGnv = valGnv
        
    }
    
    
    func returnResultGasOrEtn() -> String{
        
        if valResultGasOrEtn >= 70.0 {
            return "Gasolina"
        }else{
            return "Etanol"
        }
    }
    
    
}
