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
    
    var diary: Diary?
    
    var reloadCalendar: (() -> Void)?
    
    lazy var updateReadVC: ((Diary) -> ()) = { diary in
        self.diary = diary
        
        self.contentView.emoticonView.customImageView.image = Constants.BaseImage.emotion[diary.emoticonId]
        
        self.contentView.imageView.customImageView.image = self.loadImageFromDocument(fileName: diary.objectId)
        if let content = diary.content {
            self.contentView.contentView.text = content
        } else {
            self.contentView.contentView.text = "일기 미작성"
        }
    }
    
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
            contentView.emoticonView.customImageView.image = Constants.BaseImage.emotion[diary.emoticonId]
            
            if let date = FormatterRepository.formatter.date(from: diary.objectId) {
                print(date, 12345)
                contentView.dateLabel.text = "DATE : " + FormatterRepository.dateLabelFormatter.string(from: date)
            }
            
            contentView.imageView.customImageView.image = loadImageFromDocument(fileName: diary.objectId)
            if let content = diary.content {
                contentView.contentView.text = content
            } else {
                contentView.contentView.text = "일기 미작성"
            }
        }
        
        for family in UIFont.familyNames {
            print("=====\(family)====")

            for name in UIFont.fontNames(forFamilyName: family) {
                print(name)
            }
        }
        
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
        if let reloadCalendar = reloadCalendar {
            reloadCalendar()
        }
        dismiss(animated: true)
    }
    
    @objc
    private func updateButtonTapped() {
        
        let vc = UpdateViewController()
        vc.diary = diary
        vc.updateReadVC = updateReadVC
        
        transition(vc, transitionStyle: .present)
    }
}
