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
        view.setTitleColor(.systemBlue, for: .normal)
        return view
    }()
    
    let cancelButton: UIButton = {
        let view = UIButton()
        view.setTitle("취소", for: .normal)
        view.setTitleColor(.systemBlue, for: .normal)
        return view
    }()
    
    let albumButton: UIButton = {
        let view = UIButton()
        view.setTitle("앨범", for: .normal)
        view.setTitleColor(.systemBlue, for: .normal)
        return view
    }()
    
    let deleteButton: UIButton = {
        let view = UIButton()
        view.setTitle("삭제", for: .normal)
        view.setTitleColor(.systemRed, for: .normal)
        return view
    }()
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .black
        return view
    }()
    
    let picker = UIImagePickerController()
    
    var bindingImage: ((UIImage) -> Void)?
    var objectId: String?
    var ReadVC: ReadViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [saveButton, deleteButton, cancelButton, albumButton, imageView].forEach {
            view.addSubview($0)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(16)
            make.top.equalTo(view).offset(12)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.leading.equalTo(cancelButton.snp.trailing).offset(16)
            make.top.equalTo(view).offset(12)
        }
        
        saveButton.snp.makeConstraints { make in
            make.trailing.equalTo(view).inset(16)
            make.top.equalTo(view).offset(12)
        }
        
        albumButton.snp.makeConstraints { make in
            make.trailing.equalTo(saveButton.snp.leading).offset(-16)
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
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
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
    private func deleteButtonTapped(_ sender: UIButton) {
        ReadVC?.mainView.imageView.customImageView.image = nil
        removeImageFromDocument(fileName: objectId!)
        dismiss(animated: true)
    }
    
    @objc
    private func albumButtonTapped(_ sender: UIButton) {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
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
