//
//  FullCell.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/21.
//

import UIKit
import SnapKit

class FullCell: BaseTableViewCell {
    
    let cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.opacity = 0.4
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        return view
    }()
    
    let cellDefaultView: CellDefaultView = {
        let view = CellDefaultView()
        return view
    }()
    
    let underline: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.layer.cornerRadius = 1
        return view
    }()
    
    let cellFullView: CellFullView = {
        let view = CellFullView()
        return view
    }()
    
    override func configureUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        [cellBackgroundView, cellDefaultView, underline, cellFullView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        cellBackgroundView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(8)
            make.leading.trailing.equalTo(self).inset(16)
        }
        
        cellDefaultView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(cellBackgroundView)
            make.height.equalTo(64)
        }
        
        underline.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.leading.equalTo(cellFullView.diaryImageView.snp.leading)
            make.trailing.equalTo(cellFullView.diaryContentView.snp.trailing)
            make.top.equalTo(cellDefaultView.snp.bottom).offset(-4)
        }
        
        cellFullView.snp.makeConstraints { make in
            make.top.equalTo(underline.snp.bottom).offset(8)
            make.leading.bottom.trailing.equalTo(cellBackgroundView)
        }
    }
}

