//
//  SearchView.swift
//  News
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct SearchView: View {
    @State private var search = ""
    @State private var articles: [Article] = []
    var body: some View {
        NavigationView {
            List {
                ForEach(articles, id: \.web_url) {
                    article in NavigationLink {
                        ArticleSearchDetailView(article: article)
                    } label: {
                        VStack{
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
                                .frame(width: 200, height: 200)
                            }
                            
                            Text(article.snippet)
                                .foregroundColor(.pink)
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
                }
            }
            .searchable(text: $search)
            .onChange(of: search) {
                newValue in searchFunc()
            }
            .navigationTitle("Search")
        }
    }
    func searchFunc() {
        let apiKey = ""
        guard let url = URL(string: "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=\(search)&api-key=\(apiKey)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(ArticleResponse.self, from: data)
                DispatchQueue.main.async {
                    self.articles = result.response.docs
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

/*struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}*/
