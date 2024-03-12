//
//  LoginOrSignUpView.swift
//  sample_chatting_app
//
//  Created by Ratnakar on 28/02/24.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct LoginOrSignUpView:View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var isLogin: Bool = true
    @State var isLoggedIn: Bool = false
    
    func changeIsLogin(){
        isLogin.toggle()
    }
    
    func validate() {
        if isLogin {
            //            Auth.auth().signIn(withEmail: email, password: password) { result, error in
            //                if error != nil {
            //
            //                } else {
            //
            //                }
            //            }
            isLoggedIn = true
        } else {
            //            Auth.auth().createUser(withEmail: email, password: password) { result, error in
            //                if let error = error {
            //                    print(error.localizedDescription)
            //                    return
            //                } else {
            //
            //                }
            //            }
            
        }
    }
    
    var body: some View {
        NavigationView {
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
                }
                .padding()
                .frame(maxHeight: .infinity,alignment: .top)
                
                ZStack {
                    GlassView(corners: 20, height: isLogin ? 500 : 600)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    
                    VStack {
                        HStack(alignment: .center) {
                            HeadingText(headingText: "Login", isActive: isLogin, changeScreen: changeIsLogin)
                            HeadingText(headingText: "SignUp", isActive: !isLogin, changeScreen: changeIsLogin)
                        }
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                        .frame(height: 50)
                        
                        if isLogin {
                            LoginView(email: $email, password: $password, changeScreen: changeIsLogin, validateFun: validate)
                        } else {
                            SignupView(email: $email, password: $password, validateFun: validate)
                        }
                    }
                }
                
                VStack {
                    Divider()
                    
                    Text("Thank for using the app")
                        .font(.title2)
                    
                    Text("checkout more apps and concepts")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(Color(red: 0.201, green: 0.309, blue: 0.932))
                    
                }
                .frame(maxHeight: .infinity,alignment: .bottom)
            }
            .background(
                NavigationLink(
                    destination: BottomTabBar(),
                    isActive: $isLoggedIn,
                    label: { EmptyView() }
                )
            )
            .navigationBarHidden(true)
        }
    }
}

struct LoginView: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var changeScreen: () -> Void
    var validateFun: () ->  Void
    
    var body: some View {
        VStack {
            FloatingPlaceholderTextField(text: $email, placeholder: "enter email")
            
            FloatingPlaceholderTextField(text: $password, password: true, placeholder: "enter password")
            
            ZStack {
                GlassView(corners: 25, height: 50)
                Button {
                    validateFun()
                } label: {
                    Text("Login")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.742, saturation: 0.478, brightness: 0.9))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
            Text("or")
                .fontWeight(.bold)
            
            ZStack {
                GlassView(corners: 25, height: 50)
                Button {
                    changeScreen()
                } label: {
                    Text("SignUp")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hue: 0.742, saturation: 0.478, brightness: 0.9))
                }
            }
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
            HStack(spacing: 30) {
                ImageView(image: "g.circle.fill", height: 40)
                ImageView(image: "f.circle.fill", height: 40)
                ImageView(image: "apple.logo", height: 40)
            }
            .padding(.top)
        }
        .padding()
    }
}

struct SignupView: View {
    
    @Binding var email: String
    @Binding var password: String
    
    var validateFun: () -> Void
    
    var body: some View {
        VStack {
            FloatingPlaceholderTextField(text: $email, placeholder: "enter email")
            
            FloatingPlaceholderTextField(text: $password, password: true, placeholder: "enter password")
            
            ZStack {
                GlassView(corners: 25, height: 50)
                Button {
                    validateFun()
                } label: {
                    Text("Create Account")
                        .font(.title2)
                        .foregroundColor(Color(hue: 0.742, saturation: 0.478, brightness: 0.9))
                }
            }
            
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            
            Divider()
                .padding()
            
            SignUpButtonView(image: "apple.logo", title: "Create with AppleId")
            SignUpButtonView(image: "g.circle.fill", title: "Create with Google")
            SignUpButtonView(image: "f.circle.fill", title: "Create with Facebook")
            
        }
        .padding()
    }
}


struct HeadingText: View {
    var headingText : String
    var isActive: Bool
    var changeScreen : () -> Void
    var body: some View {
        
        if isActive {
            ZStack {
                GlassView(corners: 8, height: 50)
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                Button(action: {
                    changeScreen()
                }, label: {
                    Text(headingText)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                })
                .frame(maxWidth: .infinity,alignment: .center)
            }
        } else {
            Button(action: {
                changeScreen()
            }, label: {
                Text(headingText)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            })
            .frame(maxWidth: .infinity,alignment: .center)
        }
    }
}

struct FloatingPlaceholderTextField: View {
    @Binding var text: String
    @State private var isEditing: Bool = false
    @State private var isHidden: Bool = false
    
    var password: Bool = false
    let placeholder: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                .strokeBorder(.black, lineWidth: 2)
                .frame(height: 60)
            ZStack(alignment: .leading) {
                Text(placeholder)
                    .font(.title3)
                    .foregroundColor(.gray)
                    .background(Color(red: 0.729, green: 0.846, blue: 0.93))
                    .padding(.horizontal, 30)
                    .opacity(text.isEmpty || isEditing ? 1 : 0)
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
                    Image(systemName: isHidden ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                        .onTapGesture {
                            isHidden.toggle()
                        }
                }
            }
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
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
        ZStack {
            GlassView(corners: 20, height: 40)
            HStack {
                ImageView(image: image, height: 25)
                    .padding(16)
                
                Text(title)
                    .font(.body)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity,alignment: .leading)
            }
        }
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}


#Preview {
    LoginOrSignUpView()
}



