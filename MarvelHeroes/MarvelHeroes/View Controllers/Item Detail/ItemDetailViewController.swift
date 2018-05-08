//
//  ItemDetailViewController.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 08/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
	
	@IBOutlet weak var itemImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	
	var itemTitle: String?
	var itemDescription: String?
	var image: UIImage?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = itemTitle
		titleLabel.text = itemTitle
		descriptionLabel.text = itemDescription
		itemImageView.image = image
	}
	
	@IBAction func close(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}
	
}
