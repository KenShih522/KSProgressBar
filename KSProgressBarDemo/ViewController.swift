//
//  ViewController.swift
//  KSProgressBarDemo
//
//  Created by Shih on 13/12/2017.
//  Copyright © 2017 kenshih. All rights reserved.
//

import UIKit
import KSProgressBar

class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: KSProgressView!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBAction func sliderValueChanged(_ slider: UISlider) {
        
        self.progressView.progress = UInt(slider.value)
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()

    }

}

