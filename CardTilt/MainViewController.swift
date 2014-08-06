//
//  MainViewController.swift
//  CardTilt
//
//  Created by Ray Fix on 6/25/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var members:[Member] = []
    
    //MARK: - Model
    
    func loadModel() {
        let path = NSBundle.mainBundle().pathForResource("TeamMembers", ofType: "json")
        members = Member.loadMembersFromFile(path)
    }
    
    //MARK: - View Lifetime
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // appearance and layout customization
        self.tableView.backgroundView = UIImageView(image:UIImage(named:"background"))
        self.tableView.estimatedRowHeight = 280
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // load our model
        loadModel();
    }

    //MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Card", forIndexPath: indexPath) as CardTableViewCell
        let member = members[indexPath.row]
        cell.useMember(member)
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
}
