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

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! SpeedometerAnimationModel
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}


class GasViewController: UIViewController, UITextFieldDelegate
{
    
    @IBOutlet var textGasValue : UITextField!
    @IBOutlet var textGnvOrEtnValue: UITextField!
    @IBOutlet var textResult: UITextField!
    
// var teste: SpeedometerAnimationModel = SpeedometerAnimationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        textGasValue.delegate = self
        textGnvOrEtnValue.delegate = self
        //textResult.delegate = self
        
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to:nil, from:nil, forEvent:nil)
        textGasValue.becomeFirstResponder()
        
        
        
        // criar primeira cena do jogo, da classe gamescene
        let scene = SpeedometerAnimationModel(size: CGSize(width: 700, height: 840))
        
        // configurar a view
        let skView = self.view as! SKView
        
        // vizualisar fps e node para debug
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        // otimizacoes de desempenho de renderizacao feito por spritekit
        skView.ignoresSiblingOrder = true
        
        // setar escala da janela
        scene.scaleMode = .AspectFill
        
        //mostrar cena
        skView.presentScene(scene)

        
        
        //refreshValues()
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
        return true
    }

    
    
    @IBAction func buttonCalculate(sender: NSObject) {
        
        //fechar teclado virtual
        self.view.endEditing(true)
        
        var valGasDouble = Float((textGasValue.text as NSString).floatValue)
        var valGnvOrEtnDouble = Float((textGnvOrEtnValue.text as NSString).floatValue)
        
       

        
      var valResult = GasCalculatorModel(valGas: valGasDouble, valEnt: valGnvOrEtnDouble)
        
        textResult.text = valResult.returnResultGasOrEtn()
        
        

        
    // teste.createSpeedometer()
        
        
        
        
        
        
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