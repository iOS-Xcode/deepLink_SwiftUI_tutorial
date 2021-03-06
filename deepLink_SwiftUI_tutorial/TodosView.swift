//
//  TodosView.swift
//  deepLink_SwiftUI_tutorial
//
//  Created by Seokhyun Kim on 2021-03-05.
//

import Foundation
import SwiftUI

struct TodoItem : Identifiable, Hashable {
    var id : UUID
    var title : String
}

func prepareData() -> [TodoItem] {
    print("prepareData called")
    var newList = [TodoItem]()
    
    for i in 0...20 {
        let newTodo = TodoItem(id: UUID(), title: "My toDo \(i)")
        print("newTodo.id : \(newTodo.id) / title: \(newTodo.title)")
        newList.append(newTodo)
    }
    return newList
}

struct TodosView: View {
    @State var todoItems = [TodoItem]()
    @State var activeUUID: UUID?
    
    init() {
        _todoItems = State(initialValue: prepareData())
    }
    var body: some View {
        NavigationView {
            List(todoItems) { todoItem in
                
                NavigationLink (
                    destination: Text("\(todoItem.title)"),
                    tag: todoItem.id,
                    //$activeUUID 값이 변경되면 해당 하는 링크로 이동
                    selection: $activeUUID,
                    label: {
                        Text("\(todoItem.title)")
                    })
            }
            .navigationTitle("To do List")
            .onOpenURL(perform: { url in
                if case .todoItem(let id) = url.detailPage {
                    print("넘어온 아디 : \(id)")
                    activeUUID = id
                }
            })
        }
    }
}

struct TodosView_Previews: PreviewProvider {
    static var previews: some View {
        TodosView()
    }
}
