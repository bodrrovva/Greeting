//
//  GreetingPresenter.swift
//  Greeting
//
//  Created by Student on 29.04.2022.
//

import Foundation
//Presenter обеспечивает общение View с другими файлами и определяеют куда направить запрос(Router, Interactor). Подготавливает и передает данные обратно во View.

struct GreetingData {
    let greeting: String
    let subject: String
}

protocol GreetingPresentorProtocol: class {
    //функция нажатия кнопки(что нужно сделать)
    func didTabShowGreetingButton()
}

class GreetingPresentor: GreetingPresentorProtocol {
    //ссылки
    weak var view: GreetingViewProtocol!
    var interactor: GtreetingInteractorProtocol!

    //инициализатор
    required init(view: GreetingViewProtocol){
        self.view = view
    }
    
    //обращаемся в Interator
    func didTabShowGreetingButton() {
        interactor.provideGreetingData()
    }
}

//расширение
extension GreetingPresentor: GreetingInteractorOutputProtocol{
    //формируем приветсвие из полученных данных
    func receiveGreetingData(greetingData: GreetingData) {
        let greeting = "\(greetingData.greeting), \(greetingData.subject)!"
        
        //передаем данные во View
        view.setGreeting(greeting: greeting)
    }
}
