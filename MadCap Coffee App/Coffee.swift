//
//  Coffee.swift
//  MyApp
//
//  Created by Gabriella Divergilio on 9/29/26.
// String = each size has a text label (for the buttons)
// CaseIterable = Swift can list all sizes (so the Picker can make a button for each)

enum Drinksize: String, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
    
    var price: Double {
        switch self {
        case .small:
            return 4.47
        case .medium:
            return 5.47
        case .large:
            return 6.47
        }
    }
}
enum Milk: String, CaseIterable {
    case whole = "Whole"
    case oat = "Oat"
    case breve = "Breve"
    case almond = "Almond"
}
enum Sweetness: String, CaseIterable {
    case none = "None"
    case regular = "Regular"
    case extraSweet = "Extra Sweet"
    case lessSweet = "Less Sweet"
}
enum Ice: String, CaseIterable {
    case lightIce = "Light Ice"
    case regular = "Regular"
    case extraIce = "Extra Ice"
}
enum Espresso: String, CaseIterable {
    case single = " Add a single shot"
    case double = " Add a double shot"
    case quad = "Add a quad shot"
    case decaf = "Decaf"
    var price: Double {
        switch self {
        case .single:
            return 0.75
        case .double:
            return 1.50
        case .quad:
            return 3.00
        case .decaf:
            return 0
        }
    }
}
enum AddOn: String, CaseIterable {
    case vanilla = "Vanilla"
    case mocha = "Mocha"
    case caramel = "Caramel"
    case coldFoam = "Cold Foam"
}
struct Coffee: Hashable {
    var name: String
    var assetname: String
    var photoName: String
    var size : Drinksize = .medium
    var milkType: Milk = .whole
    var sweet: Sweetness = .none
    var iceType: Ice = .lightIce
    var espresso: Espresso = .single
    var addOns: Set<AddOn> = []
    var note: String?
    var details: String = ""

    func calculatePrice() -> Double {        // ← new: adds up the drink's price
        return size.price + espresso.price + Double(addOns.count) * 1.00
    }
}
