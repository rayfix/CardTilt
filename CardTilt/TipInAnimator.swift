//
//  AppDelegate.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class TipInCellAnimator {
    // placeholder for things to come -- only fades in for now
    class func animate(cell:UITableViewCell) {
        if let view = cell.contentView {
            view.layer.opacity = 0.1
            UIView.animateWithDuration(1.4) {
                view.layer.opacity = 1
            }
        }
    }
}