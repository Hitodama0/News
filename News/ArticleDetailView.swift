//
//  ArticleDetailView.swift
//  News
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct ArticleDetailView: View {
    var article: Result
    var body: some View {
        VStack{
            
            Text(article.title)
                .font(.title)
                .fontWeight(.bold)
            
            
            if let multimedia = article.multimedia.first {
                AsyncImage(url: URL(string: multimedia.url )) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        Text("No photo available")
                    }
                }
                .frame(width: 300, height: 300)
            }
            
            Text(article.abstract)
                .padding()
            Link("Read more", destination: URL(string: article.url)!)
        }
        //.frame(width: 500, height: 500)
        .padding()
        
        
        
    }
}

/*struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleDetailView()
    }
}*/
