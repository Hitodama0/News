//
//  HeadlinesModel.swift
//  News
//
//  Created by Biagio Ricci on 12/04/23.
//

import Foundation

class HeadlinesModel: ObservableObject {
    @Published var results: [Result] = []
    func fetch() {
        let apiKey = ""
        
        guard let url = URL(string: "https://api.nytimes.com/svc/topstories/v2/movies.json?api-key=\(apiKey)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self.results = results.results
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
