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
    
    var circleTimer: Timer!
    
    //variables for labels
    @IBOutlet weak var maxScoreLabel: UILabel!
    @IBOutlet weak var currentScoreLabel: UILabel!
    
    //variable for the circle
    @IBOutlet var circlePath: UIBezierPath!
    var shapeLayer = CAShapeLayer();
    
    @IBOutlet weak var circleButton: UIButton!
    
    @IBOutlet weak var restartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //homeButton.addTarget(self, action: #selector(homeButtonPressed), for: .touchUpInside);
        self.navigationItem.titleView = homeButton;
        centerX = self.view.bounds.width/2
        centerY = self.view.bounds.height/2
        circleRadMin = min(centerX, centerY)*1/16
        
        self.restartGame();
        
        //circleRadMax = max(centerX, centerY)*3/4
        //currentRad = circleRadMin
        
        //circleTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(CircleViewController.updateCircle), userInfo: nil, repeats: true)
        //circleTimer.invalidate()
        //self.drawCircle(circleRadius: currentRad)
        
    }
    
    @IBAction func circleButtonPressed(_ sender: Any) {
        if (!gameRunning){return;}
        
        score = score + 1;
        self.currentScoreLabel.text = "Score: " + String(score)
        circleRadMax = currentRad
        if (circleRadMax <= 2 * circleRadMin){
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
        circleRadMax = max(centerX, centerY)*1/2;
        currentRad = circleRadMin;
        self.drawCircle(circleRadius: currentRad);
        circleTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(CircleViewController.updateCircle), userInfo: nil, repeats: true);
        gameRunning = true;
        
    }
    
    @objc func updateCircle()
    {
        if (shrinking){
            currentRad = currentRad - 2;
        }else{
            currentRad = currentRad + 2;
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
        shapeLayer.fillColor = UIColor.white.cgColor;
            
            //
        //you can change the stroke color
        //shapeLayer.strokeColor = UIColor.black.cgColor
        //you can change the line width
        //shapeLayer.lineWidth = 2.0
        
        view.layer.addSublayer(shapeLayer)
        
        
    }

    
}
