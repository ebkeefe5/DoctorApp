//
//  selectGame.swift
//  GamePortion
//
//  Created by Eric Keefe on 3/13/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class selectGame: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    
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
    

}
