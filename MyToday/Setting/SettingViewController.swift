//
//  SettingViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/10/03.
//

import UIKit

class SettingViewController: BaseViewController {
    
    let mainView = SettingView()
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    override func configure() {
        
    }
}
