import SwiftUI
import SwiftData

struct AuthorizationPage: View {
    @State private var login = ""
    @State private var password = ""
    @State private var isObscure = true
    @State private var canTap = false
    @State private var loginStatus = TextEditingStatus.none
    @State private var passwordStatus = TextEditingStatus.none
    @State private var navigate: Bool = UserDefaults.standard.bool(forKey: "Navigate")
    @FocusState private var loginIsFocused: Bool
    @FocusState private var passwordIsFocused: Bool
    
    func checkCanTap() {
        if login.isEmpty || password.isEmpty {
            canTap = false
        } else {
            canTap = true
        }
    }
    
    var body: some View {
        NavigationView {
                VStack {
                    HStack {
                        Image(
                            "logo"
                        )
                        .resizable()
                        .frame(
                            width: 24,
                            height: 30
                        )
                        Spacer()
                    }
                    .padding(
                        .top,
                        27.38
                    )
                    .padding(
                        .leading,
                        24
                    )
                    
                    Spacer()
                    
                    VStack() {
                        Text(
                            "Авторизация"
                        )
                        .font(
                            .custom(
                                "Unbounded",
                                size: 24
                            )
                        )
                        .fontWeight(
                            .medium
                        )
                        if loginStatus == .error {
                            Text(
                                "Логин введён неверно"
                            )
                            .font(
                                .custom(
                                    "Montserrat",
                                    size: 12
                                )
                            )
                            .foregroundColor(
                                Color(
                                    .red
                                )
                            )
                            .padding(
                                .vertical,
                                2
                            )
                            .padding(
                                .leading,
                                16
                            )
                        } else {
                            Spacer().frame(
                                height: 30
                            )
                        }
                        
                        VStack(
                            spacing: 8
                        ) {
                            TextField(
                                "Логин",
                                text: $login
                            )
                            .font(
                                .custom(
                                    "Montserrat",
                                    size: 13
                                )
                            )
                            .focused(
                                $loginIsFocused
                            )
                            .padding(
                                .horizontal,
                                16
                            )
                            .frame(
                                height: 44
                            )
                            .background(
                                RoundedRectangle(
                                    cornerRadius: 16
                                )
                                .stroke(
                                    Color(
                                        loginStatus == .none ? Color.gray : loginStatus == .editing ? Color.black : Color.red
                                    ),
                                    lineWidth: 1
                                )
                            )
                            .foregroundColor(
                                Color(
                                    red: 0.07,
                                    green: 0.07,
                                    blue: 0.07
                                )
                            )
                            .onChange(
                                of: login
                            ) {
                                checkCanTap()
                            }
                            .onTapGesture {
                                if (
                                    passwordIsFocused
                                ) {
                                    passwordIsFocused = false
                                    passwordStatus = .none
                                }
                                loginIsFocused = true
                                loginStatus = .editing
                            }
                            
                            ZStack (
                                alignment: .trailing
                            ) {
                                if (
                                    isObscure
                                ) {
                                    SecureField(
                                        "Пароль",
                                        text: $password
                                    )
                                    .font(
                                        .custom(
                                            "Montserrat",
                                            size: 13
                                        )
                                    )
                                    .focused(
                                        $passwordIsFocused
                                    )
                                    .padding(
                                        .horizontal,
                                        16
                                    )
                                    .frame(
                                        height: 44
                                    )
                                    .frame(
                                        maxWidth: 10000
                                    )
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 16
                                        ).stroke(
                                            Color(
                                                passwordStatus == .none ? Color.gray : passwordStatus == .editing ? Color.black : Color.red
                                            ),
                                            lineWidth: 1
                                        )
                                    )
                                    .foregroundColor(
                                        Color(
                                            red: 0.07,
                                            green: 0.07,
                                            blue: 0.07
                                        )
                                    )
                                    .onChange(
                                        of: password
                                    ) {
                                        checkCanTap()
                                    }
                                    .overlay(
                                        HStack {
                                            Spacer()
                                            
                                            Button(action: {
                                                isObscure.toggle()
                                            },
                                                   label: {
                                                Image(
                                                    systemName: isObscure ? "eye" : "eye.slash"
                                                )
                                                .foregroundColor(
                                                    passwordStatus == .editing ? Color.black : Color.gray
                                                )
                                                .padding(
                                                    .trailing,
                                                    16
                                                )
                                            })
                                        }
                                    )
                                }
                                else {
                                    TextField(
                                        "Пароль",
                                        text: $password
                                    )
                                    .font(
                                        .custom(
                                            "Montserrat",
                                            size: 13
                                        )
                                    )
                                    .focused(
                                        $passwordIsFocused
                                    )
                                    .padding(
                                        .horizontal,
                                        16
                                    )
                                    .frame(
                                        height: 44
                                    )
                                    .background(
                                        RoundedRectangle(
                                            cornerRadius: 16
                                        ).stroke(
                                            Color(
                                                passwordIsFocused ? .black : .gray
                                            ),
                                            lineWidth: 1
                                        )
                                    )
                                    .foregroundColor(
                                        Color(
                                            red: 0.07,
                                            green: 0.07,
                                            blue: 0.07
                                        )
                                    )
                                    .onChange(
                                        of: password
                                    ) {
                                        checkCanTap()
                                    }
                                    .overlay(
                                        HStack {
                                            Spacer()
                                            
                                            Button(action: {
                                                isObscure.toggle()
                                            },
                                                   label: {
                                                Image(
                                                    systemName: isObscure ? "eye" : "eye.slash"
                                                )
                                                .foregroundColor(
                                                    passwordStatus == .editing ? Color.black : Color.gray
                                                )
                                                .padding(
                                                    .trailing,
                                                    16
                                                )
                                            })
                                        }
                                    )
                                }
                                
                            }
                            .onTapGesture {
                                if (
                                    loginIsFocused
                                ) {
                                    loginIsFocused = false
                                    loginStatus = .none
                                }
                                passwordIsFocused = true
                                passwordStatus = .editing
                            }
                        }
                        
                        if passwordStatus == .error {
                            Text(
                                "Пароль введён неверно"
                            )
                            .font(
                                .custom(
                                    "Montserrat",
                                    size: 12
                                )
                            )
                            .foregroundColor(
                                Color(
                                    .red
                                )
                            )
                            .padding(
                                .vertical,
                                2
                            )
                            .padding(
                                .leading,
                                16
                            )
                            .padding(
                                .bottom,
                                10
                            )
                        } else {
                            Spacer().frame(
                                height: 32
                            )
                        }
                        NavigationLink(
                                            destination: CustomTabView(),
                                            isActive: $navigate,
                                            label: {
                                                Button (
                                                action: {
                                                    navigate = true
                                                    UserDefaults.standard.set(navigate, forKey: "Navigate")
                                                },
                                                       label: {
                                                    Text(
                                                        "Войти"
                                                    )
                                                    .font(
                                                        .custom(
                                                            "Unbounded",
                                                            size: 16
                                                        )
                                                    )
                                                    .foregroundColor(
                                                        .white
                                                    )
                                                    .frame(
                                                        height: 56
                                                    )
                                                    .frame(
                                                        maxWidth: .infinity
                                                    )
                                                    .background(
                                                        RoundedRectangle(
                                                            cornerRadius: 16
                                                        ).fill(
                                                            Color(
                                                                red: 1,
                                                                green: 0.21,
                                                                blue: 0.21
                                                            ).opacity(
                                                                canTap ? 1 : 0.3
                                                            )
                                                        )
                                                    )
                                                    .font(
                                                        .system(
                                                            size: 16,
                                                            weight: .semibold
                                                        )
                                                    )
                                                }
                                                )
                                            }
                                        )
                        
                    
                        
                        HStack(
                            spacing: 0
                        ) {
                            Text(
                                "Проблемы с авторизацией?"
                            )
                            .font(
                                .custom(
                                    "Montserrat",
                                    size: 12
                                )
                            )
                            .fontWeight(
                                .regular
                            )
                            .foregroundColor(
                                Color(
                                    red: 0.14,
                                    green: 0.14,
                                    blue: 0.14
                                )
                            )
                            
                            Text(
                                " Пиши сюда"
                            )
                            .font(
                                .custom(
                                    "Montserrat",
                                    size: 12
                                )
                            )
                            .fontWeight(
                                .semibold
                            )
                            .foregroundColor(
                                Color(
                                    red: 0.14,
                                    green: 0.14,
                                    blue: 0.14
                                )
                            )
                        }
                    }
                    .padding(
                        .horizontal,
                        24
                    )
                    
                    Spacer()
                }
                .onTapGesture {
                    if (
                        loginIsFocused
                    ) {
                        loginIsFocused = false
                        loginStatus = .none
                    }
                    if (
                        passwordIsFocused
                    ) {
                        passwordIsFocused = false
                        passwordStatus = .none
                    }
                }
        }.onAppear {
            print(navigate)
        }
    }
    }
