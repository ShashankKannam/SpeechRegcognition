//
//  ViewController.swift
//  LyricsGenerator
//
//  Created by shashank kannam on 1/8/17.
//  Copyright © 2017 shashank kannam. All rights reserved.
//

import UIKit
import Speech

class MainVC: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var plarButton:CustomRoundedButton!
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var activitySpinner: UIActivityIndicatorView!
    
    var audioPlayer:AVAudioPlayer!
    
    @IBAction func play(_ sender: UIButton) {
        activitySpinner.isHidden = false
        activitySpinner.startAnimating()
        requestSpeechAuth()
        
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
       activitySpinner.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitySpinner.isHidden = true
       // requestSpeechAuth()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func requestSpeechAuth(){
        SFSpeechRecognizer.requestAuthorization { (authStatus) in
            if authStatus == SFSpeechRecognizerAuthorizationStatus.authorized{
                if let path = Bundle.main.url(forResource: "_Cake By The Ocean", withExtension: "mp3"){
                    do{
                        let sound = try AVAudioPlayer(contentsOf: path)
                        self.audioPlayer = sound
                        sound.play()
                    }catch let error as NSError{
                       print(error.debugDescription)
                    }
                    
                    let recognizer = SFSpeechRecognizer()
                    let request = SFSpeechURLRecognitionRequest(url: path)
                    recognizer?.recognitionTask(with: request, resultHandler: { (result, error) in
                        if let error = error{
                           print(error)
                        }
                        else{
                        self.textView.text = result?.bestTranscription.formattedString
                        //self.activitySpinner.stopAnimating()
                        }
                    })
                    
                }
            }
        }
    }

}

