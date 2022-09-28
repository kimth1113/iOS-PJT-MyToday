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
        view.backgroundColor = Constants.BaseColor.ListCell.background
        view.layer.cornerRadius = 8
        return view
    }()
    
    let cellDefaultView: CellDefaultView = {
        let view = CellDefaultView()
        return view
    }()
    
    let cellImageView: CellImageView = {
        let view = CellImageView()
        return view
    }()
    
    let cellContentView: CellContentView = {
        let view = CellContentView()
        return view
    }()
    
    override func configureUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(cellBackgroundView)
        addSubview(cellDefaultView)
        
        [cellImageView, cellContentView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        cellBackgroundView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
        
        cellDefaultView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(cellBackgroundView).inset(8)
        }
        
        cellImageView.snp.makeConstraints { make in
            make.top.equalTo(cellDefaultView.snp.bottom)
            make.leading.trailing.equalTo(cellBackgroundView).inset(8)
            make.height.equalTo(200)
        }
        
        cellContentView.snp.makeConstraints { make in
            make.top.equalTo(cellImageView.snp.bottom)
            make.leading.trailing.equalTo(cellBackgroundView).inset(8)
            make.height.equalTo(100)
        }
    }
}

