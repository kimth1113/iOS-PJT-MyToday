//
//  ReadViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/18.
//

import UIKit

class ReadViewController: BaseViewController {
    
    // 화면구성
    private let headerView = DiaryHeaderView()
    private let scrollView = UIScrollView()
    private let contentView = ReadView()
    
    let emotionImageList = [
        Constants.BaseImage.Emotion.happy,
        Constants.BaseImage.Emotion.angry,
        Constants.BaseImage.Emotion.disgusted,
        Constants.BaseImage.Emotion.fear,
        Constants.BaseImage.Emotion.kiss,
        Constants.BaseImage.Emotion.sad,
        Constants.BaseImage.Emotion.sadness,
        Constants.BaseImage.Emotion.sleeping,
        Constants.BaseImage.Emotion.surprised
    ]
    
    var diary: Diary?
    
    override func loadView() {
        super.loadView()
        
        view = headerView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.cancelButtonView.snp.bottom).offset(20)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            make.width.equalTo(scrollView.snp.width)
        }
        
        if let diary = diary {
            contentView.emoticonView.customImageView.image = emotionImageList[diary.emoticonId - 1]
            
            contentView.imageView.customImageView.image = loadImageFromDocument(fileName: diary.objectId)
            if let content = diary.content {
                contentView.contentView.text = content
            } else {
                contentView.contentView.text = "일기 미작성"
            }
        }
        
//        for family in UIFont.familyNames {
//            print("=====\(family)====")
//
//            for name in UIFont.fontNames(forFamilyName: family) {
//                print(name)
//            }
//        }
        
        setButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function, 111)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(#function, 222)
    }
    
    override func configure() {
        
    }
}

extension ReadViewController {
    
    private func setButton() {
        headerView.cancelButtonView.customButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        headerView.updateButtonView.customButton.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func cancelButtonTapped() {
        
        dismiss(animated: true)
    }
    
    @objc
    private func updateButtonTapped() {
        
        let vc = UpdateViewController()
        vc.diary = diary
        
        transition(vc, transitionStyle: .present)
    }
}
