//
//  Vehicles.swift
//  SampleApp
//
//  Created by Ivan Ivanov on 28.02.22.
//

import Foundation

struct Vehicles: Codable {
    let acura: [String]
    let alfaRomeo: [String]
    let amc: [String]
    let astonMartin: [String]
    let audi: [String]
    let avanti: [String]
    let bentley: [String]
    let bmw: [String]
    let buick: [String]
    let cadillac: [String]
    let chevrolet: [String]
    let chrysler: [String]
    let daewoo: [String]
    let daihatsu: [String]
    let datsun: [String]
    let dodge: [String]
    let ferrari: [String]
    let fiat: [String]
    let ford: [String]
    let gmc: [String]
    let honda: [String]
    let hummer: [String]
    let hyundai: [String]
    let infiniti: [String]
    let isuzu: [String]
    let jaguar: [String]
    let jeep: [String]
    let kia: [String]
    let lamborghini: [String]
    let lancia: [String]
    let landRover: [String]
    let lexus: [String]
    let lincoln: [String]
    let lotus: [String]
    let maserati: [String]
    let maybach: [String]
    let mazda: [String]
    let mcLaren: [String]
    let mercedesBenz: [String]
    let mercury: [String]
    let mini: [String]
    let mitsubishi: [String]
    let nissan: [String]
    let oldsmobile: [String]
    let peugeot: [String]
    let plymouth: [String]
    let pontiac: [String]
    let porsche: [String]
    let ram: [String]
    let renault: [String]
    let rollsRoyce: [String]
    let saab: [String]
    let saturn: [String]
    let scion: [String]
    let smart: [String]
    let subaru: [String]
    let suzuki: [String]
    let tesla: [String]
    let toyota: [String]
    let triumph: [String]
    let volkswagen: [String]
    let volvo: [String]
    let yugo: [String]
    let bugatti: [String]
    let citroen: [String]
    let dacia: [String]
    let opel: [String]
    let seat: [String]
    
    enum CodingKeys: String, CodingKey {
        case acura = "Acura"
        case alfaRomeo = "Alfa Romeo"
        case amc = "AMC"
        case astonMartin = "Aston Martin"
        case audi = "Audi"
        case avanti = "Avanti"
        case bentley = "Bentley"
        case bmw = "BMW"
        case buick = "Buick"
        case cadillac = "Cadillac"
        case chevrolet = "Chevrolet"
        case chrysler = "Chrysler"
        case daewoo = "Daewoo"
        case daihatsu = "Daihatsu"
        case datsun = "Datsun"
        case dodge = "Dodge"
        case ferrari = "Ferrari"
        case fiat = "FIAT"
        case ford = "Ford"
        case gmc = "GMC"
        case honda = "Honda"
        case hummer = "HUMMER"
        case hyundai = "Hyundai"
        case infiniti = "Infiniti"
        case isuzu = "Isuzu"
        case jaguar = "Jaguar"
        case jeep = "Jeep"
        case kia = "Kia"
        case lamborghini = "Lamborghini"
        case lancia = "Lancia"
        case landRover = "Land Rover"
        case lexus = "Lexus"
        case lincoln = "Lincoln"
        case lotus = "Lotus"
        case maserati = "Maserati"
        case maybach = "Maybach"
        case mazda = "Mazda"
        case mcLaren = "McLaren"
        case mercedesBenz = "Mercedes-Benz"
        case mercury = "Mercury"
        case mini = "MINI"
        case mitsubishi = "Mitsubishi"
        case nissan = "Nissan"
        case oldsmobile = "Oldsmobile"
        case peugeot = "Peugeot"
        case plymouth = "Plymouth"
        case pontiac = "Pontiac"
        case porsche = "Porsche"
        case ram = "RAM"
        case renault = "Renault"
        case rollsRoyce = "Rolls-Royce"
        case saab = "Saab"
        case saturn = "Saturn"
        case scion = "Scion"
        case smart = "Smart"
        case subaru = "Subaru"
        case suzuki = "Suzuki"
        case tesla = "Tesla"
        case toyota = "Toyota"
        case triumph = "Triumph"
        case volkswagen = "Volkswagen"
        case volvo = "Volvo"
        case yugo = "Yugo"
        case bugatti = "Bugatti"
        case citroen = "Citroen"
        case dacia = "Dacia"
        case opel = "Opel"
        case seat = "Seat"
    }
    
    var dictionary: [String: Any] {
        return [        "Acura": acura,
                        "Alfa Romeo": alfaRomeo,
                        "AMC": amc,
                        "Aston Martin": astonMartin,
                        "Audi": audi,
                        "Avanti": avanti,
                        "Bentley": bentley,
                        "BMW": bmw,
                        "Buick": buick,
                        "Cadillac": cadillac,
                        "Chevrolet": chevrolet,
                        "Chrysler": chrysler,
                        "Daewoo": daewoo,
                        "Daihatsu": daihatsu,
                        "Datsun": datsun,
                        "Dodge": dodge,
                        "Ferrari": ferrari,
                        "Fiat": fiat,
                        "Ford": ford,
                        "GMC": gmc,
                        "Honda": honda,
                        "Hummer": hummer,
                        "Hyundai": hyundai,
                        "Infiniti": infiniti,
                        "Isuzu": isuzu,
                        "Jaguar": jaguar,
                        "Jeep": jeep,
                        "Kia": kia,
                        "Lamborghini": lamborghini,
                        "Lancia": lancia,
                        "Land Rover": landRover,
                        "Lexus": lexus,
                        "Lincoln": lincoln,
                        "Lotus": lotus,
                        "Maserati": maserati,
                        "Maybach": maybach,
                        "Mazda": mazda,
                        "McLaren": mcLaren,
                        "Mercedes Benz": mercedesBenz,
                        "Mercury": mercury,
                        "Mini": mini,
                        "Mitsubishi": mitsubishi,
                        "Nissan": nissan,
                        "Oldsmobile": oldsmobile,
                        "Peugeot": peugeot,
                        "Plymouth": plymouth,
                        "Pontiac": pontiac,
                        "Porsche": porsche,
                        "RAM": ram,
                        "Renault": renault,
                        "Rolls Royce": rollsRoyce,
                        "Saab": saab,
                        "Saturn": saturn,
                        "Scion": scion,
                        "Smart": smart,
                        "Subaru": subaru,
                        "Suzuki": suzuki,
                        "Tesla": tesla,
                        "Toyota": toyota,
                        "Triumph": triumph,
                        "Volkswagen": volkswagen,
                        "Volvo": volvo,
                        "Yugo": yugo,
                        "Bugatti": bugatti,
                        "Citroen": citroen,
                        "Dacia": dacia,
                        "Opel": opel,
                        "Seat": seat
        ]
    }
    var nsDictionary: NSDictionary {
        return dictionary as NSDictionary
    }
}
