//
//  MovieView.swift
//  News
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct MovieView: View {
    @State private var search = ""
    @State private var movies: [MovieReview] = []
    var body: some View {
        NavigationView {
            List {
                ForEach(movies, id: \.display_title) {
                    movie in NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        VStack{
                            Text(movie.display_title)
                        }
                        .padding()
                    }
                }
            }
            .searchable(text: $search)
            .onChange(of: search) {
                newValue in searchFunc()
            }
            .navigationTitle("Movie")
        }
    }
    func searchFunc() {
        let apiKey = ""
        guard let url = URL(string: "https://api.nytimes.com/svc/movies/v2/reviews/search.json?query=\(search)&api-key=\(apiKey)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let result = try JSONDecoder().decode(ReviewsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.movies = result.results
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

/*struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}*/
