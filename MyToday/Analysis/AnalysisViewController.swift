//
//  AnalysisViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/24.
//

import UIKit
import RealmSwift
import SwiftyJSON

class AnalysisViewController: BaseViewController {
    
    let mainView = AnalysisView()
    
    private let repository = DiaryRepository()
    
    var textCount: [String: Int] = [:] {
        didSet {
            let sortedTextCount = textCount.sorted { $0.value > $1.value }
            var keyList: [String] = []
            var valueList: [Int] = []
            
            var total = 0
            for (key, value) in sortedTextCount {
                keyList.append(key)
                valueList.append(value)
                total += 1
                if total == 6 { break }
            }
            
            mainView.analysisRankView.rankInfoView.textLabel.text = "..."
            mainView.analysisRankView.rankInfoView.countLabel.text = "..."
            mainView.analysisRankView.rankInfoView2.textLabel.text = "..."
            mainView.analysisRankView.rankInfoView2.countLabel.text = "..."
            mainView.analysisRankView.rankInfoView3.textLabel.text = "..."
            mainView.analysisRankView.rankInfoView3.countLabel.text = "..."
            mainView.analysisRankView.rankInfoView4.textLabel.text = "..."
            mainView.analysisRankView.rankInfoView4.countLabel.text = "..."
            mainView.analysisRankView.rankInfoView5.textLabel.text = "..."
            mainView.analysisRankView.rankInfoView5.countLabel.text = "..."
            mainView.analysisRankView.rankInfoView6.textLabel.text = "..."
            mainView.analysisRankView.rankInfoView6.countLabel.text = "..."

            
            for i in 0 ..< keyList.count {
                if i == 0 {
                    mainView.analysisRankView.rankInfoView.textLabel.text = keyList[i]
                    mainView.analysisRankView.rankInfoView.countLabel.text = "\(valueList[i])번"
                } else if i == 1 {
                    mainView.analysisRankView.rankInfoView2.textLabel.text = keyList[i]
                    mainView.analysisRankView.rankInfoView2.countLabel.text = "\(valueList[i])번"
                } else if i == 2 {
                    mainView.analysisRankView.rankInfoView3.textLabel.text = keyList[i]
                    mainView.analysisRankView.rankInfoView3.countLabel.text = "\(valueList[i])번"
                } else if i == 3 {
                    mainView.analysisRankView.rankInfoView4.textLabel.text = keyList[i]
                    mainView.analysisRankView.rankInfoView4.countLabel.text = "\(valueList[i])번"
                } else if i == 4 {
                    mainView.analysisRankView.rankInfoView5.textLabel.text = keyList[i]
                    mainView.analysisRankView.rankInfoView5.countLabel.text = "\(valueList[i])번"
                } else if i == 5 {
                    mainView.analysisRankView.rankInfoView6.textLabel.text = keyList[i]
                    mainView.analysisRankView.rankInfoView6.countLabel.text = "\(valueList[i])번"
                }
            }
            
        }
    }
    
    lazy var analysisThisMonth: ((Date) -> Void)? = { date in
        let analysisDate = FormatterRepository.analysisMonthFormatter.string(from: date)
        self.mainView.dateButton.setTitle(analysisDate, for: .normal)
        self.diaryList = self.repository.getAnalysisDiaryList(date: date)
    }
    
