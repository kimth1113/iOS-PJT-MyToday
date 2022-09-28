//
//  EmoticonModalViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/27.
//

import UIKit
import SnapKit

class EmoticonModalViewContoller: UIViewController {
    
    let emoticonListView: EmotionListView = {
        let view = EmotionListView()
        return view
    }()
    
    var bindingEmoticonImage: ((Int) -> Void)?
    
    lazy var emoticonButtonViewList = [
        emoticonListView.emoticonButtonView,
        emoticonListView.emoticonButtonView2,
        emoticonListView.emoticonButtonView3,
        emoticonListView.emoticonButtonView4,
        emoticonListView.emoticonButtonView5,
        emoticonListView.emoticonButtonView6,
        emoticonListView.emoticonButtonView7,
        emoticonListView.emoticonButtonView8,
        emoticonListView.emoticonButtonView9
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        view.addSubview(emoticonListView)
        
        emoticonListView.snp.makeConstraints { make in
            make.edges.equalTo(view).inset(20)
        }

        if let sheet = sheetPresentationController {
            
            sheet.detents = [.medium()]
            sheet.selectedDetentIdentifier = .medium
            sheet.largestUndimmedDetentIdentifier = .medium
            /// sheet로 present된 viewController내부를 scroll하면 sheet가 움직이지 않고 내부 컨텐츠를 스크롤되도록 설정
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            /// grabber바 보이도록 설정
            sheet.prefersGrabberVisible = true
            /// corner 값 설정
    //      sheet.preferredCornerRadius = 32.0
        }
        
        setButton()
    }
    
    // 버튼등록
    private func setButton() {
        // 이모티콘 버튼
        for i in 0 ..< emoticonButtonViewList.count {
            emoticonButtonViewList[i].customButton.addTarget(self, action: #selector(emoticonButtonTapped), for: .touchUpInside)
        }
    }

    @objc
    private func emoticonButtonTapped(_ sender: UIButton) {
        
        guard let bindingEmoticonImage = bindingEmoticonImage else { return }
        
        for i in 1...9 {
            if i == sender.tag {
                bindingEmoticonImage(i)
            }
        }
        dismiss(animated: true)
    }
}
