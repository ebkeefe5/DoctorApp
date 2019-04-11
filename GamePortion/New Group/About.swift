//
//  About.swift
//  GamePortion
//
//  Created by Eric Keefe on 4/10/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class About: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let imageNames : [String] = ["Keefe", "Ellis", "Don", "Susan", "Doan"];
    let descriptions1: [String] = ["Meagan Keefe", "Ellis Swharts", "Don Thomson", "Susan Robins", "General Practitioner", "John Doan"];
    let descriptions2: [String] = ["Dermatologist", "Dentist", "Counselor", "General Practitioner", "Guitarist"];
    var abouts : [Ab] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        abouts = createArray();
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    func createArray() -> [Ab]{
        var answer : [Ab] = []
        
        let Ab1 = Ab(image: UIImage(named: imageNames[0]) ?? UIImage(), name: descriptions1[0], des: descriptions2[0]);
        let Ab2 = Ab(image: UIImage(named: imageNames[1]) ?? UIImage(), name: descriptions1[1], des: descriptions2[1]);
        let Ab3 = Ab(image: UIImage(named: imageNames[2]) ?? UIImage(), name: descriptions1[2], des: descriptions2[2]);
        let Ab4 = Ab(image: UIImage(named: imageNames[3]) ?? UIImage(), name: descriptions1[3], des: descriptions2[3]);
        let Ab5 = Ab(image: UIImage(named: imageNames[4]) ?? UIImage(), name: descriptions1[4], des: descriptions2[4]);
        
        
        
        
        answer.append(Ab1)
        answer.append(Ab2)
        answer.append(Ab3)
        answer.append(Ab4)
        answer.append(Ab5)
       
        
        
        
        
        
        
        return answer;
        
        
    }
    
}

extension About: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abouts.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ab = abouts[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell") as! AbCell;
        cell.setContent(ab: ab);
        return cell;
        
    }
    
  
    
    

    

}

