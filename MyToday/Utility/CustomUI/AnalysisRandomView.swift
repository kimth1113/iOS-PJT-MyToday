//
//  AnalysisRandomView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/25.
//

import UIKit
import SnapKit

class AnalysisRandomView: BaseView {
    
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
        [randomImageView, button].forEach {
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
    }
}
