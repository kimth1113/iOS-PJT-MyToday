//
//  ContentViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/17.
//

import UIKit
import SnapKit
import IQKeyboardManagerSwift

class ContentViewController: BaseViewController {
    
    let mainView = ContentView()
    
    var content: String?
    
    var saveContentText: ((String?) -> Void)?
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        mainView.textView.delegate = self
        mainView.textView.becomeFirstResponder()
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
            
        if let content = content {
            mainView.textView.text = content
        }
    
        setButton()
    }
    
    override func configure() {
        
    }
}

extension ContentViewController {
    
    private func setButton() {
        
        mainView.checkButtonView.customButton.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func checkButtonTapped(_ sender: UIButton) {
        guard let content = mainView.textView.text else { return }
        
        if content.trimmingCharacters(in: .whitespaces) == "" {
            saveContentText!(nil)
        } else {
            saveContentText!(mainView.textView.text)
        }
        
        dismiss(animated: true)
    }
}

extension ContentViewController: UITextViewDelegate {
    
    // 키보드 나타날 때
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("끝2")
        
        let height = UIScreen.main.bounds.size.height
        
        mainView.backgroundView.snp.makeConstraints { make in
            make.bottom.equalTo(mainView).offset(height / 2)
        }
    }
    
    // 키보드 없어질 때
    func textViewDidEndEditing(_ textView: UITextView) {
        print("시작2")
        
        mainView.backgroundView.snp.makeConstraints { make in
            make.bottom.equalTo(mainView)
        }
    }
    
}
