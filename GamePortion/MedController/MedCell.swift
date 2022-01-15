//
//  MedCell.swift
//  audioApp2
///Users/ebkeefe/Desktop/GamePortion/GamePortion/MedController/MedCell.swift
//  Created by Eric Keefe on 3/18/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class MedCell: UITableViewCell {

    @IBOutlet weak var medImageView: UIImageView!
    
    @IBOutlet weak var medTitleLabel: UILabel!
    
    func setContent(med: Med){
        medImageView.image = med.image;
        medTitleLabel.text = med.title;      
    }
    
}
