//
//  LogService.swift

//
//  Created by Dev on 12/03/2024.
//

import Foundation
struct LogService{
    static func log(_ input: Any?) {
        print("FetchDebug: \(input ?? "empty log")",separator: "\n")
    }
}
