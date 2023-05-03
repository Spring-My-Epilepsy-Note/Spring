//
//  ContentView.swift
//  Spring Watch App
//
//  Created by Hyesung Jeon on 2023/05/03.
//

import SwiftUI
import HealthKit

struct ContentView: View {
    
    init() {
        let healthStore = HKHealthStore()
        let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
        healthStore.requestAuthorization(toShare: nil, read: Set([heartRateType])) { (success, error) in
            if let error = error {
                // Handle error here
                print("Error requesting HealthKit authorization: \(error.localizedDescription)")
                return
            }
            
            if success {
                // HealthKit authorization granted
            } else {
                // HealthKit authorization denied
            }
        }
    }
    @State var heartRate: Double = 0
    
    var body: some View {
        VStack {
            Text("심박수: \(Int(heartRate))")
                .font(.title)
            Button("심박수 측정") {
                let healthStore = HKHealthStore()
                let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
                let now = Date()
                
                // Define the sample query
                let heartRateQuery = HKAnchoredObjectQuery(type: heartRateType,
                                                           predicate: nil,
                                                           anchor: nil,
                                                           limit: HKObjectQueryNoLimit) { (query, samples, deletedObjects, anchor, error) in
                    guard let mostRecentSample = samples?.last as? HKQuantitySample else {
                        // Handle error here
                        print("error")
                        return
                    }
                    
                    let heartRateUnit = HKUnit(from: "count/min")
                    let heartRate = mostRecentSample.quantity.doubleValue(for: heartRateUnit)
                    
                    DispatchQueue.main.async {
                        self.heartRate = heartRate
                        print(self.heartRate)
                    }
                }
                
                // Set the update handler for the query
                heartRateQuery.updateHandler = { (query, samples, deletedObjects, anchor, error) in
                    guard let mostRecentSample = samples?.last as? HKQuantitySample else {
                        // Handle error here
                        print("error")
                        return
                    }
                    
                    let heartRateUnit = HKUnit(from: "count/min")
                    let heartRate = mostRecentSample.quantity.doubleValue(for: heartRateUnit)
                    
                    DispatchQueue.main.async {
                        self.heartRate = heartRate
                        print(self.heartRate)
                    }
                }
                
                // Execute the query
                healthStore.execute(heartRateQuery)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
