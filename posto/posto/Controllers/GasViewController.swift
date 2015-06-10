//
//  GasViewController.swift
//  posto
//
//  Created by Davi Rodrigues on 08/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

class GasViewController: UIKit.UIViewController {
    
    @IBOutlet var textGasValue : UITextField!
    @IBOutlet var textGnvOrEtnValue: UITextField!
    @IBOutlet var labelResult : UILabel!
    
            //let valResult = GasCalculatorModel(valGas: 0.00 , valEnt: 0.00)
    
    
    
  
    
    func refreshValues(){
       
 
        
         // tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        
        textGasValue.text = String(format: "%0.3f", textGasValue.text)
        textGnvOrEtnValue.text = String(format: "%0.3f", textGnvOrEtnValue.text )
        labelResult.text = ""

       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //parra esconder a barra de busca
        let tap = UITapGestureRecognizer(target: self, action:"dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        
         refreshValues()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func buttonCalculate(sender: AnyObject) {
        
      let valResult = GasCalculatorModel(valGas: Double((textGasValue.text as NSString).doubleValue), valEnt: Double((textGnvOrEtnValue.text as NSString).doubleValue))
        
        labelResult.text = valResult.returnResultGasOrEtn()
        
    }
    
    //abaixar teclado virtual
    func dismissKeyboard(){
            self.textGasValue.resignFirstResponder()
            self.textGnvOrEtnValue.resignFirstResponder()
    }
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
