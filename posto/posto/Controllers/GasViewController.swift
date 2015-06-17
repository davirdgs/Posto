//
//  GasViewController.swift
//  posto
//
//  Created by Davi Rodrigues on 08/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit
import AVFoundation
import SpriteKit



class GasViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet var textGasValue : UITextField!
    @IBOutlet var textGnvOrEtnValue: UITextField!
    @IBOutlet var textResult: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        textGasValue.delegate = self
        textGnvOrEtnValue.delegate = self
        //textResult.delegate = self
        
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to:nil, from:nil, forEvent:nil)
        textGasValue.becomeFirstResponder()
        
        

        
        
        //refreshValues()
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    @IBAction func buttonCalculate(sender: AnyObject) {
        
        var valGasDouble = Float((textGasValue.text as NSString).floatValue)
        var valGnvOrEtnDouble = Float((textGnvOrEtnValue.text as NSString).floatValue)
        
        
        
      var valResult = GasCalculatorModel(valGas: valGasDouble, valEnt: valGnvOrEtnDouble)
        
        textResult.text = valResult.returnResultGasOrEtn()
        
        

        
     
        
        
        
        
        //fechar teclado virtual
        self.view.endEditing(true)
        
    }
    

    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var result = true
        let prospectiveText = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        let newLength = count(textField.text.utf16) + count(string.utf16) - range.length

        
        if (textField == textGasValue) || textField == textGnvOrEtnValue {
            if count(string) > 0 {
                if newLength == 2 {
                            textField.text.extend(".")
                }
                let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789").invertedSet
                let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
                
                let resultingStringLengthIsLegal = count(prospectiveText) <= 5
                
                let scanner = NSScanner(string: prospectiveText)
                let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.atEnd
                
                result = replacementStringIsLegal &&
                    resultingStringLengthIsLegal &&
                resultingTextIsNumeric
            }
        }
        return result
    }


    func textFieldShouldReturn(userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
}