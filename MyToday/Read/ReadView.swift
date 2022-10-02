//
//  ReadView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/18.
//

import UIKit
import SnapKit

class ReadView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.scrollBackground
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let subBackground: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.topBackground
        view.contentMode = .scaleToFill
        view.layer.opacity = 0.5
        return view
    }()
    
    let backButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.left.square.fill"), for: .normal)
        view.tintColor = .black
        view.layer.opacity = 0.8
        view.setPreferredSymbolConfiguration(.init(pointSize: 36), forImageIn: .normal)
        return view
    }()
    
    let trashButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "trash.square.fill"), for: .normal)
        view.tintColor = .systemPink
        view.layer.opacity = 0.9
        view.setPreferredSymbolConfiguration(.init(pointSize: 36), forImageIn: .normal)
        return view
    }()
    
    let saveButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        view.tintColor = .systemGreen
        view.setPreferredSymbolConfiguration(.init(pointSize: 36), forImageIn: .normal)
        return view
    }()
    
    let topline: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.layer.cornerRadius = 1
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.date
        view.numberOfLines = 2
        view.textAlignment = .center
//        view.layer.opacity = 0.5
        view.sizeToFit()
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return view
    }()
    
    let underline: UIView = {
        let view = UIView()
        view.backgroundColor = .black
//        view.layer.opacity = 0.5
        view.layer.cornerRadius = 2
        return view
    }()
    
    let emoticonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        view.layer.cornerRadius = 4
        view.customButton.setTitle("감정 선택[필수]", for: .normal)
        view.customButton.titleLabel?.font = Constants.BaseFont.Read.label
        view.customButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5), for: .normal)
        return view
    }()
    
    let registerEmoticonView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "faceid")
        view.tintColor = .black
        return view
    }()
    
    let imageView: CustomButtonView = {
        let view = CustomButtonView()
        view.layer.cornerRadius = 4
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        view.layer.masksToBounds = true
        view.customButton.setTitle("사진 등록", for: .normal)
        view.customButton.titleLabel?.font = Constants.BaseFont.Read.label
        view.customButton.setTitleColor(UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.5), for: .normal)
        return view
    }()
    
    let registerImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "photo.fill")
        view.tintColor = .black
        return view
    }()
    
    let contentBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.3)
        return view
    }()
    
    let contentView: UITextView = {
        let view = UITextView()
        view.font = Constants.BaseFont.Read.content
        view.backgroundColor = .clear
        view.text = "아직 일기를 작성하지 않았어요."
        view.textColor = .placeholderText
        return view
    }()
    
    override func configureUI() {
        [backgroundImage, subBackground, backButton, trashButton, saveButton, topline, dateLabel, underline, emoticonView, imageView, registerEmoticonView, registerImageView, contentBackgroundView, contentView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        subBackground.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.width.height.equalTo(40)
        }
        
        trashButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.trailing.equalTo(saveButton.snp.leading)
            make.width.height.equalTo(40)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.width.height.equalTo(40)
        }
        
        topline.snp.makeConstraints { make in
            make.top.equalTo(saveButton.snp.bottom).offset(8)
            make.leading.trailing.equalTo(self)
            make.height.equalTo(1)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(topline.snp.bottom).offset(16)
            make.leading.trailing.equalTo(underline)
        }
        
        underline.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(4)
            make.leading.equalTo(self).inset(20)
            make.width.equalTo(132)
            make.height.equalTo(4)
        }
        
        emoticonView.snp.makeConstraints { make in
            make.top.equalTo(underline.snp.bottom).offset(8)
            make.leading.trailing.equalTo(underline)
            make.height.equalTo(emoticonView.snp.width)
        }
        
        registerEmoticonView.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(emoticonView).inset(8)
            make.width.height.equalTo(28)
        }
            
        imageView.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.top)
            make.trailing.equalTo(self).inset(20)
            make.leading.equalTo(underline.snp.trailing).offset(12)
            make.bottom.equalTo(emoticonView.snp.bottom)
        }
        
        registerImageView.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView).inset(8)
            make.width.height.equalTo(28)
        }

        contentBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(emoticonView.snp.bottom).offset(12)
            make.leading.equalTo(emoticonView)
            make.trailing.equalTo(imageView)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(20)
        }

        contentView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentBackgroundView).inset(4)
            make.top.bottom.equalTo(contentBackgroundView)
        }
    }
}

