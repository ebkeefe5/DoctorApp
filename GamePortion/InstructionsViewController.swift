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
    
    
    override func viewDidLoad() {
        super.viewDidLoad();
        //let button =  UIButton(type: .custom)
        //button.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        //button.backgroundColor = .white
        //button.setTitle("Home", for: .normal)
        homeButton.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside)
        self.navigationItem.titleView = homeButton;
        //let logo = UIImage(named: "gHouse.png");
        //let imageView = UIImageView(image:logo);
        //self.navigationItem.titleView = imageView;
        
        // Do any additional setup after loading the view.
    }
    
    @objc func homeButtonPressed(){
        print("hi");
        
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
