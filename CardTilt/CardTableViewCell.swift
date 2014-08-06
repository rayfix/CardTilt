//
//  CardTableViewCell.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import QuartzCore

class CardTableViewCell: UITableViewCell {

    @IBOutlet var mainView: UIView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var aboutLabel: UILabel!
    @IBOutlet var profilePictureView: UIImageView!
    @IBOutlet var webLabel: UILabel!
    @IBOutlet var webButton: UIButton!
    @IBOutlet var twitterButton: UIButton!
    @IBOutlet var twitterImage: UIImageView!
    @IBOutlet var facebookButton: UIButton!
    @IBOutlet var facebookImage: UIImageView!
    var twitter:String?
    var facebook:String?
    
    func useMember(member:Member) {
        // Round those corners
        mainView.layer.cornerRadius = 10;
        mainView.layer.masksToBounds = true;
        
        // Fill in the data
        nameLabel.text = member.name
        titleLabel.text = member.title
        locationLabel.text = member.location
        aboutLabel.text = member.about
        profilePictureView.image = UIImage(named: member.imageName)
        
        // Fill the buttons and show or hide them
        webLabel.text = member.web

        if let twitterURLString = member.twitter {
            twitterImage.hidden = false
            twitter = twitterURLString
        }
        else {
            twitterImage.hidden = true
            twitter = nil
        }
        
        if let facebookURLString = member.facebook {
            facebookImage.hidden = false
            facebook = facebookURLString
        }
        else {
            facebookImage.hidden = true
            facebook = nil
        }
    }

    func jumpTo(URLString:String?) {
        if let URL = NSURL.URLWithString(URLString) {
            UIApplication.sharedApplication().openURL(URL)
        }
    }
    
    @IBAction func webButtonTapped(sender: AnyObject) {
        jumpTo(webLabel.text)
    }
    
    @IBAction func twitterButtonTapped(sender: AnyObject) {
        jumpTo(twitter)
    }
    
    @IBAction func facebookButtonTapped(sender: AnyObject) {
        jumpTo(facebook)
    }
}
