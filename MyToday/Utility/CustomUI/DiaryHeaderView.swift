//
//  ReadHeaderView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/19.
//

import UIKit

class DiaryHeaderView: BaseView {
    
    let leftButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemOrange
        return view
    }()
    
    let rightButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    let underline: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func configureUI() {
        backgroundColor = UIColor(rgb: 0xfaf4e4)
        
        [leftButtonView, rightButtonView, underline].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        leftButtonView.snp.makeConstraints { make in
            make.top.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.width.height.equalTo(40)
        }
        
        rightButtonView.snp.makeConstraints { make in
            make.top.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.width.height.equalTo(40)
        }
        
        underline.snp.makeConstraints { make in
            make.top.equalTo(leftButtonView.snp.bottom).offset(19)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(1)
        }
    }
}
