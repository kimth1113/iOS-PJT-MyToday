//
//  UpdateViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/12.
//

import UIKit
import SnapKit

class UpdateViewController: BaseViewController {
    
    let scrollView = UIScrollView()
    let contentView = UpdateView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = .black
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            make.width.equalTo(scrollView.snp.width)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        contentView.writeDiaryView.textView.delegate = self
    }
    
    override func configure() {
//        setEmoticonButton()
//        setTapGesture()
        
//        mainView.dismissView.customButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }
}

//extension UpdateViewController {
//
//    @objc
//    private func dismissButtonTapped(_ sender: UIButton) {
//        dismiss(animated: true)
//    }
//
//    @objc
//    private func emoticonButtonTapped(_ sender: UIButton) {
//
//        switch sender.tag {
//        case 1:
//            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
//                self.mainView.selectEmoticonView.emoticonButtonView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            } completion: { _ in
//            }
//        case 2:
//            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
//                self.mainView.selectEmoticonView.emoticonButtonView2.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            } completion: { _ in
//            }
//        case 3:
//            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
//                self.mainView.selectEmoticonView.emoticonButtonView3.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            } completion: { _ in
//            }
//        case 4:
//            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
//                self.mainView.selectEmoticonView.emoticonButtonView5.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            } completion: { _ in
//            }
//        case 5:
//            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
//                self.mainView.selectEmoticonView.emoticonButtonView5.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            } completion: { _ in
//            }
//        case 6:
//            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
//                self.mainView.selectEmoticonView.emoticonButtonView5.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            } completion: { _ in
//            }
//        case 7:
//            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
//                self.mainView.selectEmoticonView.emoticonButtonView5.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            } completion: { _ in
//            }
//        case 8:
//            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
//                self.mainView.selectEmoticonView.emoticonButtonView5.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            } completion: { _ in
//            }
//        case 9:
//            UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
//                self.mainView.selectEmoticonView.emoticonButtonView5.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
//            } completion: { _ in
//            }
//        default:
//            break
//        }
//    }
//
//    private func setEmoticonButton() {
//
//        let emoticonButtonList = [
//            mainView.selectEmoticonView.emoticonButtonView.customButton,
//            mainView.selectEmoticonView.emoticonButtonView2.customButton,
//            mainView.selectEmoticonView.emoticonButtonView3.customButton,
//            mainView.selectEmoticonView.emoticonButtonView4.customButton,
//            mainView.selectEmoticonView.emoticonButtonView5.customButton,
//            mainView.selectEmoticonView.emoticonButtonView6.customButton,
//            mainView.selectEmoticonView.emoticonButtonView7.customButton,
//            mainView.selectEmoticonView.emoticonButtonView8.customButton,
//            mainView.selectEmoticonView.emoticonButtonView9.customButton
//        ]
//
//        for btn in emoticonButtonList {
//            btn.addTarget(self, action: #selector(emoticonButtonTapped), for: .touchUpInside)
//        }
//    }
//}

//extension UpdateViewController: UITextViewDelegate {
//
//    func textViewDidChange(_ textView: UITextView) {
//
//        let size = CGSize(width: view.frame.width, height: .infinity)
//        let estimatedSize = textView.sizeThatFits(size)
//
//        textView.constraints.forEach { (constraint) in
//
//          /// 180 이하일때는 더 이상 줄어들지 않게하기
//            if estimatedSize.height <= 180 {
//
//            }
//            else {
//                if constraint.firstAttribute == .height {
//                    constraint.constant = estimatedSize.height
//                }
//                print(constraint.firstAttribute)
//            }
//        }
//    }
//}
//
//extension UpdateViewController: UIGestureRecognizerDelegate {
//
//    private func setTapGesture() {
//        let tapTerm = UITapGestureRecognizer(target: self, action: nil)
//        tapTerm.delegate = self
//        mainView.writeDiaryView.textView.addGestureRecognizer(tapTerm)
//    }
//
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        view.endEditing(true)
//        return true
//    }
//}
