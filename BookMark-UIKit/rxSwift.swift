//
//  rxSwift.swift
//  BookMark-UIKit
//
//  Created by Nail Kamilov on 14.06.2022.
//
import UIKit

class rxSwift: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// "I have an array of observables..."
let one = Observable.deferred { Observable.just(1) }
let two = Observable.deferred { Observable.just(2) }
let observables = [one, two]

// "the output of each, should be the input of the next"
// this is problematic, because observables do not strictly have inputs.
let resultsFromEach = Observable.concat(observables)

resultsFromEach
    .reduce(0) { result, next in
        result + 1
    }
    .debug("result")
    .subscribe()
