//
//  Member.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import Foundation

class Member
{
    let imageName:String?
    let name:String?
    let title:String?
    let location:String?
    let about:String?
    let web:String?
    let facebook:String?
    let twitter:String?
    
    init(dictionary:NSDictionary) {
        imageName = dictionary["image"]    as? String
        name      = dictionary["name"]     as? String
        title     = dictionary["title"]    as? String
        location  = dictionary["location"] as? String
        web       = dictionary["web"]      as? String
        facebook  = dictionary["facebook"] as? String
        twitter   = dictionary["twitter"]  as? String
        
        // fixup the about text to add newlines
        var unescapedAbout = dictionary["about"] as String
        about = unescapedAbout.stringByReplacingOccurrencesOfString("\\n", withString:"\n", options:nil, range:nil)        
    }
    
    class func loadMembersFromFile(path:String) -> [Member]
    {
        var members:[Member] = []
        
        var error:NSError? = nil
        if let data = NSData.dataWithContentsOfFile(path, options:nil, error:&error) {
            if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error:&error) as? NSDictionary {
                if let team = json["team"] as? NSArray {
                    for obj:AnyObject in team {
                        let memberDictionary = obj as NSDictionary
                        let member = Member(dictionary: memberDictionary)
                        members.append(member)
                    }
                }
            }
        }
        return members
    }
}
