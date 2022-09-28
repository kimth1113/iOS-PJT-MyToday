//
//  CellDefaultView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/21.
//

import UIKit
import SnapKit

class CellDefaultView: BaseView {
    
    let yearLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.BaseFont.DiaryList.year
        view.layer.opacity = 0.5
        view.textColor = #colorLiteral(red: 0.1907216495, green: 0.1907216495, blue: 0.1907216495, alpha: 1)
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
    
    let emoticonImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.tintColor = .black
        return view
    }()
    
    override func configureUI() {
        [yearLabel, dateLabel, eDateLabel, emoticonImageView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        self.snp.makeConstraints { make in
            make.bottom.equalTo(emoticonImageView.snp.bottom).offset(8)
        }
        
        yearLabel.snp.makeConstraints { make in
            make.top.trailing.equalTo(self).inset(4)
        }
        
        emoticonImageView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.top)
            make.bottom.equalTo(eDateLabel.snp.bottom)
            make.width.height.equalTo(40)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(8)
            make.leading.equalTo(emoticonImageView.snp.trailing).offset(16)
        }
        
        eDateLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(4)
            make.leading.equalTo(dateLabel)
        }
    }
}
