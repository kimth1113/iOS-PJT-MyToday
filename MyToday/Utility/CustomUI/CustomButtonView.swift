//
//  DismissButton.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/13.
//

import UIKit
import SnapKit

class CustomButtonView: BaseView {
    
    let customImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let customButton: UIButton = {
        let view = UIButton()
        
        return view
    }()
    
    let emoticonImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func configureUI() {
        addSubview(customButton)
        addSubview(customImageView)
        addSubview(emoticonImageView)
    }
    
    override func setConstraint() {
        customImageView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        customButton.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        emoticonImageView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(12)
        }
    }
}
