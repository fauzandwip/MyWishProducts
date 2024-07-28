//
//  ProductReviewListView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 28/07/24.
//

import SwiftUI

struct ProductReviewListView: View {
    var reviews: [ProductReview]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Reviews :")
                .font(.title3)
                .fontWeight(.semibold)
            List(reviews, id: \.self) { review in
                ReviewCardView(review: review)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
            }
            .listStyle(.plain)
            .frame(minHeight: 400)
        }
    }
}

//struct ProductReviewListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductReviewListView()
//    }
//}
