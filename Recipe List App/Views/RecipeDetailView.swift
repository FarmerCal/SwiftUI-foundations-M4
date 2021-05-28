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
                    .font(.custom("Avenir Heavy", size: 32))
                
                Divider()
                
                GeometryReader{ geo in
                    
                VStack(alignment: .leading){
                
                    Text("Serving size")
                        .font(.custom("Avenir Light", size: 20))
                        .frame(height:geo.size.height/20)

                    
                    Picker("", selection: $selectedServingSize){
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.pickerStyle(SegmentedPickerStyle())
                    .frame(width:geo.size.width/2)
                    .font(.custom("Avenir Light", size: 20))

                    
                }
                .padding()
                }.frame(height:80)
                
                VStack(alignment: .leading){
                    
                    Divider()
                    
                    //MARK: Ingredients
                    VStack(alignment: .leading){
                        
                        Text("Ingredients")
                            .font(.custom("Avenir Heavy", size: 24))
                            .padding([.leading, .bottom], 5.0)
                        
                        
                        ForEach(recipe.ingredients){ item in
                            
                            Text("✦  " + RecipeModel.getPortion(ingredient:item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                                .font(.custom("Avenir Light", size: 20))

                            
                        }
                        .padding(.leading, 20)
                        .padding(0.5)
                        .font(.system(size: 15))
                        
                    }
                    
                    Divider()
                    
                    //MARK: Directions
                    VStack(alignment: .leading){
                        Text("Directions")
                            .font(.custom("Avenir Heavy", size: 24))
                            .padding([.leading, .bottom], 5.0)
                        
                        ForEach(0..<recipe.directions.count, id:\.self){ index in
                            
                            Text(String(index+1) + ". " + recipe.directions[index])
                                .font(.custom("Avenir Light", size: 20))

                            
                        }
                        .padding(.leading, 20)
                        .padding(10)
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
