//
//  DogSuduku.swift
//  GamePortion
//
//  Created by Eric Keefe on 4/12/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

class DogSuduku: UIViewController {

    
  
    @IBOutlet weak var gameOverImage: UIImageView!
    
    @IBOutlet weak var b1: UIButton!
    
    @IBOutlet weak var b2: UIButton!
    
    @IBOutlet weak var b3: UIButton!
    
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
    
    
    @IBOutlet weak var dog1B: UIButton!
    @IBOutlet weak var dog2B: UIButton!
    @IBOutlet weak var dog3B: UIButton!
    @IBOutlet weak var dog4B: UIButton!
    @IBOutlet weak var dog5B: UIButton!
    @IBOutlet weak var dog6B: UIButton!
    @IBOutlet weak var trash: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    
    var dogType = 3; //0 means nothing, 1-6 dogs, 7 trash
    
    var gameBoard: [[Int]] = [[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0] ];// = [[0, -1, -4, 0, 0, -3], [0, -6, 0, -1, 0, 0], [0, 0, 0, 0, -3, -6], [-6, -3, 0, 0, 0, 0], [0, 0, -3, 0, -4, 0], [-4, 0, 0, -3, -5, 0]]
    
    var permBoard: [[Int]] = [[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0] ];
    
    let permImageNames: [String] = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6"]
    
    let tempImageNames: [String] = ["dog7", "dog8", "dog9", "dog10", "dog11", "dog12"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = homeButton;
        startNewGame();
        
        
        b1.clipsToBounds = true;
        b1.layer.cornerRadius = 15
        b1.layer.borderWidth = 2.0
        b1.layer.borderColor = UIColor.white.cgColor
        
        b2.clipsToBounds = true;
        b2.layer.cornerRadius = 15
        b2.layer.borderWidth = 2.0
        b2.layer.borderColor = UIColor.white.cgColor
        
        b3.clipsToBounds = true;
        b3.layer.cornerRadius = 15
        b3.layer.borderWidth = 2.0
        b3.layer.borderColor = UIColor.white.cgColor
        
       
        
        
        // Do any additional setup after loading the view.
    }
    
    func checkBoard() -> Bool {
        
        
        print("printing rows");
        
        
        print(gameBoard[0]);
        print(gameBoard[1]);
        print(gameBoard[2]);
        print(gameBoard[3]);
        print(gameBoard[4]);
        print(gameBoard[5]);
        
        print("printing columns");
        
        print(getColumn(col: 0));
        print(getColumn(col: 1));
        print(getColumn(col: 2));
        print(getColumn(col: 3));
        print(getColumn(col: 4));
        print(getColumn(col: 5));
        
        print("printing grids");
        print(getGrid(row: 0, col:0));
        print(getGrid(row: 0, col:3));
        print(getGrid(row: 2, col:0));
        print(getGrid(row: 2, col:3));
        print(getGrid(row: 4, col:0));
        print(getGrid(row: 4, col:3));
 
        
        //checking rows
        if (!checkSixValues(values: gameBoard[0]) || !checkSixValues(values: gameBoard[1]) || !checkSixValues(values: gameBoard[2]) || !checkSixValues(values: gameBoard[3]) || !checkSixValues(values: gameBoard[4]) || !checkSixValues(values: gameBoard[5])){
            print("mistake in rows!!");
            return false;
        }
        
        //checking cols
        if (!checkSixValues(values: getColumn(col: 0)) || !checkSixValues(values: getColumn(col: 1)) || !checkSixValues(values: getColumn(col: 2)) || !checkSixValues(values: getColumn(col: 3)) || !checkSixValues(values: getColumn(col: 4)) || !checkSixValues(values: getColumn(col: 5))){
            print("mistake in cols!!");
            return false;
        }
        
        //checking grids
        if (!checkSixValues(values: getGrid(row: 0, col:0)) || !checkSixValues(values: getGrid(row: 0, col:3)) || !checkSixValues(values: getGrid(row: 2, col:0)) || !checkSixValues(values: getGrid(row: 2, col:3)) || !checkSixValues(values: getGrid(row: 4, col:0)) || !checkSixValues(values: getGrid(row: 4, col:3))){
            print("mistake in grids!!");
            return false;
        }
        
        print("there are no mistakes");
    
        return true
    }
    
