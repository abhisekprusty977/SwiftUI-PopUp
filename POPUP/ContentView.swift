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
            
            // Background
            Color.white
                .ignoresSafeArea()
                .blur(radius: (showPopup || showSecondPopup) ? 5 : 0)
            
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
            
            // Overlay for tap outside dismiss
            if showPopup || showSecondPopup {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation {
                            showPopup = false
                            showSecondPopup = false
                        }
                    }
            }
            
            // FIRST POPUP
            if showPopup {
                BottomSheet {
                    VStack(spacing: 15) {
                        Text("Nature is the art of God.")
                        Text("In every walk with nature, one receives far more.")
                        Text("Look deep into nature, and you understand everything better.")
                        Text("Nature always wears the colors of the spirit.")
                        Text("Adopt the pace of nature: her secret is patience.")
                        
                        HStack(spacing: 15) {
                            
                            Button {
                                withAnimation {
                                    showPopup = false
                                }
                            } label: {
                                popupButton(title: "Cancel")
                            }
                            
                            Button {
                                withAnimation {
                                    showPopup = false
                                    showSecondPopup = true
                                }
                            } label: {
                                popupButton(title: "Agree")
                            }
                        }
                    }
                } onDismiss: {
                    showPopup = false
                }
                .transition(.move(edge: .bottom))
            }
            
            // SECOND POPUP
            if showSecondPopup {
                BottomSheet {
                    VStack(spacing: 15) {
                        Text("Do you want to continue further?")
                        Text("This will proceed to the next step.")
                        
                        HStack(spacing: 15) {
                            
                            Button {
                                withAnimation {
                                    showSecondPopup = false
                                }
                            } label: {
                                popupButton(title: "Cancel")
                            }
                            
                            Button {
                                withAnimation {
                                    showSecondPopup = false
                                }
                            } label: {
                                popupButton(title: "Proceed")
                            }
                        }
                    }
                } onDismiss: {
                    showSecondPopup = false
                }
                .transition(.move(edge: .bottom))
            }
        }
    }
}

// MARK: - Reusable Bottom Sheet
struct BottomSheet<Content: View>: View {
    
    let content: Content
    var onDismiss: () -> Void
    
    @GestureState private var dragOffset: CGFloat = 0
    
    init(@ViewBuilder content: () -> Content, onDismiss: @escaping () -> Void) {
        self.content = content()
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                // Drag Indicator
                Capsule()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 40, height: 5)
                    .padding(.top, 8)
                
                content
                    .padding()
            }
            .background(Color.white)
            .cornerRadius(20)
            .offset(y: dragOffset)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        if value.translation.height > 0 {
                            state = value.translation.height
                        }
                    }
                    .onEnded { value in
                        if value.translation.height > 120 {
                            withAnimation {
                                onDismiss()
                            }
                        }
                    }
            )
            .shadow(radius: 10)
            .padding()
        }
    }
}

// MARK: - Button Style
func popupButton(title: String) -> some View {
    Text(title)
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(10)
}

#Preview {
    PopupDemoView()
}
