//
//  ErrorHandler.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class ErrorHandler {
	
	class func handle(error: ErrorType, inViewController viewController: UIViewController) {
		var message = ""
		switch error {
		case .fetching:
			message = "Error fetching data."
		case .parsing:
			message = "Error parsing data."
		}
		
		showAlert(inViewController: viewController, withMessage: message)
	}
	
	private class func showAlert(inViewController viewController: UIViewController, withMessage message: String) {
		let alertController = UIAlertController(title: "Ops!", message: message, preferredStyle: .alert)
		let doneAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
		alertController.addAction(doneAction)
		viewController.present(alertController, animated: true, completion: nil)
	}
	
}