    func getColumn(col: Int) -> [Int]{
        //return that column of gameBoard
        let column: [Int] = [gameBoard[0][col], gameBoard[1][col], gameBoard[2][col], gameBoard[3][col], gameBoard[4][col], gameBoard[5][col]];
        return column;
        
    }
    
    func getGrid(row: Int, col: Int) -> [Int]{
        
        
        let grid: [Int] = [gameBoard[row][col], gameBoard[row][col + 1], gameBoard[row][col + 2], gameBoard[row + 1][col], gameBoard[row + 1][col + 1], gameBoard[row + 1][col + 2]];
        return grid;
    }
    
    
    func checkSixValues(values: [Int]) -> Bool{
        var s = Set<Int>()
        
        for n in values{
            if (n == 0){return false;}
            if (s.contains(absoluteValue(dog: n))){
                return false;
            }else{
                s.insert(absoluteValue(dog: n));
            }
        }
        return true;
        
    }
    
    func absoluteValue(dog: Int) -> Int{
        if (dog > 0){return dog;}
        else{return -dog;}
        
        
    }
    
    func startNewGame(){
        getNewBoard();
        permBoard = gameBoard;
        clearBoard();
        setInitialImages();
    }
    
    func getNewBoard(){
        let boardGenerator = gameBoards();
        gameBoard = boardGenerator.getBoard();
    }
    
    
    
    func clearBoard(){
        s00.setBackgroundImage(UIImage(), for: .normal);
        s00.backgroundColor = UIColor.clear;
        
        s01.setBackgroundImage(UIImage(), for: .normal);
        s01.backgroundColor = UIColor.clear;
        
        s02.setBackgroundImage(UIImage(), for: .normal);
        s02.backgroundColor = UIColor.clear;
        
        s03.setBackgroundImage(UIImage(), for: .normal);
        s03.backgroundColor = UIColor.clear;
        
        s04.setBackgroundImage(UIImage(), for: .normal);
        s04.backgroundColor = UIColor.clear;
        
        s05.setBackgroundImage(UIImage(), for: .normal);
        s05.backgroundColor = UIColor.clear;
        
        s10.setBackgroundImage(UIImage(), for: .normal);
        s10.backgroundColor = UIColor.clear;
        
        s11.setBackgroundImage(UIImage(), for: .normal);
        s11.backgroundColor = UIColor.clear;
        
        s12.setBackgroundImage(UIImage(), for: .normal);
        s12.backgroundColor = UIColor.clear;
        
        s13.setBackgroundImage(UIImage(), for: .normal);
        s13.backgroundColor = UIColor.clear;
        
        s14.setBackgroundImage(UIImage(), for: .normal);
        s14.backgroundColor = UIColor.clear;
        
        s15.setBackgroundImage(UIImage(), for: .normal);
        s15.backgroundColor = UIColor.clear;
        
        s20.setBackgroundImage(UIImage(), for: .normal);
        s20.backgroundColor = UIColor.clear;
        
        s21.setBackgroundImage(UIImage(), for: .normal);
        s21.backgroundColor = UIColor.clear;
        
        s22.setBackgroundImage(UIImage(), for: .normal);
        s22.backgroundColor = UIColor.clear;
        
        s23.setBackgroundImage(UIImage(), for: .normal);
        s23.backgroundColor = UIColor.clear;
        
        s24.setBackgroundImage(UIImage(), for: .normal);
        s24.backgroundColor = UIColor.clear;
        
        s25.setBackgroundImage(UIImage(), for: .normal);
        s25.backgroundColor = UIColor.clear;
        
        s30.setBackgroundImage(UIImage(), for: .normal);
        s30.backgroundColor = UIColor.clear;
        
        s31.setBackgroundImage(UIImage(), for: .normal);
        s31.backgroundColor = UIColor.clear;
        
        s32.setBackgroundImage(UIImage(), for: .normal);
        s32.backgroundColor = UIColor.clear;
        
        s33.setBackgroundImage(UIImage(), for: .normal);
        s33.backgroundColor = UIColor.clear;
        
        s34.setBackgroundImage(UIImage(), for: .normal);
        s34.backgroundColor = UIColor.clear;
        
        s35.setBackgroundImage(UIImage(), for: .normal);
        s35.backgroundColor = UIColor.clear;
        
        s40.setBackgroundImage(UIImage(), for: .normal);
        s40.backgroundColor = UIColor.clear;
        
        s41.setBackgroundImage(UIImage(), for: .normal);
        s41.backgroundColor = UIColor.clear;
        
        s42.setBackgroundImage(UIImage(), for: .normal);
        s42.backgroundColor = UIColor.clear;
        
        s43.setBackgroundImage(UIImage(), for: .normal);
        s43.backgroundColor = UIColor.clear;
        
        s44.setBackgroundImage(UIImage(), for: .normal);
        s44.backgroundColor = UIColor.clear;
        
        s45.setBackgroundImage(UIImage(), for: .normal);
        s45.backgroundColor = UIColor.clear;
     
        s50.setBackgroundImage(UIImage(), for: .normal);
        s50.backgroundColor = UIColor.clear;
        
        s51.setBackgroundImage(UIImage(), for: .normal);
        s51.backgroundColor = UIColor.clear;
        
        s52.setBackgroundImage(UIImage(), for: .normal);
        s52.backgroundColor = UIColor.clear;
        
        s53.setBackgroundImage(UIImage(), for: .normal);
        s53.backgroundColor = UIColor.clear;
        
        s54.setBackgroundImage(UIImage(), for: .normal);
        s54.backgroundColor = UIColor.clear;
        
        s55.setBackgroundImage(UIImage(), for: .normal);
        s55.backgroundColor = UIColor.clear;
        
        
        
        
    }
    
