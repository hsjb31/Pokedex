//
//  ViewController.swift
//  Pokedex
//
//  Created by Harshal Solanki on 12/04/17.
//  Copyright © 2017 Harshal Solanki. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout ,UISearchBarDelegate {

    @IBOutlet weak var collection : UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    
    var filteredPokemon = [Pokemon]()
    
    var inSearchMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        parsePokemonCSV()
    
    
    }
    
    func parsePokemonCSV()  {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
                
            }
            
        } catch let err as NSError {
            
            print(err.debugDescription)
        }

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 105, height: 105)
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
    return 1
    
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode{
            return filteredPokemon.count
        }
        return pokemon.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            let poke : Pokemon!
            
            if inSearchMode{
               poke = filteredPokemon[indexPath.row]
            cell.configurecell(poke)
            }
            else{

                poke = pokemon[indexPath.row]
                cell.configurecell(poke)
            }
            
            
            return cell
        }
        else{
            return UICollectionViewCell()
        }
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    
        if searchBar.text == nil || searchBar.text == ""{
            
        inSearchMode = false
        collection.reloadData()
        }
        else{
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            filteredPokemon = pokemon.filter({$0.name.range(of: lower) != nil})
            
            collection.reloadData()
        }
        
        
        
    }
}

