//
//  ViewController.swift
//  Tapper
//
//  Created by Peter Lada on 9/28/15.
//  Copyright © 2015 Peter Lada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapTarget = 0
    var tapCount = 0

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var tapTargetTxt: UITextField!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapCountLbl: UILabel!
    
    @IBAction func doPlay(sender: UIButton!) {
        if tapTargetTxt.text != nil && tapTargetTxt.text != "" {
            tapTarget = Int(tapTargetTxt.text!)!
            showPlay()
            tapCount = 0
            checkIfFinished()
        }
    }
    
    func showPlay(inverse: Bool = false) {
        logo.hidden = !inverse
        playBtn.hidden = !inverse
        tapTargetTxt.hidden = !inverse
        
        tapBtn.hidden = inverse
        tapCountLbl.hidden = inverse
    }
    
    func checkIfFinished() {
        if tapCount == 1 {
            tapCountLbl.text = "One tap"
        } else {
            tapCountLbl.text = "\(tapCount) taps"
        }
        if tapCount >= tapTarget {
            tapTargetTxt.text = ""
            showPlay(true)
            tapCount = 0
        }
    }
    
    @IBAction func doTap(sender: UIButton!) {
        tapCount++
        checkIfFinished()
    }
    
}

