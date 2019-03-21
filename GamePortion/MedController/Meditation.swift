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

class Meditation: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var popImage: UIImageView!
    @IBOutlet weak var popLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    var meditations : [Med] = []
    let imageNames : [String] = ["Sense", "Aspen", "Waterfall", "Present"];
    let songs : [String] = ["Sense", "Aspen", "Waterfall", "Present"];
    
    var currentRow = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAudio();
        meditations = createArray();
        tableView.delegate = self;
        tableView.dataSource = self;
        // Do any additional setup after loading the view.
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
        }catch{
            print("problem loading audio");
        }
    }
    
    
    
    func popRow(){
        popImage.image = UIImage(named: songs[currentRow]);
        popLabel.text = songs[currentRow];
        popLabel.textColor = UIColor.white;
        
    }
    
    func createArray() -> [Med]{
        var answer : [Med] = []
        
        let med1 = Med(image: UIImage(named: imageNames[0]) ?? UIImage(), title: songs[0]);
        let med2 = Med(image: UIImage(named: imageNames[1]) ?? UIImage(), title: songs[1]);
        let med3 = Med(image: UIImage(named: imageNames[2]) ?? UIImage(), title: songs[2]);
        let med4 = Med(image: UIImage(named: imageNames[3]) ?? UIImage(), title: songs[3]);
        
        
        answer.append(med1)
        answer.append(med2)
        answer.append(med3)
        answer.append(med4)
        
        
        
        
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

