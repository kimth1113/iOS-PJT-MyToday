//
//  ReadViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/18.
//

import UIKit
import IQKeyboardManagerSwift

class ReadViewController: BaseViewController {
    
    let mainView = ReadView()
    
    private let repository = DiaryRepository()
    
    var diary: Diary?
    
    var originalEmoticonId: Int?
    var newEmoticonId: Int?
    var newImage: UIImage?
    var newContent: String?
    
    let picker = UIImagePickerController()

    // 클로져 모음
    var reloadCalendar: (() -> Void)?
    var reloadDiaryList: (() -> Void)?
    var reloadAnalysis: (() -> Void)?
    lazy var bindingEmoticonImage: ((Int) -> Void) = { emoticonId in
        
        self.mainView.emoticonView.emoticonImageView.image = Constants.BaseImage.emotion2[emoticonId]
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: [.repeat, .autoreverse]) {
            
            self.mainView.emoticonView.emoticonImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        } completion: { _ in
            
        }
        self.newEmoticonId = emoticonId
    }
    lazy var bindingImage: ((UIImage) -> Void) = { image in
        self.mainView.imageView.customImageView.image = image
        self.newImage = image
    }
    
    
    lazy var bindingContent: ((String?) -> Void) = { content in
        self.mainView.contentView.text = content
    }
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton()
        
//        let tapTerm = UITapGestureRecognizer(target: self, action: nil)
//        tapTerm.delegate = self
//        mainView.contentView.addGestureRecognizer(tapTerm)

//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first)
    }
    
    override func configure() {
        picker.delegate = self
        mainView.contentView.delegate = self
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        bindingData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: [.repeat, .autoreverse]) {
            self.mainView.emoticonView.emoticonImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        } completion: { _ in
            
        }
        
    }
    
}

extension ReadViewController {
    
    private func bindingData() {
        // 화면초기 바인딩하는 시점
        guard let diary = diary else { return }
        
        // 날짜 라벨 표시
        guard let date = FormatterRepository.formatter.date(from: diary.objectId) else { return }
        mainView.dateLabel.text = FormatterRepository.dateLabelFormatter.string(from: date)
        // 이모티콘 바인딩
        mainView.emoticonView.emoticonImageView.image = Constants.BaseImage.emotion2[diary.emoticonId]
        originalEmoticonId = diary.emoticonId
        // 이미지 바인딩
        mainView.imageView.customImageView.image = loadImageFromDocument(fileName: diary.objectId)
        
        if let content = diary.content {
            mainView.contentView.text = content
            mainView.contentView.textColor = .black
        }
    }

