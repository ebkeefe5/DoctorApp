//
//  WhatToExpect.swift
//  GamePortion
//
//  Created by Eric Keefe on 2/24/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class WhatToExpect: UIViewController {

    @IBOutlet weak var dentistButton: UIButton!
    
    @IBOutlet weak var eyeDoctorButton: UIButton!
    
    @IBOutlet weak var dermButton: UIButton!
    
    @IBOutlet weak var GPButton: UIButton!
    
    @IBOutlet weak var sportsDoctorButton: UIButton!
    
    @IBOutlet weak var pychologistButton: UIButton!
    
    var x1: CGFloat = 10.0;
    var y1: CGFloat = 245.0;
    var width1: CGFloat = 175;
    var height1: CGFloat = 130;
    var xspacing: CGFloat = 0;
    var yspacing: CGFloat = 0;
    var buttonBorderWidth: CGFloat = 2;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        xspacing = width1 + 10;
        yspacing = height1 + 10;
        
        
        dentistButton.clipsToBounds = true;
        dentistButton.layer.cornerRadius = 25.0;
        dentistButton.frame = CGRect(x: x1, y: y1, width: width1, height: height1);
        dentistButton.layer.borderWidth = buttonBorderWidth;
        dentistButton.layer.borderColor = UIColor.white.cgColor;
        
        eyeDoctorButton.clipsToBounds = true;
        eyeDoctorButton.layer.cornerRadius = 25.0;
        eyeDoctorButton.frame = CGRect(x: x1+xspacing, y: y1, width: width1, height: height1);
        eyeDoctorButton.layer.borderWidth = buttonBorderWidth;
        eyeDoctorButton.layer.borderColor = UIColor.white.cgColor;
        
        dermButton.clipsToBounds = true;
        dermButton.layer.cornerRadius = 25.0;
        dermButton.frame = CGRect(x: x1, y: y1+yspacing, width: width1, height: height1);
        dermButton.layer.borderWidth = buttonBorderWidth;
        dermButton.layer.borderColor = UIColor.white.cgColor;
        
        
        GPButton.clipsToBounds = true;
        GPButton.layer.cornerRadius = 25.0;
        GPButton.frame = CGRect(x: x1+xspacing, y: y1+yspacing, width: width1, height: height1);
        GPButton.layer.borderWidth = buttonBorderWidth;
        GPButton.layer.borderColor = UIColor.white.cgColor;
        
        pychologistButton.clipsToBounds = true;
        pychologistButton.layer.cornerRadius = 25.0;
        pychologistButton.frame = CGRect(x: x1, y: y1+yspacing+yspacing, width: width1, height: height1);
        pychologistButton.layer.borderWidth = buttonBorderWidth;
        pychologistButton.layer.borderColor = UIColor.white.cgColor;
        
        sportsDoctorButton.clipsToBounds = true;
        sportsDoctorButton.layer.cornerRadius = 25.0;
        sportsDoctorButton.frame = CGRect(x: x1 + xspacing, y: y1+yspacing+yspacing, width: width1, height: height1);
        sportsDoctorButton.layer.borderWidth = buttonBorderWidth;
        sportsDoctorButton.layer.borderColor = UIColor.white.cgColor;
        
        

        // Do any additional setup after loading the view.
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
