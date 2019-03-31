///
//  Meditation.swift
//  audioApp2
//
//  Created by Eric Keefe on 3/18/19.
//  Copyright © 2019 Eric Keefe. All rights reserved.
//


import UIKit
import AVFoundation

var audioPlayer = AVAudioPlayer()
var audioPlayerExists = 0;

class Meditation: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var homebutton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var popImage: UIImageView!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    var meditations : [Med] = []
    let imageNames : [String] = [ "Sense", "Aspen", "Waterfall", "Present",  "S5", "S6", "S7", "S8", "S9", "S10", "S11", "S12", "S13"];
    let songs : [String] = ["Water Is Wide", "Lost Then Found", "The Old Church of Kilronan", "Attersee", "When the Stars Come Out", "The Road Home", "Venezia Bells at Dawn", "Winter by the Fire", "Wild Geese Above the Clouds", "Where Has the Love Gone", "Harp Guitar Dreams", "Into the Quiet", "Farewell"];
    
     let songs2 : [String] = ["Water Is Wide", "Lost Then Found", "The Old . . .", "Attersee", "When the . . .", "The Road Home", "Venezia Bells . . .", "Winter by . . .", "Wild Geese . . .", "Where Has . . .", "Harp Guitar . . .", "Into the Quiet", "Farewell"];
    
    var currentRow = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (audioPlayerExists == 0){
            print("bro");
            loadAudio();
        }else{
            print("yo");
            if (audioPlayer.isPlaying){
                
                playPauseButton.setImage(UIImage(named: "whitePlay"), for: .normal);
                
            }else{
                
                playPauseButton.setImage(UIImage(named: "whitePause"), for: .normal);
               
            }
        }
        meditations = createArray();
        tableView.delegate = self;
        tableView.dataSource = self;
        self.navigationItem.titleView = homebutton;
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func homeButtonPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true);
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "selectedRow") as? Int{
            currentRow = x;
            print("the current row is: " + String(currentRow));
        }
        popRow();
        
    }
    
    
    
    func loadAudio(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf:
                URL.init(fileURLWithPath: Bundle.main.path(forResource: songs[currentRow], ofType: "mp3" )!));
            audioPlayer.delegate = self;
            
            audioPlayer.prepareToPlay();
            audioPlayerExists = 1;
        }catch{
            print("problem loading audio");
        }
    }
    
    
    
    func popRow(){
        popImage.image = UIImage(named: imageNames[currentRow]);
        popLabel.text = songs2[currentRow];
        popLabel.textColor = UIColor.white;
        
    }
    
    func createArray() -> [Med]{
        var answer : [Med] = []
        
        let med1 = Med(image: UIImage(named: imageNames[0]) ?? UIImage(), title: songs[0]);
        let med2 = Med(image: UIImage(named: imageNames[1]) ?? UIImage(), title: songs[1]);
        let med3 = Med(image: UIImage(named: imageNames[2]) ?? UIImage(), title: songs[2]);
        let med4 = Med(image: UIImage(named: imageNames[3]) ?? UIImage(), title: songs[3]);
        let med5 = Med(image: UIImage(named: imageNames[4]) ?? UIImage(), title: songs[4]);
        let med6 = Med(image: UIImage(named: imageNames[5]) ?? UIImage(), title: songs[5]);
        let med7 = Med(image: UIImage(named: imageNames[6]) ?? UIImage(), title: songs[6]);
        let med8 = Med(image: UIImage(named: imageNames[7]) ?? UIImage(), title: songs[7]);
        let med9 = Med(image: UIImage(named: imageNames[8]) ?? UIImage(), title: songs[8]);
        let med10 = Med(image: UIImage(named: imageNames[9]) ?? UIImage(), title: songs[9]);
        let med11 = Med(image: UIImage(named: imageNames[10]) ?? UIImage(), title: songs[10]);
        let med12 = Med(image: UIImage(named: imageNames[11]) ?? UIImage(), title: songs[11]);
        let med13 = Med(image: UIImage(named: imageNames[12]) ?? UIImage(), title: songs[12]);
        
        
        
        
        answer.append(med1)
        answer.append(med2)
        answer.append(med3)
        answer.append(med4)
        answer.append(med5)
        answer.append(med6)
        answer.append(med7)
        answer.append(med8)
        answer.append(med9)
        answer.append(med10)
        answer.append(med11)
        answer.append(med12)
        answer.append(med13)
        
        
        
        
        return answer;
        
        
    }
    
    @IBAction func playPausePressed(_ sender: Any) {
        print("play pause pressed");
        if (audioPlayer.isPlaying){
            audioPlayer.pause();
            playPauseButton.setImage(UIImage(named: "whitePlay"), for: .normal);
            print("pause");
        }else{
            audioPlayer.play();
            playPauseButton.setImage(UIImage(named: "whitePause"), for: .normal);
            print("play");
        }
        
        
        
        //if (audioPlayer.isPlaying){
            //audioPlayer.pause();
            //print("pause");
        //}else{
            
        //}
        
    }
    
    @IBAction func fastForwardPressed(_ sender: Any) {
        print("fast forward pressed");
        let wasPlaying = audioPlayer.isPlaying;
        currentRow = currentRow + 1;
        if (currentRow == imageNames.count){
            currentRow = 0;
        }
        loadAudio();
        if (wasPlaying){
           
            audioPlayer.play();
            //playPauseButton.setImage(UIImage(named: "whitePause"), for: .normal);
        }
        let indexPath = IndexPath(row: currentRow, section: 0)
        self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.middle)
       
        popRow();
    }
    
    @IBAction func rewindPressed(_ sender: Any) {
        print("rewind pressed");
        let wasPlaying = audioPlayer.isPlaying;
        print(audioPlayer.currentTime);
        if (audioPlayer.currentTime < 0.1){
            print("should skip back");
            currentRow = currentRow - 1;
            if (currentRow == -1){currentRow = 0;}
            loadAudio();
            if (wasPlaying){
                
                audioPlayer.play();
                
            }
            popRow();
            
            
        }else{
        
            audioPlayer.currentTime = 0;
            
            if (wasPlaying){
                audioPlayer.play();
            }
        }
        let indexPath = IndexPath(row: currentRow, section: 0)
         self.tableView.selectRow(at: indexPath, animated: false, scrollPosition: UITableViewScrollPosition.middle)
        
    }
    
}

extension Meditation: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meditations.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let med = meditations[indexPath.row];
        let cell = tableView.dequeueReusableCell(withIdentifier: "medCell") as! MedCell;
        cell.setContent(med: med);
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        UserDefaults.standard.set(indexPath.row, forKey: "selectedRow");
        currentRow = indexPath.row;
        loadAudio();
        audioPlayer.play();
        playPauseButton.setImage(UIImage(named: "whitePause"), for: .normal);
        popRow();
    }
    
    
    
    
}

