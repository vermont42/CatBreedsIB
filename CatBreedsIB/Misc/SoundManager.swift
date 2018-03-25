//
//  SoundManager.swift
//  CatBreedsIB
//
//  Created by Josh Adams on 11/18/15.
//  Copyright © 2015 Josh Adams. All rights reserved.
//
import Foundation
import AVFoundation

class SoundManager {
  private static let soundManager = SoundManager()
  private var sounds: [String: AVAudioPlayer]
  private static let soundExtension = "m4a"
  
  private init () {
    sounds = Dictionary()
    do {
      try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
    } catch let error as NSError {
      print("\(error.localizedDescription)")
    }
  }
  
  static func play(_ sound: Sound) {
    if soundManager.sounds[sound.rawValue] == nil {
      if let audioUrl = Bundle.main.url(forResource: sound.rawValue, withExtension: soundExtension) {
        do {
          try soundManager.sounds[sound.rawValue] = AVAudioPlayer.init(contentsOf: audioUrl)
        } catch let error as NSError {
          print("\(error.localizedDescription)")
        }
      }
    }
    soundManager.sounds[sound.rawValue]?.play()
  }
}
