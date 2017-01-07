//
//  XMDatePickerView.swift
//  XMDatePickerView
//
//  Created by TwtMac on 17/1/7.
//  Copyright © 2017年 Mazy. All rights reserved.
//

import UIKit

class XMDatePickerView: UIView {
    
    /// 背景视图-->按钮,自带点击事件
    @IBOutlet weak var backgroundButton: UIButton!
    /// 时间选择器的父视图
    @IBOutlet weak var parentView: UIView!
    /// 时间选择器
    @IBOutlet weak var datePicker: UIDatePicker!
    /// 取消按钮
    @IBOutlet weak var cancelButton: UIButton!
    /// 确定按钮
    @IBOutlet weak var sureButton: UIButton!
    
    
    
    /// 背景按钮点击事件
    @IBAction func backgroundBtnClick() {
        
    }
    
    /// 取消按钮点击事件
    @IBAction func cancelBtnClick() {
    }
    
    /// 确定按钮点击事件
    @IBAction func sureBtnClick() {
    }
}
