//
//  DetailsViewController+CollectionView.swift
//  MarvelHeroes
//
//  Created by Lucas Domene on 07/05/18.
//  Copyright © 2018 Lucas Domene. All rights reserved.
//

import UIKit

extension DetailsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return details[collectionView.tag].count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCollectionCell", for: indexPath) as! DetailsCollectionViewCell
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		cell.tag = indexPath.row
		// TODO: - Set placeholder
		let detailItem = details[collectionView.tag][indexPath.row]
		
		if let image = imageService.imageForKey(key: String(detailItem.id)) {
			(cell as! DetailsCollectionViewCell).imageView.image = image
			return
		}

		if let imagePath = detailItem.thumbnail?.fullPath, let url = URL(string: imagePath) {
			imageService.downloadImage(fromURL: url) { image in
				self.imageService.setImage(image: image, forkey: String(detailItem.id))
				DispatchQueue.main.async {
					if cell.tag == indexPath.row {
						(cell as! DetailsCollectionViewCell).imageView.image = image
					}
				}
			}
		}
	}
	
}
