//
//  OrderConformationPage.swift
//  MyApp
//
//  Created by Gabriella Divergilio on 9/29/26.
//

import SwiftUI
struct OrderConformation: View {
    let confirmedOrder: Coffee
    @Environment(\.dismiss) var dismiss
    var subtotal: Double {
        confirmedOrder.calculatePrice()
    }
    var tax: Double {
        subtotal * 0.06
    }
    var total: Double {
        subtotal + tax
    }
    
    var body: some View {
        ZStack {
            Color.lightBackground
                .ignoresSafeArea()
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.greenCheck)
                        .frame(width: 100, height: 100)
                    
                    Image(systemName: "checkmark")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.white)
                    
                }
                .padding(.bottom, 12)
                Text("Order Confirmed")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundStyle(Color.darkBrown)
                
                    .padding(5)
                Text("Your drink is being prepared. \nWe'll let you know when it's ready!")
                    .multilineTextAlignment(.center)
                
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(Color.secondText)
                VStack {
                    
                    HStack {
                        Image(confirmedOrder.photoName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .padding(.trailing,20)
                        
                        VStack(alignment: .leading) {
                            Text(confirmedOrder.name)
                                .frame(maxWidth: .infinity)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(Color.darkBrown)
                                .padding(.bottom, 8)
                            
                            HStack {
                                Text("Size")
                                Spacer()
                                Text(confirmedOrder.size.rawValue)
                                    .foregroundStyle(Color.secondText)
                            }
                            
                            HStack {
                                Text("Milk")
                                Spacer()
                                Text(confirmedOrder.milkType.rawValue)
                                    .foregroundStyle(Color.secondText)
                            }
                            
                            HStack {
                                Text("Sweetness")
                                Spacer()
                                Text(confirmedOrder.sweet.rawValue)
                                    .foregroundStyle(Color.secondText)
                            }
                            
                            HStack {
                                Text("Add-On's")
                                Spacer()
                                Text(confirmedOrder.addOns.isEmpty ? "None" : confirmedOrder.addOns.map { $0.rawValue }.joined(separator: ", "))
                                    .foregroundStyle(Color.secondText)
                            }
                            
                            HStack {
                                Text("Ice")
                                Spacer()
                                Text(confirmedOrder.iceType.rawValue)
                                    .foregroundStyle(Color.secondText)
                            }
                            
                            HStack {
                                Text("Espresso")
                                Spacer()
                                Text(confirmedOrder.espresso.rawValue)
                                    .foregroundStyle(Color.secondText)
                            }
                        }
                        Spacer()
                        
                    }
                }
                
                .padding()
                .frame(width: 364, height: 201, alignment: .top)
                .background(Color.selectedFill)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.horizontal)
                .padding(.top, 20)
                
                VStack {
                    Divider()
                        .frame(height: 1)              // ← new: line thickness
                        .overlay(Color.darkBrown)
                    HStack {
                        Text("Subtotal")
                        Spacer()
                        Text(subtotal, format: .currency(code: "USD"))
                    }
                    .padding(.horizontal, 20)
                    
                    HStack {
                        Text("Tax")
                        Spacer()
                        Text(tax, format: .currency(code: "USD"))
                    }
                    .padding(.horizontal,20)
                    
                    Divider()
                        .frame(height: 1)              // ← new: line thickness
                        .overlay(Color.darkBrown)
                    HStack {
                        Text("Total")
                            .fontWeight(.semibold)
                        Spacer()
                        Text(total, format: .currency(code: "USD"))
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal, 20)
                    
                }
                .frame(width: 364)                  // same width as the box
                .padding(.top, 12)                  // space between the box and the prices
                .foregroundStyle(Color.darkBrown)
                Button {
                    dismiss()
                } label: {
                    Text("Back to Home")
                        .font(.system(size:16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width:300, height: 44)
                        .background(Color.darkBrown)
                        .clipShape(RoundedRectangle(cornerRadius:16))
                }
                .padding(.top, 20)
                
                Image("logoMadCap")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 30)
                    .padding(.top, 20)
            }
            .frame(maxHeight: .infinity, alignment: .top)    // ← fill the screen, line up at the top
                .padding(.top, 110)
            
            Button {
                dismiss()
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.darkBrown)
                        .frame(width: 44, height: 44)
                    Image(systemName: "xmark")
                        .font(.system(size:16, weight: .semibold))
                        .foregroundStyle(Color.white)
                }
            }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)   // top-left corner
                       .padding()
            }
        .presentationDragIndicator(.visible)
    }
}

#Preview {
    OrderConformation(confirmedOrder: Coffee(name: "Strawberry Latte", assetname: "strawberrymatcha1", photoName: "Strawberrymatcha2"))
}

