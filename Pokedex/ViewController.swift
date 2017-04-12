//
//  ViewController.swift
//  Pokedex
//
//  Created by Harshal Solanki on 12/04/17.
//  Copyright © 2017 Harshal Solanki. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        collection.dataSource = self
        collection.delegate = self
        
    
    
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
    return 1
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 718
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            let pokemon = Pokemon(name: "Pokemon", pokedexId: indexPath.row )
            cell.configurecell(pokemon : pokemon)
            
            return cell
        }
        else{
            return UICollectionViewCell()
        }
        
        
    }
}

