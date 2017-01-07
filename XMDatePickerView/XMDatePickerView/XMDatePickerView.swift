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
    
    
    /// 通过类方法,获取时间选择器对象
    ///
    /// - Returns: 从xib中返回自身视图
    class func datePickerView()->XMDatePickerView {
        return Bundle.main.loadNibNamed("XMDatePickerView", owner: nil, options: nil)?.first as! XMDatePickerView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        /// 初始化自己
        let bounds = UIScreen.main.bounds
        frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        backgroundColor = UIColor.init(colorLiteralRed: 0.16, green: 0.17, blue: 0.21, alpha: 0.3)
        
        /// 设置背景视图的属性--->圆角
        parentView.layer.cornerRadius = 1
        parentView.layer.masksToBounds = false
        /// 设置阴影
        parentView.layer.shadowOpacity = 1.0
        parentView.layer.shadowColor = UIColor.lightGray.cgColor
        parentView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        parentView.layer.shadowRadius = 5.0
        
        /// 给取消/确定按钮添加边框
        borderView(borderView: cancelButton)
        borderView(borderView: sureButton)
        
    }
    
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


extension XMDatePickerView {
    func borderView(borderView: UIView) {
        let color = UIColor.init(colorLiteralRed: 0, green: 174/255.0, blue: 240/255.0, alpha: 1)
        
        borderView.layer.cornerRadius = 3;
        borderView.layer.borderWidth = 1;
        borderView.layer.borderColor = color.cgColor;
        borderView.layer.masksToBounds = true;
        
        if borderView .isKind(of: UIButton.self) {
            let btn = borderView as! UIButton
            btn .setTitleColor(color, for: .normal)
            
        }
    }
}
