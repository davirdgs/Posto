//
//  MaintenanceViewController.swift
//  posto
//
//  Created by Davi Rodrigues on 08/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

class MaintenanceViewController: UIViewController {

    

    
    //@IBOutlet weak var oilTextField: UITextView!
    @IBOutlet weak var oilTextField: UILabel!
    @IBOutlet weak var maintenanceTextField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.setMaintenance()
        self.setOilText()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setOilText() {
        let oilNumber: NSNumber = MyCarData.returnValue("oil_defaults") as! NSNumber
        let kmNumber: NSNumber = MyCarData.returnValue("km_defaults") as! NSNumber
        
        //println(oilNumber)
        //println(kmNumber)
        //println(MyCarData.returnValue("user_type"))
        
        var next: Int
        var ref: Int = 0
        
        if(MyCarData.returnValue("user_type") as! Int == 0) {
            ref = 7000
        } else if(MyCarData.returnValue("user_type") as! Int == 1) {
            ref = 15000
        }
        
        
        if(oilNumber == 0 || kmNumber == 0) {
            self.oilTextField.text = "Atualize com a quilometragem da última troca de óleo e a quilometragem atual no menu 'Meu Carro'"
            return
        }
        
        next = ref - (kmNumber.intValue - oilNumber.intValue)
        if(next < 0) {
            next = 0 - next
            self.oilTextField.text = "A última troca de óleo deveria ocorrer há " + next.description + " quilometros"
        } else {
            self.oilTextField.text = "Próxima troca de óleo em " + next.description + " quilometros"
        }
        
        
        
    }
    
    func setMaintenance() {
        let inspectionNumber: NSNumber = MyCarData.returnValue("inspection_defaults") as! NSNumber
        let kmNumber: NSNumber = MyCarData.returnValue("km_defaults") as! NSNumber
        
        var next: Int
        var ref: Int = 0
        
        if(MyCarData.returnValue("user_type") as! Int == 0) {
            ref = 10000
        } else if(MyCarData.returnValue("user_type") as! Int == 1) {
            ref = 20000
        }
        
        
        if(inspectionNumber == 0 || kmNumber == 0) {
            self.maintenanceTextField.text = "Atualize com a quilometragem da última manutenção e a quilometragem atual no menu 'Meu Carro'"
            return
        }
        
        next = ref - (kmNumber.intValue - inspectionNumber.intValue)
        if(next < 0) {
            next = 0 - next
            self.maintenanceTextField.text = "A última manutenção deveria ocorrer há " + next.description + " quilometros"
        } else {
            self.maintenanceTextField.text = "Próxima manutenção em " + next.description + " quilometros"
        }
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
