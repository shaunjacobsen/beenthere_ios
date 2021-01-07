//
//  HealthKitSetupAssistant.swift
//  Been There
//
//  Created by Shaun Jacobsen on 06/01/2021.
//

import HealthKit

class HealthKitSetupAssistant {
  
  private enum HealthkitSetupError: Error {
    case notAvailableOnDevice
    case dataTypeNotAvailable
  }
  
  class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
    // is HealthKit available?
    guard HKHealthStore.isHealthDataAvailable() else {
      completion(false, HealthkitSetupError.notAvailableOnDevice)
      return
    }
    
    // get data we want from HealthKit
    guard let birthdate = HKObjectType.characteristicType(forIdentifier: .dateOfBirth) else {
        return
    }
    
    
    let healthKitTypesToRead: Set<HKObjectType> = [birthdate, HKObjectType.workoutType()]
    
    // get authorisation
    HKHealthStore().requestAuthorization(toShare: nil, read: healthKitTypesToRead) { (success, error) in
        completion(success, error)
    }
    
  }
}
