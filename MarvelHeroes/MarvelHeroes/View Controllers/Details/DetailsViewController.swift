//
//  DetailsViewController.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
	
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var tableView: UITableView!
	
	var hero: Hero!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.tableFooterView = UIView()
		
		DetailsService.fetchDetails(type: Serie.self, offset: 0, heroID: String(hero.id)) { result in
			switch result {
			case .success(let comics):
				print(comics)
			case .failure(let error):
				print(error)
			}
		}
		
	}
}
