//
//  GasViewController.swift
//  posto
//
//  Created by Davi Rodrigues on 08/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit



class GasViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textGasValue : UITextField!
    @IBOutlet var textGnvOrEtnValue: UITextField!
    
    @IBOutlet weak var labelResult: UITextView!
    
            //let valResult = GasCalculatorModel(valGas: 0.00 , valEnt: 0.00)
    
    
    
  
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //parra esconder a barra de busca
       // let tap = UITapGestureRecognizer(target: self, action:"dismissKeyboard")
      //  view.addGestureRecognizer(tap)

           // NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification)
        
        UIApplication.sharedApplication().sendAction("resignFirstResponder", to:nil, from:nil, forEvent:nil)
        
        refreshValues()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func refreshValues(){
        
        
        
       
    
//    textGasValue.text = String(format: "%0.3f", textGasValue.text)
//       textGnvOrEtnValue.text = String(format: "%0.3f", textGnvOrEtnValue.text )
//       labelResult.text = ""
        

    }
    
    
    
    

    
//    func keyboardWillShow(notification: NSNotification) {
//        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue
//        // do stuff with the frame...
//    }
    
    
    @IBAction func buttonCalculate(sender: AnyObject) {
        
        var valGasFloat = (textGasValue.text as NSString).floatValue
        var valGnvOrEtnFloat = (textGnvOrEtnValue.text as NSString).floatValue
        
        
        
      let valResult = GasCalculatorModel(valGas: valGasFloat, valEnt: valGnvOrEtnFloat)
        
        labelResult.text = valResult.returnResultGasOrEtn()
        
        
        //fechar teclado virtual
        self.view.endEditing(true)
        
    }
    
    
    //determinar tamanho máximo dos valores
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let newLength = count(textField.text.utf16) + count(string.utf16) - range.length
        
//        if newLength == 2 {
//            textField.text.extend(".")
//        }
        
  
        
        
        
        
        return newLength <= 5 // Bool
    }
    
    
    //abaixar teclado virtual
//    func dismissKeyboard(){
//            self.textGasValue.resignFirstResponder()
//            self.textGnvOrEtnValue.resignFirstResponder()
//        
//    }
    
    
    @IBAction func textFieldUpInside(sender: UITextField) {
        textGasValue.text = "0.000"
        textGnvOrEtnValue.text = String(format: "%0.3f", textGnvOrEtnValue.text )
        labelResult.text = ""
    }
    


 
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        return true;
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
