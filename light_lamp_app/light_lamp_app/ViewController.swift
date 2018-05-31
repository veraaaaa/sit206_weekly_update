//
//  ViewController.swift
//  light_lamp_app
//
//  Created by 王雨薇 on 2018/5/31.
//  Copyright © 2018年 wangyuwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func lightoff(_ sender: UIButton) {
        counter += 1
        touchCounter.text = "\(counter) clicks"
        if sender.tag == 0{
            sender.setImage(UIImage(named: "light_on"), for: .normal)
        sender.tag = 1
    }
        else{
          sender.setImage(UIImage(named: "light_off"), for: .normal)
            sender.tag = 0
      }
    }
    var counter : Int = 0
    @IBOutlet weak var touchCounter: UILabel!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

