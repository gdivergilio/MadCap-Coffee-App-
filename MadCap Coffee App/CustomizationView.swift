//
//  CustomizationView.swift
//  MyApp
//
//  Created by Gabriella Divergilio on 9/29/26.
//
import SwiftUI

struct CustomizationView: View {
    @State var coffee: Coffee
    @State private var showingSheet = false
    @State private var specialRequest = ""
    @Environment(\.dismiss) var dismiss  //back arrow button

    var body: some View {
        
        
        ZStack{
            Color.lightBackground
                .ignoresSafeArea()
            ScrollView {
                VStack{
                    ZStack(alignment: .bottom) {
                        Color.customPageTan
                        Image(coffee.photoName)
                            .resizable()
                            .scaledToFit()
                            .frame(height:160)
                            .padding(.bottom, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 260)
                    VStack(alignment: .leading) {
                        Text(coffee.name)
                            .font(.title2)
                            .bold()
                            .foregroundStyle(Color.darkBrown)
                        
                        Text(coffee.details)
                            .font(.caption)
                            .foregroundStyle(Color.secondText)
                        
                        Divider()
                            .padding(.bottom,0)
                            .frame(height: 1)              // ← new: line thickness
                            .overlay(Color.darkBrown)
                        
                        Text("Size")
                        HStack(spacing: 0) {                                          // ← new, replaces the Picker
                            ForEach(Drinksize.allCases, id: \.self) { size in
                                Button {
                                coffee.size = size
                                } label: {
                                    Text(size.rawValue)
                                        .font(.system(size: 14))
                                        .foregroundStyle(Color.darkBrown)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 32)
                                        .background(coffee.size == size ? Color.selectedFill : Color.clear)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                        .padding(3)
                        .background(Color.lightBackground, in: Capsule())
                        .overlay(
                            Capsule()
                                .strokeBorder(Color.darkBrown, lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                        Text("Milk")
                        HStack(spacing: 0) {
                            ForEach(Milk.allCases, id: \.self) { milk in
                                Button {
                                    coffee.milkType = milk
                                } label: {
                                    Text(milk.rawValue)
                                        .font(.system(size: 14))
                                        .foregroundStyle(Color.darkBrown)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 32)
                                        .background(coffee.milkType == milk ? Color.selectedFill : Color.clear)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                        .pickerStyle(.segmented)
                        .overlay(
                            Capsule()
                                .strokeBorder(Color.darkBrown, lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                        Text("Sweetness")
                        HStack(spacing:0) {
                            ForEach(Sweetness.allCases, id: \.self) { level in
                                Button {
                                    coffee.sweet = level
                                } label: {
                                    Text(level.rawValue)
                                        .font(.system(size: 14))
                                        .foregroundStyle(Color.darkBrown)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 32)
                                        .background(coffee.sweet == level ? Color.selectedFill : Color.clear)
                                        .clipShape(Capsule())
                                }
                            }
                        }
                        .pickerStyle(.segmented)
                        .overlay(
                            Capsule()
                                .strokeBorder(Color.darkBrown, lineWidth: 1)
                        )
                        .padding(.bottom, 10)
                        
                        Text("Ice")
                        HStack(spacing:0) {
                            ForEach(Ice.allCases, id: \.self) { ice in
                                Button {
                                    coffee.iceType = ice
                            } label: {
                                Text(ice.rawValue)
                                    .font(.system(size: 14))
                                    .foregroundStyle(Color.darkBrown)
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 32)
                                    .background(coffee.iceType == ice ? Color.selectedFill : Color.clear)
                                    .clipShape(Capsule())
                                }
                            }
                        }
                        .pickerStyle(.segmented)
                        .overlay(
                            Capsule()
                                .strokeBorder(Color.darkBrown, lineWidth: 1)
)
                        .padding(.bottom, 10)
                        Text("Espresso")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(Espresso.allCases, id: \.self) { shot in       // one button per espresso option
                                    Button {
                                        coffee.espresso = shot                           // save this option when tapped
                                    } label: {
                                        Text(shot.rawValue)
                                            .font(.system(size: 12))
                                            .foregroundStyle(Color.darkBrown)            // dark brown text
                                            .frame(width: 103, height: 67)               // button size
                                            .background(coffee.espresso == shot ? Color.selectedFill : Color.clear)  // tan if selected
                                            .clipShape(RoundedRectangle(cornerRadius: 16))   // rounded corners
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .strokeBorder(Color.darkBrown, lineWidth: 1)   // dark brown outline
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.bottom, 10)
                        Text("Add-ons")
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(AddOn.allCases, id: \.self) { addOn in       // one button per espresso option
                                    Button {
                                        if coffee.addOns.contains(addOn){
                                            coffee.addOns.remove(addOn)
                                        } else {
                                            coffee.addOns.insert(addOn)
                                        }
                                    } label: {
                                        Text(addOn.rawValue)
                                            .font(.system(size: 12))
                                            .foregroundStyle(Color.darkBrown)            // dark brown text
                                            .frame(width: 77, height: 60)               // button size
                                            .background(coffee.addOns.contains(addOn) ? Color.selectedFill : Color.clear)  // tan if selected
                                            .clipShape(RoundedRectangle(cornerRadius: 13))   // rounded corners
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 13)
                                                    .strokeBorder(Color.darkBrown, lineWidth: 1)
                                            )
                                    }
                                }
                            }
                        }
                        .padding(.bottom,20)
                        
                        TextField("Add Special Instructions (optional)", text: $specialRequest,
                                  prompt: Text("Add Special Instructions (optional)")
                            .foregroundStyle(Color.darkBrown.opacity(0.6)))
                        .foregroundStyle(Color.darkBrown)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.darkBrown, lineWidth: 1)
                        )
                        Button {
                            if !specialRequest.isEmpty {              // did they type a note?
                                coffee.note = specialRequest          // yes → save it
                            }
                            showingSheet = true                       // open the confirmation
                        } label: {
                            Text("Add to Order")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)              // white text
                                .frame(width: 300)           // stretch full width
                                .frame(height: 44)                    // bar height
                                .background(Color.darkBrown)          // dark brown fill
                                .clipShape(RoundedRectangle(cornerRadius: 16))   // rounded corners
                        }
                        .padding(.top, 10)
                        .sheet(isPresented: $showingSheet) {
                            OrderConformation(confirmedOrder: coffee)
                        }
                        .frame(maxWidth: .infinity)    // ← centers the button in its row
                        
                        Image("logoMadCap")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 20)
                            .padding(.bottom, 30)
                    }
                    .padding(.horizontal)
                    // attached to second vstack
                }
            }
            .scrollIndicators(.hidden)
           
            Button {
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Back")
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .foregroundStyle(.white)
                .background(Color.darkBrown)
                .clipShape(Capsule())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)   // top-left corner
            .padding(.top, 60)                                                      // below the notch
            .padding(.leading, 16)
        }
        .ignoresSafeArea(edges: .top)
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    CustomizationView(coffee: Coffee(name: "Strawberry Matcha", assetname: "strawberrymatcha1", photoName: "Strawberrymatcha2", details: "Matcha with milk and strawberry syrup, served over ice"))
}
