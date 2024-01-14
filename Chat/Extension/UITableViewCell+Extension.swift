//
//  UITableViewCell+Extension.swift
//  Chat
//
//  Created by A_Mcflurry on 1/13/24.
//

import UIKit

// extension UIView {
func formatDate(_ dateKind: DateKind, _ date: Date) -> String {
	let formatter = DateFormatter()
	formatter.dateFormat = dateKind.rawValue
	formatter.locale = Locale(identifier: "ko_KR")
	return formatter.string(from: date)
}

func formatDate(_ dateKind: DateKind, _ date: String) -> String {
	let formatter = DateFormatter()
	formatter.dateFormat = "yyyy-MM-dd hh:mm"
	let newDate = formatter.date(from: date) ?? Date()
	formatter.dateFormat = dateKind.rawValue
	formatter.locale = Locale(identifier: "ko_KR")
	return formatter.string(from: newDate)
}
enum DateKind: String {
	case main = "yy.MM.dd"
	case chat = "hh:mm a"
}

//}
