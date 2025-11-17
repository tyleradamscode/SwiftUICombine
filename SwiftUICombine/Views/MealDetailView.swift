//
//  MealDetailView.swift

//
//  Created by Dev on 12/03/2024.
//
import SwiftUI

struct MealDetailView: View {
    @StateObject var mealDetailViewModel: MealDetailViewModel
    let mealId: String

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let mealDetail = mealDetailViewModel.mealDetail {
                Text(mealDetail.name)
                    .font(.title)
                    .fontWeight(.bold)
                Text("Instructions:")
                    .font(.headline)
                Text(mealDetail.instructions)
                    .font(.body)
                Text("Ingredients:")
                    .font(.headline)
                ScrollView{
                    ForEach(0..<mealDetail.ingredients.count, id: \.self) { index in
                        HStack {
                            Text("\(mealDetail.ingredients[index]) - \(mealDetail.measurements[index])")
                            Spacer()
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .padding()
        .navigationBarTitle("Meal Detail")
        .onAppear {
            mealDetailViewModel.fetchMeaDetail(id: mealId)
        }
    }
}
