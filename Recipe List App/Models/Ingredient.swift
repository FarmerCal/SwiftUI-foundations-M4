//
//  Ingredient.swift
//  Recipe List App
//
//  Created by Callum Day Ham on 5/24/21.
//

import Foundation

class Ingredient: Identifiable, Decodable{
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
