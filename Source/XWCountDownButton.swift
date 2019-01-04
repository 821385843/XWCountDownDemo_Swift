//
//  XWCountDownButton.swift
//  XWCountDownDemo_Swift
//
//  Created by 谢伟 on 2019/1/4.
//  Copyright © 2019 谢伟. All rights reserved.
//
import UIKit

public enum XWCountDownType {
    case XWCountDownDefault, XWCountDownOne, XWCountDownTwo, XWCountDownThree
}

public class XWCountDownButton: UIButton {
    fileprivate var timer: DispatchSourceTimer?
    
    /// 记录按钮初始的title，用于倒计时完成之后的回显
    fileprivate var title: String?
    fileprivate var count: Int = 0
}

// MARK: - 系统方法
public extension XWCountDownButton {
    override public func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        
        if count == 0 {
            self.title = title
            count += 1
        }
    }
    
}

// MARK: - 私有方法
public extension XWCountDownButton {
    
    /// 开始倒计时
    ///
    /// - Parameters:
    ///   - totalTime: 倒计时的总时间
    ///   - countDownType: 倒计时显示的样式（XWCountDownDefault -- 5／XWCountDownOne -- 5s／XWCountDownTwo -- 05／XWCountDownThree -- 05s
    public func startCountDown(_ totalTime: Int = 60, _ countDownType: XWCountDownType = .XWCountDownDefault) {
        isUserInteractionEnabled = false
        var timeout = totalTime - 1
        timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        timer?.schedule(deadline: .now(), repeating: .seconds(1), leeway: .seconds(1))
        timer?.setEventHandler(handler: {
            if timeout <= 0 {
                self.timer?.cancel()
                DispatchQueue.main.async {
                    self.isUserInteractionEnabled = true
                    self.setTitle(self.title!, for: .normal)
                }
            } else {
                let seconds = timeout % totalTime
                let strTime = self.getTimeTypeWithSeconds(seconds, countDownType)
                DispatchQueue.main.async {
                    self.setTitle(String(format: "%@",strTime), for: .normal)
                }
                timeout -= 1
            }
        })
        timer?.resume()
    }
    
    public func getTimeTypeWithSeconds(_ seconds: Int, _ countDownType: XWCountDownType) -> String {
        switch countDownType {
        case .XWCountDownDefault:
            return String(format: "%d", seconds)
        case .XWCountDownOne:
            return String(format: "%ds", seconds)
        case .XWCountDownTwo:
            return String(format: "%.2d", seconds)
        case .XWCountDownThree:
            return String(format: "%.2ds", seconds)
        }
    }
}
