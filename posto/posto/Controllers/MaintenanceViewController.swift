//
//  MaintenanceViewController.swift
//  posto
//
//  Created by Davi Rodrigues on 08/06/15.
//  Copyright (c) 2015 Davi Rodrigues. All rights reserved.
//

import UIKit

class MaintenanceViewController: UIViewController {

    
    @IBOutlet weak var oilLabel: UILabel!
    @IBOutlet weak var maintenanceLabel: UILabel!
    
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
        
        var next: Int
        
        if(oilNumber == 0 || kmNumber == 0) {
            self.oilLabel.text = "Atualize com a quilometragem da última troca de óleo e a quilometragem atual no menu 'Meu Carro'"
            return
        }
        
        next = 10000 - (kmNumber.intValue - oilNumber.intValue)
        
        
        
    }
    
    func setMaintenance() {
        let inspectionNumber: NSNumber = MyCarData.returnValue("inspection_defaults") as! NSNumber
        let kmNumber: NSNumber = MyCarData.returnValue("km_defaults") as! NSNumber
        
        if(inspectionNumber == 0 || kmNumber == 0) {
            self.maintenanceLabel.text = "Atualize com a quilometragem da última revisão e a quilometragem atual no menu 'Meu Carro'"
            return
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
