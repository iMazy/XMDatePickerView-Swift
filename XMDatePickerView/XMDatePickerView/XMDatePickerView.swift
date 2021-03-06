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
    
    /// 动画时间间隔
    let duration: Double = 0.3
    
    /// 定义一个闭包,作为时间选择完成后的回调
    var dateBlock:((String)->())?
    
    var formatter: DateFormatter?
    
    
    /// 设置日期的选择器的模式
    var dateMode: UIDatePickerMode? {
        didSet {
            /// 设置日期选择器的模式,默认是时间选择器
            datePicker.datePickerMode = dateMode ?? UIDatePickerMode.dateAndTime
            
            let ft = DateFormatter()
            if dateMode == UIDatePickerMode.date {
                ft.dateFormat = "yyyy-MM-dd"
            } else if dateMode == UIDatePickerMode.dateAndTime {
                ft.dateFormat = "yyyy-MM-dd HH:mm"
            }
            formatter = ft
        }
    }
    
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
        parentView.layer.cornerRadius = 10
        parentView.layer.masksToBounds = false
        /// 设置阴影
        parentView.layer.shadowOpacity = 1.0
        parentView.layer.shadowColor = UIColor.lightGray.cgColor
        parentView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        parentView.layer.shadowRadius = 5.0
        
        /// 给 取消/确定 按钮添加边框
        borderView(borderView: cancelButton)
        borderView(borderView: sureButton)
        
    }
    
    /// 背景按钮点击事件
    @IBAction func backgroundBtnClick() {
        dismiss()
    }
    
    /// 取消按钮点击事件
    @IBAction func cancelBtnClick() {
        dismiss()
    }
    
    /// 确定按钮点击事件
    @IBAction func sureBtnClick() {
        dismiss()
        /// 闭包回调结果
        if self.dateBlock != nil {
            let dateStr = formatter?.string(from: datePicker.date)
            dateBlock!(dateStr ?? "")
        }
    }
}


extension XMDatePickerView {
    
    
    /// 抽取视图设置边框方法
    ///
    /// - Parameter borderView: 需要设置边框的视图
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
    
    /// 展示
    func show() {
        parentView.alpha = 0
        parentView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: duration) {
            self.parentView.alpha = 1.0
            self.parentView.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
        }
    }
    
    /// 消失
    func dismiss() {
        UIView.animate(withDuration: duration, animations: {
            self.parentView.alpha = 0
            self.parentView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5)
        }) { (_) in
            /// 还原并从父视图中移除
            self.parentView.transform = CGAffineTransform.identity
            self.removeFromSuperview()
        }
    }
}
