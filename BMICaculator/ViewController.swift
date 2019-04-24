//
//  ViewController.swift
//  BMICaculator
//
//  Created by cc on 2019/4/23.
//  Copyright © 2019 cc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    @IBOutlet weak var displayer: UILabel!
    
    @IBOutlet weak var heightInput: UITextField!
    
    @IBOutlet weak var weightInput: UITextField!
    
    var height: Double?
    var weight: Double?
    
    @IBAction func calculation(_ sender: UIButton) {
        height = Double(heightInput.text!)
        weight = Double(weightInput.text!)
        
        guard let height = height else {
            displayer.text = "输入错误，请重新输入"
            return
        }
        
        guard let weight = weight else {
            displayer.text = "输入错误，请重新出入"
            return
        }
        
        displayer.text = BMICalulator(height: height, weight: weight)
    }
    
    //BMI计算函数
    func BMICalulator(height: Double, weight: Double) ->String {
        let BMI = weight/(height * height)
        let textValue = String(format: "%2.f", BMI)
        switch BMI {
        case 0.0..<18.5:
            return "您的BMI指数为\(textValue),情况过轻"
        case 18.5..<24.0:
            return "您的BMI指数为\(textValue),情况正常"
        case 24.0...28.0:
            return "您的BMI指数为\(textValue),情况过重"
        case 28.0...:
            return "您的BMI指数为\(textValue),情况肥胖"
        default:
            return "输入错误，身高和体重不为负数"
        }
    }
}

