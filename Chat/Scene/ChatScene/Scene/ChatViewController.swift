//
//  ChatViewController.swift
//  Chat
//
//  Created by A_Mcflurry on 1/13/24.
//

import UIKit

class ChatViewController: UIViewController {

	static let idnetifier = "ChatViewController"
	var data = ChatRoom(chatroomId: 0, chatroomImage: [], chatroomName: "")
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var textField: UITextField!
	override func viewDidLoad() {
		super.viewDidLoad()
		registerNib()
		setDelegate()
		navigationItem.title = data.chatroomName
		tableView.separatorStyle = .none
		tableView.selectionFollowsFocus = false
		tableView.rowHeight = UITableView.automaticDimension
	}

	@IBAction func enterTextField(_ sender: Any) {

	}
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.chatList.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let bool = data.chatList[indexPath.row].user == .user
		// 삼항연산자로 처리하려고 했는데, 코드가 그렇게 이쁘게 나올것 같지 않아서 이렇게 해봤습니다.
		if bool {
			let cell = tableView.dequeueReusableCell(withIdentifier: SendChatTableViewCell.identifier, for: indexPath) as! SendChatTableViewCell

			cell.setCell(data.chatList[indexPath.row])
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: ReciveTableViewCell.identifier, for: indexPath) as! ReciveTableViewCell

			cell.setCell(data.chatList[indexPath.row])
			return cell
		}
	}
}

extension ChatViewController: TableViewProtocol {
	func registerNib() {
		tableView.register(UINib(nibName: ReciveTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ReciveTableViewCell.identifier)

		tableView.register(UINib(nibName: SendChatTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SendChatTableViewCell.identifier)
	}

	func setDelegate() {
		tableView.delegate = self
		tableView.dataSource = self
	}
}
