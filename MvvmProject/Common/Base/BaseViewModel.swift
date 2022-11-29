//
//  BaseViewModel.swift
//  MvvmProject
//
//  Created by Test VPN on 29/11/2022.
//

import Foundation
import RxSwift

class BaseViewModel{
    struct BaseOutput{
        let alert : PublishSubject<String>
        let loading : PublishSubject<Bool>
    }
    
    
}
