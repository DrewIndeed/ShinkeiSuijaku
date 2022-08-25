//
//  SoundManager.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 24/08/2022.
//

import Foundation
import AVFoundation

func playSound(_ soundFileName: String) {
    var filePath: String?
    filePath = Bundle.main.path(forResource: soundFileName, ofType: "mp3")
    let fileURL = URL(fileURLWithPath: filePath!)
    
    var soundID: SystemSoundID = 0
    AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
    AudioServicesPlaySystemSound(soundID)
}

var audioPlayer = AVAudioPlayer()

func playMusic(_ soundName: String)
{
    let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: soundName, ofType:"mp3")!)
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
        audioPlayer.numberOfLoops = -1
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    } catch {
        print("Error getting the audio file")
    }
}
