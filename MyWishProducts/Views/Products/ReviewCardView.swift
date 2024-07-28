//
//  ReviewCardView.swift
//  MyWishProducts
//
//  Created by Fauzan Dwi Prasetyo on 28/07/24.
//

import SwiftUI

struct ReviewCardView: View {
    var review: ProductReview
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                userInfo
                
                Spacer()
                
                rating
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 0))
            
            // comment
            Text(review.comment)
        }
        .padding(20)
        .background(.thinMaterial)
        .cornerRadius(10)
    }
}

extension ReviewCardView {
    private var userInfo: some View {
        VStack(alignment: .leading) {
            Text(review.reviewerName)
                .font(.headline)
            Text(review.reviewerEmail)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    private var rating: some View {
        HStack(spacing: 1) {
            ForEach(1...5, id: \.self) { number in
                number <= review.rating ?
                Image(systemName: "star.fill")
                : Image(systemName: "star")
            }
            .foregroundColor(.yellow)
            .font(.caption)
        }
        .font(.title3)
        .fontWeight(.bold)
    }
}

//struct ReviewCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewCardView()
//    }
//}
