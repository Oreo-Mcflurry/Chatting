//
//  MainViewController.swift
//  Chat
//
//  Created by A_Mcflurry on 1/13/24.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchbar: UISearchBar!
	@IBOutlet weak var seperator: UIView!
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.separatorStyle = .none
		setDelegate()
		registerNib()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return mockChatList.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: MainFriendTableViewCell.identfier, for: indexPath) as! MainFriendTableViewCell
		cell.setFriendTableCell(mockChatList[indexPath.row])
		return cell
	}

	func setDelegate() {
		tableView.delegate = self
		tableView.dataSource = self
	}
}

extension MainViewController: TableViewProtocol {
	func registerNib() {
		tableView.register(UINib(nibName: MainFriendTableViewCell.identfier, bundle: nil), forCellReuseIdentifier:  MainFriendTableViewCell.identfier)
	}
}
