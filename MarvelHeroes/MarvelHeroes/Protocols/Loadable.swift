//
//  Loadable.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 06/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

protocol Loadable {
	var spinner: UIActivityIndicatorView { get set }
	func startLoading()
	func stopLoading()
}

extension Loadable where Self: UIViewController {
	
	func configureSpinner() {
		spinner.backgroundColor = UIColor.red
		spinner.layer.cornerRadius = 10
		spinner.hidesWhenStopped = true
		spinner.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(spinner)
		
		spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
	}
	
	func startLoading() {
		spinner.startAnimating()
	}
	
	func stopLoading() {
		spinner.stopAnimating()
	}
	
}
