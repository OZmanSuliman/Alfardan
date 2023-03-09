//
//  LoginView.swift
//  Alfardan
//
//  Created by Osman Ahmed on 09/03/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack{
            
            //Bg
            Image("Second-Bg")
                .resizable()
                .overlay(
                    Rectangle()
                        .foregroundColor(Color.black.opacity(0.65))
                )
                .ignoresSafeArea(.all)
            
            VStack{
                //Logo
                Image("Second-logo")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .padding(.top,45)
                Spacer()
                // Form
                VStack(spacing: 15){
                    VStack(alignment: .center, spacing: 30){
                        VStack(alignment: .center) {
                            CustomTextfield(placeholder:
                                                Text("Username"),
                                            fontName: "OpenSans-Regular",
                                            fontSize: 18,
                                            fontColor: Color.white.opacity(0.3),
                                            username: $username)
                            Divider()
                                .background(Color.white)
                        }
                        VStack(alignment: .center) {
                            CustomSecureField(placeholder:
                                                Text("Password"),
                                              fontName: "OpenSans-Regular",
                                              fontSize: 18,
                                              fontColor: Color.white.opacity(0.3),
                                              password: $password)
                            Divider()
                                .background(Color.white)
                        }
                    }
                    HStack{
                        Button(action: {}){
                            Text("Request new password.")
                                .modifier(CustomTextM(fontName: "OpenSans-Regular", fontSize: 14, fontColor: Color.white.opacity(0.65)))
                        }
                        Spacer()
                    }
                }
                .padding(.horizontal,35)
                
                //Button
                Button(action: {}){
                    Text("login".uppercased())
                        .modifier(CustomTextM(fontName: "OpenSans-Bold", fontSize: 14, fontColor: Color.black))
                        .modifier(ButtonStyle(buttonHeight: 60, buttonColor: Color.white, buttonRadius: 10))
                }
                .padding(.horizontal,35)
                .padding(.top,30)
                Spacer()
                //SighnUp
                VStack(spacing: 15){
                    Text("Need an account?")
                        .modifier(CustomTextM(fontName: "OpenSans-Bold", fontSize: 14, fontColor: Color.white.opacity(0.5)))
                    Button(action: {}){
                        Text("sign up".uppercased())
                            .modifier(CustomTextM(fontName: "OpenSans-Bold", fontSize: 14, fontColor: Color.white))
                            .modifier(ButtonStyle(buttonHeight: 60, buttonColor: Color.white.opacity(0.15), buttonRadius: 10))
                    }
                }
                .padding(.horizontal,90)
                .padding(.bottom,30)
                
            }
            
        }
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
