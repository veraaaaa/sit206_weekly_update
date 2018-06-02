//
//  ViewController.swift
//  Animation
//
//  Created by 王雨薇 on 2018/6/2.
//  Copyright © 2018年 wangyuwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //vars
    var animator : UIDynamicAnimator?
    var gravity : UIGravityBehavior?
    var collision : UICollisionBehavior?
    var balloon : UIView?
    var timer : Timer?
    let balloonImage = UIImage(named:"ballons")
    let poppedballonImage = UIImage(named: "pop")
    
    @objc func poppedBalonEvenr(_ sender : UIButton){
        sender.setImage(poppedballonImage, for: .normal)
        UIView.animate(withDuration: 1, animations: {sender.alpha = 0})
    }
    
    func addBalloon(){
        let xPosition = Int(arc4random() % UInt32(self.view.bounds.width))
        balloon = UIButton(frame: CGRect(x: xPosition, y: 0, width: 100, height: 100))
        (balloon as! UIButton).setImage(balloonImage, for: .normal)
        (balloon as! UIButton).addTarget(self, action: #selector(self.poppedBalonEvenr(_:)), for: .touchUpInside)
        self.view.addSubview(balloon!)
        gravity?.addItem(balloon!)
        collision?.addItem(balloon!)
    }
    func addBalloonMan(){
        let xPosition = Int(arc4random() % UInt32(self.view.bounds.width))
        balloon = UIButton(frame: CGRect(x: 20, y: 0, width: 100, height: 100))
        (balloon as! UIButton).setImage(balloonImage, for: .normal)
        (balloon as! UIButton).addTarget(self, action: #selector(self.poppedBalonEvenr(_:)), for: .touchUpInside)
        self.view.addSubview(balloon!)
        gravity?.addItem(balloon!)
        collision?.addItem(balloon!)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animator = UIDynamicAnimator()
        gravity = UIGravityBehavior()
        collision = UICollisionBehavior()
        collision?.translatesReferenceBoundsIntoBoundary = true
        collision?.collisionMode = .boundaries
        animator?.addBehavior(gravity!)
        animator?.addBehavior(collision!)
        //addBalloonMan()
        //gravity?.gravityDirection = CGVector(dx: 0, dy: 1)
       // gravity?.magnitude = 0.2
        //timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(_) -> Void in self.addBalloon()})
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