    private var diaryList: Results<Diary>! {
        didSet {
            var totalText: String = ""
            var emoticonCount: [Int: Int] = [:]
            
            diaryList.forEach {
                if let text = $0.content {
                    totalText += text + " "
                }
                
                if emoticonCount[$0.emoticonId] == nil {
                    emoticonCount[$0.emoticonId] = 1
                } else {
                    emoticonCount[$0.emoticonId]! += 1
                }
            }
            
            if let count = emoticonCount[1] {
                mainView.analysisEmoticonView.emotionCountView.countLabel.text = "\(count)일"
                mainView.analysisEmoticonView.emotionCountView.countLabel.textColor = .systemPink
            } else {
                mainView.analysisEmoticonView.emotionCountView.countLabel.text = "없음"
                mainView.analysisEmoticonView.emotionCountView.countLabel.textColor = .white
            }
            if let count = emoticonCount[2] {
                mainView.analysisEmoticonView.emotionCountView2.countLabel.text = "\(count)일"
                mainView.analysisEmoticonView.emotionCountView2.countLabel.textColor = .systemPink
            } else {
                mainView.analysisEmoticonView.emotionCountView2.countLabel.text = "없음"
                mainView.analysisEmoticonView.emotionCountView2.countLabel.textColor = .white
            }
            if let count = emoticonCount[3] {
                mainView.analysisEmoticonView.emotionCountView3.countLabel.text = "\(count)일"
                mainView.analysisEmoticonView.emotionCountView3.countLabel.textColor = .systemPink
            } else {
                mainView.analysisEmoticonView.emotionCountView3.countLabel.text = "없음"
                mainView.analysisEmoticonView.emotionCountView3.countLabel.textColor = .white
            }
            if let count = emoticonCount[4] {
                mainView.analysisEmoticonView.emotionCountView4.countLabel.text = "\(count)일"
                mainView.analysisEmoticonView.emotionCountView4.countLabel.textColor = .systemPink
            } else {
                mainView.analysisEmoticonView.emotionCountView4.countLabel.text = "없음"
                mainView.analysisEmoticonView.emotionCountView4.countLabel.textColor = .white
            }
            if let count = emoticonCount[5] {
                mainView.analysisEmoticonView.emotionCountView5.countLabel.text = "\(count)일"
                mainView.analysisEmoticonView.emotionCountView5.countLabel.textColor = .systemPink
            } else {
                mainView.analysisEmoticonView.emotionCountView5.countLabel.text = "없음"
                mainView.analysisEmoticonView.emotionCountView5.countLabel.textColor = .white
            }
            if let count = emoticonCount[6] {
                mainView.analysisEmoticonView.emotionCountView6.countLabel.text = "\(count)일"
                mainView.analysisEmoticonView.emotionCountView6.countLabel.textColor = .systemPink
            } else {
                mainView.analysisEmoticonView.emotionCountView6.countLabel.text = "없음"
                mainView.analysisEmoticonView.emotionCountView6.countLabel.textColor = .white
            }
            if let count = emoticonCount[7] {
                mainView.analysisEmoticonView.emotionCountView7.countLabel.text = "\(count)일"
                mainView.analysisEmoticonView.emotionCountView7.countLabel.textColor = .systemPink
            } else {
                mainView.analysisEmoticonView.emotionCountView7.countLabel.text = "없음"
                mainView.analysisEmoticonView.emotionCountView7.countLabel.textColor = .white
            }
            if let count = emoticonCount[8] {
                mainView.analysisEmoticonView.emotionCountView8.countLabel.text = "\(count)일"
                mainView.analysisEmoticonView.emotionCountView8.countLabel.textColor = .systemPink
            } else {
                mainView.analysisEmoticonView.emotionCountView8.countLabel.text = "없음"
                mainView.analysisEmoticonView.emotionCountView8.countLabel.textColor = .white
            }
            if let count = emoticonCount[9] {
                mainView.analysisEmoticonView.emotionCountView9.countLabel.text = "\(count)일"
                mainView.analysisEmoticonView.emotionCountView9.countLabel.textColor = .systemPink
            } else {
                mainView.analysisEmoticonView.emotionCountView9.countLabel.text = "없음"
                mainView.analysisEmoticonView.emotionCountView9.countLabel.textColor = .white
            }
            
            if let randomId = diaryList.randomElement()?.objectId {
                mainView.analysisRandomView.randomImageView.image = loadImageFromDocument(fileName: randomId)
            }
            
            textRankAnalysis(text: totalText)
            
            mainView.analysisMonthView.monthLabel.text = "\(diaryList.count)"
            
        }
    }
    
    override func loadView() {
        super.loadView()
        
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diaryList = repository.getAnalysisDiaryList(date: Date())
        setButton()
    }
    
    override func configure() {
        
    }
    
}

extension AnalysisViewController {
    
    func setButton() {
        mainView.dateButton.addTarget(self, action: #selector(dateButtonTapped), for: .touchUpInside)
        mainView.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        mainView.rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
    }

    @objc
    func dateButtonTapped(_ sender: UIButton) {
        let vc = DateAlertViewController()
        vc.analysisThisMonth = analysisThisMonth
        transition(vc, transitionStyle: .present)
    }
    
    @objc
    func leftButtonTapped(_ sender: UIButton) {
        
        let current = FormatterRepository.analysisMonthFormatter.date(from: (mainView.dateButton.titleLabel?.text)!)
        
        let nextDate = Calendar.current.date(byAdding: .month, value: -1, to: current!)
        let nextString = FormatterRepository.analysisMonthFormatter.string(from: nextDate!)
        
        self.mainView.dateButton.setTitle(nextString, for: .normal)
        self.diaryList = self.repository.getAnalysisDiaryList(date: nextDate!)
    }
    
    @objc
    func rightButtonTapped(_ sender: UIButton) {
        let current = FormatterRepository.analysisMonthFormatter.date(from: (mainView.dateButton.titleLabel?.text)!)
        
        let nextDate = Calendar.current.date(byAdding: .month, value: +1, to: current!)
        let nextString = FormatterRepository.analysisMonthFormatter.string(from: nextDate!)
        
        self.mainView.dateButton.setTitle(nextString, for: .normal)
        self.diaryList = self.repository.getAnalysisDiaryList(date: nextDate!)
    }
    
    private func textRankAnalysis(text: String) {
//        let text = text.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!
        
        var textCount: [String: Int] = [:]
        
        let json: [String: Any] = [
            "access_key": "24c8a380-8811-47dd-a0e4-6e132655f3fb",
                "argument": [
                "analysis_code": "ner",
                "text": text
            ]
        ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        // create post request
        let url = URL(string: "http://aiopen.etri.re.kr:8000/WiseNLU")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // insert json data to the request
        request.httpBody = jsonData
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                
                DispatchQueue.main.async {
                    guard let result = responseJSON["return_object"] as? [String: Any] else {
                        self.textCount = textCount
                        return
                    }
                    let sentence = result["sentence"] as! Array<[String: Any]>
                    
                    sentence.forEach {
                        let morp = $0["morp"] as! Array<[String: Any]>
                        morp.forEach {
                            let resultString = $0["lemma"]! as! String
                            let checkList = StopWord.allWord
                            if !checkList.contains(resultString) {
                                if textCount[resultString] == nil {
                                    textCount[resultString] = 1
                                } else {
                                    textCount[resultString]! += 1
                                }
                            }
                        }
                    }
                    
                    self.textCount = textCount
                }
            }
        }

        task.resume()
    }
}
