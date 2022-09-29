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
    
    let CalendarVC = CalendarViewController()
    let DiaryListVC = DiaryListViewController()
    let AnalysisVC = AnalysisViewController()
    
    var otherday: Date = Date()
    
    lazy var moveToWriteVC: ((UpdateViewController, Date) -> Void) = { vc, date in
        // 오늘 일기
        let date = FormatterRepository.formatter.string(from: date)
        if let diary = self.repository.getDiary(date: date) {
            vc.diary = diary
        } else {
            vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
        }

        vc.reloadCalendar = self.CalendarVC.reloadCalendar
        self.transition(vc, transitionStyle: .present)
    }
    
    lazy var moveToReadVC: ((ReadViewController, Diary) -> Void) = { vc, diary in
        vc.diary = diary
        vc.reloadCalendar = self.CalendarVC.reloadCalendar
        self.transition(vc, transitionStyle: .present)
    }
    
    let pencilButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.pencel, for: .normal)
        view.contentMode = .scaleAspectFit
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
        view.locale = Locale(identifier: "ko-KR")
        view.preferredDatePickerStyle = .wheels
//        view.timeZone = .autoupdatingCurrent
        view.backgroundColor = UIColor(red: 112/255, green: 162/255, blue: 255/255, alpha: 0.8)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = false
//
        view.isHidden = true
//        view.layer.opacity = 0
//
//        let maximumDate = Calendar.current.date(byAdding: .day, value: -2, to: Date())
//        view.maximumDate = maximumDate
        
        return view
    }()
    
    let dateSelectButton: UIButton = {
        let view = UIButton()
        view.setTitle("선택", for: .normal)
        view.isHidden = true
        return view
    }()
    
    let dateCancelButton: UIButton = {
        let view = UIButton()
        view.setTitle("취소", for: .normal)
        view.isHidden = true
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
        
        tabBar.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        tabBar.tintColor = .systemPink
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
        let fifthVC = tabBarResultController(vc: PencilAlertViewController(), resultType: .vc, img: Constants.BaseImage.TapMenu.setting, selectedImg: Constants.BaseImage.TapMenu.settingFill)
        
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
            make.leading.trailing.equalTo(view).inset(20)
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
            make.bottom.equalTo(datePicker.snp.top).inset(8)
        }
        
        dateSelectButton.snp.makeConstraints { make in
            make.trailing.equalTo(dateCancelButton.snp.leading).offset(-20)
            make.bottom.equalTo(datePicker.snp.top).inset(8)
        }
    }

    @objc
    private func pencilButtonTapped(_ sender: UIButton) {
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
        } else {
            vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
        }
        
        vc.reloadCalendar = CalendarVC.reloadCalendar
        
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
        } else {
            vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
        }
        
        vc.reloadCalendar = CalendarVC.reloadCalendar
        
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
        } else {
            vc.diary = Diary(objectId: date, emotionId: 0, content: nil)
        }
        
        vc.reloadCalendar = CalendarVC.reloadCalendar
        
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
    }
}
