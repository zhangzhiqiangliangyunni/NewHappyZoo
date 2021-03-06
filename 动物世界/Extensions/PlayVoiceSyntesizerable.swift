//
//  PlayVoiceSyntesizerable.swift
//  动物世界
//
//  Created by zhangzhiqiang on 2020/7/26.
//  Copyright © 2020 zhangzhiqiang. All rights reserved.
//

import Foundation
import AVFoundation

protocol PlayVoiceSyntesizerable {}

extension PlayVoiceSyntesizerable {
    
    func startTranslattion(_ text: String) {
        
        let syntesizer = AVSpeechSynthesizer()
        //1. 创建需要合成的声音类型
        var voice = AVSpeechSynthesisVoice(language: "zh-CN")
        var utterance = AVSpeechUtterance(string: text)
        
        let alphabetArr = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        for i in alphabetArr {

            if text.contains(i) {
                let newText = text.filter{ $0 != i }

                voice = AVSpeechSynthesisVoice(language: "en-US")
                utterance = AVSpeechUtterance(string: String(i))
                utterance.rate = 0.4
                utterance.voice = voice
                utterance.volume = 1
                utterance.postUtteranceDelay = 0.2
                utterance.pitchMultiplier = 1
                //开始播放
                syntesizer.speak(utterance)

                voice = AVSpeechSynthesisVoice(language: "zh-CN")
                utterance = AVSpeechUtterance(string: newText)
                utterance.rate = 0.4
                utterance.voice = voice
                utterance.volume = 1
                utterance.postUtteranceDelay = 0.2
                utterance.pitchMultiplier = 1
                //开始播放
                syntesizer.speak(utterance)
            }else{
                //2. 创建合成的语音类
                voice = AVSpeechSynthesisVoice(language: "zh-CN")
                utterance = AVSpeechUtterance(string: text)
                utterance.rate = 0.4
                utterance.voice = voice
                utterance.volume = 1
                utterance.postUtteranceDelay = 0.2
                utterance.pitchMultiplier = 1
                //开始播放
                syntesizer.speak(utterance)
            }
        }
        
        
    }
    
}

 
