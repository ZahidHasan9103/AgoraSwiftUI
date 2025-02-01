//
//  JoinedChannelScreen.swift
//  AgoraSwift
//
//  Created by Hasan Zahid on 31/1/25.
//

import SwiftUI

struct JoinedChannelScreen: View{
    
    @State private var manager: AgoraManager = AgoraManager()
    let joinedAsHost: Bool
    
    init (joinedAsHost : Bool = false){
        self.joinedAsHost = joinedAsHost
    }
    
    var localView = VideoView(type: .local,
                              audioOnly: false)
    var remoteView = VideoView(type: .local,
                              audioOnly: false)
    
    var body: some View{
        VStack(){
//            Text("You joined as a \(manager.isJoinedAsHost ? "Host" : "Audience")")
//                .font(.title3)
//                .fontWeight(.medium)
            
//            ZStack(alignment: .topTrailing){
//                remoteView
////                    .frame(maxHeight: 400)
//                    .background(Color.gray)
//                localView
//                    .frame(width: 200, height: 200)
//                    .background(Color.red)
//
//            }
            
            Text(joinedAsHost ? "You joined as a Host" : "You joined as an Audience")
            ZStack(alignment: .topTrailing){
                remoteView
                    .background(Color.gray)
                localView
                    .frame(width: 200, height: 200)
                    .background(Color.red)

            }
            
            .navigationTitle("Hey there")
        }
        .onAppear(){

            manager.joinChannel(
                asHost: joinedAsHost,
                localView: localView.videoView,
                remoteView: remoteView.videoView)
            print("I am appearing")
           // self.manager.joinChannel(asHost: false)
        }
        .onDisappear(){
            manager.leaveChannel()
            print("I am disappearing")
        }
    }
    
}

#Preview ("JoinnedChannelView"){
    NavigationStack{
        JoinedChannelScreen()
    }
}
