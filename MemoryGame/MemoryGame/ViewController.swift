//
//  ViewController.swift
//  MemoryGame
//
//  Created by 王雨薇 on 2018/6/1.
//  Copyright © 2018年 wangyuwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var Intscore: UILabel!
    @IBOutlet var ResetButton: [UIButton]!
    
    var lastButton : UIButton?
    var imgs :[UIImage] = [
        UIImage(named: "CrySm")!,
        UIImage(named: "wink")!,
        UIImage(named: "thinder")!,
        UIImage(named: "bird")!
    ]
    
    func rotate(_ sender : UIButton){
        UIView.animate(withDuration: 0.75, animations: {
            sender.layer.transform =
            CATransform3DMakeRotation(22.0/7, 0, 1, 0)
            })
    }
    @IBAction func buttonToched(_ sender: UIButton) {
        if sender.tag == -1{ return}
        
        sender.setImage(imgs[sender.tag], for: .normal)
        rotate(sender)
        
        if lastButton == nil{
            lastButton = sender
        }
        else if lastButton != nil &&
            sender.tag == lastButton!.tag{
            Intscore.text = "\(Intscore.text!)! + 1)"
            
            sender.tag = -1
            lastButton!.tag = -1
            lastButton = nil
        }
        else{
            sender.setImage(imgs[0], for: .normal)
            lastButton!.setImage(imgs[0], for: .normal)
            rotate(sender)
            rotate(lastButton!)
            lastButton = nil
        }
        
    }
    
    @IBAction func reset(_ sender: UIButton) {
        Intscore.text = "0"
        var nums = Array(0..<ResetButton.count)
        while nums.count > 0{
            var i = Int(arc4random_uniform(UInt32(nums.count)))
            var j = Int(arc4random_uniform(UInt32(nums.count)))
            if i != j {
                if i > j{
                    i = nums.remove(at: i)
                    j = nums.remove(at: j)
                }
                else{
                    j = nums.remove(at:j)
                    i = nums.remove(at:i)
                }
                let random = Int(arc4random_uniform(UInt32(imgs.count - 1)) + 1)
                ResetButton[i].tag = random
                ResetButton[j].tag = random
                ResetButton[i].setImage(imgs[0], for: .normal)
                ResetButton[j].setImage(imgs[0], for: .normal)
            }
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

