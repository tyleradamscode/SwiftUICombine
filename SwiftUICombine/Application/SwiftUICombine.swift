//
//  Created by Dev on 12/03/2024.
//

import SwiftUI

@main
struct SwiftUICombine: App {
    var body: some Scene {
        WindowGroup {
            MealListView(mealListViewModel: MealViewModel())
        }
    }
}
