//
//  homeViewController.swift
//  w4
//
//  Created by JUNI on 2022/08/29.
//

import UIKit
import AVFoundation

class homeViewController: UIViewController,UIGestureRecognizerDelegate {
    var audioPlayer : AVPlayer!
    
    @IBOutlet weak var sound: UIImageView!
    @IBOutlet weak var gameStart: UIImageView!
    
    
    let myStoryBoard : UIStoryboard = UIStoryboard(name:"Main", bundle: nil)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BGMPlayer()
           //클릭 가능하도록 설정
           self.gameStart.isUserInteractionEnabled = true
           //제스쳐 추가
           self.gameStart.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
        
            self.sound.isUserInteractionEnabled = true

        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.sound.addGestureRecognizer(tapGesture)
        // Do any additional setup after loading the view.
    }
    

    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        audioPlayer?.pause()
        let GameViewController = myStoryBoard.instantiateViewController(withIdentifier: "GameViewController")
        GameViewController.modalPresentationStyle = .fullScreen //전체화면으로 보이게 설정
        GameViewController.modalTransitionStyle = .crossDissolve
        self.present(GameViewController, animated: true)
    }
    
    //sound
    func BGMPlayer(){
    guard let url = Bundle.main.url(forResource: "bgm1", withExtension: "mp3") else {
                print("error to get the mp3 file")
                return
            }
            do {
                audioPlayer = try AVPlayer(url: url)
            } catch {
                print("audio file error")
            }
            audioPlayer?.play()
    }
    
    var count : Int = 0
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        count += 1
        if (count%2 != 0){
            sound.image = UIImage(named: "Icon_SoundOff.png")
            audioPlayer?.pause()}
        else   {             sound.image = UIImage(named: "Icon_SoundOn.png")

            audioPlayer?.play()}

        print("sound touch")
        sound.endEditing(true)
        return true
    }
    
}
