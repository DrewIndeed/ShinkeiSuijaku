/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 2
  Author: Le Nguyen Truong An
  ID: s3820098
  Last modified: 29/08/2022
  Acknowledgement:
    + https://stackoverflow.com/
    + https://www.hackingwithswift.com/
    + https://www.raywenderlich.com/
    + https://github.com/
    + https://www.swiftbysundell.com/
    + https://www.chosic.com/
    + https://mixkit.co/
    + https://www.donnywals.com/
    + https://thisdevbrain.com/
*/

//
//  SoundManager.swift
//  ShinkeiSuijaku
//
//  Created by Andrew Le Nguyen on 24/08/2022.
//

import Foundation
import AVFoundation

// Function to play sound effects
func playSound(_ soundFileName: String) {
    var filePath: String?
    filePath = Bundle.main.path(forResource: soundFileName, ofType: "mp3")
    let fileURL = URL(fileURLWithPath: filePath!)
    
    var soundID: SystemSoundID = 0
    AudioServicesCreateSystemSoundID(fileURL as CFURL, &soundID)
    AudioServicesPlaySystemSound(soundID)
}

// Function to play background music
var audioPlayer = AVAudioPlayer()
func playMusic(_ soundName: String)
{
    let sound = NSURL(fileURLWithPath: Bundle.main.path(forResource: soundName, ofType:"mp3")!)
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: sound as URL)
        audioPlayer.numberOfLoops = -1
        audioPlayer.prepareToPlay()
        
        // ADJUST TO play() in final build
        audioPlayer.play()
    } catch {
        print("Error getting the audio file")
    }
}
