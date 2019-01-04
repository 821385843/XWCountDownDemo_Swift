//
//  ViewController.swift
//  XWCountDownDemo_Swift
//
//  Created by 谢伟 on 2019/1/4.
//  Copyright © 2019 谢伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - 私有方法
extension ViewController {
    fileprivate func setupUI() {
        let btn = XWCountDownButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        btn.center = view.center
        btn.backgroundColor = UIColor.orange
        btn.setTitle("倒计时", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func btnClick(_ btn: XWCountDownButton) {
        btn.startCountDown(15, .XWCountDownOne)
    }
}



