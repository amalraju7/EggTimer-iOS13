

import UIKit
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTime = ["Soft":3,"Medium":4,"Hard":7]

    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var hardness: String?
    var player: AVAudioPlayer!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    

    @IBAction func hardnessPressed(_ sender: UIButton) {
        
        timer.invalidate()
         hardness = sender.currentTitle!
        totalTime = eggTime[hardness!]!
        progressBar.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
       
        
    }
    
    @objc func updateTimer(){
        if (secondsPassed < totalTime){
        
            secondsPassed += 1
            progressBar.progress = Float(Double(secondsPassed)/Double(totalTime))
        
            
        }
        else{
            timer.invalidate()
            titleLabel.text = "Done."
            playSound(soundName: "alarm_sound")
        }
    }
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}

