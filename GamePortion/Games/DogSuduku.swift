//
//  DogSuduku.swift
//  GamePortion
//
//  Created by Eric Keefe on 4/12/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class DogSuduku: UIViewController {

    
  
    
    
   
    @IBOutlet weak var s00: UIButton!
    @IBOutlet weak var s01: UIButton!
    @IBOutlet weak var s02: UIButton!
    @IBOutlet weak var s03: UIButton!
    @IBOutlet weak var s04: UIButton!
    @IBOutlet weak var s05: UIButton!
    
    @IBOutlet weak var s10: UIButton!
    @IBOutlet weak var s11: UIButton!
    @IBOutlet weak var s12: UIButton!
    @IBOutlet weak var s13: UIButton!
    @IBOutlet weak var s14: UIButton!
    @IBOutlet weak var s15: UIButton!
    
    @IBOutlet weak var s20: UIButton!
    @IBOutlet weak var s21: UIButton!
    @IBOutlet weak var s22: UIButton!
    @IBOutlet weak var s23: UIButton!
    @IBOutlet weak var s24: UIButton!
    @IBOutlet weak var s25: UIButton!
    
    
    @IBOutlet weak var s30: UIButton!
    @IBOutlet weak var s31: UIButton!
    @IBOutlet weak var s32: UIButton!
    @IBOutlet weak var s33: UIButton!
    @IBOutlet weak var s34: UIButton!
    @IBOutlet weak var s35: UIButton!
    
    
    @IBOutlet weak var s40: UIButton!
    @IBOutlet weak var s41: UIButton!
    @IBOutlet weak var s42: UIButton!
    @IBOutlet weak var s43: UIButton!
    @IBOutlet weak var s44: UIButton!
    @IBOutlet weak var s45: UIButton!
    
    
    @IBOutlet weak var s50: UIButton!
    @IBOutlet weak var s51: UIButton!
    @IBOutlet weak var s52: UIButton!
    @IBOutlet weak var s53: UIButton!
    @IBOutlet weak var s54: UIButton!
    @IBOutlet weak var s55: UIButton!
    
    
    @IBOutlet weak var homeButton: UIButton!
    
    var dogType = 3; //0 means nothing, 1-6 dogs, 7 trash
    
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
        var current:Int = 0;
        var name:String = "";
        
        current = gameBoard[0][0]
        if (current != 0){
            name = getName(code: current);
            s00.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[0][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s01.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[0][2]
        if (current != 0){
            name = getName(code: current);
            s02.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[0][3]
        if (current != 0){
            name = getName(code: current);
            s03.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[0][4]
        if (current != 0){
            name = getName(code: current);
            s04.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[0][5]
        if (current != 0){
            name = getName(code: current);
            s05.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        
        current = gameBoard[1][0]
        if (current != 0){
            name = getName(code: current);
            s10.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[1][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s11.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[1][2]
        if (current != 0){
            name = getName(code: current);
            s12.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[1][3]
        if (current != 0){
            name = getName(code: current);
            s13.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[1][4]
        if (current != 0){
            name = getName(code: current);
            s14.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[1][5]
        if (current != 0){
            name = getName(code: current);
            s15.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[2][0]
        if (current != 0){
            name = getName(code: current);
            s20.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[2][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s21.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[2][2]
        if (current != 0){
            name = getName(code: current);
            s22.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[2][3]
        if (current != 0){
            name = getName(code: current);
            s23.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[2][4]
        if (current != 0){
            name = getName(code: current);
            s24.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[2][5]
        if (current != 0){
            name = getName(code: current);
            s25.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[3][0]
        if (current != 0){
            name = getName(code: current);
            s30.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[3][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s31.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[3][2]
        if (current != 0){
            name = getName(code: current);
            s32.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[3][3]
        if (current != 0){
            name = getName(code: current);
            s33.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[3][4]
        if (current != 0){
            name = getName(code: current);
            s34.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[3][5]
        if (current != 0){
            name = getName(code: current);
            s35.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[4][0]
        if (current != 0){
            name = getName(code: current);
            s40.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[4][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s41.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[4][2]
        if (current != 0){
            name = getName(code: current);
            s42.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[4][3]
        if (current != 0){
            name = getName(code: current);
            s43.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[4][4]
        if (current != 0){
            name = getName(code: current);
            s44.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[4][5]
        if (current != 0){
            name = getName(code: current);
            s45.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        
        current = gameBoard[5][0]
        if (current != 0){
            name = getName(code: current);
            s50.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[5][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s51.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[5][2]
        if (current != 0){
            name = getName(code: current);
            s52.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[5][3]
        if (current != 0){
            name = getName(code: current);
            s53.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[5][4]
        if (current != 0){
            name = getName(code: current);
            s54.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        
        current = gameBoard[5][5]
        if (current != 0){
            name = getName(code: current);
            s55.setBackgroundImage(UIImage(named: name), for: .normal)
        }
     
    }
    
   
    @IBAction func s00Pressed(_ sender: Any) {
        print("hello");
        if (gameBoard[0][0] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[0][0] = 0;
            s00.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[0][0] = dogType;
            let name: String = getName(code: dogType);
            s00.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s01(_ sender: Any) {
        if (gameBoard[0][1] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[0][1] = 0;
            s01.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[0][1] = dogType;
            let name: String = getName(code: dogType);
            s01.setBackgroundImage(UIImage(named: name), for: .normal);
        }
        
    }
    
    
    @IBAction func s02(_ sender: Any) {
        if (gameBoard[0][2] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[0][2] = 0;
            s02.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[0][2] = dogType;
            let name: String = getName(code: dogType);
            s02.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s03(_ sender: Any) {
        if (gameBoard[0][3] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[0][3] = 0;
            s03.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[0][3] = dogType;
            let name: String = getName(code: dogType);
            s03.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s04(_ sender: Any) {
        if (gameBoard[0][4] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[0][4] = 0;
            s04.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[0][4] = dogType;
            let name: String = getName(code: dogType);
            s04.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s05(_ sender: Any) {
        if (gameBoard[0][5] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[0][5] = 0;
            s05.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[0][5] = dogType;
            let name: String = getName(code: dogType);
            s05.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s10(_ sender: Any) {
        if (gameBoard[1][0] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[1][0] = 0;
            s10.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[1][0] = dogType;
            let name: String = getName(code: dogType);
            s10.setBackgroundImage(UIImage(named: name), for: .normal);
        }
        
    }
    
    
    @IBAction func s11(_ sender: Any) {
        if (gameBoard[1][1] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[1][1] = 0;
            s11.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[1][1] = dogType;
            let name: String = getName(code: dogType);
            s11.setBackgroundImage(UIImage(named: name), for: .normal);
        }
        
    }
    
    
    @IBAction func s12(_ sender: Any) {
        
        if (gameBoard[1][2] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[1][2] = 0;
            s12.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[1][2] = dogType;
            let name: String = getName(code: dogType);
            s12.setBackgroundImage(UIImage(named: name), for: .normal);
        }
        
    }
    
    
    @IBAction func s13(_ sender: Any) {
        if (gameBoard[1][3] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[1][3] = 0;
            s13.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[1][3] = dogType;
            let name: String = getName(code: dogType);
            s13.setBackgroundImage(UIImage(named: name), for: .normal);
        }
        
    }
    
    
    @IBAction func s14(_ sender: Any) {
        if (gameBoard[1][4] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[1][4] = 0;
            s14.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[1][4] = dogType;
            let name: String = getName(code: dogType);
            s14.setBackgroundImage(UIImage(named: name), for: .normal);
        }
        
    }
    
    
    @IBAction func s15(_ sender: Any) {
        if (gameBoard[1][5] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[1][5] = 0;
            s15.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[1][5] = dogType;
            let name: String = getName(code: dogType);
            s15.setBackgroundImage(UIImage(named: name), for: .normal);
        }
        
    }
    
    
    @IBAction func s20(_ sender: Any) {
        
    }
    
    
    @IBAction func s21(_ sender: Any) {
    }
    
    
    @IBAction func s22(_ sender: Any) {
    }
    
    
    @IBAction func s23(_ sender: Any) {
    }
    
    
    @IBAction func s24(_ sender: Any) {
    }
    
    
    @IBAction func s25(_ sender: Any) {
    }
    
    
    @IBAction func s30(_ sender: Any) {
    }
    
    
    @IBAction func s31(_ sender: Any) {
    }
    
    
    @IBAction func s32(_ sender: Any) {
    }
    
    
    @IBAction func s33(_ sender: Any) {
    }
    
    
    @IBAction func s34(_ sender: Any) {
    }
    
    @IBAction func s35(_ sender: Any) {
    }
    
    
    @IBAction func s40(_ sender: Any) {
    }
    
    
    @IBAction func s41(_ sender: Any) {
    }
    
    @IBAction func s42(_ sender: Any) {
    }
    
    
    @IBAction func s43(_ sender: Any) {
    }
    
    
    @IBAction func s44(_ sender: Any) {
    }
    
    
    @IBAction func s45(_ sender: Any) {
    }
    
    
    @IBAction func s50(_ sender: Any) {
    }
    
    
    @IBAction func s51(_ sender: Any) {
    }
    
    @IBAction func s52(_ sender: Any) {
    }
    
    
    @IBAction func s53(_ sender: Any) {
    }
    
    
    
    @IBAction func s54(_ sender: Any) {
    }
    
    
    @IBAction func s55(_ sender: Any) {
    }
    
    
    @IBAction func dog1(_ sender: Any) {
        
        dogType = 1;
    }
    
    @IBAction func dog2(_ sender: Any) {
        dogType = 2;
    }
    
    
    @IBAction func dog3(_ sender: Any) {
        dogType = 3;
    }
    
    
    @IBAction func dog4(_ sender: Any) {
        dogType = 4;
    }
    
    
    @IBAction func dog5(_ sender: Any) {
        dogType = 5;
    }
    
    @IBAction func dog6(_ sender: Any) {
        dogType = 6;
    }
    
    
    @IBAction func dog7(_ sender: Any) {
        dogType = 7;
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
