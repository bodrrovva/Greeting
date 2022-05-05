//
//  GreetingInteractor.swift
//  Greeting
//
//  Created by Student on 29.04.2022.
//

import Foundation
//Interactor обработывает запросы из Presenter. Здесь содержиться основная бизнес логика модуля

protocol GtreetingInteractorProtocol: class{
    //функция формирования данных для приветсвия
    func provideGreetingData()
}

//протокол для исходящих данных
protocol GreetingInteractorOutputProtocol: class {
    //функция передачи данных в другие файлы
    func receiveGreetingData(greetingData: GreetingData)
}

class GreetingInteractor: GtreetingInteractorProtocol{
    
    //сылки
    weak var presentor: GreetingInteractorOutputProtocol!
    
    //инициализатор
    required init(presentor: GreetingInteractorOutputProtocol) {
        self.presentor = presentor
    }
    
    //формируем данные для приветсвия(бизнес логика модуля)
    func provideGreetingData() {
        
        //Обращаемся к моделе данных Person
        let person = Person(name: "Tim", surname: "Cook")
        //subject - полноне имя
        let subject = "\(person.name) \(person.surname)"
        //подготовливаем данные для приветсвия
        let greetingData = GreetingData(greeting: "Hello", subject: subject)
        
        //передаем данные в presenter
        presentor.receiveGreetingData(greetingData: greetingData)
    }
}

