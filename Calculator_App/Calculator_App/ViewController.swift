//
//  ViewController.swift
//  Calculator_App
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
    @IBOutlet weak var X: UITextField!
    @IBOutlet weak var Y: UITextField!
    @IBOutlet weak var Result: UILabel!
    @IBOutlet weak var History: UITextView!
    
    @IBAction func plus(_ sender: UIButton) {
        var value1 : Double = 0
        
        switch  sender.tag {
        case 0:
            value1 = Double(X.text!)! + Double(Y.text!)!
        default:
            print("error")
        }
        Result.text = "Result:" + "\n \(value1)"
        History.text = "\(History.text!) \n \(X.text!) + \(Y.text!) = \(value1) "
        }
    @IBAction func minus(_ sender: UIButton) {
        var value1 : Double = 0
        
        switch  sender.tag {
        case 0:
            value1 = Double(X.text!)! - Double(Y.text!)!
        default:
            print("error")
        }
        Result.text = "Result:" + "\n \(value1)"
        History.text = "\(History.text!) \n \(X.text!) - \(Y.text!) = \(value1) "
    }
    @IBAction func times(_ sender: UIButton) {
        var value1 : Double = 0
        
        switch  sender.tag {
        case 0:
            value1 = Double(X.text!)! * Double(Y.text!)!
        default:
            print("error")
        }
        Result.text = "Result:" + "\n \(value1)"
        History.text = "\(History.text!) \n \(X.text!) * \(Y.text!) = \(value1) "
    }
    @IBAction func derivated(_ sender: UIButton) {
        var value1 : Double = 0
        
        switch  sender.tag {
        case 0:
            value1 = Double(X.text!)! / Double(Y.text!)!
        default:
            print("error")
        }
        Result.text = "Result:" + "\n \(value1)"
        History.text = "\(History.text!) \n \(X.text!) / \(Y.text!) = \(value1) "
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

