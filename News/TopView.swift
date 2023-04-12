//
//  TopView.swift
//  News
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct TopView: View {
    @StateObject var headlinesModel = HeadlinesModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(headlinesModel.results, id: \.url) {
                    result in NavigationLink {
                        ArticleDetailView(article: result)
                    } label: {
                        VStack{
                            if let multimedia = result.multimedia.first {
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
                            VStack{
                                Text("\(result.title)")
                                    .foregroundColor(.pink)
                                    .fontWeight(.bold)
                                Divider()
                                Text(result.abstract)
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("TOP STORIES")
            .onAppear {
                headlinesModel.fetch()
            }
        }
    }
}

/*struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}*/
