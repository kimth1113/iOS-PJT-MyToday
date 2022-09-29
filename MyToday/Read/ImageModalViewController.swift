//
//  ImageModalViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/27.
//

import UIKit
import SnapKit

class ImageModalViewContoller: UIViewController {
    
    let saveButton: UIButton = {
        let view = UIButton()
        view.setTitle("저장", for: .normal)
        return view
    }()
    
    let cancelButton: UIButton = {
        let view = UIButton()
        view.setTitle("취소", for: .normal)
        return view
    }()
    
    let albumButton: UIButton = {
        let view = UIButton()
        view.setTitle("앨범", for: .normal)
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.borderWidth = 4
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    let picker = UIImagePickerController()
    
    var bindingImage: ((UIImage) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        [saveButton, cancelButton, albumButton, imageView].forEach {
            view.addSubview($0)
        }
        
        saveButton.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(16)
            make.top.equalTo(view).offset(12)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalTo(saveButton.snp.trailing).offset(16)
            make.top.equalTo(view).offset(12)
        }
        
        albumButton.snp.makeConstraints { make in
            make.trailing.equalTo(view).inset(16)
            make.top.equalTo(view).offset(12)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(saveButton.snp.bottom).offset(12)
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }

        picker.delegate = self
        
        if let sheet = sheetPresentationController {
            
            sheet.detents = [.large()]
            sheet.selectedDetentIdentifier = .large
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
        }
        
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        albumButton.addTarget(self, action: #selector(albumButtonTapped), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func saveButtonTapped(_ sender: UIButton) {
        guard let bindingImage = bindingImage else { return }
        bindingImage(imageView.image!)
        dismiss(animated: true)
    }
    
    @objc
    private func albumButtonTapped(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
//            print("사용불가 + 사용자에게 토스트/얼럿")
            return
        }
        
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        
        present(picker, animated: true)
    }
    
    @objc
    private func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension ImageModalViewContoller: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            imageView.image = image
            
            dismiss(animated: true)
        }
    }
}
