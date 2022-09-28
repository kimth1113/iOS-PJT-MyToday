//
//  DefualtCell.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/21.
//

import UIKit
import SnapKit

class DefaultCell: BaseTableViewCell {
    
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
    
    override func configureUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(cellBackgroundView)
        addSubview(cellDefaultView)
    }
    
    override func setConstraint() {
        
        cellBackgroundView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
        
        cellDefaultView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(cellBackgroundView).inset(8)
        }
    }
}

