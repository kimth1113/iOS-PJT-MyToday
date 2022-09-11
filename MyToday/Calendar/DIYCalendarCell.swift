//
//  DIYCalendarCell.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/11.
//

import UIKit
import FSCalendar
import SnapKit

class DIYCalendarCell: FSCalendarCell {
    
//    weak var circleImageView: UIImageView!
//    weak var selectionLayer: CAShapeLayer!
    
    let titleImageView: UIImageView = {
        let view = UIImageView()
        view.image = nil
        view.contentMode = .scaleAspectFit
        view.layer.opacity = 0.5
        return view
    }()
    
    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#function)
        
//        let circleImageView = UIImageView(image: UIImage(named: "serious"))
        self.contentView.insertSubview(titleImageView, at: 0)
//        self.circleImageView = circleImageView
//        self.circleImageView.contentMode = .scaleAspectFit
//        self.circleImageView.backgroundColor = .green
        
//        let selectionLayer = CAShapeLayer()
//        selectionLayer.fillColor = UIColor.black.cgColor
//        selectionLayer.actions = ["hidden": NSNull()]
//        self.contentView.layer.insertSublayer(selectionLayer, below: self.titleLabel!.layer)
//        self.selectionLayer = selectionLayer
        
        self.shapeLayer.isHidden = true
        
//        let view = UIView(frame: self.bounds)
//        view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.12)
//        self.backgroundView = view;
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print(#function)
        self.titleImageView.frame = self.contentView.bounds
        
        self.backgroundView?.frame = self.bounds.insetBy(dx: 1, dy: 1)
//        self.selectionLayer.frame = self.contentView.bounds
        
        titleImageView.snp.makeConstraints { make in
            make.width.equalTo(self.contentView).multipliedBy(0.8)
            make.height.equalTo(titleImageView.snp.width)
            make.centerX.equalTo(self.contentView)
            make.centerY.equalTo(self.contentView)
        }
        
//        circleImageView.layer.cornerRadius = circleImageView.frame.width / 2
//        circleImageView.layer.masksToBounds = true
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        print(#function)
        
        // Override the build-in appearance configuration
        if self.isPlaceholder {
            self.eventIndicator.isHidden = true
            self.titleLabel.textColor = .clear
            titleImageView.image = nil
        }
        
    }
    
    func changeCircleImageView(image: UIImage) {
        titleImageView.image = image
    }
    
}
