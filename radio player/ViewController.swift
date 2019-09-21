//
//  ViewController.swift
//  radio player
//
//  Created by chrv80 on 22/06/2019.
//  Copyright © 2019 chrv80. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation

var urlRadio = "http://el1.info:9400/;listen.pls"
var myurlRadio = NSURL(string: urlRadio)
var audioPlayerItem = AVPlayerItem(url: myurlRadio! as URL)
var audioPlayer = AVPlayer(playerItem: audioPlayerItem)

var stationList = ["Radio Rwmaios 94":"http://el1.info:9400/;listen.pls", "Avanti 97.7":"http://avanti977lamia.live24.gr:80/avanti977lamia", "Chroma 98.5":"http://xroma985.live24.gr:80/xroma985", "Kiss FM 91.1":"http://213.239.206.179:9110/;stream.mp3", "Metro FM 90.3":"http://metro903.live24.gr:80/metro903", "Palmos 95":"http://s7.onweb.gr:8554/"]

var stationNames = [String]()

class ViewController: NSViewController {
    
    @IBOutlet weak var radioTitle: NSTextField!
    @IBOutlet weak var chooseStation: NSPopUpButton!
    @IBOutlet weak var volumeSlider: NSSlider!
    
    
    func changeStation(radioUrl: String){
        urlRadio = radioUrl
        myurlRadio = NSURL(string: urlRadio)
        audioPlayerItem = AVPlayerItem(url: myurlRadio! as URL)
        audioPlayer = AVPlayer(playerItem: audioPlayerItem)
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        view.window?.isOpaque = false
        view.window?.backgroundColor = NSColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 0.95)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        radioTitle.stringValue = "Radio Player.."
        for (key,_) in stationList {
            stationNames.append(key)
        }
        chooseStation.removeAllItems()
        chooseStation.addItems(withTitles: stationNames)
        chooseStation.selectItem(at: stationList.count-4)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        for (key,value) in stationList {
            if (key == stationNames[chooseStation.indexOfSelectedItem]) {
                changeStation(radioUrl: value)
                audioPlayer.play()
                radioTitle.stringValue = key
            }
        }
    }
    
    @IBAction func pauseButton(_ sender: Any) {
        audioPlayer.pause()
        radioTitle.stringValue = "Radio Player.."
    }

    @IBAction func exitButton(_ sender: Any) {
        exit(0)
    }
    
    @IBAction func volumeControl(_ sender: Any) {
        audioPlayer.volume = Float(volumeSlider.doubleValue)
    }
}

