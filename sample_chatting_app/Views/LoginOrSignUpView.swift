//
//  LoginOrSignUpView.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 28/02/24.
//

import Foundation
import SwiftUI

struct LoginOrSignUpView:View {
    
    @EnvironmentObject var router: Router
    @State var email: String = ""
    @State var password: String = ""
    @State var isLogin: Bool = true
    
    func changeIsLogin(){
        isLogin.toggle()
    }
    
    func validate(){
        //TODO: Navigation to home screen
    }
    var body: some View {
        ZStack {
            
            LinearGradient(colors: [Color(hue: 0.569, saturation: 0.293, brightness: 0.906)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Text("Hi")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text("Welcome")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.201, green: 0.309, blue: 0.932))
                    .foregroundStyle(.red)
            }
            .padding()
            .frame(maxHeight: .infinity,alignment: .top)
            
            GlassView(corners: 20, height: isLogin ? 500 : 530)
                .overlay {
                    VStack {
                        HStack(alignment: .center) {
                            
                            HeadingText(headingText: "Login", isActive: isLogin, changeScreen: changeIsLogin)
                            HeadingText(headingText: "SignUp", isActive: !isLogin, changeScreen: changeIsLogin)
                            
                        }
                        .safeAreaPadding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .frame(height: 50)
                        
                        if isLogin {
                            LoginView(changeScreen: changeIsLogin, validate: validate)
                        } else {
                            SignupView()
                        }
                        
                    }
                    
                }
                .safeAreaPadding()
            
            VStack {
                Divider()
                
                Text("Thank for using the app")
                    .font(.title2)
                
                Text("checkout more apps and concepts")
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.201, green: 0.309, blue: 0.932))
                    .foregroundStyle(.red)
            }
            .frame(maxHeight: .infinity,alignment: .bottom)
        }
        
    }
}

struct LoginView: View {
    var changeScreen: () -> Void
    var validate: () -> Void
    var body: some View {
        VStack {
            FloatingPlaceholderTextField(placeholder: "Enter email")
                .padding()
            
            FloatingPlaceholderTextField(password: true, placeholder: "Enter Password")
                .padding()
            
            GlassView(corners: 25, height: 50)
                .overlay {
                    Button {
                        validate()
                    } label: {
                        Text("Login")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hue: 0.742, saturation: 0.478, brightness: 0.9))
                    }
                }
            
            Text("or")
                .fontWeight(.bold)
            
            GlassView(corners: 25, height: 50)
                .overlay {
                    Button {
                        changeScreen()
                    } label: {
                        Text("SignUp")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hue: 0.742, saturation: 0.478, brightness: 0.9))
                    }
                }
            
            HStack(spacing: 30) {
                ImageView(image: "g.circle.fill", height: 40)
                ImageView(image: "f.circle.fill", height: 40)
                ImageView(image: "apple.logo", height: 40)
            }
            .padding(.top)
        }
        .safeAreaPadding()
    }
}

struct SignupView: View {
    var body: some View {
        VStack {
            FloatingPlaceholderTextField(placeholder: "Enter email")
                .padding()
            
            FloatingPlaceholderTextField(password: true, placeholder: "Enter Password")
                .padding()
            
            GlassView(corners: 25, height: 50)
                .overlay {
                    Text("Create Account")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(Color(hue: 0.742, saturation: 0.478, brightness: 0.9))
                }
            
            Divider()
                .padding()
            
            SignUpButtonView(image: "apple.logo", title: "Create with AppleId")
            SignUpButtonView(image: "g.circle.fill", title: "Create with Google")
            SignUpButtonView(image: "f.circle.fill", title: "Create with Facebook")
            
        }
        .safeAreaPadding()
    }
}


struct HeadingText: View {
    var headingText : String
    var isActive: Bool
    var changeScreen : () -> Void
    var body: some View {
        
        if isActive {
            GlassView(corners: 8, height: 50)
                .overlay {
                    Button(action: {
                        changeScreen()
                    }, label: {
                        Text(headingText)
                            .foregroundStyle(.black)
                            .fontWeight(.bold)
                    })
                    .frame(maxWidth: .infinity,alignment: .center)
                }
        } else {
            Button(action: {
                changeScreen()
            }, label: {
                Text(headingText)
                    .foregroundStyle(.black)
                    .fontWeight(.bold)
            })
            .frame(maxWidth: .infinity,alignment: .center)
        }
    }
}

struct FloatingPlaceholderTextField: View {
    @State private var text: String = ""
    @State private var isEditing: Bool = false
    @State private var isHidden: Bool = false
    
    var password: Bool = false
    let placeholder: String
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
            .fill(.clear)
            .strokeBorder(.black, lineWidth: 2)
            .frame(height: 60)
            .overlay {
                ZStack(alignment: .leading) {
                    Text(placeholder)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .background(Color(red: 0.729, green: 0.846, blue: 0.93))
                        .padding(.horizontal, 30)
                        .offset(y: isEditing ? -35 : 0)
                        .scaleEffect(isEditing ? 0.8 : 1)
                    
                    TextField("", text: $text, onEditingChanged: { editing in
                        withAnimation {
                            isEditing = editing
                        }
                    })
                    .frame(height: 60)
                    .padding(.leading, 20)
                    
                    if password {
                        Button(action:
                                {
                            isHidden.toggle()
                        }, label: {
                            Image(systemName: isHidden ? "eye.fill" : "eye.slash.fill")
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .padding()
                            Text("")
                        })
                    }
                }
            }
    }
}

struct ImageView: View {
    var image: String
    var height: CGFloat
    var body: some View {
        Image(systemName: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .white, radius: 2, x: 3, y: 3)
            .frame(height: height)
            .foregroundColor(Color(red: 0.37, green: 0.361, blue: 0.902))
    }
}


struct SignUpButtonView: View {
    var image: String
    var title: String
    var body: some View {
        GlassView(corners: 20, height: 40)
            .overlay {
                HStack {
                    ImageView(image: image, height: 25)
                        .padding(16)
                    
                    Text(title)
                        .font(.body)
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            }
    }
}


#Preview {
    LoginOrSignUpView()
}



