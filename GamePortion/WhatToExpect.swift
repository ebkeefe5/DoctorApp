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
    
     @IBOutlet weak var button1: UIButton!
 
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    
    @IBOutlet weak var button7: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = homeButton;
        
        button1.clipsToBounds = true;
        button1.layer.cornerRadius = 25.0;
        
        button1.layer.borderWidth = 2;
        button1.layer.borderColor = UIColor.white.cgColor;
        
        button2.clipsToBounds = true;
        button2.layer.cornerRadius = 25.0;
        
        button2.layer.borderWidth = 2;
        button2.layer.borderColor = UIColor.white.cgColor;
        
        button3.clipsToBounds = true;
        button3.layer.cornerRadius = 25.0;
        button3.layer.borderWidth = 2;
        button3.layer.borderColor = UIColor.white.cgColor;
        
        button4.clipsToBounds = true;
        button4.layer.cornerRadius = 25.0;
        button4.layer.borderWidth = 2;
        button4.layer.borderColor = UIColor.white.cgColor;
        
        button5.clipsToBounds = true;
        button5.layer.cornerRadius = 25.0;
        button5.layer.borderWidth = 2;
        button5.layer.borderColor = UIColor.white.cgColor;
        
        button6.clipsToBounds = true;
        button6.layer.cornerRadius = 25.0;
        button6.layer.borderWidth = 2;
        button6.layer.borderColor = UIColor.white.cgColor;
        
        button7.clipsToBounds = true;
        button7.layer.cornerRadius = 25.0;
        button7.layer.borderWidth = 2;
        button7.layer.borderColor = UIColor.white.cgColor;
        
       
        
        
        
        
        
        
        
        
        

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
