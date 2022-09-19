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
    private let headerView = DiaryHeaderView()
    private let scrollView = UIScrollView()
    private let contentView = UpdateView()
    
    private let repository = DiaryRepository()
    var diary: Diary?
    var newEmoticonId: Int?
    var newContent: String?
    
    var reloadCalendar: (() -> Void)?
    
    lazy var saveContentText: (String?) -> Void = { text in
        
        if let content = text {
            self.contentView.contentView.textLabelView.text = text
            self.newContent = text
        } else {
            self.contentView.contentView.textLabelView.text = "언젠가 잊혀질 소중했던 순간을 기록하세요."
            self.newContent = nil
        }
    }
    
    lazy var emoticonButtonViewList = [
        contentView.emoticonView.emoticonButtonView,
        contentView.emoticonView.emoticonButtonView2,
        contentView.emoticonView.emoticonButtonView3,
        contentView.emoticonView.emoticonButtonView4,
        contentView.emoticonView.emoticonButtonView5,
        contentView.emoticonView.emoticonButtonView6,
        contentView.emoticonView.emoticonButtonView7,
        contentView.emoticonView.emoticonButtonView8,
        contentView.emoticonView.emoticonButtonView9
    ]
    
    let picker = UIImagePickerController()
    
    override func loadView() {
        super.loadView()
        
        view = headerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(diary)
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first)
        
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

        picker.delegate = self
        
        newEmoticonId = diary?.emoticonId
        newContent = diary?.content
        if let diary = diary {
            contentView.imageView.customImageView.image = loadImageFromDocument(fileName: diary.objectId)
            
            if let content = diary.content {
                contentView.contentView.textLabelView.text = content
            } else {
                contentView.contentView.textLabelView.text = "언젠가 잊혀질 소중했던 순간을 기록하세요."
            }
        }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        contentView.writeDiaryView.textView.delegate = self
        
        if let diary = diary {
            if diary.emoticonId != 0 {
                print("appear")
                UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
                    self.emoticonButtonViewList[diary.emoticonId-1].customImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                } completion: { _ in
                    
                }
            }
        }
    }
    
    override func configure() {
        setButton()
//        setTapGesture()
        
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
        
        if newEmoticonId == 0 {
            print("이모티콘 선택 바람")
            return
        }
        
        // 이미지가 있으면 저장 (기존 이미지 저장되있을 경우 분기처리하기)
        if let image = contentView.imageView.customImageView.image {
            saveImageToDocument(fileName: "\(diary.objectId)", image: image)
        } else { }
        
        
        repository.create(diary: diary)
        
        // 생성 및 수정 시점 : 기존 EmoticonId -> newEmoticonId 바꾸기
        if let newEmoticonId = newEmoticonId {
            repository.updateEmoticonId(diary: diary, newEmoticonId: newEmoticonId, newContent: newContent)
        }
        
        
        reloadCalendar!()
        dismiss(animated: true)
    }

    // 버튼등록
    private func setButton() {
        // 취소버튼
        headerView.cancelButtonView.customButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        headerView.updateButtonView.customButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        // 이모티콘 버튼
        for i in 0 ..< emoticonButtonViewList.count {
            emoticonButtonViewList[i].customButton.addTarget(self, action: #selector(emoticonButtonTapped), for: .touchUpInside)
        }
        // 이미지 선택 버튼
        contentView.imageView.customButton.addTarget(self, action: #selector(photoLibraryButtonTapped), for: .touchUpInside)
        // 텍스트뷰 버튼
        contentView.contentView.textLabelButton.addTarget(self, action: #selector(textViewButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func emoticonButtonTapped(_ sender: UIButton) {
        newEmoticonId = sender.tag
        
        for i in 1...9 {
            if i == sender.tag {
                UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.repeat, .autoreverse]) {
                    self.emoticonButtonViewList[i-1].customImageView.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                } completion: { _ in
                    
                }
            } else {
                UIView.animateKeyframes(withDuration: 0, delay: 0, options: []) {
                    self.emoticonButtonViewList[i-1].customImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                } completion: { _ in
                    
                }
            }
        }
    }

    @objc
    func photoLibraryButtonTapped(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
            print("사용불가 + 사용자에게 토스트/얼럿")
            return
        }
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        
        present(picker, animated: true)
    }
    
    @objc
    func textViewButtonTapped(_ sender: UIButton) {
        let vc = ContentViewController()
        vc.content = newContent
        vc.saveContentText = saveContentText
        transition(vc, transitionStyle: .present)
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
            contentView.imageView.customImageView.image = image
            
            dismiss(animated: true)
        }
    }
}
