//
//  EyeDoctor.swift
//  GamePortion
//
//  Created by Eric Keefe on 2/25/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class EyeDoctor: UIViewController {

    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    var x1: CGFloat = 10.0;
    var y1: CGFloat = 210.0;
    var width1: CGFloat = 350;
    var height1: CGFloat = 135;
    var yspacing: CGFloat = 15;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        button1.clipsToBounds = true;
        button1.layer.cornerRadius = 25.0;
        button1.frame = CGRect(x: x1, y: y1, width: width1, height: height1);
        button1.layer.borderWidth = 2;
        button1.layer.borderColor = UIColor.white.cgColor;
        
        button2.clipsToBounds = true;
        button2.layer.cornerRadius = 25.0;
        button2.frame = CGRect(x: x1, y: y1 + height1 + yspacing, width: width1, height: height1);
        button2.layer.borderWidth = 2;
        button2.layer.borderColor = UIColor.white.cgColor;
        
        button3.clipsToBounds = true;
        button3.layer.cornerRadius = 25.0;
        button3.frame = CGRect(x: x1, y: y1 + height1 + yspacing + yspacing + height1, width: width1, height: height1);
        button3.layer.borderWidth = 2;
        button3.layer.borderColor = UIColor.white.cgColor;

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
