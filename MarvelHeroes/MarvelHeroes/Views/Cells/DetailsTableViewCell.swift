//
//  DetailsTableViewCell.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
		
	@IBOutlet private weak var collectionView: UICollectionView!
	@IBOutlet weak var emptyLabel: UILabel!
	@IBOutlet weak var spinner: UIActivityIndicatorView!
	
	func setCollectionViewDataSourceDelegate<T: UICollectionViewDataSource & UICollectionViewDelegate>(dataSourceDelegate: T, forRow row: Int) {
		collectionView.delegate = dataSourceDelegate
		collectionView.dataSource = dataSourceDelegate
		collectionView.tag = row
		collectionView.reloadData()
	}
	
}

