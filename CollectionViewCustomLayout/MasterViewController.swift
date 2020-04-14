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
    private let columns: CGFloat = 3.0
    private let inset: CGFloat = 8.0
    private let spacing: CGFloat = 8.0
    private let lineSpacing: CGFloat = 8.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.isToolbarHidden = true
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

// MARK: UICollectionViewDelegateFlowLayout
extension MasterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //let width = Int((collectionView.frame.width / columns) - (inset + spacing))
        let randomSize = 64 * Int(arc4random_uniform(UInt32(3)) + 1)
        return CGSize(width: randomSize, height: randomSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
}
