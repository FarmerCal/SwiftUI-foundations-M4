//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Callum Day Ham on 5/18/21.
//

import Foundation

class RecipeModel: ObservableObject{
    
    @Published var recipes = [Recipe]()
    
    init(){
        
        //create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String{
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil{
        
        // get a single serving size by mulitplying denominator by the recipe servings
        denominator *= recipeServings
            
        // get target protion by multiplying numerator by target servings
        numerator *= targetServings
            
        // reduce fraction by greatest common devisor
            let diviser = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= diviser
            denominator /= diviser
            
        // get the whole portion if numerator is greater than denominator
            if numerator >= denominator{
                
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
        // express the remainder as a fraction
            if numerator > 0{
                
                portion += wholePortions > 0 ? " ": ""
                portion += "\(numerator)/\(denominator)"
                
            }
            
        }
        
        if var unit = ingredient.unit{
            
            if (wholePortions > 1) || ((Double(numerator) / Double(denominator) + Double(wholePortions)) > 1.0){
                if unit.suffix(2) == "ch"{
                    
                    unit += "es"
                    
                }
                else if unit.suffix(1) == "f"{
                    
                    unit = String(unit.dropLast(1))
                    unit += "ves"
                    
                }
                else{
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.num == nil ? "":" "
            
            return portion + unit
        }
        
        return portion
        
    }
}
