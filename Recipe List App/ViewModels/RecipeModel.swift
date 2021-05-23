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
}
