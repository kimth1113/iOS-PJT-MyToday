//
//  SettingView.swift
//  MyToday
//
//  Created by 김태현 on 2022/10/03.
//

import UIKit
import SnapKit

class SettingView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.Analysis.background
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func configureUI() {
        [backgroundImage].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
