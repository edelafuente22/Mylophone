//
//  TitleViewController.swift
//  Mylophone
//
//  Created by Edward de la Fuente on 3/21/18.
//  Copyright © 2018 Claitco. All rights reserved.
//

import UIKit
import AVFoundation

class TitleViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleSound = Bundle.main.url(forResource: "xylophone-sweep", withExtension: "wav")
        
        audioPlayer = try! AVAudioPlayer(contentsOf: titleSound!)
        audioPlayer.play()
        
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        
    }
    
    @objc func timeToMoveOn() {
        self.performSegue(withIdentifier: "main", sender: Any?.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
