//
//  ViewController.swift
//  Mylophone
//
//  Created by Edward de la Fuente on 3/20/18.
//  Copyright © 2018 Claitco. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    var selectedSound = ""
    let soundArray = ["xylophone-c", "xylophone-d", "xylophone-e", "xylophone-f", "xylophone-g", "xylophone-a", "xylophone-b", "xylophone-c2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        selectedSound = soundArray[sender.tag - 1]
        print(selectedSound)
        playSound()
    
    }
    
    func playSound(){
        let sound = Bundle.main.url(forResource: selectedSound, withExtension: "wav")
        
        audioPlayer = try! AVAudioPlayer(contentsOf: sound!)
        
        audioPlayer.play()
    }
    
}

extension UIButton {
    open override func draw(_ rect: CGRect) {
        //provide custom style
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}

