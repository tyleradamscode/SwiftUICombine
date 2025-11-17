//
//  MealViewModel.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation
import Combine

class MealViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    private let mealService: MealServiceProtocol
    @Published var mealList: [Meal] = []
    
    init(mealService: MealServiceProtocol = MealService()) {
        self.mealService = mealService
    }
    
    func fetchMealList() {
        mealService.getMealsList(for: "Dessert")
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
                LogService.log(data)
        }, receiveValue: {[weak self] result in
            self?.mealList = result.meals
        }).store(in: &cancellables)
    }
}
