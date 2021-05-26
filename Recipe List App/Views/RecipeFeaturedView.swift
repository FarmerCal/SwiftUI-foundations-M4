//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Callum Day Ham on 5/25/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        VStack(alignment: .center){
            
            Text("Featured Recipes")
                .bold()
                .font(.title)
            
            GeometryReader{ geo in
                
                TabView{
                    
                    ForEach(0..<model.recipes.count){ index in
                        
                        if model.recipes[index].featured{
                            
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
                                            .foregroundColor(.black)
                                            .multilineTextAlignment(.center)
                                            .frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                                    }.frame(width: geo.size.width, height: geo.size.height/10, alignment: .center)
                                    
                                    
                                }
                            }
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
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Filling")
            }
            .padding([.leading, .bottom])
        }
        
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
