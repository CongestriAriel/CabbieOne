//
//  SplashViewController.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import UIKit
import AVFoundation

class SplashViewController: BaseViewController {

    @IBOutlet weak var animationView: LottieView!
    @IBOutlet weak var imageView: UIImageView!
    var shouldContinueWithApplication = false
    
    let speechSynthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        greed()
    }

    func configureUI() {
        imageView.image = #imageLiteral(resourceName: "BB8")
    }

    func setUp() {
        speechSynthesizer.delegate = self
        animationView.delegate = self
    }

    func greed() {
        let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: "Hi, I am Siri. I will be your guide in this trip")
        speechUtterance.rate = 0.4
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(speechUtterance)
    }

    func continueWithApplication() {
        let speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string: "Let`s start")
        speechUtterance.rate = 0.4
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechSynthesizer.speak(speechUtterance)
    }
}
extension SplashViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        if shouldContinueWithApplication {
            navigationController?.isNavigationBarHidden = false
            navigationController?.setViewControllers([MovieListBuilder.start(navigation: self.navigationController)], animated: true)
        } else {
            animationView.start(animation: "BB8", shouldLoop: false)
            imageView.isHidden = true
            shouldContinueWithApplication = true
        }
    }
}
extension SplashViewController: LottieViewDelegate {
    func animationDidFinish() {
        continueWithApplication()
        
    }
}
