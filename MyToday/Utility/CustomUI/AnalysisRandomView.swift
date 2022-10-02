//
//  AnalysisRandomView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/25.
//

import UIKit
import SnapKit

class AnalysisRandomView: BaseView {
    
    let randomLabel: UILabel = {
        let view = UILabel()
        view.text = "랜덤사진"
        view.font = Constants.BaseFont.Analysis.label
        view.textColor = .white
        view.layer.opacity = 0.3
        return view
    }()
    
    let randomImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = Constants.BaseImage.background
        return view
    }()
    
    let button: UIButton = {
        let view = UIButton()
        return view
    }()
    
    override func configureUI() {
        [randomImageView, button, randomLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        randomImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        button.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        randomLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
    }
}
