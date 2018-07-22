//
//  ThirdViewController.swift
//  FoodShelter
//
//  Created by Mohamed Maazin Sudheer on 7/22/18.
//  Copyright © 2018 Mohamed Sudheer. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var partyText: UITextField!
    @IBOutlet weak var buttonEnable: UIButton!
    @IBOutlet weak var items: UITextField!
    @IBOutlet weak var quantity: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submit(_ sender: Any) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUp") as! PopUpViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
    }
    
}
