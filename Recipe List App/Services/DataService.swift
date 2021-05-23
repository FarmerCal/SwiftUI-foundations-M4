//
//  DataService.swift
//  Recipe List App
//
//  Created by Callum Day Ham on 5/18/21.
//

import Foundation

class DataService{
    
    //"static" 
    static func getLocalData() -> [Recipe]{
        //parse local json file
        //get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        //check if path is not nil, otherwise ...
        guard pathString != nil else{
            return [Recipe]()
        }
        //create url object
        let url = URL(fileURLWithPath: pathString!)
        do{
            //create a data object
            let data = try Data(contentsOf: url)
            //decode the data with a json decoder
            let decoder = JSONDecoder()
            // .self because we are passing a type in as a parameter
            do{
                let recipeData = try decoder.decode([Recipe].self, from: data)
                //add the unique ID's
                for r in recipeData{
                    r.id = UUID()
            }
                
                //retund the recipes
                return recipeData
            }
            catch{
                print(error)
            }
        
            
        }
        catch{
            print(error)
        }
        return [Recipe]()
    }
}
