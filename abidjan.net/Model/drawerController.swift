//
//  drawerController.swift
//  abidjan.net
//
//  Created by Pentest225 on 3/23/21.
//  Copyright © 2021 Pentest225. All rights reserved.
//

import Foundation
import UIKit

protocol MenuControllerDelegate {
    func onChangeMenu(newRoute :String)
}
class MenuController :UITableViewController {
    var delegate : MenuControllerDelegate?
    private let menuList :[String]
    init(with menuItem:[String]) {
        self.menuList = menuItem
        super.init(nibName:nil,bundle:nil)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "drawerItem")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        tableView.backgroundColor = .systemRed
        view.backgroundColor = .systemRed
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "drawerItem", for: indexPath)
        cell.textLabel?.text = menuList[indexPath.row]
        cell.backgroundColor = .systemRed
        cell.contentView.backgroundColor = .systemRed
        cell.textLabel?.textColor = .white
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.onChangeMenu(newRoute: menuList[indexPath.row])
        
    }
}


