//
//  LoadingViewController.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import UIKit
import Lottie

class LoadingManager {
    
    static var sharedLoader = UIView(frame: UIScreen.main.bounds)
    private static var window: UIWindow!

    static func start() {
        sharedLoader.backgroundColor = .black
        let loadingView = LottieView(frame: CGRect(x: (sharedLoader.frame.maxX/2) - 100, y: (sharedLoader.frame.maxY/2) - 100, width: 200, height: 200))
        loadingView.start(animation: "Loading", shouldLoop: true)
        sharedLoader.addSubview(loadingView)
        window.addSubview(sharedLoader)
    }

    static func stop() {
        sharedLoader.removeFromSuperview()
    }

    static func setWindow(_ window: UIWindow) {
        self.window = window
    }
}
