//
//  CoffeeTileView.swift
//  MyApp
//
//  Created by Gabriella Divergilio on 9/29/26.
//

import SwiftUI
//this tile has a slot called coffee, and whatever goes in it must be a Coffee.

struct CoffeeTileView: View {
    let coffee: Coffee
    var body: some View {
        VStack(spacing: 6) {
            Image (coffee.photoName)
                .resizable()
                .scaledToFit()
                .frame(height: 130)
            
            Text(coffee.name)
                .font(.system(size: 12, weight: .semibold))
                .foregroundStyle(Color.darkBrown)
            
            Text(coffee.details)
                .font(.system(size: 11))
                .foregroundStyle(Color.secondText)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(width: 140)
        .padding(12)
        .background(Color.selectedFill)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
        
    #Preview {
        CoffeeTileView(coffee: Coffee(name: "Strawberry Matcha", assetname: "strawberrymatcha1", photoName: "Strawberrymatcha2", details: "Macha with milk and strawberry syrup, served with over ice "))
    }
