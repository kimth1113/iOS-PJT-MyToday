//
//  ContentView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/17.
//

import UIKit
import SnapKit

class ContentView: BaseView {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    let backgroundView2: UIView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    let textView: UITextView = {
        let view = UITextView()
        view.backgroundColor = .systemYellow
        view.font = Constants.BaseFont.boxTitle
        return view
    }()
    
    let checkButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 20
        return view
    }()
    
    override func configureUI() {
        backgroundColor = UIColor(named: "calendar-background")
        
        [backgroundView, backgroundView2, textView, checkButtonView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(safeAreaLayoutGuide).inset(28)
            make.height.equalTo(self).multipliedBy(0.5)
        }
        
        backgroundView2.snp.makeConstraints { make in
            make.edges.equalTo(backgroundView).inset(12)
        }
        
        textView.snp.makeConstraints { make in
            make.edges.equalTo(backgroundView2).inset(12)
        }
        
        checkButtonView.snp.makeConstraints { make in
            make.centerY.equalTo(backgroundView.snp.top).offset(8)
            make.centerX.equalTo(backgroundView.snp.trailing).offset(-8)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
    }
}
