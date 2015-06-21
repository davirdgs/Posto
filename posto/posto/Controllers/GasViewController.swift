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

    var calculator = GasCalculatorModel()
    @IBOutlet var textGasValue : UITextField!
    @IBOutlet var textGnvOrEtnValue: UITextField!
    @IBOutlet var textResult: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //criar cena inicial com fundo branco
        let scene = SKScene(size: CGSize(width: 800, height: 600))
        scene.backgroundColor = SKColor.whiteColor()
        
        //configurar the view.
        let skView = self.view as! SKView
        
        //setar escala da cena
        scene.size = skView.bounds.size
        scene.scaleMode = .AspectFill
        
        //cena inicial
        skView.presentScene(scene)
        
        //delegates dos textsFields
        textGasValue.delegate = self
        textGnvOrEtnValue.delegate = self

        
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to:nil, from:nil, forEvent:nil)
        textGasValue.becomeFirstResponder()
    }

    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        return false
    }

    
    
    func buttonCalculate(sender: UIButton) {
        
        var valResult: Bool
        
        //fechar teclado virtual
        self.view.endEditing(true)
        
        //esconder botão calcular
        sender.hidden = true
        
        
        var valGasFloat = Float((textGasValue.text as NSString).floatValue)
        var valGnvOrEtnFloat = Float((textGnvOrEtnValue.text as NSString).floatValue)
        valResult = calculator.returnResultGasOrEtn(valGasFloat, valEtn: valGnvOrEtnFloat)
        
        
        
        if  valResult == true {
            
            textResult.text = "Abasteça com ETANOL"

            let scene = SpeedometerAnimationLeft(size: CGSize(width: 800, height: 600))
            
            // Configure the view.
            let skView = self.view as! SKView
            
            /* Set the scale mode to scale to fit the window */
            scene.size = skView.bounds.size
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
            
  
            scene.removeAllActions()
            
        }else{
            textResult.text = "Abasteça com GASOLINA"
            
            let scene = SpeedometerAnimationRight(size: CGSize(width: 800, height: 600))
            
            // Configure the view.
            let skView = self.view as! SKView
            
            /* Set the scale mode to scale to fit the window */
            scene.size = skView.bounds.size
            scene.scaleMode = .AspectFill
            
            skView.presentScene(scene)
            
        }
        
        
        

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
                let replacementString = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
                
                let resultingStringLength = count(prospectiveText) <= 5
                
                let scanner = NSScanner(string: prospectiveText)
                let resultingTextIsNumeric = scanner.scanDecimal(nil) && scanner.atEnd
                
                result = replacementString &&
                    resultingStringLength &&
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