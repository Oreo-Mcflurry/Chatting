//
//  ManyFriendTableViewCell.swift
//  Chat
//
//  Created by A_Mcflurry on 1/14/24.
//

import UIKit

class ManyFriendTableViewCell: UITableViewCell {

	static let idnetifier = "ManyFriendTableViewCell"
	@IBOutlet var friends: [UIImageView]!
	@IBOutlet weak var chatRoomName: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	@IBOutlet weak var lastChatLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()

		chatRoomName.font = .boldSystemFont(ofSize: 16)
		dateLabel.textColor = .systemGray2
		dateLabel.font = .systemFont(ofSize: 13)
		dateLabel.textAlignment = .center
		lastChatLabel.textColor = .systemGray2
		lastChatLabel.font = .systemFont(ofSize: 14)
		DispatchQueue.main.async {
			for item in self.friends {
				item.contentMode = .scaleAspectFill
				item.layer.cornerRadius = item.frame.width / 2
			}
		}
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}
	func setFriendTableCell(_ data: ChatRoom) {
		for (index, item) in friends.enumerated() {
			item.image = UIImage(named: data.chatroomImage[index])
		}
		chatRoomName.text = data.chatroomName
		lastChatLabel.text = data.chatList.last?.message
		dateLabel.text = formatDate(.main, data.chatList.last!.date)
	}

}
