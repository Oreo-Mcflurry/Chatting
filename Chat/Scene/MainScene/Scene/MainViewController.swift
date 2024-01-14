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
		tableView.rowHeight = UITableView.automaticDimension
		searchbar.placeholder = "친구 이름을 검색해보세요"
		setDelegate()
		registerNib()
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return mockChatList.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if mockChatList[indexPath.row].chatroomImage.count == 1 {
			let cell = tableView.dequeueReusableCell(withIdentifier: MainFriendTableViewCell.identfier, for: indexPath) as! MainFriendTableViewCell
			cell.setFriendTableCell(mockChatList[indexPath.row])
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: ManyFriendTableViewCell.idnetifier, for: indexPath) as! ManyFriendTableViewCell
			cell.setFriendTableCell(mockChatList[indexPath.row])
			return cell
		}
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let sb = UIStoryboard(name: ChatViewController.idnetifier, bundle: nil)
		let vc = sb.instantiateViewController(withIdentifier: ChatViewController.idnetifier) as! ChatViewController
		vc.data = mockChatList[indexPath.row]
		navigationController?.pushViewController(vc, animated: true) // navigation
		tableView.reloadRows(at: [indexPath], with: .none)
	}
}

extension MainViewController: TableViewProtocol {
	func registerNib() {
		tableView.register(UINib(nibName: MainFriendTableViewCell.identfier, bundle: nil), forCellReuseIdentifier:  MainFriendTableViewCell.identfier)

		tableView.register(UINib(nibName: ManyFriendTableViewCell.idnetifier, bundle: nil), forCellReuseIdentifier: ManyFriendTableViewCell.idnetifier)
	}

	func setDelegate() {
		tableView.delegate = self
		tableView.dataSource = self
	}
}
