//
//  ViewController.swift
//  VoiceEffect
//
//  Created by Satya on 25/10/23.
//

import UIKit
import AudioKit
import AVFoundation

class ViewController: UIViewController {
    private let audioManager: SCAudioManager!
    required init?(coder: NSCoder) {
        audioManager = SCAudioManager()

        super.init(coder: coder)

        audioManager.recordingDelegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        waveformView.configuration = waveformView.configuration.with(
//            style: styleForSelection(index: styleSelector.selectedSegmentIndex)
//        )
        audioManager.prepareAudioRecording()
    }
    lazy var recordButton: UIButton! = {
        let recordButton = UIButton()
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        recordButton.backgroundColor = .gray
        recordButton.setTitleColor(.white, for: .normal)
        recordButton.addTarget(self, action: #selector(didTaped(_:)), for: .touchUpInside)
        recordButton.setTitle("Record", for: .normal)
        return recordButton
      }()
    
    @objc func didTaped(_ sender: UIButton){
        if audioManager.recording() {
            audioManager.stopRecording()
            recordButton.setTitle("Start Recording", for: .normal)
        } else {
            audioManager.startRecording()
            recordButton.setTitle("Stop Recording", for: .normal)
        }
    }
    func FirstView() {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        let view = UIView()
        view.frame = CGRectMake(0, 100, 380, 800)
        let charImageView =  UIImageView(image: UIImage(named: "ma"))
        charImageView.frame = CGRectMake(190, 240, 25, 25)
        
        let userImageView =  UIImageView(image: UIImage(named: "avatar"))
        userImageView.frame = CGRectMake(160, 180, 75, 75)
        
        let charImageView1 =  UIImageView(image: UIImage(named: "ma"))
        charImageView1.frame = CGRectMake(135, 170, 35, 35)
        
        let userImageView1 =  UIImageView(image: UIImage(named: "avatar"))
        userImageView1.frame = CGRectMake(105, 105, 90, 90)
        
        view.backgroundColor = .white
        
        let circleView = CircleWithDotsView()
        circleView.frame = CGRect(x: 0, y: 100, width: 300, height: 300)
        
        let center = CGPoint(x: 200, y: 200)
        var numberOfCircles = 8
        let minRadius: CGFloat = 50
        let maxRadius: CGFloat = 180
        let dotSize: CGFloat = 6
        
        var multiCircleImageView = UIImageView()
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .repeat, animations: { [weak self] in
            numberOfCircles = 6
            var multiCircleImage = CircleWithDotsView.drawMultipleDottedCircles2(center: center, numberOfCircles: numberOfCircles, minRadius: minRadius, maxRadius: maxRadius, dotSize: dotSize)
            multiCircleImageView = UIImageView(image: multiCircleImage)
            view.addSubview(multiCircleImageView)
            multiCircleImageView.alpha = 0
        }, completion: { finished in
            // multiCircleImageView.alpha = 1
            multiCircleImageView.removeFromSuperview()
        })
        view.addSubview(userImageView)
        view.addSubview(charImageView)
        view.backgroundColor = UIColor(red: 0.151, green: 0.151, blue: 0.162, alpha: 0.8)
        
        
//        //----
//
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        let dotRadiusView2 = DotRadiusView2(frame: CGRect(x: 50, y: 400, width: 300, height: 300))
        var image1 = UIImage()
        image1 = DotRadiusView2.drawCurrentImage2()
        imageView.image = image1
        dotRadiusView2.addSubview(imageView)
        dotRadiusView2.addSubview(userImageView1)
        dotRadiusView2.addSubview(charImageView1)
        dotRadiusView2.backgroundColor = .clear
        view.addSubview(dotRadiusView2)
        
        //----------

//        UIView.animate(withDuration: 1.0, delay: 0.1, options: .repeat, animations: { [weak self] in
//            image1 = DotRadiusView2.drawCurrentImage2()
//            imageView.image = image1
//            imageView.alpha = 0.1
//            dotRadiusView2.addSubview(imageView)
//            dotRadiusView2.addSubview(userImageView1)
//            dotRadiusView2.addSubview(charImageView1)
//            dotRadiusView2.backgroundColor = .clear
//            view.addSubview(dotRadiusView2)
////            dotRadiusView2.setNeedsDisplay()
//            // dotRadiusView2.setNeedsDisplay()
//        }, completion: { finished in
//            dotRadiusView2.setNeedsDisplay()
//            imageView.removeFromSuperview()
////            self.view.removeFromSuperview()
//        })
        
        
//        UIView.animate(withDuration: 1.0, delay: 0.0, options: .repeat, animations: { [weak self] in
//            view.addSubview(dotRadiusView)
//        }, completion: { finished in
//            dotRadiusView.removeFromSuperview()
//        })
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            UIView.animate(withDuration: 1.0, delay: 0.0,options: .repeat, animations: {
//                dotRadiusView2.setNeedsDisplay()
            })
        }
        
        view.addSubview(recordButton)
        recordButton.frame = CGRect(x: 100, y: 700, width: 180, height: 40)
        self.view = view
    }
}
extension ViewController: RecordingDelegate {
    func audioManager(_ manager: SCAudioManager!, didAllowRecording success: Bool) {
        if !success {
            preconditionFailure("Recording must be allowed in Settings to work.")
        }
    }

    func audioManager(_ manager: SCAudioManager!, didFinishRecordingSuccessfully success: Bool) {
        print("did finish recording with success=\(success)")
        recordButton.setTitle("Start Recording", for: .normal)
    }

    func audioManager(_ manager: SCAudioManager!, didUpdateRecordProgress progress: CGFloat) {
        print("current power: \(manager.lastAveragePower()) dB")
        let linear = 1 - pow(10, manager.lastAveragePower() / 20)
        print("linear: \(linear)")
        // Here we add the same sample 3 times to speed up the animation.
        // Usually you'd just add the sample once.
//        waveformView.add(samples: [linear, linear, linear])
    }
}

