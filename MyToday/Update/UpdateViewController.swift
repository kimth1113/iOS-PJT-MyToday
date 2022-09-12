//
//  UpdateViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/12.
//

import UIKit

class UpdateViewController: BaseViewController {
    
    let mainView = UpdateView()
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TEST"
        mainView.dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }
    
    override func configure() {
        
    }
}

extension UpdateViewController {
    
    @objc
    private func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
