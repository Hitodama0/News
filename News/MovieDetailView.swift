//
//  MovieDetailView.swift
//  News
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: MovieReview
    var body: some View {
        VStack(spacing: 10){
            Text("Title: \(movie.display_title)")
            Text("Rating: \(movie.mpaa_rating)")
            Text("Summary Review: \(movie.summary_short)")
            Link("\(movie.link.suggested_link_text)", destination: URL(string: movie.link.url)!)
            
        }
        .padding()
    }
}

/*struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}*/
