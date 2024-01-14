//
//  OtherChatTableViewCell.swift
//  Chat
//
//  Created by A_Mcflurry on 1/13/24.
//

import UIKit

class SendChatTableViewCell: UITableViewCell {

	static let identifier = "SendChatTableViewCell"
	@IBOutlet weak var chatBackView: UIView!
	@IBOutlet weak var chatLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!

	override func awakeFromNib() {
		super.awakeFromNib()
		chatLabel.numberOfLines = 0
		chatBackView.layer.cornerRadius = 8
		chatBackView.backgroundColor = .systemGray5
		chatBackView.layer.borderColor = UIColor.systemGray2.cgColor
		chatBackView.layer.borderWidth = 1
		dateLabel.font = .systemFont(ofSize: 12)
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	func setCell(_ data: Chat) {
		chatLabel.text = data.message
		dateLabel.text = formatDate(.chat, data.date)
	}

}
