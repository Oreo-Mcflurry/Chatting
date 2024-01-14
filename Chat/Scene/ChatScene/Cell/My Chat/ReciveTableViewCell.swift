//
//  MyChatTableViewCell.swift
//  Chat
//
//  Created by A_Mcflurry on 1/13/24.
//

import UIKit

class ReciveTableViewCell: UITableViewCell {

	static let identifier = "ReciveTableViewCell"
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var name: UILabel!
	@IBOutlet weak var chatBackView: UIView!
	@IBOutlet weak var chat: UILabel!
	@IBOutlet weak var date: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		profileImage.contentMode = .scaleAspectFill
		name.font = .boldSystemFont(ofSize: 16)
		chat.numberOfLines = 0
		chatBackView.layer.cornerRadius = 8
		chatBackView.layer.borderColor = UIColor.systemGray2.cgColor
		chatBackView.layer.borderWidth = 1
		date.font = .systemFont(ofSize: 12)
		DispatchQueue.main.async {
			self.profileImage.layer.cornerRadius = self.profileImage.frame.width / 2
		}
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	func setCells(_ data: Chat) {
		profileImage.image = UIImage(named: data.user.profileImage)
		name.text = data.user.rawValue
		chat.text = data.message
		date.text = formatDate(.chat, data.date)
	}
}
