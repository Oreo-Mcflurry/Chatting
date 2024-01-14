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
		let cell = tableView.dequeueReusableCell(withIdentifier: ReciveTableViewCell.identifier, for: indexPath) as! ReciveTableViewCell

		cell.setCells(data.chatList[indexPath.row])
		return cell
	}
}

extension ChatViewController: TableViewProtocol {
	func registerNib() {
		tableView.register(UINib(nibName: ReciveTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ReciveTableViewCell.identifier)
	}

	func setDelegate() {
		tableView.delegate = self
		tableView.dataSource = self
	}
}
