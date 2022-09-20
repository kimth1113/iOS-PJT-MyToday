//
//  ReusableProtocol.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit

protocol ReusableProtocol {
    
    static var reuseIdentifier: String { get }
}


extension UITableViewCell: ReusableProtocol {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableProtocol {
    
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
