//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Callum Day Ham on 5/25/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShow = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Text("Featured Recipes")
                .bold()
                .font(.custom("Avenir Heavy", size: 32))
            
            GeometryReader{ geo in
                
                TabView(selection: $tabSelectionIndex){
                    
                    ForEach(0..<model.recipes.count){ index in
                        
                        if model.recipes[index].featured{
                            
                            Button(action: {
                                
                                self.isDetailViewShow = true
                                
                            }, label: {
                                ZStack{
                                    
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0){
                                        
                                        GeometryReader{ geo in
                                            Image(model.recipes[index].image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                
                                        }.clipped()
                                        GeometryReader{ geo in
                                            Text(model.recipes[index].name)
                                                .font(.custom("Avenir Light", size: 20))

                                                .foregroundColor(.black)
                                                .multilineTextAlignment(.center)
                                                .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                                        }.frame(width: geo.size.width, height: geo.size.height/10, alignment: .center)
                                        
                                        
                                    }
                                }
                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShow){
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width-40, height: geo.size.height-60, alignment: .center)
                            .cornerRadius(10)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity:0.5), radius: 10, x:-5, y:10)
                            .padding(.bottom, geo.size.height/10)
                        }
                    
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            VStack{
                
                Text("Prep time:")
                    .font(.custom("Avenir Heavy", size: 24))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(.custom("Avenir Light", size: 20))

                Text("Highlights")
                    .font(.custom("Avenir Heavy", size: 24))
                RecipeHighlightsView(highlights: model.recipes[tabSelectionIndex].highlights)
                    .font(.custom("Avenir Light", size: 20))

            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform:{
            setFeaturedIndex()
        })
        
    }
    
    func setFeaturedIndex(){
     
        let index = model.recipes.firstIndex{(recipe)-> Bool in
         
            return recipe.featured
                
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
