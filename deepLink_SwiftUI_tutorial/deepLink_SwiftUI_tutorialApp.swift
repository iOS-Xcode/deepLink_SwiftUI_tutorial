//
//  deepLink_SwiftUI_tutorialApp.swift
//  deepLink_SwiftUI_tutorial
//
//  Created by Seokhyun Kim on 2021-03-05.
//

import SwiftUI

@main
struct deepLink_SwiftUI_tutorialApp: App {
    
    @State var selectedTab = TabIdentifier.todos
    
    var body: some Scene {
        WindowGroup {
            //ContentView()
            TabView(selection: $selectedTab,
                    content: {
                        TodosView().tabItem {
                            VStack {
                                Image(systemName: "list.bullet")
                                Text("ToDoList")
                            }
                        }.tag(TabIdentifier.todos)
                        ProfileView().tabItem {                             VStack {
                            Image(systemName: "person.circle.fill")
                            Text("Profile")
                        } }.tag(TabIdentifier.profile)
                    })
                .onOpenURL(perform: { url in
                    //열려야 하는 url 처리
                    guard let tabId = url.tabIdentifier else { return }
                    selectedTab = tabId
                })
        }
    }
}

struct deepLink_SwiftUI_tutorialApp_Previews: PreviewProvider {
    static var previews: some View {
        Text("Test")
    }
}

// 어떤 탭이 선택 되는지
enum TabIdentifier : Hashable {
    case todos
    case profile
}
//어떤 페이지를 보여줘야 하는지.
enum PageIdentofier: Hashable {
    case todoItem(id: UUID)
}

extension URL {
    var isDeeplink : Bool {
        //Info.plist
        return scheme == "swiftUI-deepLink"
    }
    
    //url 들어오는 것으로 어떤 타입의 챕을 보여줘야 하는지 가져오기
    var tabIdentifier: TabIdentifier? {
        guard isDeeplink else {
            return nil
        }
        //swiftUI_deepLink://(host)
        switch host {
        case "todos":
            return .todos
        case "profile":
            return .profile
        default:
            return nil
        }
    }
    //swiftUI_deepLink://(host)/pathComponents
    var detailPage: PageIdentofier? {
        print("pathComponents: \(pathComponents)")

        guard let tabId = tabIdentifier, pathComponents.count > 1, let uuid = UUID(uuidString: pathComponents[1]) else { return nil }
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
        
        }
    }

