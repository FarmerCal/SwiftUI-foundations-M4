//
//  RecipeHighlightsView.swift
//  Recipe List App
//
//  Created by Callum Day Ham on 5/27/21.
//

import SwiftUI

struct RecipeHighlightsView: View {
    
    var allHighlights = ""
    
    init(highlights:[String]){
        
        for index in 0..<highlights.count{
            
            if index == highlights.count - 1{
                allHighlights += highlights[index]
            }
            else{
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        Text(allHighlights)
        .font(.custom("Avenir Light", size: 20))
    }
}

struct RecipeHighlightsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlightsView(highlights: ["yo","yo mama"])
    }
}
