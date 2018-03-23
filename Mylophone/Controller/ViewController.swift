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
        UIView.animate(withDuration: 0.1,
                        animations: {
                        sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        },
                        completion: { _ in
                        UIView.animate(withDuration: 0.2) {
                            sender.transform = CGAffineTransform.identity
                        }
        })
    
        selectedSound = soundArray[sender.tag - 1]
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
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}

