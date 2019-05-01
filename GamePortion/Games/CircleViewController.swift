//
//  CircleViewController.swift
//  GamePortion
//
//  Created by Eric Keefe on 10/24/18.
//  Copyright © 2018 Eric Keefe. All rights reserved.
//

import UIKit
import Foundation

class CircleViewController: UIViewController {

    @IBOutlet weak var bonusLabel: UILabel!
    @IBOutlet weak var homeButton: UIButton!
    //is the game running
    var gameRunning = true;
    
    //max Score so far
    var maxScore:Int = 0;
    
    var centerX: CGFloat = 0.0;
    var centerY: CGFloat = 0.0;
    var shrinking = false;
    var circleRadMin:CGFloat = 0;
    var circleRadMax:CGFloat = 0;
    var currentRad:CGFloat = 0;
    var score:Int = 0;
    var streakScore:Int = 0;
    
    var circleTimer: Timer!
    
    //variables for labels
    @IBOutlet weak var maxScoreLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    //variable for the circle
    @IBOutlet var circlePath: UIBezierPath!
    var shapeLayer = CAShapeLayer();
    
    @IBOutlet weak var circleButton: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!
    
    var circleColor = UIColor.white.cgColor;
    var count = 0;
    
    var labels = ["Perfect! +2", "Awesome! +2", "Nice job! +2", "Wow! +2", "Super! +2"];
    
    var streak = ["STREAK!! +", "HUGE BONUS +", "LET'S GOOO +", "WOOOOH +", "OH YEAAAH +"];
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         bonusLabel.text = "";
        bonusLabel.textColor = UIColor.white;
        circleButton.clipsToBounds = true;
        //circleButon.layer.cornerRadius = 25.0;
        
        restartButton.clipsToBounds = true;
        restartButton.layer.cornerRadius = 25.0;
        
        restartButton.layer.borderWidth = 2;
        restartButton.layer.borderColor = UIColor.white.cgColor;
        
        circleButton.layer.borderWidth = 2;
        circleButton.layer.borderColor = UIColor.white.cgColor;
        //homeButton.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside);
        self.navigationItem.titleView = homeButton;
        centerX = self.view.bounds.width/2
        centerY = self.view.bounds.height/2
        circleRadMin = centerX * 1/8;
        
        self.restartGame();
        
        //circleRadMax = max(centerX, centerY)*3/4
        //currentRad = circleRadMin
        
        //circleTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(CircleViewController.updateCircle), userInfo: nil, repeats: true)
        //circleTimer.invalidate()
        //self.drawCircle(circleRadius: currentRad)
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        if let x = UserDefaults.standard.object(forKey: "userMaxScore") as? String{
            maxScoreLabel.text = "Record: " + x
            maxScore = Int(x) ?? 0;
        }
        
        
        print("hi");
        
    }
    
    func perfectHit(){
        streakScore = streakScore + 1;
        circleColor =  UIColor(red: 189/255, green: 236/255, blue: 182/255, alpha: 1.0).cgColor;
        count = 0;
       
        let textIndex = Int.random(in: 0 ... 4);
        if (streakScore == 1){
            bonusLabel.text = labels[textIndex];
            score = score + 2;
        }else{
            score = score + 2*streakScore;
            let x : Int = (2*streakScore);
            let xNSNumber = x as NSNumber
            let xString : String = xNSNumber.stringValue
            let addText = streak[textIndex] + xString;
            bonusLabel.text = addText;
            
        }
        
    }
    
    @IBAction func circleButtonPressed(_ sender: Any) {
        
        if (!gameRunning){return;}
        if (currentRad + 5 >= circleRadMax){
            perfectHit();
        }else{
            streakScore = 0;
            circleColor = UIColor.white.cgColor;
            score = score + 1;
        }
        // }
        
        self.currentScoreLabel.text = "Score: " + String(score)
        circleRadMax = currentRad
        if (circleRadMax <= 1.5 * circleRadMin){
            self.endGame()
        }
        //get the location of the mouse and test if it's inside the circle
        
        
        
    }
    
    @IBAction func homePressed(_ sender: Any) {
    self.navigationController?.popToRootViewController(animated: true);
    }
    
    
    func endGame(){
        gameRunning = false
        circleTimer.invalidate()
        if (score > maxScore){
            maxScore = score
            //set the defaults
            UserDefaults.standard.set(String(maxScore), forKey: "userMaxScore");
        }
        score = 0;
        self.maxScoreLabel.text = "Record: " + String(maxScore);
    }
    
    
   
    @IBAction func restartButtonPressed(_ sender: Any) {
        if (!gameRunning){
            self.restartGame();
        }else{
            self.endGame();
            self.restartGame();
        }
    }
    
    func restartGame(){
        self.currentScoreLabel.text = "Score: 0";
     
        shrinking = false;
        circleRadMax = centerX*0.85;
        currentRad = circleRadMin;
        self.drawCircle(circleRadius: currentRad);
        circleTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(CircleViewController.updateCircle), userInfo: nil, repeats: true);
        gameRunning = true;
        circleColor = UIColor.white.cgColor;
        
    }
    
    @objc func updateCircle()
    {
        count = count + 1;
        if (count >= 80){
            bonusLabel.text = "";
        }
        
        if (shrinking){
            currentRad = currentRad - 1;
        }else{
            currentRad = currentRad + 1;
        }
        if (currentRad >= circleRadMax){
            shrinking = true;
        }
        if (currentRad <= circleRadMin){
            shrinking = false;
        }
        self.drawCircle(circleRadius: currentRad)
    }
    
    
    func drawCircle(circleRadius: CGFloat){
        
        circlePath = UIBezierPath(arcCenter: CGPoint(x: centerX,y: centerY), radius: circleRadius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true);
        
        shapeLayer.path = circlePath.cgPath;
        
        
        
        //change the fill color
        shapeLayer.fillColor = circleColor;
            
            //
        //you can change the stroke color
        //shapeLayer.strokeColor = UIColor.black.cgColor
        //you can change the line width
        //shapeLayer.lineWidth = 2.0
        
        view.layer.addSublayer(shapeLayer)
        
        
    }
    
    

    
    










    
}
