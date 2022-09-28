//
//  FloatButtonView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/27.
//

import UIKit
import SnapKit

class FloatButtonView: BaseView {
    
    let todayButton: UIButton = {
        let view = UIButton()
        view.setTitle("오늘", for: .normal)
        view.backgroundColor = .white
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 8
        return view
    }()
    
    let yesterdayButton: UIButton = {
        let view = UIButton()
        view.setTitle("어제", for: .normal)
        view.backgroundColor = .white
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 8
        return view
    }()
    
    let otherdayButton: UIButton = {
        let view = UIButton()
        view.setTitle("다른날", for: .normal)
        view.backgroundColor = .white
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 8
        return view
    }()
    
    let cancelButton: UIButton = {
        let view = UIButton()
        view.setTitle("취소", for: .normal)
        view.backgroundColor = .white
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [todayButton, yesterdayButton, otherdayButton, cancelButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 12
        return view
    }()
    
    override func configureUI() {
        [horizontalStackView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        horizontalStackView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
