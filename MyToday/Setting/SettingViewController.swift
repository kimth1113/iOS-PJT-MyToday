//
//  SettingViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/10/03.
//

import UIKit
import MessageUI
import AcknowList

class SettingViewController: BaseViewController {
    
    let mainView = SettingView()
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setButton()
    }
    
    override func configure() {
        
    }
}

extension SettingViewController: MFMailComposeViewControllerDelegate {
    func setButton() {
        mainView.reviewButtonView.customButton.addTarget(self, action: #selector(reviewButtonTapped), for: .touchUpInside)
        mainView.openInfoButtonView.customButton.addTarget(self, action: #selector(openInfoButtonTapped), for: .touchUpInside)
        mainView.mailButtonView.customButton.addTarget(self, action: #selector(mailButtonTapped), for: .touchUpInside)
    }

    @objc
    func reviewButtonTapped(_sender: UIButton) {
        if let reviewURL = URL(string: "itms-apps://itunes.apple.com/app/itunes-u/id\(6443586907)?ls=1&mt=8&action=write-review"), UIApplication.shared.canOpenURL(reviewURL) {
            UIApplication.shared.open(reviewURL, options: [:], completionHandler: nil)
        }
    }
                                                  
    @objc
    func openInfoButtonTapped(_sender: UIButton) {

        guard let url = Bundle.main.url(forResource: "Package", withExtension: "resolved"),
              let data = try? Data(contentsOf: url),
              let acknowList = try? AcknowPackageDecoder().decode(from: data) else {
            return
        }
        
        let vc = AcknowListViewController()
        vc.acknowledgements = acknowList.acknowledgements
        let nav = UINavigationController(rootViewController: vc)
        transition(nav, transitionStyle: .present)
    }
                                               
    @objc
    func mailButtonTapped(_sender: UIButton) {
                                                               
        // 기기에 사용자의 메일 계정이 등록되어 있는지
        if MFMailComposeViewController.canSendMail() {
            
            let mail = MFMailComposeViewController()
            mail.setToRecipients(["kimth1113@gmail.com"])
            mail.setSubject("setting_mail_subject".localized)
            mail.mailComposeDelegate = self
            
            self.present(mail, animated: true)
        } else {
            let alert = UIAlertController(title: nil, message: "alert_nomail".localized, preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok".localized, style: .default) { _ in
                self.dismiss(animated: true)
            }
            alert.addAction(ok)
            present(alert, animated: true)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result {
        case .cancelled:
            print("Cancel")
        case .saved:
            print("Saved")
        case .sent:
            print("Send")
        case .failed:
            print("Failed")
        }
        controller.dismiss(animated: true)
    }
}
