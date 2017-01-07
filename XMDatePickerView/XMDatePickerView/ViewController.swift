//
//  ViewController.swift
//  XMDatePickerView
//
//  Created by TwtMac on 17/1/7.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dateField: UITextField!
    @IBOutlet weak var timeField: UITextField!
    
    var datePickerView: XMDatePickerView?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dateField.delegate = self
        timeField.delegate = self
    }
}


// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        /// 01 初始化时间选择器
        datePickerView = XMDatePickerView.datePickerView()
        view.addSubview(datePickerView!)
        
        /// 02 设置日期选择器的模式
        if textField == dateField {
            datePickerView?.dateMode = UIDatePickerMode.date
        } else if textField == timeField {
            datePickerView?.dateMode = UIDatePickerMode.dateAndTime
        }
        /// 03 显示日期选择器
        datePickerView?.show()
        
        /// 04 处理日期选择器选择后的回调结果
        datePickerView?.dateBlock = { (dateStr: String)->() in
            textField.text = dateStr
        }
        
        return false
    }
}
