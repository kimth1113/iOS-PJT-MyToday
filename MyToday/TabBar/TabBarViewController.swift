//
//  TabBarViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/07.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {
    
    let repository = DiaryRepository()
    
    let pencilButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.pencel, for: .normal)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let CalendarVC = CalendarViewController()
    let DiaryListVC = DiaryListViewController()
    
    lazy var moveToWriteVC: ((UpdateViewController, Date) -> Void) = { vc, date in
        // 오늘 일기
        let date = FormatterRepository.formatter.string(from: date)
        if let diary = self.repository.getDiary(date: date) {
            vc.diary = diary
        } else {
            vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
        }

        UIView.animate(withDuration: 0.8) {
            let rotate = CGAffineTransform(rotationAngle: .pi)
            self.pencilButton.transform = rotate
        } completion: { _ in
            let rotate = CGAffineTransform(rotationAngle: .zero)
            self.pencilButton.transform = rotate

            vc.reloadCalendar = self.CalendarVC.reloadCalendar
            self.transition(vc, transitionStyle: .present)
        }
    }
    
    lazy var moveToReadVC: ((ReadViewController, Diary) -> Void) = { vc, diary in
        let vc = ReadViewController()
        vc.diary = diary
//        vc.reloadCalendar = reloadCalendar
        self.transition(vc, transitionStyle: .present)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DiaryListVC.moveToReadVC = moveToReadVC
        
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var tabFrame = tabBar.frame
        let height = UIScreen.main.bounds.size.height
        
        // 기기별 탭바 UI 설정
        switch height {
        case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 6.3, height: 88, width: 76)
        case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 6.5, height: 92, width: 84)
        case 812.0: //iphone 13 mini
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 4, height: 120, width: 80)
        case 896.0: //iphone 11
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 4.3, height: 128, width: 84)
        case 926.0: //iphone 13 Pro Max
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 4.3, height: 134, width: 88)
        default:
          print("not an iPhone")
          break
        }
        tabBar.frame = tabFrame
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureTabBar()
    }
    
}

extension TabBarViewController {
    
    private func configure() {
        view.addSubview(pencilButton)
        
        tabBar.backgroundColor = Constants.BaseColor.TabBar.background
        tabBar.tintColor = Constants.BaseColor.TabBar.item
        tabBar.unselectedItemTintColor = Constants.BaseColor.TabBar.unselectedItem
        tabBar.layer.cornerRadius = Constants.BaseDesign.tabBarRadius
        tabBar.isHidden = false
        hidesBottomBarWhenPushed = false
        
        pencilButton.addTarget(self, action: #selector(pencilButtonTapped), for: .touchUpInside)
    }
    
    private func configureTabBar() {
        
        let firstVC = tabBarResultController(vc: CalendarVC, resultType: .vc, img: Constants.BaseImage.TapMenu.calendar, selectedImg: Constants.BaseImage.TapMenu.calendarFill)
        let secondVC = tabBarResultController(vc: DiaryListVC, resultType: .vc, img: Constants.BaseImage.TapMenu.diaryList, selectedImg: Constants.BaseImage.TapMenu.diaryListFill)
        let thirdVC = tabBarResultController(vc: ViewController(), resultType: .vc, img: nil, selectedImg: nil)
        let fourthVC = tabBarResultController(vc: ReadViewController(), resultType: .vc, img: Constants.BaseImage.TapMenu.analysis, selectedImg: Constants.BaseImage.TapMenu.analysisFill)
        let fifthVC = tabBarResultController(vc: PencilAlertViewController(), resultType: .vc, img: Constants.BaseImage.TapMenu.setting, selectedImg: Constants.BaseImage.TapMenu.settingFill)
        
        let viewControllers = [secondVC, firstVC, thirdVC, fourthVC, fifthVC]
        setViewControllers(viewControllers, animated: false)
    }
    
    private func configureTabBarUI(tabFrame: CGRect, dy: CGFloat, height: UInt, width: UInt) -> CGRect {
        var tabFrame = tabFrame
        
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabFrame.size.height = view.frame.size.width / dy
        tabFrame.origin.y = view.frame.size.height - view.frame.size.width / dy
        pencilButton.snp.makeConstraints { make in
            make.height.equalTo(height)
            make.width.equalTo(width)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view)
        }
        
        return tabFrame
    }
    
    @objc
    private func pencilButtonTapped(_ sender: UIButton) {
        
        let vc = PencilAlertViewController()
        
        vc.moveToWriteVC = moveToWriteVC
        
        transition(vc, transitionStyle: .presentAlert)
        
        
//        let alert = UIAlertController(title: "일기 작성하기", message: nil, preferredStyle: .alert)
//        let cancel = UIAlertAction(title: "취소", style: .cancel)
//        let today = UIAlertAction(title: "오늘 일기 작성하기", style: .default) { _ in
//
//            let vc = UpdateViewController()
//
//            // 오늘 일기
//            let date = FormatterRepository.formatter.string(from: Date())
//            if let diary = self.repository.getDiary(date: date) {
//                vc.diary = diary
//            } else {
//                vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
//            }
//
//            UIView.animate(withDuration: 0.8) {
//                let rotate = CGAffineTransform(rotationAngle: .pi)
//                self.pencilButton.transform = rotate
//            } completion: { _ in
//                let rotate = CGAffineTransform(rotationAngle: .zero)
//                self.pencilButton.transform = rotate
//
//                vc.reloadCalendar = self.CalendarVC.reloadCalendar
//                self.transition(vc, transitionStyle: .present)
//            }
//        }
//        let otherDay = UIAlertAction(title: "특정날 일기 작성하기", style: .default) { _ in
//
//
//            UIView.animate(withDuration: 0.8) {
//                let rotate = CGAffineTransform(rotationAngle: .pi)
//                self.pencilButton.transform = rotate
//            } completion: { _ in
//                let rotate = CGAffineTransform(rotationAngle: .zero)
//                self.pencilButton.transform = rotate
//
////                self.transition(UpdateViewController(), transitionStyle: .present)
//            }
//        }
//        alert.addAction(cancel)
//        alert.addAction(today)
//        alert.addAction(otherDay)
//        self.present(alert, animated: true)
    }
    
}
