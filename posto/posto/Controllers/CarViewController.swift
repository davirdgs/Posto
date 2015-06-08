//
//  CarViewController.swift
//  posto
//
//  Created by Davi Rodrigues on 08/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

class CarViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate
{
    @IBOutlet weak var modelPicker: UIPickerView!
    @IBOutlet weak var modelLabel: UILabel!
    let pickerData = ["Mozzarella","Gorgonzola","Provolone","Brie","Maytag Blue","Sharp Cheddar","Monterrey Jack","Stilton","Gouda","Goat Cheese", "Asiago"]
    
    
    
    @IBOutlet weak var kmTextField: UITextField!
    @IBOutlet weak var oilTextField: UITextField!
    @IBOutlet weak var reviewTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //myLabel.text = pickerData[row]
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField.clearsOnBeginEditing = false
        return true
    }
    
    @IBAction func handleSingleTap(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    
}