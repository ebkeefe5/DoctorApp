//
//  NotesViewController.swift
//  GamePortion
//
//  Created by Eric Keefe on 2/1/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit

//var theText:String = ""

class NotesViewController: UIViewController, UITextViewDelegate {

    
    
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = homeButton;
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapDone))
        
        self.navigationItem.rightBarButtonItem = doneButton;
        
       
        textView.frame.size = CGSize(width: textView.frame.size.width, height: 605)
        
        
    }
    
 
    
    
    
    func textView (_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text:String) ->Bool {
        textView.frame.size = CGSize(width: textView.frame.size.width, height: 343)
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
    
   
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //doneButton.setTitle("Done", for: .normal)
        //UserDefaults.standard.set(textView.text, forKey: "userInput");
        //textView.resignFirstResponder();
        //theText = textView.text
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        if let x = UserDefaults.standard.object(forKey: "userInput") as? String{
            textView.text = x
        }
        
    }
    
    @objc func tapDone(){
        textView.frame.size = CGSize(width: textView.frame.size.width, height: 605)
        textView.resignFirstResponder();
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
