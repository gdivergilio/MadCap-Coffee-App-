//
//  ProductTileView.swift
//  MadCap Coffee App
//
//  Created by Gabriella Divergilio on 10/8/26.
//

import SwiftUI

struct ProductTileView: View {
    let coffeeBag : Product

    var body: some View {
        VStack {
            Image(coffeeBag.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 100)
            Text(coffeeBag.name)
            Text(coffeeBag.price, format: .currency(code: "USD"))

        }
        .frame(width: 100)
        .padding()
        .background(.selectedFill)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .multilineTextAlignment(.center)
        .lineLimit(2)
    }
}

#Preview {
    ProductTileView(coffeeBag:Product(name: "Midnight Bolt: Sumatran", imageName: "coffeeBackground", price: 28.99, details: "A stronger, deeper-tasting coffee for people who love bold flavors. Use a matte black bag with white lettering."))
}
