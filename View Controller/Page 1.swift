//
//  SubPage1.swift
//  iPhoneAppExercise2
//
//  Created by Xcode User on 2018-03-07.
//  Copyright © 2018 Xcode User. All rights reserved.
//

import UIKit
import AVFoundation

class SubPage1: UIViewController, AVAudioSessionDelegate, AVAudioPlayerDelegate {

    @IBOutlet var volSlider : UISlider!
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet var myLabel : UILabel!
    
    var soundPlayer : AVAudioPlayer?
    
    // Volume Change
    @IBAction func volumeDidChange(sender : UISlider)
    {
        soundPlayer?.volume = volSlider.value
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl)
    {
        if(mySegmentedControl.selectedSegmentIndex == 0)
        {
            myLabel.text = "Sky Full of Stars";
            let soundURL = Bundle.main.path(forResource: "coldplay", ofType: "mp3")
            let url = URL(fileURLWithPath: soundURL!)
            
            // soundPlayer connects to url of file
            self.soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
            self.soundPlayer?.currentTime = 0
            self.soundPlayer?.volume = self.volSlider.value
            // repeat forever
            self.soundPlayer?.numberOfLoops = -1
            self.soundPlayer?.play()
        }
        else if(mySegmentedControl.selectedSegmentIndex == 1)
        {
            myLabel.text = "Shots";
            let soundURL = Bundle.main.path(forResource: "id", ofType: "mp3")
            let url = URL(fileURLWithPath: soundURL!)
            
            // soundPlayer connects to url of file
            self.soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
            self.soundPlayer?.currentTime = 0
            self.soundPlayer?.volume = self.volSlider.value
            // repeat forever
            self.soundPlayer?.numberOfLoops = -1
            self.soundPlayer?.play()        }
        else if(mySegmentedControl.selectedSegmentIndex == 2)
        {
            myLabel.text = "Something Just Like This";
            let soundURL = Bundle.main.path(forResource: "chainsmokers", ofType: "mp3")
            let url = URL(fileURLWithPath: soundURL!)
            
            // soundPlayer connects to url of file
            self.soundPlayer = try! AVAudioPlayer.init(contentsOf: url)
            self.soundPlayer?.currentTime = 0
            self.soundPlayer?.volume = self.volSlider.value
            // repeat forever
            self.soundPlayer?.numberOfLoops = -1
            self.soundPlayer?.play()
        }
    }
 
    override func viewDidDisappear(_ animated: Bool) {
        soundPlayer?.stop()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
