//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Callum Day Ham on 5/19/21.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        
        //MARK: Image
        
        ScrollView{
            VStack{
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Text(recipe.name)
                    .bold()
                    .padding(.top,20)
                    .font(.largeTitle)
                
                GeometryReader{ geo in
                    
                VStack(alignment: .leading){
                    Text("Serving size")
                    
                    Picker("", selection: $selectedServingSize){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                    .frame(width:geo.size.width/2)
                }
                .padding()
                }.frame(height:80)
                
                Divider()
                
                VStack(alignment: .leading){
                    
                    //MARK: Ingredients
                    VStack(alignment: .leading){
                        
                        Text("Ingredients")
                            .font(.system(size: 22))
                            .font(.headline)
                            .fontWeight(.heavy)
                            .padding([.leading, .bottom], 5.0)
                        
                        
                        ForEach(recipe.ingredients){ item in
                            
                            Text("✦  " + RecipeModel.getPortion(ingredient:item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            
                        }
                        .padding(.leading, 20)
                        .padding(0.5)
                        .font(.system(size: 15))
                        
                    }
                    
                    Divider()
                    
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
