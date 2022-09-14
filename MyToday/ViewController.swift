//
//  ViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/07.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .systemGray
        return scrollView
    }()
    let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    let secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    let thirdView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .yellow
     
        view.addSubview(scrollView)
        scrollView.addSubview(firstView)
        scrollView.addSubview(secondView)
        scrollView.addSubview(thirdView)
        
        scrollView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview().inset(16)
        }
        firstView.snp.makeConstraints {
            $0.top.left.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        secondView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(1000)
            $0.left.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        thirdView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(2000)
            $0.left.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.height.equalTo(100)
        }
    }
}

