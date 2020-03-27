//
//  Loadingview.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import UIKit
import SwiftUI
import Lottie

protocol LottieViewDelegate {
    func animationDidFinish()
}
class LottieView: UIView {

    var delegate: LottieViewDelegate?
    var animationView = AnimationView()
    
    func start(animation: String, shouldLoop: Bool) {
        self.backgroundColor = .black
        
        let animation = Animation.named(animation)
        animationView.frame = self.frame
        animationView.animation = animation
        animationView.loopMode = shouldLoop ? .loop : .playOnce
        animationView.contentMode = .scaleAspectFit
        animationView.play { [weak self ] (_) in
            if !shouldLoop { self?.delegate?.animationDidFinish() } 
        }
        animationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: self.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }

    func stop() {
        self.removeFromSuperview()
    }

}
