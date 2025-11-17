//
//  MealDetailViewModel.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation
import Foundation
import Combine

class MealDetailViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    let mealDetailService: MealDetailServiceProtocol
    @Published var mealDetail: MealDetail?
    
    init(mealDetailService: MealDetailServiceProtocol = MealDetailService()) {
        self.mealDetailService = mealDetailService
    }
    
    func fetchMeaDetail(id: String) {
        mealDetailService.getMealDetail(forId: id)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { data in
                LogService.log(data)
        }, receiveValue: { [weak self] result in
            self?.mealDetail = result.meals.first
        }).store(in: &cancellables)
    }
}