    private func setButton() {
        mainView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        mainView.trashButton.addTarget(self, action: #selector(trashButtonTapped), for: .touchUpInside)
        mainView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        mainView.emoticonView.customButton.addTarget(self, action: #selector(emoticonChangeButtonTapped), for: .touchUpInside)
        mainView.imageView.customButton.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside)
    }
        
    @objc
    private func backButtonTapped(_ sender: UIButton) {
        
        // 아무것도 작성하지 않았을 때 (처음 들어온 경우)
        if originalEmoticonId == 0 && newEmoticonId == nil && newContent == nil && newImage == nil {
            let alert = UIAlertController(title: nil, message: "작성된 정보가 없으므로 해당 일기는 삭제됩니다.", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                self.dismiss(animated: true)
            }
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true)
            return
        }
        let alert = UIAlertController(title: nil, message: "정말 작성을 멈추고 나가시겠어요?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true)
        return
    }
    
    @objc
    private func trashButtonTapped(_ sender: UIButton) {
        
        guard let objectId = diary?.objectId else { return }
        
        let alert = UIAlertController(title: nil, message: "정말 일기를 삭제하시겠어요?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) { _ in
            
            if let diary = self.repository.getDiary(date: objectId) {
                
                self.removeImageFromDocument(fileName: diary.objectId)
                
                self.repository.delete(diary: self.repository.localRealm.object(ofType: Diary.self, forPrimaryKey: diary.objectId)!)
                
                if let reloadCalendar = self.reloadCalendar {
                    reloadCalendar()
                }
                if let reloadDiaryList = self.reloadDiaryList {
                    reloadDiaryList()
                }
                if let reloadAnalysis = self.reloadAnalysis {
                    reloadAnalysis()
                }
            }
            
            self.dismiss(animated: true)
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        present(alert, animated: true)
        return
    }
    
    @objc
    private func saveButtonTapped(_ sender: UIButton) {
        guard let diary = diary else { return }
        
        guard originalEmoticonId != 0 || newEmoticonId != nil else {
            let alert = UIAlertController(title: nil, message: "감정등록 버튼을 눌러 오늘의 감정을 선택해주세요.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "확인", style: .default)
            alert.addAction(ok)
            present(alert, animated: true)
            return
        }
        
        if newEmoticonId == nil && newContent == nil && newImage == nil {
            let alert = UIAlertController(title: nil, message: "수정된 내용이 없습니다.\n나가시겠습니까?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                self.dismiss(animated: true)
            }
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true)
            return
        }
        
        if let _ = repository.getDiary(date: diary.objectId) {
            // 기존에 있다면
            let alert = UIAlertController(title: nil, message: "수정하시겠습니까?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                self.repository.updateDiary(diary: diary, newEmoticonId: self.newEmoticonId ?? diary.emoticonId, newContent: self.newContent ?? diary.content)
                
                if let reloadCalendar = self.reloadCalendar {
                    reloadCalendar()
                }
                if let reloadDiaryList = self.reloadDiaryList {
                    reloadDiaryList()
                }
                if let reloadAnalysis = self.reloadAnalysis {
                    reloadAnalysis()
                }
                
                if let image = self.mainView.imageView.customImageView.image {
                    self.saveImageToDocument(fileName: diary.objectId, image: image)
                }

                self.dismiss(animated: true)
            }
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true)
        } else {
            // 기존에 없다면
            let alert = UIAlertController(title: nil, message: "저장하시겠습니까?", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "취소", style: .cancel)
            let ok = UIAlertAction(title: "확인", style: .default) { _ in
                self.repository.create(diary: Diary(objectId: diary.objectId, emotionId: self.newEmoticonId!, content: self.newContent))
                
                if let reloadCalendar = self.reloadCalendar {
                    reloadCalendar()
                }
                if let reloadDiaryList = self.reloadDiaryList {
                    reloadDiaryList()
                }
                if let reloadAnalysis = self.reloadAnalysis {
                    reloadAnalysis()
                }
                
                if let image = self.mainView.imageView.customImageView.image {
                    self.saveImageToDocument(fileName: diary.objectId, image: image)
                }

                self.dismiss(animated: true)
            }
            alert.addAction(cancel)
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    
    @objc
    func emoticonChangeButtonTapped(_ sender: UIButton) {
        
        let vc = EmoticonModalViewContoller()
        
        vc.bindingEmoticonImage = bindingEmoticonImage
        
        present(vc, animated: true)
    }
    
    @objc
    func imageButtonTapped(_ sender: UIButton) {
        
        // 이미지가 없다면
        if mainView.imageView.customImageView.image == nil {
            
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
//                print("사용불가 + 사용자에게 토스트/얼럿")
                return
            }
            
            picker.sourceType = .photoLibrary
            picker.allowsEditing = false
            
            present(picker, animated: true)
        } else {
            let vc = ImageModalViewContoller()
            
            vc.imageView.image = mainView.imageView.customImageView.image!
            vc.bindingImage = bindingImage
            vc.objectId = diary?.objectId
            vc.ReadVC = self
            
            present(vc, animated: true)
        }
    }
}

extension ReadViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        mainView.imageView.customImageView.image = image
        newImage = image
        
        dismiss(animated: true)
    }
}

extension ReadViewController: UITextViewDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        view.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        newContent = textView.text
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .placeholderText else { return }
        textView.textColor = .black
        textView.text = nil
    }
        
    func textViewDidEndEditing(_ textView: UITextView) {
        
        let text = textView.text.trimmingCharacters(in: ["\n"])
        
        if textView.text.isEmpty || text.trimmingCharacters(in: .whitespaces) == "" {
            textView.text = "아직 일기를 작성하지 않았어요."
            textView.textColor = .placeholderText
        }
    }
}

//extension ReadViewController: UIGestureRecognizerDelegate {
//
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        view.endEditing(true)
//
//        return true
//    }
//}
