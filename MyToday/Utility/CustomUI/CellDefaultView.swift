//
//  CellDefaultView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/21.
//

import UIKit
import SnapKit

class CellDefaultView: BaseView {
    
    let emoticonImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.tintColor = .black
        return view
    }()
    
    let sidebar: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.layer.cornerRadius = 1
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.BaseFont.DiaryList.date
        view.textColor = #colorLiteral(red: 0.1907216495, green: 0.1907216495, blue: 0.1907216495, alpha: 1)
        return view
    }()
    
    let eDateLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.BaseFont.DiaryList.eDate
        view.textColor = #colorLiteral(red: 0.1907216495, green: 0.1907216495, blue: 0.1907216495, alpha: 1)
        return view
    }()
    
    lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [dateLabel, eDateLabel])
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 4
        return view
    }()
    
    let yearLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.BaseFont.DiaryList.year
        view.layer.opacity = 0.5
        view.textColor = #colorLiteral(red: 0.1907216495, green: 0.1907216495, blue: 0.1907216495, alpha: 1)
        return view
    }()
    
    override func configureUI() {
        [emoticonImageView, sidebar, verticalStackView, yearLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        yearLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self).inset(20)
            make.centerY.equalTo(self)
        }
        
        emoticonImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.top.leading.bottom.equalTo(self).inset(8)
            make.width.equalTo(emoticonImageView.snp.height)
        }
        
        sidebar.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.centerY.equalTo(self)
            make.leading.equalTo(emoticonImageView.snp.trailing).offset(8)
            make.height.equalTo(verticalStackView)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(sidebar.snp.trailing).offset(8)
        }
    }
}
