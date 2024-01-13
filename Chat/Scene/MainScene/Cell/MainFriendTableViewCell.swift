//
//  MainFriendTableViewCell.swift
//  Chat
//
//  Created by A_Mcflurry on 1/13/24.
//

import UIKit

class MainFriendTableViewCell: UITableViewCell {

	static let identfier = "MainFriendTableViewCell"
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var date: UILabel!
	@IBOutlet weak var lastTalk: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		profileImage.contentMode = .scaleAspectFill
		name.font = .boldSystemFont(ofSize: 16)
		date.textColor = .systemGray3
		date.font = .systemFont(ofSize: 13)
		date.textAlignment = .center
		lastTalk.textColor = .systemGray3
		lastTalk.font = .systemFont(ofSize: 14)
		DispatchQueue.main.async {
			self.profileImage.layer.cornerRadius = self.profileImage.frame.width/2
		}
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	func setFriendTableCell(_ data: ChatRoom) {
		profileImage.image = UIImage(named: data.chatroomImage[0])
		name.text = data.chatroomName
		lastTalk.text = data.chatList.last?.message
		date.text = formatDate(data.chatList.last!.date)
	}
}

extension UITableViewCell {
	func formatDate(_ date: String) -> String {
		let formatter = DateFormatter()
		let newDate = formatter.date(from: date) ?? Date()
		formatter.dateFormat = "yy.MM.dd"
		
		return formatter.string(from: newDate)
	}
}
