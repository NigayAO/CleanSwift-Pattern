//
//  GreetingPresenter.swift
//  CleanSwift Pattern
//
//  Created by Alik Nigay on 20.03.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol GreetingPresentationLogic {
    func presentSomething(response: Greeting.Something.Response)
}

class GreetingPresenter: GreetingPresentationLogic {
    
    weak var viewController: GreetingDisplayLogic?
    
    func presentSomething(response: Greeting.Something.Response) {
        let viewModel = Greeting.Something.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
