//
//  BaseVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 31/08/2023.
//

import Combine
import Foundation

open class BaseVM: ObservableObject {
    var cancellableSet: Set<AnyCancellable> = []

    var onUpdateNotes = PassthroughSubject<Void, Never>()

    init() {
        loadData()
        makeSubscription()
    }

    open func loadData() {}

    open func makeSubscription() {}
}
