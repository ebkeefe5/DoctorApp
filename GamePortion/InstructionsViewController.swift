//
//  InstructionsViewController.swift
//  GamePortion
//
//  Created by Eric Keefe on 10/24/18.
//  Copyright © 2018 Eric Keefe. All rights reserved.
//

import UIKit

class InstructionsViewController: UIViewController {

    
   
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        button1.clipsToBounds = true;
        button1.layer.cornerRadius = 25.0;
        
        button1.layer.borderWidth = 2;
        button1.layer.borderColor = UIColor.white.cgColor;
        
        self.navigationItem.titleView = homeButton;
       
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func homePressed(_ sender: Any) {
    self.navigationController?.popToRootViewController(animated: true);
    }
    
  
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
