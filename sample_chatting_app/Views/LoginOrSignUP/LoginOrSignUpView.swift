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
    
    @State var isLogin: Bool = false
    @State var tapOnNavigation: Bool = false
    @State var viewModel = LoginOrSignUpViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                LinearGradient(colors: [.black, Color("TabBarTopGradient4"), Color("TabBarTopGradient2"), Color("TabBarTopGradient5"), .black, Color("TabBarTopGradient3"), Color("TabBarTopGradient6")], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Text("Chat with more enchance features")
                        .font(.system(size: 68, weight: .medium))
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                    Text("Our chat app is the perfect way to information and your feeling in a better way.")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.white.opacity(0.5))
                    
                    SocialMediaIconsView(viewModel: $viewModel, color: .white)
                    
                    ORView(color: .white)
                    
                    ZStack {
                        GlassView(corners: 8, height: 50, width: .infinity)
                            .padding()
                        Text("Sign up with mail")
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        isLogin = false
                        tapOnNavigation = true
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    
                    HStack {
                        Text("Existing account?")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(.white)
                        
                        Text(" Log in")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        isLogin = true
                        tapOnNavigation = true
                    }
                    
                }
                .background(
                    NavigationLink(
                        destination: LoginView(isLogin: isLogin),
                        isActive: $tapOnNavigation,
                        label: { EmptyView() }
                    )
                )
                .padding()
                .frame(maxHeight: .infinity,alignment: .top)
                
            }
        }
        .onAppear {
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }
}

//MARK: Login and SignUp view
struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var viewModel = LoginOrSignUpViewModel()
    @State var name: String = ""
    @State var email: String = ""
    @State var pass: String = ""
    @State var confirmPass: String = ""
    @State var isLoggedIn: Bool = false
    var isLogin: Bool
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    Text(isLogin ? "Log in to Chatbox" : "Sign up with Email")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color("TitleTextColor"))
                        .padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0))
                    
                    Text(isLogin ? "Welcome back! Sign in using your social account or email to continue us" : "Get chatting with friends and family today by signing up for our chat app!")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color("TextColor"))
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 10))
                    
                    if isLogin {
                        SocialMediaIconsView(viewModel: $viewModel, color: .black)
                        ORView(color: .black)
                    }
                    
                    if !isLogin {
                        TextFeildView(heading: "Your name", text: $name)
                    }
                    
                    TextFeildView(heading: "Your email", text: $email)
                    
                    TextFeildView(heading: "Password", text: $pass, isForPassword: true)
                    
                    if !isLogin {
                        TextFeildView(heading: "Confirm Password", text: $confirmPass, isForPassword: true)
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(LinearGradient(colors: [.black, Color("TabBarTopGradient6")], startPoint: .leading, endPoint: .trailing))
                            .frame(height: 50, alignment: .center)
                            .padding()
                        
                        Text(isLogin ? "Log in" : "Create an account")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        isLoggedIn = true
                    }
                    
                    if isLogin {
                        Text("Forgot password?")
                            .font(.system(size: 14))
                            .foregroundColor(Color("TitleTextColor"))
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    }
                }
                .padding()
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(.backIcon)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 20, height: 20)
                        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
            }
            .background(
                NavigationLink(
                    destination: BottomTabBar(),
                    isActive: $isLoggedIn,
                    label: { EmptyView() }
                )
            )
        }
        .navigationBarBackButtonHidden(true)
    }
}

//MARK: Customised the TextFeild and Header
struct TextFeildView: View {
    
    var heading: String
    @Binding var text: String
    var isForPassword: Bool = false
    var isError: Bool = false
    
    var body: some View {
        VStack {
            Text(heading)
                .font(.system(size: 14, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor( isError ? .red : Color("TitleTextColor"))
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            
            if isForPassword {
                SecureField("", text: $text)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            } else {
                TextField("", text: $text)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            Rectangle()
                .fill(isError ? .red : Color("TextColor"))
                .frame(maxWidth: .infinity, maxHeight: 1)
                .offset(y: -15)
        }
        .frame(alignment: .leading)
        .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
    }
}

//MARK: SocialMediaIconsView
struct SocialMediaIconsView: View {
    @Binding var viewModel: LoginOrSignUpViewModel
    var color: Color
    
    var body: some View {
        HStack {
            ZStack {
                GlassView(corners: 25, height: 50, width: 50)
                Image(uiImage: .facebookIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35)
            }
            .onTapGesture {
                viewModel.loginByFacebook()
            }
            
            ZStack {
                GlassView(corners: 25, height: 50, width: 50)
                Image(uiImage: .googleIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35)
            }
            .onTapGesture {
                viewModel.loginByGoogle()
            }
            
            ZStack {
                GlassView(corners: 25, height: 50, width: 50)
                Image(systemName: "applelogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25)
                    .foregroundColor(color)
            }
            .onTapGesture {
                viewModel.loginByApple()
            }
        }
        .padding(10)
    }
}

//MARK: ORView
struct ORView: View {
    var color: Color
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(LinearGradient(colors: [color.opacity(0.1), color], startPoint: .leading, endPoint: .trailing))
                .frame(maxWidth: .infinity, maxHeight: 2)
            Text("OR")
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
            Rectangle()
                .fill(LinearGradient(colors: [color.opacity(0.1), color], startPoint: .trailing, endPoint: .leading))
                .frame(maxWidth: .infinity, maxHeight: 2)
        }
        .padding()
    }
}

#Preview {
    LoginOrSignUpView()
}
