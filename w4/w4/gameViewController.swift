//
//  gameViewController.swift
//  w4
//
//  Created by JUNI on 2022/08/30.
//


import UIKit
import AVFoundation

class gameViewController: UIViewController, UIGestureRecognizerDelegate {
    var audioPlayer : AVPlayer!
    
    @IBOutlet weak var plusCoin: UILabel!
    @IBOutlet weak var character: UIImageView!
    @IBOutlet weak var timer_record: UILabel!
    @IBOutlet weak var X_button: UIImageView!
    
    var countCoin : Int = 0
    @IBOutlet weak var sound: UIImageView!

        

    override func viewDidLoad() {
        super.viewDidLoad()
        BGMPlayer()
        
        self.plusCoin.text = "0"

        
        
        self.X_button.isUserInteractionEnabled = true
        self.X_button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.viewTapped)))
     
        self.sound.isUserInteractionEnabled = true
        
        let tapGesture : UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.sound.addGestureRecognizer(tapGesture)
        

        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureHandler))
        character.addGestureRecognizer(panGestureRecognizer)


        character.isUserInteractionEnabled = true
//        timer()


    }
    
    @IBAction func panGestureHandler(_ sender: UIPanGestureRecognizer) {
//        self.plusCoin.text = "Recognized"        // 뷰 이동
            let translation = sender.translation(in: self.view)
            self.character.center.x += translation.x
                
        var xdot :Float = Float((sender.translation(in: self.view).x.rounded()))

        
        
            // 방향 확인
//            let velocity = sender.velocity(in: self.character)
//            let x = velocity.x
            
            sender.setTranslation(CGPoint.zero, in: character)
        }
  
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//
    
        timer()

        
        //thread 1
        DispatchQueue.global(qos: .userInitiated).async {

            for i in stride(from: 1, through: 40, by: 1) {
                var randomData = Float.random(in: 0...390)
                var randomY = Float.random(in: 100...300)

                var randomvel = Float.random(in: 0...0.3)

                DispatchQueue.main.async {

                    var imageView: UIImageView = self.create(x: randomData, y:randomY)

                self.view.addSubview(imageView)

                    UIImageView.animate(withDuration: 1, delay: CGFloat(randomvel), animations:{
                imageView.frame = CGRect(x: CGFloat(randomData)  , y: CGFloat(690), width: 20, height: 20)
                self.view.layoutIfNeeded()
                        
                if((self.character.frame.origin.x <= imageView.frame.origin.x+imageView.frame.size.width  &&
                    imageView.frame.origin.x <= self.character.frame.origin.x + self.character.frame.size.width) &&
                   (self.character.frame.origin.y <= imageView.frame.origin.y+imageView.frame.size.height && imageView.frame.origin.y <= self.character.frame.origin.y + self.character.frame.size.height)
                
                ){
                    self.countCoin += 1
                    print(self.countCoin)
//                    self.plusCoin.text = String(self.countCoin)


                }
                    },completion:{_ in imageView.isHidden = true
                        self.plusCoin.text = String(self.countCoin)

                    })

                }}}
//
        //thread2
        DispatchQueue.global(qos: .userInitiated).async {

            for i in stride(from: 1, through: 30, by: 1) {
                var randomData = Float.random(in: 0...390)
                var randomY = Float.random(in: 100...300)
                var randomvel = Float.random(in: 0...0.3)
                DispatchQueue.main.async {

                    var imageView: UIImageView = self.create(x: randomData, y: randomY)

                self.view.addSubview(imageView)

                    UIImageView.animate(withDuration: 1, delay: CGFloat(randomvel)+0.4, animations:{
        imageView.frame = CGRect(x: CGFloat(randomData)  , y: CGFloat(690), width: 20, height: 20)
        self.view.layoutIfNeeded()

                if((self.character.frame.origin.x <= imageView.frame.origin.x+imageView.frame.size.width  &&
                    imageView.frame.origin.x <= self.character.frame.origin.x + self.character.frame.size.width) &&
                   (self.character.frame.origin.y <= imageView.frame.origin.y+imageView.frame.size.height && imageView.frame.origin.y <= self.character.frame.origin.y + self.character.frame.size.height)
                
                ){
                    self.countCoin += 1
                    print(self.countCoin)
                    self.plusCoin.text = String(self.countCoin)

                }
                
                        
            },completion:{_ in imageView.isHidden = true })

}}}
//
        //thread3
        DispatchQueue.global(qos: .userInitiated).async {
            for i in stride(from: 1, through: 30, by: 1) {

                var randomData = Float.random(in: 0...390)
                var randomY = Float.random(in: 100...300)

                var randomvel = Float.random(in: 0...0.3)
                DispatchQueue.main.async {

                    var imageView: UIImageView = self.create(x: randomData, y:randomY)
            
                self.view.addSubview(imageView)
            
                    UIImageView.animate(withDuration: 1.2, delay: CGFloat(randomvel)+0.7, animations:{ [self] in
                imageView.frame = CGRect(x: CGFloat(randomData)  , y: CGFloat(690), width: 20, height: 20)
                self.view.layoutIfNeeded()
                        
                        
                        if((self.character.frame.origin.x <= imageView.frame.origin.x+imageView.frame.size.width  &&
                            imageView.frame.origin.x <= self.character.frame.origin.x + self.character.frame.size.width) &&
                           (self.character.frame.origin.y <= imageView.frame.origin.y+imageView.frame.size.height && imageView.frame.origin.y <= self.character.frame.origin.y + self.character.frame.size.height)
                        
                        ){
                            self.countCoin += 1
                            print(self.countCoin)
                            self.plusCoin.text = String(self.countCoin)
                            
                //캐릭터에도 스레드, 좌표 맞을때 사라지는 기능, 화면 덮어도 되겠다

                        }
                        
                    },completion:{_ in
                        self.plusCoin.text = String(self.countCoin)

                        imageView.isHidden = true

                    })
                    
            
                    
                    
                }}}
        

        
    }
    
    
    
    
    func create(x:Float,y:Float) -> UIImageView {
        lazy var imageView: UIImageView = {
           
                     // Set the size of UIImageView.
           
                     let width: CGFloat = 20
                    let height: CGFloat = 20
           
                     // Set x, y of UIImageView.
           
            let posX: CGFloat = CGFloat(x)
           
            let posY: CGFloat = CGFloat(y)
           
                     // Create UIImageView.
           
                     let imageView = UIImageView(frame: CGRect(x: posX, y: posY, width: width, height: height))
           
                     // Create UIImage.
                     let myImage: UIImage = UIImage(named: "Coin1.png")!
           
                     // Set the image to UIImageView.
           
                     imageView.image = myImage
//
            return imageView
//
        }()
        
        return imageView
//
    }
    
  
    //pop up
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        audioPlayer?.pause()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
    
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated:true)
    }
    
    
    
    //sound
    func BGMPlayer(){
    guard let url = Bundle.main.url(forResource: "bgm2", withExtension: "mp3") else {
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
    
    
    //timer
    var mTimer : Timer?
    var number : Float = 10.00
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func timer(){
        mTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
//            timer_record.text = String("time over")
//            audioPlayer?.pause()
        
    }
    @objc func timerCallback(){
        if (number > 0.01){
        number -= 0.01
        timer_record.text = String(format:"%.2f",number)
        }
        else   {timer_record.text = String("Time is over!")
            audioPlayer?.pause()
            //점수 뷰 띄우기
        }
  
}
}
