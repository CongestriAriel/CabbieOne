//
//  BaseViewController.swift
//  StarWarMVVM
//
//  Created by Ariel Congestri on 26/03/2020.
//  Copyright © 2020 Ariel Congestri. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    func showLoadingView() {
        LoadingManager.start()
    }

    func hideLoadingView() {
        LoadingManager.stop()
    }
}
