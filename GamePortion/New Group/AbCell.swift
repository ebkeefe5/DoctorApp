//
//  AbCell.swift
//  GamePortion
//
//  Created by Eric Keefe on 4/10/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class AbCell: UITableViewCell {

    
    @IBOutlet weak var abImageView: UIImageView!
    
    @IBOutlet weak var abDescription: UILabel!
    
    @IBOutlet weak var abDescription2: UILabel!
    
    
    func setContent(ab: Ab){
        abImageView.image = ab.image;
        abDescription.text = ab.name;
        abDescription2.text = ab.des;
        
    }

}
