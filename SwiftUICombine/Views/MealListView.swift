//
//  MealListView.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation
import SwiftUI

struct MealListView: View {
    @StateObject var mealListViewModel: MealViewModel
    
    var body: some View {
        NavigationView {
            if mealListViewModel.mealList.isEmpty {
                ProgressView()
                    .onAppear {
                        mealListViewModel.fetchMealList()
                    }
            } else {
                List(mealListViewModel.mealList, id: \.id) { meal in
                    NavigationLink(destination: MealDetailView(
                        mealDetailViewModel: MealDetailViewModel(),
                        mealId: meal.id)) {
                            MealRow(meal: meal)
                        }
                }
                .navigationTitle("Meals")
            }
        }
    }
}

struct MealRow: View {
    let meal: Meal
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.thumbnailURL)) { phase in
                switch phase {
                case .empty:
                    ZStack {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                @unknown default:
                    EmptyView()
                }
            }
            .padding(.trailing, 8)
            
            Text(meal.name)
                .font(.headline)
        }
        .padding(.vertical, 8)
    }
}
