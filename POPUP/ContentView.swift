//
//  ContentView.swift
//  POPUP
//
//  Created by Abhisek Prusty on 21/04/26.
//

import SwiftUI

struct PopupDemoView: View {
    
    @State private var showPopup = false
    @State private var showSecondPopup = false
    
    var body: some View {
        ZStack {
            
            Color.white.ignoresSafeArea()
            
            // Main Button
            Button(action: {
                withAnimation {
                    showPopup = true
                }
            }) {
                Text("Show Popup")
                    .foregroundColor(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(12)
                    .padding(.horizontal, 20)
            }
            
            // FIRST POPUP
            if showPopup {
                VStack {
                    Spacer()
                    
                    VStack(spacing: 15) {
                        
                        Text("Nature is the art of God.In every walk with nature, one receives far more.Look deep into nature, and you understand everything better.Nature always wears the colors of the spirit.Adopt the pace of nature: her secret is patience.")
                        
                        HStack(spacing: 15) {
                            
                            // Cancel
                            Button {
                                withAnimation {
                                    showPopup = false
                                }
                            } label: {
                                Text("Cancel")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                            }
                            
                            // Agree → Open Second Popup
                            Button {
                                withAnimation {
                                    showPopup = false
                                    showSecondPopup = true
                                }
                            } label: {
                                Text("Agree")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding()
                }
                .transition(.move(edge: .bottom))
            }
            
            // SECOND POPUP
            if showSecondPopup {
                VStack {
                    Spacer()
                    
                    VStack(spacing: 15) {
                        
                        Text("Do you want to continue further...This will proceed to the next step.")
                        
                        HStack(spacing: 15) {
                            
                            // Cancel
                            Button {
                                withAnimation {
                                    showSecondPopup = false
                                }
                            } label: {
                                Text("Cancel")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                            }
                            
                            // Proceed
                            Button {
                                withAnimation {
                                    showSecondPopup = false
                                }
                                // Yaha aage ka action add kar sakte ho
                            } label: {
                                Text("Proceed")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray.opacity(0.3))
                                    .cornerRadius(10)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding()
                }
                .transition(.move(edge: .bottom))
            }
        }
    }
}

#Preview {
    PopupDemoView()
}
