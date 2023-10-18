//
//  ViewController.swift
//  VoiceFilter
//
//  Created by Satya Rajput on 18/10/23.
//

import UIKit
import AVFoundation
import AVFAudio
class ViewController: UIViewController, AVAudioPlayerDelegate {

    fileprivate var audioEngine = AVAudioEngine()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createVoice0()
    }
    @IBAction func createVoice0() {
    let audioSession = AVAudioSession.sharedInstance()

    do {
        try audioSession.setCategory(.playAndRecord, mode: .spokenAudio, options: .defaultToSpeaker)
        try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
    } catch {
        print("error.")
    }
}
  @IBAction func createVoice1(){
        stop()
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .defaultToSpeaker)
            try audioSession.setActive(true)
        } catch let error as NSError {
            print("error")
        }

        let input = audioEngine.inputNode
        let mixer = audioEngine.mainMixerNode

        let reverb = AVAudioUnitReverb()

        reverb.loadFactoryPreset(.largeHall2)
        reverb.wetDryMix = 50


        audioEngine.attach(reverb)

        let distortion = AVAudioUnitDistortion()

        distortion.loadFactoryPreset(.speechWaves)

        distortion.preGain = -6

        audioEngine.attach(distortion)

        let eq = AVAudioUnitEQ()
        eq.globalGain = 90
        audioEngine.attach(eq)


        audioEngine.connect(input, to: reverb, format: input.inputFormat(forBus: 0))
        audioEngine.connect(reverb, to: eq, format: input.inputFormat(forBus: 0))
        audioEngine.connect(eq, to: mixer, format: input.inputFormat(forBus: 0))
        audioEngine.connect(input, to: distortion, format: input.inputFormat(forBus: 0))
        audioEngine.connect(distortion, to: mixer, format: input.inputFormat(forBus: 0))


        try! audioEngine.start()

    }

    @IBAction  func createVoice2(){
        stop()
        let audioSession = AVAudioSession.sharedInstance()

        do {
            try audioSession.setCategory(.record, mode: .measurement, options: .defaultToSpeaker)
            try audioSession.setActive(true)
        } catch let error as NSError {
            print("error")
        }

        let input = audioEngine.inputNode
        let mixer = audioEngine.mainMixerNode

        let reverb = AVAudioUnitReverb()

        reverb.loadFactoryPreset(.largeRoom)
        reverb.wetDryMix = 50

        audioEngine.attach(reverb)

        let distortion = AVAudioUnitDistortion()

        distortion.loadFactoryPreset(.multiDecimated1)

        distortion.preGain = -6

        audioEngine.attach(distortion)

        let eq = AVAudioUnitEQ()
        eq.globalGain = 90
        audioEngine.attach(eq)


        audioEngine.connect(input, to: reverb, format: input.inputFormat(forBus: 0))
        audioEngine.connect(reverb, to: eq, format: input.inputFormat(forBus: 0))
        audioEngine.connect(eq, to: mixer, format: input.inputFormat(forBus: 0))
        audioEngine.connect(input, to: distortion, format: input.inputFormat(forBus: 0))
        audioEngine.connect(distortion, to: mixer, format: input.inputFormat(forBus: 0))


        try! audioEngine.start()

    }

    @IBAction func createVoice3(){
        stop()
        let audioSession = AVAudioSession.sharedInstance()


        do {
            try audioSession.setCategory(.record, mode: .measurement,options: .defaultToSpeaker)
            try audioSession.setActive(true)
        } catch let error as NSError {
            print("error")
        }

        let input = audioEngine.inputNode
        let mixer = audioEngine.mainMixerNode

        let reverb = AVAudioUnitReverb()

        reverb.loadFactoryPreset(.cathedral)
        reverb.wetDryMix = 50

        audioEngine.attach(reverb)

        let distortion = AVAudioUnitDistortion()

        distortion.loadFactoryPreset(.multiEcho1)

        distortion.preGain = -6

        audioEngine.attach(distortion)

        let eq = AVAudioUnitEQ()
        eq.globalGain = 90
        audioEngine.attach(eq)


        audioEngine.connect(input, to: reverb, format: input.inputFormat(forBus: 0))
        audioEngine.connect(reverb, to: eq, format: input.inputFormat(forBus: 0))
        audioEngine.connect(eq, to: mixer, format: input.inputFormat(forBus: 0))
        audioEngine.connect(input, to: distortion, format: input.inputFormat(forBus: 0))
        audioEngine.connect(distortion, to: mixer, format: input.inputFormat(forBus: 0))


        try! audioEngine.start()

    }
    @IBAction func stop() {
        audioEngine.stop()
        audioEngine.reset()
    }

}

