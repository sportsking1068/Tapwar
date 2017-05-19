//
//  ViewController.swift
//  TapWar
//
//  Created by Nicholas Paul Johnson on 4/17/17.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox




class ViewController: UIViewController {

    @IBOutlet weak var TopBtn: UIButton!
    @IBOutlet weak var BtmBtn: UIButton!
    
    @IBOutlet weak var Restart: UIButton!

    
    
    
    @IBOutlet weak var LionPicture: UIImageView!
    @IBOutlet weak var GiraffePicture: UIImageView!
    
    
    @IBOutlet weak var WinLion: UITextView!
    @IBOutlet weak var WinGiraffe: UITextView!

    
    
    var backgroundaudio = AVAudioPlayer()

    
    @IBOutlet weak var OrangeLabel: UILabel!
    
    @IBOutlet weak var endScene: UIButton!
    @IBOutlet weak var TopEndLabel: UILabel!
    
    @IBOutlet weak var BottomEndLabel: UILabel!
    var score = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        
        
        do{
            
            backgroundaudio = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Videogame backround music" , ofType: "mp3")!))
        }
        
        catch{
            print(error)
        }
        backgroundaudio.play()
        backgroundaudio.numberOfLoops = -1
        score = 0

        OrangeLabel.text = "Tap"
        
        
        
        endScene.isHidden = true
        TopEndLabel.isHidden = true
        BottomEndLabel.isHidden = true
        LionPicture.isHidden = true
        GiraffePicture.isHidden = true
        Restart.isHidden = true
 
        
        TopEndLabel.transform = CGAffineTransform(rotationAngle: 3.14)
        LionPicture.transform = CGAffineTransform(rotationAngle: 3.14)

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func BlueBtnAction(_ sender: AnyObject) {
        
        score+=1
     
        
        testScore()
        
        
        
    }
    @IBAction func RedBtnAction(_ sender: AnyObject) {
        
        score-=1

        
        testScore()
    }
    
    func testScore(){
        
        if score >= 10{
            endScene.isHidden = false
            TopEndLabel.isHidden = false
            BottomEndLabel.isHidden = false
            LionPicture.isHidden = false
            Restart.isHidden = false
            
            TopEndLabel.text = "Team Lion wins!"
            BottomEndLabel.text = "Loser"
            
            LionPicture.image = UIImage(named: "lion")
            var imagenames = ["lion.jpg", "lion2.jpg", "lion3.jpg", "lion4.jpg"]
            var images = [UIImage]()
            
            for i in 0..<imagenames.count{
                
                images.append(UIImage(named: imagenames[i])!)
                
                
                
            }
            
            LionPicture.animationImages = images
            LionPicture.animationDuration = 2.0
            LionPicture.startAnimating()
            
            
            
          

            
            
            
        }
        
        else if score <= -10{
            
            endScene.isHidden = false
            TopEndLabel.isHidden = false
            BottomEndLabel.isHidden = false
            GiraffePicture.isHidden = false
            Restart.isHidden = false
            TopEndLabel.text = "Loser"
            BottomEndLabel.text = "Team Giraffe wins!"
            GiraffePicture.image = UIImage(named: "giraffe.jpg")
            var imagenames = ["giraffe.jpg", "giraffe2.jpg", "giraffe3.jpg", "giraffe4.jpg"]
            var images = [UIImage]()
            
            for i in 0..<imagenames.count{
                
                images.append(UIImage(named: imagenames[i])!)
                
                
                
            }
            
            GiraffePicture.animationImages = images
            GiraffePicture.animationDuration = 2.0
            GiraffePicture.startAnimating()
            
                
            
            
                
                
            }
        
       
        
    }
    @IBAction func EndSceneAction(_ sender: AnyObject) {
        
        
        endScene.isHidden = true
        TopEndLabel.isHidden = true
        BottomEndLabel.isHidden = true
        LionPicture.isHidden = true
        GiraffePicture.isHidden = true
        Restart.isHidden = true
       

        
        score = 0

        OrangeLabel.text = "Tap"
        
    }
}

