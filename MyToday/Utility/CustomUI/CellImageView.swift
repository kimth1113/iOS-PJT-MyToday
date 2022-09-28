//
//  CellImageView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/21.
//

import UIKit
import SnapKit

class CellImageView: BaseView {
    
    let diaryImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    
    override func configureUI() {
        addSubview(diaryImageView)
    }
    
    override func setConstraint() {
        diaryImageView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
    }
}
