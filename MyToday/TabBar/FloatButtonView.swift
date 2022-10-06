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
        var filled = UIButton.Configuration.filled()
        filled.title = "today".localized
        filled.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        filled.attributedTitle?.font = Constants.BaseFont.Tapbar.float
        filled.baseBackgroundColor = .systemOrange
        let view = UIButton(configuration: filled, primaryAction: nil)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let yesterdayButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.title = "yesterday".localized
        filled.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        filled.attributedTitle?.font = Constants.BaseFont.Tapbar.float
        filled.baseBackgroundColor = .systemBlue
        let view = UIButton(configuration: filled, primaryAction: nil)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let otherdayButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.title = "otherday".localized
        filled.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        filled.attributedTitle?.font = Constants.BaseFont.Tapbar.float
        filled.baseBackgroundColor = .systemGreen
        let view = UIButton(configuration: filled, primaryAction: nil)
        view.layer.cornerRadius = 20
        return view
    }()
    
    let cancelButton: UIButton = {
        var filled = UIButton.Configuration.filled()
        filled.title = "cancel".localized
        filled.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        filled.attributedTitle?.font = Constants.BaseFont.Tapbar.float
        filled.baseBackgroundColor = .systemPink
        let view = UIButton(configuration: filled, primaryAction: nil)
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [todayButton, yesterdayButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var horizontalStackView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [otherdayButton, cancelButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [horizontalStackView, horizontalStackView2])
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 12
        return view
    }()
    
    override func configureUI() {
        [verticalStackView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}
