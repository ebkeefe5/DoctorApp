//
//  Dermatologist.swift
//  GamePortion
//
//  Created by Eric Keefe on 2/25/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class Dermatologist: UIViewController {

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
   
    
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
