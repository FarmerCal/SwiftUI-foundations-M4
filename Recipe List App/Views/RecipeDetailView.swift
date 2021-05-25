//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Callum Day Ham on 5/19/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
       
        //MARK: Image
        
        VStack{
            Image(recipe.image)
                .resizable()
                .scaledToFit()
            
            ScrollView{
                
                VStack(alignment: .leading){
                    
                    //MARK: Ingredients
                    VStack(alignment: .leading){
                        
                        Text("Ingredients")
                            .font(.system(size: 22))
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding([.leading, .bottom], 5.0)
                        
                        
                        ForEach(recipe.ingredients){ item in
                            
                            Text("✦  " + item.name)
                            
                        }
                        .padding(.leading, 20)
                        .padding(0.5)
                        .font(.system(size: 15))
                        
                    }
                    
                    
                    //MARK: Directions
                    VStack(alignment: .leading){
                        Text("Directions")
                            .font(.system(size: 22))
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding([.leading, .bottom], 5.0)
                        
                        ForEach(0..<recipe.directions.count, id:\.self){ index in
                            
                            Text(String(index+1) + ". " + recipe.directions[index])
                            
                        }
                        .padding(.leading, 20)
                        .padding(0.5)
                        .font(.system(size: 15))
                    }
                    
                    //MARK:
                }
            }
            .navigationBarTitle(recipe.name)
        }
    }
}

struct RecipeDetialView_Previews: PreviewProvider {
    static var previews: some View {
        
        //create a dummy recipe to pass in to see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
