//
//  TabBarViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/07.
//

import UIKit
import SnapKit
import FirebaseAnalytics

class TabBarViewController: UITabBarController {
    
    let repository = DiaryRepository()
    
    let CalendarVC = CalendarViewController()
    let DiaryListVC = DiaryListViewController()
    let AnalysisVC = AnalysisViewController()
    let SettingVC = SettingViewController()
    
    var otherday: Date = Date()
    
    lazy var moveToReadVC: ((ReadViewController, Diary) -> Void) = { vc, diary in
        vc.diary = diary
        vc.reloadCalendar = self.CalendarVC.reloadCalendar
        self.transition(vc, transitionStyle: .present)
    }
    
    let pencilButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.pencel, for: .normal)
        return view
    }()
    
    let floatButtonView: FloatButtonView = {
        let view = FloatButtonView()
        view.isHidden = true
        return view
    }()
    
    let datePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .date
        view.locale = Locale(identifier: "locale_identifier".localized)
        view.preferredDatePickerStyle = .wheels
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        view.isHidden = true
        view.maximumDate = Date()
        return view
    }()
    
    let dateSelectButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        view.isHidden = true
        view.tintColor = #colorLiteral(red: 0.1964718935, green: 0.7384423325, blue: 0, alpha: 1)
        view.setPreferredSymbolConfiguration(.init(pointSize: 28), forImageIn: .normal)
        return view
    }()
    
    let dateCancelButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "xmark.app.fill"), for: .normal)
        view.isHidden = true
        view.tintColor = .systemPink
        view.setPreferredSymbolConfiguration(.init(pointSize: 28), forImageIn: .normal)
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        
        DiaryListVC.moveToReadVC = moveToReadVC
        
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var tabFrame = tabBar.frame
        let height = UIScreen.main.bounds.size.height
        
