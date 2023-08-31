//
//  ProfileView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileVM()

    var body: some View {
        ZStack {
            AppConfig.theme.backgroundColor.edgesIgnoringSafeArea(.top)

            VStack(spacing: AppConfig.layout.zero) {
                profileTextHeader
                VStack(spacing: AppConfig.layout.zero) {
                    HStack(spacing: AppConfig.layout.standardSpace) {
                        HStack {
                            avatar
                            VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
                                fullname
                                email
                            }
                        }
                        Spacer()
                        editButton

                    }.padding(.all, AppConfig.layout.standardSpace)
                }.background(AppConfig.theme.rowCommonBackgroundColor)
                    .cornerRadius(AppConfig.layout.standardCornerRadius)
                    .padding(.top, AppConfig.layout.standardSpace)
                Spacer()
                logoutButton
            }.padding(.horizontal, AppConfig.layout.standardSpace)
        }
    }
}

private extension ProfileView {
    var logoutButton: some View {
        CommonButton(text: "Sign out", isEnable: $viewModel.isEnableButton) {
            viewModel.signOut()
        }.padding(.bottom, AppConfig.layout.bottomButtonSpace)
    }

    var editButton: some View {
        Button {
            // TODO: - Edit Profile
        } label: {
            Image(systemName: "square.and.pencil")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(AppConfig.theme.iconColor)
                .frame(width: 24, height: 24)
        }
    }

    var avatar: some View {
        Text(viewModel.currentUser?.initrials ?? "User")
            .font(AppConfig.font.semibold40)
            .frame(width: 72, height: 72)
            .foregroundColor(AppConfig.theme.whiteTextColor)
            .background(AppConfig.theme.lineColor)
            .clipShape(Circle())
    }

    var fullname: some View {
        Text(viewModel.currentUser?.fullname ?? "User")
            .font(AppConfig.font.semibold20)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var email: some View {
        Text(viewModel.currentUser?.email ?? "example@gmail.com")
            .font(AppConfig.font.regular16)
            .accentColor(AppConfig.theme.textNoteColor)
    }

    var profileTextHeader: some View {
        Text("Profile")
            .font(AppConfig.font.bold20)
            .padding(.vertical, AppConfig.layout.mediumSpace)
            .padding(.top, AppConfig.layout.bottomButtonSpace)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
