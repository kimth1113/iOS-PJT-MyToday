//
//  AnalysisViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/24.
//

import UIKit

class AnalysisViewController: BaseViewController {
    
    let mainView = AnalysisView()
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configure() {
        
    }
}
