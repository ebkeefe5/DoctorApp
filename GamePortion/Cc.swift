//
//  Cc.swift
//  GamePortion
//
//  Created by Eric Keefe on 4/7/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class Cc: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.titleView = homeButton;

        // Do any additional setup after loading the view.
    }
    
    @IBAction func homePressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true);
    }
    
  
   

}
