

import Foundation

enum carType {
    case легковой, грузовой
}

struct WidthLengthWeight {
    var width: Int
    var length : Int
    var weight : Int
}

class Car {
    var model: String = ""
    var type: carType
    var widthLengthWeight: WidthLengthWeight
    
    static var userCount = 0
    
    init(model: String, type: carType, widthLengthWeight: WidthLengthWeight) {
        self.model = model
        self.type = type
        self.widthLengthWeight = widthLengthWeight
        
        Car.userCount += 1
    }
    
    deinit {
        Car.userCount -= 1
    }
    
    static func countInfo() {
        print("Необходимые данные \(self.userCount) отсутствуют.")
    }
    
    func  carWeight() {
        let age = widthLengthWeight.weight
        print("Автомобиль \(model) весит - \(age)кг.")
    }
    
    func printInfo() {
        print("Это информация о автомобиле \(model). тип автомобиля: \(type), данные ШД и Вес: \(widthLengthWeight.width)см \(widthLengthWeight.length)см \(widthLengthWeight.weight)кг")
        print(carWeight())
    }
    
}

class ProfileAboutCar: Car {
    var color : String
    var toner : String
    var vehicleInterior : String
    var transmission : String
    var music: String
    
    init(model: String, type: carType, widthLengthWeight: WidthLengthWeight, color: String, toner: String, vehicleInterior: String, transmission: String, music: String) {
        self.color = color
        self.toner = toner
        self.vehicleInterior = vehicleInterior
        self.transmission = transmission
        self.music = music
        
        super.init(model: model, type: type, widthLengthWeight: widthLengthWeight)
    }
    
    override func printInfo() {
        super.printInfo()
        print("Немного информации о автомобиле \(model) и его хорактеристиках: цвет : \(color), тонировка на стеклах: \(toner), салон автомобиля: \(vehicleInterior), коробка: \(transmission), наличие музыки: \(music)")
    }
    
}

class CarInforming : Car{
    var dorNum : String
    var windowLifter : String
    var hitch : String
    
    init(model: String, type: carType, widthLengthWeight: WidthLengthWeight, dorNum: String, windowLifter: String, hitch: String) {
        self.dorNum = dorNum
        self.windowLifter = windowLifter
        self.hitch = hitch
        
        super.init(model: model, type: type, widthLengthWeight: widthLengthWeight)
    }
    
    func addHitch(newHitch: String) {
        self.hitch = hitch + "," + newHitch
    }
    
    override func printInfo() {
        super.printInfo()
        print ("\(model) количество дверей: \(dorNum), стеклоподъемники: \(windowLifter), фаркоп: \(hitch)")
    }
}

var truckOne = CarInforming(model: "Volvo", type: .легковой, widthLengthWeight: .init(width: 2040, length: 1250, weight: 1400), dorNum: "пять", windowLifter: "установлены на четырех дверях", hitch: "фаркоп установлен")
truckOne.printInfo()
truckOne.addHitch(newHitch: " допом в комплект входит прицеп 'СТЕПОК'.")
truckOne.printInfo()

var truckTwo = ProfileAboutCar(model: "Камаз", type: .грузовой, widthLengthWeight: .init(width: 5050, length: 2500, weight: 6400), color: "Красный", toner: "отсутствует", vehicleInterior: "кожзам", transmission: "механика", music: "WiFi магнитола с двумя динамиками")
truckTwo.printInfo()

print(Car.countInfo())

