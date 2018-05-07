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
	var spinner = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
	
	func setCollectionViewDataSourceDelegate<T: UICollectionViewDataSource & UICollectionViewDelegate>(dataSourceDelegate: T, forRow row: Int) {
		collectionView.delegate = dataSourceDelegate
		collectionView.dataSource = dataSourceDelegate
		collectionView.tag = row
		collectionView.reloadData()
	}
	
	func configureSpinner() {
		spinner.backgroundColor = UIColor.red
		spinner.layer.cornerRadius = 10
		spinner.hidesWhenStopped = true
		spinner.translatesAutoresizingMaskIntoConstraints = false
		collectionView.addSubview(spinner)
		
		spinner.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
		spinner.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
	}
	
}

