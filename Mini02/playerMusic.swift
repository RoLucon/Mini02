//
//  playerMusic.swift
//  Mini02
//
//  Created by Gustavo Rigor on 07/05/20.
//  Copyright © 2020 Rogerio Lucon. All rights reserved.
//

import Foundation
import AVFoundation

class PlayerMusic {
    
    var audioPlayer: AVAudioPlayer!
    
    init(){}
    
    func toca(music:String){
        let pathToSound = Bundle.main.path(forResource: music, ofType: nil)!
        let url = URL(fileURLWithPath: pathToSound)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.play()
        } catch {
           // couldn't load file :(
        }
    }
    
    func para(){
        audioPlayer?.stop()
    }
    
    
}
