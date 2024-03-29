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
    
    override func configureUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(cellBackgroundView)
        addSubview(cellDefaultView)
    }
    
    override func setConstraint() {
        
        cellBackgroundView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(8)
            make.leading.trailing.equalTo(self).inset(16)
        }
        
        cellDefaultView.snp.makeConstraints { make in
            make.edges.equalTo(cellBackgroundView)
        }
    }
}

