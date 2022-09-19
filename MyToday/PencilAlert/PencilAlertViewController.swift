//
//  PencilAlertViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/18.
//

import UIKit

class PencilAlertViewController: BaseViewController {
    
    private let mainView = PencilAlertView()
    
    var moveToWriteVC: ((UpdateViewController, Date) -> Void)?
    
    var specialday: Date?
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setButton()
    }
    
    override func configure() {
        
        mainView.datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
}

extension PencilAlertViewController {
    
    private func setButton() {
        mainView.cancelButtonView.customButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        
        mainView.todayButtonView.customButton.addTarget(self, action: #selector(dayButtonTapped), for: .touchUpInside)
        mainView.yesterdayButtonView.customButton.addTarget(self, action: #selector(yesterdayButtonTapped), for: .touchUpInside)
        
        mainView.specialButtonView.customButton.addTarget(self, action: #selector(specialButtonTapped), for: .touchUpInside)
        
        mainView.doneButtonView.customButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    
    @objc
    private func cancelButtonTapped() {
        
        dismiss(animated: false)
    }
    
    @objc
    private func dayButtonTapped(_ sender: UIButton) {
        let vc = UpdateViewController()
        dismiss(animated: false)
        moveToWriteVC!(vc, Date())
    }
    
    @objc
    private func yesterdayButtonTapped(_ sender: UIButton) {
        guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else { return }
        let vc = UpdateViewController()
        dismiss(animated: false)
        moveToWriteVC!(vc, yesterday)
    }
    
    @objc
    private func specialButtonTapped() {
         
        specialday = Calendar.current.date(byAdding: .day, value: -2, to: Date())
        mainView.datePicker.isHidden = false
        mainView.doneButtonView.isHidden = false
        UIView.animate(withDuration: 2) {
            self.mainView.datePicker.layer.opacity = 1
            self.mainView.doneButtonView.layer.opacity = 1
        } completion: { _ in
            
        }
    }
    
    @objc
    private func dateChanged() {
        specialday = mainView.datePicker.date
    }
    
    @objc
    private func doneButtonTapped() {
        guard let specialday = specialday else { return }
        let vc = UpdateViewController()
        dismiss(animated: false)
        moveToWriteVC!(vc, specialday)
    }
}