//        print(height)
        // 기기별 탭바 UI 설정
        switch height {
        case 667.0: //iphone 6, 6s, 7, 8 => 4.7 inch
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 6.3, height: 88, width: 76)
        case 736.0: //iphone 6s+ 6+, 7+, 8+ => 5.5 inch
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 6.5, height: 92, width: 84)
        case 812.0: //iphone 13 mini
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 4, height: 120, width: 80)
        case 844.0: //iphone 14
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 4.2, height: 128, width: 84)
        case 852.0: //iphone 14 pro
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 4.2, height: 128, width: 84)
        case 896.0: //iphone 11
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 4.3, height: 128, width: 84)
        case 926.0: //iphone 13 Pro Max
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 4.3, height: 134, width: 88)
        case 932.0: //iphone 14 pro max
            tabFrame = configureTabBarUI(tabFrame: tabFrame, dy: 4.4, height: 134, width: 88)
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
        view.addSubview(floatButtonView)
        view.addSubview(datePicker)
        view.addSubview(dateSelectButton)
        view.addSubview(dateCancelButton)
        
        configureFloatButtonViewUI()
        configureDatePickerUI()
        
        tabBar.backgroundColor = #colorLiteral(red: 0.459092021, green: 0.6204947829, blue: 0.6681040525, alpha: 1)
        tabBar.tintColor = #colorLiteral(red: 0.9757557511, green: 0.2905896008, blue: 0.2755800486, alpha: 1)
        tabBar.unselectedItemTintColor = Constants.BaseColor.TabBar.unselectedItem
        tabBar.layer.cornerRadius = Constants.BaseDesign.tabBarRadius
        tabBar.isHidden = false
        hidesBottomBarWhenPushed = false
        
        pencilButton.addTarget(self, action: #selector(pencilButtonTapped), for: .touchUpInside)
        floatButtonView.todayButton.addTarget(self, action: #selector(todayButtonTapped), for: .touchUpInside)
        floatButtonView.yesterdayButton.addTarget(self, action: #selector(yesterdayButtonTapped), for: .touchUpInside)
        floatButtonView.otherdayButton.addTarget(self, action: #selector(otherdayButtonTapped), for: .touchUpInside)
        floatButtonView.cancelButton.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        dateSelectButton.addTarget(self, action: #selector(dateSelectButtonTapped), for: .touchUpInside)
        dateCancelButton.addTarget(self, action: #selector(dateCancelButtonTapped), for: .touchUpInside)
    }
    
    private func configureTabBar() {
        
        let firstVC = tabBarResultController(vc: CalendarVC, resultType: .vc, img: Constants.BaseImage.TapMenu.calendar, selectedImg: Constants.BaseImage.TapMenu.calendarFill)
        let secondVC = tabBarResultController(vc: DiaryListVC, resultType: .vc, img: Constants.BaseImage.TapMenu.diaryList, selectedImg: Constants.BaseImage.TapMenu.diaryListFill)
        let thirdVC = tabBarResultController(vc: ViewController(), resultType: .vc, img: nil, selectedImg: nil)
        let fourthVC = tabBarResultController(vc: AnalysisVC, resultType: .vc, img: Constants.BaseImage.TapMenu.analysis, selectedImg: Constants.BaseImage.TapMenu.analysisFill)
        let fifthVC = tabBarResultController(vc: SettingVC, resultType: .vc, img: Constants.BaseImage.TapMenu.setting, selectedImg: Constants.BaseImage.TapMenu.settingFill)
        
        let viewControllers = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
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
    
    private func configureFloatButtonViewUI() {
        floatButtonView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(pencilButton.snp.top).offset(-20)
        }
    }
    
    private func configureDatePickerUI() {
        datePicker.snp.makeConstraints { make in
            make.bottom.equalTo(pencilButton.snp.top).offset(-20)
            make.centerX.equalTo(view)
            make.height.equalTo(100)
        }
        
        dateCancelButton.snp.makeConstraints { make in
            make.trailing.equalTo(datePicker)
            make.bottom.equalTo(datePicker.snp.top).offset(-8)
            make.width.equalTo(32)
        }
        
        dateSelectButton.snp.makeConstraints { make in
            make.trailing.equalTo(dateCancelButton.snp.leading)
            make.bottom.equalTo(datePicker.snp.top).offset(-8)
            make.width.equalTo(32)
        }
    }

    @objc
    private func pencilButtonTapped(_ sender: UIButton) {
        
        datePicker.isHidden = true
        dateSelectButton.isHidden = true
        dateCancelButton.isHidden = true
        
        UIView.animate(withDuration: 0.8) {
            let rotate = CGAffineTransform(rotationAngle: .pi)
            self.pencilButton.transform = rotate
        } completion: { _ in
            let rotate = CGAffineTransform(rotationAngle: .zero)
            self.pencilButton.transform = rotate
    
            self.floatButtonView.isHidden = false
        }
    }
    
    @objc
    func todayButtonTapped(_ sender: UIButton) {
        
        let vc = ReadViewController()
        
        let date = FormatterRepository.formatter.string(from: Date())
        if let diary = self.repository.getDiary(date: date) {
            vc.diary = diary
            
            Analytics.logEvent("tap_pencel_float", parameters: [
                "날짜종류": "오늘",
                "날짜정보": "\(date)",
                "일기유무": "있음(수정)"
            ])
        } else {
            vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
            
            Analytics.logEvent("tap_pencel_float", parameters: [
                "날짜종류": "오늘",
                "날짜정보": "\(date)",
                "일기유무": "없음(신규)"
            ])
        }
        
        vc.reloadCalendar = CalendarVC.reloadCalendar
        vc.reloadDiaryList = DiaryListVC.reloadDiaryList
        vc.reloadAnalysis = AnalysisVC.reloadAnalysis
        
        floatButtonView.isHidden = true
        transition(vc, transitionStyle: .present)
    }
    
    @objc
    func yesterdayButtonTapped(_ sender: UIButton) {
        
        let vc = ReadViewController()
        
        guard let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date()) else { return }
        
        let date = FormatterRepository.formatter.string(from: yesterday)
        if let diary = self.repository.getDiary(date: date) {
            vc.diary = diary
            
            Analytics.logEvent("tap_pencel_float", parameters: [
                "날짜종류": "어제",
                "날짜정보": "\(date)",
                "일기유무": "있음(수정)"
            ])
        } else {
            vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
            
            Analytics.logEvent("tap_pencel_float", parameters: [
                "날짜종류": "어제",
                "날짜정보": "\(date)",
                "일기유무": "없음(신규)"
            ])
        }
        
        vc.reloadCalendar = CalendarVC.reloadCalendar
        vc.reloadDiaryList = DiaryListVC.reloadDiaryList
        vc.reloadAnalysis = AnalysisVC.reloadAnalysis
        
        floatButtonView.isHidden = true
        transition(vc, transitionStyle: .present)
    }
    
    @objc
    func otherdayButtonTapped(_ sender: UIButton) {
        floatButtonView.isHidden = true
        datePicker.isHidden = false
        dateSelectButton.isHidden = false
        dateCancelButton.isHidden = false
    }
    
    @objc
    func cancelButtonTapped(_ sender: UIButton) {
        floatButtonView.isHidden = true
    }
    
    @objc
    private func dateChanged() {
        otherday = datePicker.date
    }
    
    @objc
    private func dateSelectButtonTapped() {
        
        let vc = ReadViewController()
        
        let date = FormatterRepository.formatter.string(from: otherday)
        if let diary = self.repository.getDiary(date: date) {
            vc.diary = diary
            
            Analytics.logEvent("tap_pencel_float", parameters: [
                "날짜종류": "다른날",
                "날짜정보": "\(date)",
                "일기유무": "있음(수정)"
            ])
        } else {
            vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
            
            Analytics.logEvent("tap_pencel_float", parameters: [
                "날짜종류": "다른날",
                "날짜정보": "\(date)",
                "일기유무": "없음(신규)"
            ])
        }
        
        vc.reloadCalendar = CalendarVC.reloadCalendar
        vc.reloadDiaryList = DiaryListVC.reloadDiaryList
        vc.reloadAnalysis = AnalysisVC.reloadAnalysis
        
        floatButtonView.isHidden = true
        datePicker.isHidden = true
        dateSelectButton.isHidden = true
        dateCancelButton.isHidden = true
        transition(vc, transitionStyle: .present)
    }
    
    @objc
    private func dateCancelButtonTapped() {
        floatButtonView.isHidden = true
        datePicker.isHidden = true
        dateSelectButton.isHidden = true
        dateCancelButton.isHidden = true
    }
}

extension TabBarViewController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        floatButtonView.isHidden = true
        datePicker.isHidden = true
        dateSelectButton.isHidden = true
        dateCancelButton.isHidden = true
        
        CalendarVC.reloadCalendar()
        DiaryListVC.reloadDiaryList()
        AnalysisVC.reloadAnalysis()
    }
}
