//
//  MeditationController.swift
//  GamePortion
//
//  Created by Eric Keefe on 3/8/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//

import UIKit
import AVFoundation

class MeditationController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var homeButton: UIButton!
    
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = homeButton;
        do{
            audioPlayer = try AVAudioPlayer(contentsOf:
                URL.init(fileURLWithPath: Bundle.main.path(forResource: "Sense", ofType: "mp3" )!));
            audioPlayer.delegate = self;
            audioPlayer.prepareToPlay();
        }catch{
            print("problem loading audio");
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func play(_ sender: Any) {
        print("here");
        audioPlayer.play();
    }
    

    
    @IBAction func pause(_ sender: Any) {
        if (audioPlayer.isPlaying){
            audioPlayer.pause();
        }else{
            
        }
    }
    
    @IBAction func restart(_ sender: Any) {
        if (audioPlayer.isPlaying){
            audioPlayer.pause();
        }else{
            
        }
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
