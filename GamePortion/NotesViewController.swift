//
//  NotesViewController.swift
//  GamePortion
//
//  Created by Eric Keefe on 2/1/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

//var theText:String = ""

class NotesViewController: UIViewController, UITextViewDelegate, UIGestureRecognizerDelegate {

    
    
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    
    var height1: Float = 605;
    var height2: Float = 349;
    var keyBoardUp: Bool = false;
    
    
    @IBOutlet var theView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //textView.delegate = self;
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped(_:)));
        tap.delegate = self;
        tap.numberOfTapsRequired = 1;
        tap.cancelsTouchesInView = false;
        
        let doubleTap = UITapGestureRecognizer(target: self, action:#selector(self.doubleTapAction(_:)))
        doubleTap.numberOfTapsRequired = 2
        view.addGestureRecognizer(doubleTap)
        
        tap.require(toFail: doubleTap)
        
        textView.addGestureRecognizer(tap);
        
        self.navigationItem.titleView = homeButton;
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDone))
        
        self.navigationItem.rightBarButtonItem = doneButton;
        //doneButton.isEnabled = false;
        
       
        textView.frame.size = CGSize(width: textView.frame.size.width, height: CGFloat(height1))
        
        
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return true
    }
    
    @objc func doubleTapAction(_ sender: UITapGestureRecognizer){
        print("double tap");
    }
   
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer){
        print("single tap");
        if (keyBoardUp){
            print("the keyboard is already up, do nothing");
        }else{
            print("resize the text view and activate the done button");
            //doneButton.isEnabled = true;
            keyBoardUp = true;
            //doneButton.isEnabled = true;
            textView.frame.size = CGSize(width: textView.frame.size.width, height: CGFloat(height2))
            
        }
    }
    
    
    
    
    
    func textView (_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text:String) ->Bool {
        
        if (text == "" && range.length > 0){
            
            
            UserDefaults.standard.set(String(textView.text.dropLast()), forKey: "userInput");
        }else{
        
            UserDefaults.standard.set((textView.text + text), forKey: "userInput");
        }
        
        
       
        return true
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool){
        if let x = UserDefaults.standard.object(forKey: "userInput") as? String{
            textView.text = x
        }
        print("hi");
        
    }
    
    @objc func tapDone(){
        textView.frame.size = CGSize(width: textView.frame.size.width, height: CGFloat(height1))
        textView.resignFirstResponder();
        keyBoardUp = false;
        //doneButton.isEnabled = false;
    }
    
   
   

}
