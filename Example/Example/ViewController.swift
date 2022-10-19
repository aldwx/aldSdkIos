//
//  ViewController.swift
//  Example
//
//  Created by MC on 2022/10/12.
//

import UIKit
import AldAnalytics

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func login(_ sender: UIButton) {
        AldAnalytics.trackPredefined("AldLoginButtonClick", properties: ["ald_login_type": "<#登录类型（账号密码、手机号、微信授权）#>"])
        
        // 模拟登录回调
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            AldAnalytics.trackPredefined("AldLoginResult", properties: [
                "ald_account": "<#账号(zhangsan)#>",
                "ald_login_type": "<#登录类型（账号密码、手机号、微信授权）#>",
                // 是否登录成功（TRUE、FALSE）
                "ald_is_success": true,
                "ald_fail_reason": "<#失败原因#>",
            ])
        }
    }
    
    @IBAction func signup(_ sender: UIButton) {
        AldAnalytics.trackPredefined("AldRegisterButtonClick", properties: ["ald_page_title": "<#所在页面#>"])
        
        // 模拟注册回调
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            AldAnalytics.trackPredefined("AldLoginResult", properties: [
                "ald_account": "<#账号(zhangsan)#>",
                "ald_register_method": "<#注册方式（账号密码、手机号、微信授权）#>",
                // 是否登录成功（TRUE、FALSE）
                "ald_is_success": true,
                "ald_fail_reason": "<#失败原因#>",
            ])
        }
    }
    
}

