//
//  ViewController.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 05/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		HeroService.fetchHeroes(0) { result in
			switch result {
			case .success(let heroes):
				print(heroes)
			case .failure(let error):
				print(error)
			}
		}
	}

}

