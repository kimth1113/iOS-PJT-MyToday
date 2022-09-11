//
//  TabBarViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/07.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {
    
    let addButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.add, for: UIControl.State.normal)
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var tabFrame = tabBar.frame
        let height = UIScreen.main.bounds.size.height
        
        switch height {
        case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
            tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            tabFrame.size.height = view.frame.size.width / 6
            tabFrame.origin.y = view.frame.size.height - view.frame.size.width / 6
            addButton.snp.makeConstraints { make in
                make.height.equalTo(88)
                make.width.equalTo(76)
                make.centerX.equalTo(view)
                make.bottom.equalTo(view)
            }
        case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
            tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            tabFrame.size.height = view.frame.size.width / 7
            tabFrame.origin.y = view.frame.size.height - view.frame.size.width / 7
            addButton.snp.makeConstraints { make in
                make.height.equalTo(92)
                make.width.equalTo(84)
                make.centerX.equalTo(view)
                make.bottom.equalTo(view)
            }
        case 812.0: //iphone 13 mini
            tabFrame.size.height = view.frame.size.width / 4
            tabFrame.origin.y = view.frame.size.height - view.frame.size.width / 4
            addButton.snp.makeConstraints { make in
                make.height.equalTo(120)
                make.width.equalTo(80)
                make.centerX.equalTo(view)
                make.bottom.equalTo(view)
            }
        case 896.0: //iphone 11
            tabFrame.size.height = view.frame.size.width / 4
            tabFrame.origin.y = view.frame.size.height - view.frame.size.width / 4
            addButton.snp.makeConstraints { make in
                make.height.equalTo(128)
                make.width.equalTo(84)
                make.centerX.equalTo(view)
                make.bottom.equalTo(view)
            }
        case 926.0: //iphone 13 Pro Max
            tabFrame.size.height = view.frame.size.width / 4
            tabFrame.origin.y = view.frame.size.height - view.frame.size.width / 4
            addButton.snp.makeConstraints { make in
                make.height.equalTo(136)
                make.width.equalTo(88)
                make.centerX.equalTo(view)
                make.bottom.equalTo(view)
            }
        default:
          print("not an iPhone")
          break
        }
        tabBar.frame = tabFrame
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // 순서별 탭 컨트롤러 UI
        let firstVC = tabBarNavigarionController(vc: CalendarViewController(), img: Constants.BaseImage.TapMenu.calendar, selectedImg: Constants.BaseImage.TapMenu.calendarFill)
        let secondVC = tabBarNavigarionController(vc: ViewController(), img: Constants.BaseImage.TapMenu.diaryList, selectedImg: Constants.BaseImage.TapMenu.diaryListFill)
        let thirdVC = tabBarNavigarionController(vc: ViewController(), img: nil, selectedImg: nil)
        let fourthVC = tabBarNavigarionController(vc: ViewController(), img: Constants.BaseImage.TapMenu.analysis, selectedImg: Constants.BaseImage.TapMenu.analysisFill)
        let fifthVC = tabBarNavigarionController(vc: ViewController(), img: Constants.BaseImage.TapMenu.setting, selectedImg: Constants.BaseImage.TapMenu.settingFill)
        
        
        
        let viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
        self.setViewControllers(viewControllers, animated: false)
    }
    
    private func configure() {
        view.addSubview(addButton)
        
        tabBar.backgroundColor = UIColor(named: "tabbar-background")
        tabBar.tintColor = UIColor.orange
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.isHidden = false
        hidesBottomBarWhenPushed = false
        tabBar.layer.cornerRadius = 16

        addButton.addTarget(self, action: #selector(addButtonAction(sender:)), for: .touchUpInside)
    }
}

extension TabBarViewController {
    
    private func tabBarNavigarionController<T: UIViewController>(vc: T, img: UIImage?, selectedImg: UIImage?) -> T {
//        let nc = UINavigationController()
//        nc.addChild(vc)
        
        vc.tabBarItem.image = img
        vc.tabBarItem.selectedImage = selectedImg
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: -4, left: -4, bottom: -4, right: -4)
        
        return vc
    }
    
    @objc func addButtonAction(sender: UIButton) {
//        self.selectedIndex = 2
        
        print("123")
    }
    
}
