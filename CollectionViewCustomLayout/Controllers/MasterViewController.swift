//
//  MasterViewController.swift
//  CollectionViewCustomLayout
//
//  Created by Pankaj kumar on 14/04/20.
//  Copyright © 2020 Pankaj kumar. All rights reserved.
//

import UIKit

class MasterViewController: UICollectionViewController {
    
    private let charactersData = Characters.loadCharacters()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.isToolbarHidden = true
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail" {
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.character = sender as? Characters
        }
    }
}


// MARK: UICollectionViewDataSource
extension MasterViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return charactersData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCell", for: indexPath) as! CharactersCell
        cell.setup(charactersData[indexPath.item])
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension MasterViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = charactersData[indexPath.item]
        performSegue(withIdentifier: "MasterToDetail", sender: character)
    }
}

extension MasterViewController: PinterestLayoutDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        guard let image = UIImage(named: charactersData[indexPath.item].name) else {
            return 0.0
        }
        return image.size.height
    }
}
