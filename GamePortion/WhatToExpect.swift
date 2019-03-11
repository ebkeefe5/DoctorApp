//
//  WhatToExpect.swift
//  GamePortion
//
//  Created by Eric Keefe on 2/24/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class WhatToExpect: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var dentistButton: UIButton!
    
    @IBOutlet weak var eyeDoctorButton: UIButton!
    
    @IBOutlet weak var dermButton: UIButton!
    
    @IBOutlet weak var GPButton: UIButton!
    
    @IBOutlet weak var sportsDoctorButton: UIButton!
    
    @IBOutlet weak var pychologistButton: UIButton!
    
   
    var buttonBorderWidth: CGFloat = 2;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
       
        self.navigationItem.titleView = homeButton;
        
        
        
        
        
        
        dentistButton.clipsToBounds = true;
        dentistButton.layer.cornerRadius = 25.0;
        
        dentistButton.layer.borderWidth = buttonBorderWidth;
        dentistButton.layer.borderColor = UIColor.white.cgColor;
        
        eyeDoctorButton.clipsToBounds = true;
        eyeDoctorButton.layer.cornerRadius = 25.0;
        
        eyeDoctorButton.layer.borderWidth = buttonBorderWidth;
        eyeDoctorButton.layer.borderColor = UIColor.white.cgColor;
        
        dermButton.clipsToBounds = true;
        dermButton.layer.cornerRadius = 25.0;
       
        dermButton.layer.borderWidth = buttonBorderWidth;
        dermButton.layer.borderColor = UIColor.white.cgColor;
        
        
        GPButton.clipsToBounds = true;
        GPButton.layer.cornerRadius = 25.0;
        
        GPButton.layer.borderWidth = buttonBorderWidth;
        GPButton.layer.borderColor = UIColor.white.cgColor;
        
        pychologistButton.clipsToBounds = true;
        pychologistButton.layer.cornerRadius = 25.0;
        
        pychologistButton.layer.borderWidth = buttonBorderWidth;
        pychologistButton.layer.borderColor = UIColor.white.cgColor;
        
        sportsDoctorButton.clipsToBounds = true;
        sportsDoctorButton.layer.cornerRadius = 25.0;
        
        sportsDoctorButton.layer.borderWidth = buttonBorderWidth;
        sportsDoctorButton.layer.borderColor = UIColor.white.cgColor;
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func homePressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true);
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
