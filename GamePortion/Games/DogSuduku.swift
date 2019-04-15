//
//  DogSuduku.swift
//  GamePortion
//
//  Created by Eric Keefe on 4/12/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class DogSuduku: UIViewController {

    
    
    
    @IBOutlet weak var homeButton: UIButton!
    
    var gameBoard: [[Int]] = [[0, -1, -4, 0, 0, -3], [0, -6, 0, -1, 0, 0], [0, 0, 0, 0, -3, -6], [-6, -3, 0, 0, 0, 0], [0, 0, -3, 0, -4, 0], [-4, 0, 0, -3, -5, 0]]
    
    let permImageNames: [String] = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6"]
    
    let tempImageNames: [String] = ["dog7", "dog8", "dog9", "dog10", "dog11", "dog12"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = homeButton;
        setInitialImages();
        
        // Do any additional setup after loading the view.
    }
    
    func getName(code: Int) -> String {
        if (code < 0){
            return tempImageNames[-code - 1];
        }else{
            return permImageNames[code - 1];
        }
    }
    
    func setInitialImages(){
        var name:String = "";
        
        //name = getName(code: gameBoard[0][0]);
        
        
    }
    
   
    

    @IBAction func homePressed(_ sender: Any){
        self.navigationController?.popToRootViewController(animated: true)
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
