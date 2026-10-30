import SwiftUI

struct ContentView: View {
    let coffees: [Coffee] = [
        Coffee(name: "Strawberry Matcha", assetname: "strawberrymatcha1", photoName: "Strawberrymatcha2",
               details: "Matcha with milk and strawberry syrup, served over ice"), Coffee(name: "Blueberry Matcha", assetname: "blueberrymatcha1", photoName: "Blueberrymatcha", details: "Matcha with milk and blueberry syrup, served over ice"),Coffee(name: "Pumpkin Spice Latte", assetname: "pumpkinspice1", photoName: "Icedlatte", details: "Two espresso shots with pumpkin syrup, milk, cold foam, and cinnamon")
    ]
    let favorites: [Coffee] = [
        Coffee(name:"Cappuccino", assetname: "cappacinoFav", photoName: "Cappuccino", details: "Espresso with steamed milk and a thick layer of foam"), Coffee(name:"Iced Matcha", assetname: "matchaFav", photoName: "Matcha",  details: "Matcha with your choice of milk, served over ice"), Coffee(name:"Iced Coffee", assetname: "icedCoffeeFav", photoName: "Icedcoffee", details: "Cold brewed coffee served over ice"), Coffee(name:"Hot Latte", assetname: "hotLatteFav", photoName: "Hotlatte", details: "Two espresso shots with your choice of steamed milk"), Coffee(name: "Iced Latte", assetname: "icedLatteFav", photoName: "Icedlatte")
    ]
    let products:[Product] = [
        Product(name: "Madcap Classic: Clombian", imageName: "coffeePlain" , price: 16.99, details: "Your everyday coffee. Balanced, smooth, and approachable. Use the brown and cream bag you designed."), Product(name: "Midnight Bolt: Sumatran", imageName: "coffeeBackground", price: 28.99, details: "A stronger, deeper-tasting coffee for people who love bold flavors. Use a matte black bag with white lettering."), Product(name: "Morning Rush:Ethiopian", imageName: "coffeeTan", price: 30.99, details: "A brighter, fruitier coffee with a more adventurous flavor. Use your Detroit mural-inspired bag."), Product(name: "Matcha Ritual: Japanese Matcha", imageName: "coffeeMatcha", price: 20.99, details: "A premium, vibrant green tea powder that can be whisked or used for matcha lattes. Use your earthy green Detroit-themed bag.")
    ]
    
    
    
    
    
    var body: some View {
        NavigationStack { // lets screens slide to other screens
            ScrollView {
                VStack(alignment: .leading) { // NEW: stacks things top to bottom, lined up on the left
                    ZStack(alignment: .bottom) {
                        Image("MainCustomization") //big photo
                            .resizable()
                            .scaledToFit()
                            .clipped()
                        
                        NavigationLink {
                            CustomizationView(coffee: Coffee(name: "Iced Latte", assetname: "Icedlatte", photoName: "Icedlatte"))
                        } label: {
                            HStack(spacing: 30) {
                                Text("Build Your Drink")
                                Image(systemName: "chevron.right")
                            }
                            .foregroundStyle(.white)
                            .frame(width: 228)
                            .frame(height: 48)
                            .background(Color.darkBrown)
                            .clipShape(RoundedRectangle(cornerRadius: 19.5))
                            .offset(y: 21)
                        }
                    }
                    Text("Favorites")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top, 15)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(favorites, id: \.self) { favs in
                                NavigationLink {
                                    CustomizationView(coffee: favs)
                                } label: {
                                    Image(favs.assetname)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 110, height: 110)
                                        .clipShape(Circle())
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    Text("Seasonal Specials") // new section title
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top, 12)
                    
                    ScrollView(.horizontal) { //lets the row scroll sideways
                        HStack(spacing: 8) {
                            ForEach(coffees, id: \.self) { coffee in // repeat for each drink in the list
                                NavigationLink {
                                    CustomizationView(coffee: coffee) // where tapping goes
                                } label: {
                                    CoffeeTileView(coffee: coffee)
                                }
                            }
                        }
                        .padding(.horizontal)

                    }
                    
                    Text("Shop Coffee")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal)
                        .padding(.top, 12)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(products, id: \.self) { product in
                                ProductTileView(coffeeBag: product)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Image("logoMadCap")                 // ← logo here
                        .resizable()
                        .scaledToFit()
                        .frame(height: 24)
                        .frame(maxWidth: .infinity)     // centers it
                        .padding(.top, 30)
                        .padding(.bottom, 30)
                }
            }
            .ignoresSafeArea(edges: .top)
            .background(Color.customPageTan.ignoresSafeArea())
        }
    }
}
#Preview {
    ContentView()
}

