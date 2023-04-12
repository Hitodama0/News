//
//  ArticleSearchDetailView.swift
//  News
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct ArticleSearchDetailView: View {
    var article: Article
    var body: some View {
        VStack{
            Text(article.lead_paragraph)
                .padding()
            Link("Read more", destination: URL(string: article.web_url)!)
        }
    }
}

/*struct ArticleSearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleSearchDetailView()
    }
}*/
