//
//  MenuViewController.swift
//  posto
//
//  Created by Davi Rodrigues on 08/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//


import UIKit

class MenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyCarData.saveValues()
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
    
    @IBAction func returnToMenu (segue: UIStoryboardSegue) {
        
    }
    
}
