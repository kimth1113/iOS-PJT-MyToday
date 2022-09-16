//
//  UpdateViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/12.
//

import UIKit
import SnapKit
import YPImagePicker

class UpdateViewController: BaseViewController {
    
    // 화면구성
    private let headerView = UpdateHeaderView()
    private let scrollView = UIScrollView()
    private let contentView = UpdateView()
    
    private let repository = DiaryRepository()
    var diary: Diary?
    
    lazy var emoticonButtonViewList = [
        contentView.selectEmoticonView.emoticonButtonView,
        contentView.selectEmoticonView.emoticonButtonView2,
        contentView.selectEmoticonView.emoticonButtonView3,
        contentView.selectEmoticonView.emoticonButtonView4,
        contentView.selectEmoticonView.emoticonButtonView5,
        contentView.selectEmoticonView.emoticonButtonView6,
        contentView.selectEmoticonView.emoticonButtonView7,
        contentView.selectEmoticonView.emoticonButtonView8,
        contentView.selectEmoticonView.emoticonButtonView9
    ]
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = headerView
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.backgroundColor = .systemYellow

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(headerView.noteBackgroundView.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide)
            make.height.greaterThanOrEqualTo(view.snp.height).priority(.low)
            make.width.equalTo(scrollView.snp.width)
        }

        picker.delegate = self
        
        if diary == nil {
            diary = Diary(objectId: "2022-09-08", emotionId: 0, content: nil)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        contentView.writeDiaryView.textView.delegate = self
        
    }
    
    override func configure() {
        setButton()
//        setTapGesture()
        
        contentView.selectImageView.customButton.addTarget(self, action: #selector(photoLibraryButtonClicked), for: .touchUpInside)
        contentView.writeDiaryView.textLabelButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
    }
}

extension UpdateViewController {

    @objc
    private func dismissButtonTapped(_ sender: UIButton) {
        print(123)
        dismiss(animated: true)
    }
    
    @objc
    private func saveButtonTapped(_ sender: UIButton) {
        print("저장 버튼 탭")
        
        guard let diary = diary else { return }
        
        if diary.emoticonId == 0 {
            print("이모티콘 선택 바람")
            return
        }
        
        if let image = contentView.selectImageView.customImageView.image {
            saveImageToDocument(fileName: "\(diary.objectId)", image: image)
        } else { }
        
        repository.create(diary: diary)
        dismiss(animated: true)
    }

    // 버튼등록
    private func setButton() {
        // 취소버튼
        headerView.dismissView.customButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        headerView.saveView.customButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        // 이모티콘 버튼
        for i in 0 ..< emoticonButtonViewList.count {
            emoticonButtonViewList[i].customButton.addTarget(self, action: #selector(emoticonButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc
    private func emoticonButtonTapped(_ sender: UIButton) {
        
        diary?.emoticonId = sender.tag
        
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
            self.emoticonButtonViewList[sender.tag - 1].customImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { _ in
            
        }
    }

    @objc
    func photoLibraryButtonClicked(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("사용불가 + 사용자에게 토스트/얼럿")
            return
        }
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        
        present(picker, animated: true)
    }
}

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


extension UpdateViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            contentView.selectImageView.customImageView.image = image
            
            dismiss(animated: true)
        }
    }
}
