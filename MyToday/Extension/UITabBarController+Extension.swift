//
//  UITabBarController+Extension.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/12.
//

import UIKit

extension UITabBarController {
    
    enum TabBarResultType {
        case vc
        case nav
    }
    
    func tabBarResultController(vc: UIViewController, resultType: TabBarResultType, img: UIImage?, selectedImg: UIImage?) -> UIViewController {
        
        let resultController: UIViewController?
        
        switch resultType {
        case .vc:
            resultController = vc
        case .nav:
            resultController = UINavigationController()
            resultController?.addChild(vc)
        }
        
        resultController?.tabBarItem.image = img
        resultController?.tabBarItem.selectedImage = selectedImg
        resultController?.tabBarItem.imageInsets = UIEdgeInsets(top: -4, left: -4, bottom: -4, right: -4)
        
        return resultController!
    }
}
