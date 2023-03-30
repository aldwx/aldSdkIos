//
//  ViewController.swift
//  Example
//
//  Created by MC on 2022/10/12.
//

import UIKit
import AldAnalytics

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        AldAnalytics.trackAppInstall();
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
            AldAnalytics.trackPredefined("AldRegisterResult", properties: [
                //账号(zhangsan)
                "ald_account": "18811784318",
                //注册方式（账号密码、手机号、微信授权）
                "ald_register_method": "手机号",
                // 是否登录成功（TRUE、FALSE）
                "ald_is_success": true,
                //失败原因
                "ald_fail_reason": "",
            ])
        }
    }
    
    @IBAction func search(_ sender: UIButton) {
        AldAnalytics.trackPredefined("AldSearchResultClick", properties: [
           // 内容 ID
            "ald_content_id": "1001",
            //内容名称
            "ald_content_name":"白皮书1001",
            //关键词
            "ald_key_word": "阿拉丁",
            //关键词类型：例：热门/默认/自定义
            "ald_key_word_type": "热门",
            //位置序号
            "ald_position_number": 1,
        ])
        
        // 模拟搜索结果返回回调
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
            AldAnalytics.trackPredefined("AldSearchRequest", properties: [
                //关键词
                "ald_key_word": "阿拉丁",
                //搜索类型  例：全局搜索/分类搜索
                "ald_search_type": "分类",
                // 搜索结果数量
                "ald_result_num": 10,
            ])
        }
    }
}

