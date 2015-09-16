//
//  ViewController.swift
//  Pokedex
//
//  Created by Muhammad Fauzi Masykur on 9/15/15.
//  Copyright (c) 2015 Muhammad Fauzi Masykur. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var pokemonArray = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        collection.delegate = self
        collection.dataSource = self
        
           parsePokemonCSV()
    }
    
    func parsePokemonCSV() {
        
        if let path: NSString = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv") {
        
            let pathURL = NSURL.fileURLWithPath(path as String)
            var error: NSErrorPointer = nil
            if let csv = CSV(contentsOfURL: pathURL!, error: error){
                let rows = csv.rows
                
                for row in rows {
                    let pokeId = row["id"]!.toInt()
                    let name = row["identifier"]!
                    let poke = Pokemon(name: name, pokedexId: pokeId!)
                    pokemonArray.append(poke)
                }
            
            }
            else {
            println("file csv kosong")
            }
        }
        else {
            println("file csv salah atau gak ada")
            }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell {
            
            var poke = pokemonArray[indexPath.row]
            cell.configureCell(poke)
            return cell
        }
        else{
            return UICollectionViewCell()
         }
        
        
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return pokemonArray.count
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        
//        return CGSizeMake(105, 105)
//    }

}

