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

class ViewController: NSViewController {
    
    @IBOutlet weak var radioTitle: NSTextField!
    @IBOutlet weak var chooseStation: NSPopUpButton!
    @IBOutlet weak var volumeSlider: NSSlider!
    
    
    let stationList = ["Radio Rwmaios 94", "Avanti 97.7", "Chroma 98.5", "Kiss FM 91.1"]
    
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
        chooseStation.removeAllItems()
        chooseStation.addItems(withTitles: stationList)
        chooseStation.selectItem(at: stationList.count-4)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        let stationSelected = chooseStation.indexOfSelectedItem
        switch stationSelected {
        case 0:
            changeStation(radioUrl: "http://el1.info:9400/;listen.pls")
            audioPlayer.play()
            radioTitle.stringValue = "Radio Rwmaios 94"
            break
        case 1:
            changeStation(radioUrl: "http://avanti977lamia.live24.gr:80/avanti977lamia")
            audioPlayer.play()
            radioTitle.stringValue = "Avanti 97.7"
            break
        case 2:
            changeStation(radioUrl: "http://xroma985.live24.gr:80/xroma985")
            audioPlayer.play()
            radioTitle.stringValue = "Chroma 98.5"
            break
        case 3:
            changeStation(radioUrl: "http://213.239.206.179:9110/;stream.mp3")
            audioPlayer.play()
            radioTitle.stringValue = "Kiss FM 91.1"
            break
        default:
            radioTitle.stringValue = "Sfalma kata tin anaparagwgi.. \(stationSelected)"
            break
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

