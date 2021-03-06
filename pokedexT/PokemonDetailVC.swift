//
//  PokemonDetailVC.swift
//  pokedexT
//
//  Created by Uroš Đurđević on 13/09/16.
//  Copyright © 2016 Uroš Đurđević. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
        
        let image = UIImage(named: "\(pokemon.pokedexId)")
        
        mainImage.image = image
        currentEvoImg.image = image
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        
        pokemon.downloadPokemonDetail {
            //Whatever we write will only be called after the network call is complete
            self.updateUI()
            print("Did arrive here")
            
        }
    }
    
    func updateUI(){
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            
            evoLbl.text = "No Evoultions"
            nextEvoImg.isHidden = true
        } else {
            
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage.init(named: pokemon.nextEvolutionId)
            let str = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLbl.text = str
        }
    }

    
    @IBAction func backBtnPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    


}