    func getName(code: Int) -> String {
        if (code < 0){
            return permImageNames[-code - 1];
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
        if (current < 0){
            s00.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[0][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s01.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s01.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[0][2]
        if (current != 0){
            name = getName(code: current);
            s02.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s02.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[0][3]
        if (current != 0){
            name = getName(code: current);
            s03.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s03.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[0][4]
        if (current != 0){
            name = getName(code: current);
            s04.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s04.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
       
        
        current = gameBoard[0][5]
        if (current != 0){
            name = getName(code: current);
            s05.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s05.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        
        current = gameBoard[1][0]
        if (current != 0){
            name = getName(code: current);
            s10.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s10.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[1][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s11.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s11.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[1][2]
        if (current != 0){
            name = getName(code: current);
            s12.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s12.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[1][3]
        if (current != 0){
            name = getName(code: current);
            s13.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s13.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[1][4]
        if (current != 0){
            name = getName(code: current);
            s14.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s14.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[1][5]
        if (current != 0){
            name = getName(code: current);
            s15.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s15.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[2][0]
        if (current != 0){
            name = getName(code: current);
            s20.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s20.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[2][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s21.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s21.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[2][2]
        if (current != 0){
            name = getName(code: current);
            s22.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s22.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[2][3]
        if (current != 0){
            name = getName(code: current);
            s23.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s23.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
       
        
        current = gameBoard[2][4]
        if (current != 0){
            name = getName(code: current);
            s24.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s24.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
       
        
        current = gameBoard[2][5]
        if (current != 0){
            name = getName(code: current);
            s25.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s25.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
       
        
        current = gameBoard[3][0]
        if (current != 0){
            name = getName(code: current);
            s30.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s30.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[3][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s31.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s31.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[3][2]
        if (current != 0){
            name = getName(code: current);
            s32.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s32.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
      
        
        current = gameBoard[3][3]
        if (current != 0){
            name = getName(code: current);
            s33.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s33.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[3][4]
        if (current != 0){
            name = getName(code: current);
            s34.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s34.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[3][5]
        if (current != 0){
            name = getName(code: current);
            s35.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s35.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[4][0]
        if (current != 0){
            name = getName(code: current);
            s40.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s40.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[4][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s41.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s41.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[4][2]
        if (current != 0){
            name = getName(code: current);
            s42.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s42.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[4][3]
        if (current != 0){
            name = getName(code: current);
            s43.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s43.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[4][4]
        if (current != 0){
            name = getName(code: current);
            s44.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s44.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[4][5]
        if (current != 0){
            name = getName(code: current);
            s45.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s45.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        
        current = gameBoard[5][0]
        if (current != 0){
            name = getName(code: current);
            s50.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s50.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[5][1]
        if (current != 0){
            name = getName(code: current);
            print(name);
            s51.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s51.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[5][2]
        if (current != 0){
            name = getName(code: current);
            s52.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s52.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[5][3]
        if (current != 0){
            name = getName(code: current);
            s53.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s53.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[5][4]
        if (current != 0){
            name = getName(code: current);
            s54.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s54.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
        }
        
        current = gameBoard[5][5]
        if (current != 0){
            name = getName(code: current);
            s55.setBackgroundImage(UIImage(named: name), for: .normal)
        }
        if (current < 0){
            s55.backgroundColor = UIColor(red: 82/255, green: 132/255, blue: 189/255, alpha: 1.0)
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
        if (gameBoard[2][0] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[2][0] = 0;
            s20.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[2][0] = dogType;
            let name: String = getName(code: dogType);
            s20.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s21(_ sender: Any) {
        if (gameBoard[2][1] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[2][1] = 0;
            s21.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[2][1] = dogType;
            let name: String = getName(code: dogType);
            s21.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s22(_ sender: Any) {
        if (gameBoard[2][2] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[2][2] = 0;
            s22.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[2][2] = dogType;
            let name: String = getName(code: dogType);
            s22.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s23(_ sender: Any) {
        if (gameBoard[2][3] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[2][3] = 0;
            s23.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[2][3] = dogType;
            let name: String = getName(code: dogType);
            s23.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s24(_ sender: Any) {
        if (gameBoard[2][4] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[2][4] = 0;
            s24.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[2][4] = dogType;
            let name: String = getName(code: dogType);
            s24.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s25(_ sender: Any) {
        if (gameBoard[2][5] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[2][5] = 0;
            s25.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[2][5] = dogType;
            let name: String = getName(code: dogType);
            s25.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s30(_ sender: Any) {
        if (gameBoard[3][0] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[3][0] = 0;
            s30.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[3][0] = dogType;
            let name: String = getName(code: dogType);
            s30.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s31(_ sender: Any) {
        if (gameBoard[3][1] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[3][1] = 0;
            s31.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[3][1] = dogType;
            let name: String = getName(code: dogType);
            s31.setBackgroundImage(UIImage(named: name), for: .normal);
        }
        
    }
    
    
    @IBAction func s32(_ sender: Any) {
        if (gameBoard[3][2] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[3][2] = 0;
            s32.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[3][2] = dogType;
            let name: String = getName(code: dogType);
            s32.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s33(_ sender: Any) {
        if (gameBoard[3][3] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[3][3] = 0;
            s33.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[3][3] = dogType;
            let name: String = getName(code: dogType);
            s33.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s34(_ sender: Any) {
        if (gameBoard[3][4] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[3][4] = 0;
            s34.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[3][4] = dogType;
            let name: String = getName(code: dogType);
            s34.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    @IBAction func s35(_ sender: Any) {
        if (gameBoard[3][5] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[3][5] = 0;
            s35.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[3][5] = dogType;
            let name: String = getName(code: dogType);
            s35.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s40(_ sender: Any) {
        if (gameBoard[4][0] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[4][0] = 0;
            s40.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[4][0] = dogType;
            let name: String = getName(code: dogType);
            s40.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s41(_ sender: Any) {
        if (gameBoard[4][1] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[4][1] = 0;
            s41.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[4][1] = dogType;
            let name: String = getName(code: dogType);
            s41.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    @IBAction func s42(_ sender: Any) {
        if (gameBoard[4][2] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[4][2] = 0;
            s42.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[4][2] = dogType;
            let name: String = getName(code: dogType);
            s42.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s43(_ sender: Any) {
        if (gameBoard[4][3] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[4][3] = 0;
            s43.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[4][3] = dogType;
            let name: String = getName(code: dogType);
            s43.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s44(_ sender: Any) {
        if (gameBoard[4][4] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[4][4] = 0;
            s44.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[4][4] = dogType;
            let name: String = getName(code: dogType);
            s44.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s45(_ sender: Any) {
        if (gameBoard[4][5] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[4][5] = 0;
            s45.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[4][5] = dogType;
            let name: String = getName(code: dogType);
            s45.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s50(_ sender: Any) {
        if (gameBoard[5][0] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[5][0] = 0;
            s50.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[5][0] = dogType;
            let name: String = getName(code: dogType);
            s50.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s51(_ sender: Any) {
        if (gameBoard[5][1] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[5][1] = 0;
            s51.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[5][1] = dogType;
            let name: String = getName(code: dogType);
            s51.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    @IBAction func s52(_ sender: Any) {
        if (gameBoard[5][2] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[5][2] = 0;
            s52.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[5][2] = dogType;
            let name: String = getName(code: dogType);
            s52.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s53(_ sender: Any) {
        if (gameBoard[5][3] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[5][3] = 0;
            s53.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[5][3] = dogType;
            let name: String = getName(code: dogType);
            s53.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    
    @IBAction func s54(_ sender: Any) {
        if (gameBoard[5][4] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[5][4] = 0;
            s54.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[5][4] = dogType;
            let name: String = getName(code: dogType);
            s54.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    
    @IBAction func s55(_ sender: Any) {
        if (gameBoard[5][5] < 0 || dogType == 0){return};
        if (dogType == 7){
            gameBoard[5][5] = 0;
            s55.setBackgroundImage(UIImage(), for: .normal)
        }else{
            gameBoard[5][5] = dogType;
            let name: String = getName(code: dogType);
            s55.setBackgroundImage(UIImage(named: name), for: .normal);
        }
    }
    
    func resetColors(){
        
        dog1B.backgroundColor = UIColor(red: 101/255, green: 145/255, blue: 196/255, alpha: 0.0);
        dog2B.backgroundColor = UIColor(red: 101/255, green: 145/255, blue: 196/255, alpha: 0.0);
        
        dog3B.backgroundColor = UIColor(red: 101/255, green: 145/255, blue: 196/255, alpha: 0.0);
        
        dog4B.backgroundColor = UIColor(red: 101/255, green: 145/255, blue: 196/255, alpha: 0.0);
        
        dog5B.backgroundColor = UIColor(red: 101/255, green: 145/255, blue: 196/255, alpha: 0.0);
        
        dog6B.backgroundColor = UIColor(red: 101/255, green: 145/255, blue: 196/255, alpha: 0.0);
         trash.backgroundColor = UIColor(red: 101/255, green: 145/255, blue: 196/255, alpha: 0.0);
        
        dog1B.layer.borderWidth = 0.0
         dog2B.layer.borderWidth = 0.0
         dog3B.layer.borderWidth = 0.0
         dog4B.layer.borderWidth = 0.0
         dog5B.layer.borderWidth = 0.0
         dog6B.layer.borderWidth = 0.0
        trash.layer.borderWidth = 0.0
        
        
        
        
    }
    
    
    @IBAction func dog1(_ sender: Any) {
        
        dogType = 1;
        resetColors();
        dog1B.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        dog1B.layer.borderWidth = 1.0
        dog1B.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func dog2(_ sender: Any) {
        dogType = 2;
        resetColors();
        dog2B.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        dog2B.layer.borderWidth = 1.0
        dog2B.layer.borderColor = UIColor.white.cgColor
    }
    
    
    @IBAction func dog3(_ sender: Any) {
        dogType = 3;
        resetColors();
        dog3B.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        dog3B.layer.borderWidth = 1.0
        dog3B.layer.borderColor = UIColor.white.cgColor

    }
    
    
    @IBAction func dog4(_ sender: Any) {
        dogType = 4;
        resetColors();
        dog4B.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        dog4B.layer.borderWidth = 1.0
        dog4B.layer.borderColor = UIColor.white.cgColor
    }
    
    
    @IBAction func dog5(_ sender: Any) {
        dogType = 5;
        resetColors();
        dog5B.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        dog5B.layer.borderWidth = 1.0
        dog5B.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func dog6(_ sender: Any) {
        dogType = 6;
        resetColors();
        dog6B.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        dog6B.layer.borderWidth = 1.0
        dog6B.layer.borderColor = UIColor.white.cgColor
    }
    
    
    @IBAction func dog7(_ sender: Any) {
        dogType = 7;
        resetColors();
        trash.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        trash.layer.borderWidth = 1.0
        trash.layer.borderColor = UIColor.white.cgColor
    }
    
    
    @IBAction func newGame(_ sender: Any) {
        startNewGame();
    }
    
    
    @IBAction func restartGame(_ sender: Any) {
        gameBoard = permBoard;
        clearBoard();
        setInitialImages();
    
    }
    
    
    @IBAction func checkTheSolution(_ sender: Any) {
        
        if (checkBoard()){
            print("GOOD JOB");
        }else{
            print("YOU MESSED UP");
        }
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
