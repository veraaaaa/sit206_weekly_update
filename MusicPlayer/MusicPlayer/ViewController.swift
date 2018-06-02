//
//  ViewController.swift
//  MusicPlayer
//
//  Created by 王雨薇 on 2018/6/2.
//  Copyright © 2018年 wangyuwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
//IBOutlets
    @IBOutlet weak var SingerImg: UIImageView!
    @IBOutlet weak var nowPlayingLabel: UILabel!
    @IBOutlet weak var elasedTime: UILabel!
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var songProgress: UIProgressView!
    @IBOutlet weak var VolumeSlider: UISlider!
//Vars
    var filterBySigner = "All"
    var musicPlayer : MusicPlayer = MusicPlayer( PlayList())
    var isPlaying : Bool = false
    var timer :Timer!
    var playOrResume : Bool = false
    
//IBActions
    @IBAction func play(_ sender: UIButton) {
        if playOrResume == true{
            musicPlayer.resume()
        }
        else{
            musicPlayer.play(filterBy: filterBySigner)
        }
        updateUI()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,selector: #selector(self.updateRealtimeUI),userInfo: nil,repeats: true)
    }
    
    @IBAction func Pause(_ sender: UIButton) {
        musicPlayer.pause()
        playOrResume = true
    }
    
    @IBAction func Previous(_ sender: UIButton) {
        musicPlayer.next(filterBy: filterBySigner)
        updateUI()
    }
    
    @IBAction func Next(_ sender: UIButton) {
        musicPlayer.next(filterBy: filterBySigner)
        updateUI()
    }
    @IBAction func Stop(_ sender: UIButton) {
        musicPlayer.stop()
        playOrResume = false
        updateUI()
    }
    
    @IBAction func ChangeVolume(_ sender: UISlider) {
        musicPlayer.changeVolume(newValue: sender.value)
    }
//Functions
    @objc func updateRealtimeUI(){
        let currentSong = musicPlayer.getCurrentSong()
        let progress = Float( currentSong.timeElapsed / currentSong.duration )
        songProgress.setProgress(progress, animated: true)
        let elapsedTime = Int(currentSong.timeElapsed.nextUp)
        let remainingTime = Int(currentSong.duration.nextUp) - elapsedTime
        elasedTime.text = "\(elapsedTime)"
    }
    
    func updateUI(){
        let currentSong = musicPlayer.currentSong
        SingerImg.image = UIImage(named: currentSong.singer)
        nowPlayingLabel.text = currentSong.title
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

