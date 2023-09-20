//
//  CreateNoteVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import FirebaseFirestore
import Foundation

class CreateNoteVM: BaseVM {
    private var selectedNote: NoteModel?
    
    @Published var alert = Alert(title: "Error", message: "")
    @Published var isShowError: Bool = false
    @Published var id: String = UUID().uuidString
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var timestamp: String = ""
    @Published var selectedColor: NoteColor = .color1
    @Published var isEnable: Bool = true
    @Published var selectedModel: NoteModel?
    var arrColor: [NoteColor] = [.color1, .color2, .color3, .color4, .color5, .color6, .color7, .color8, .color9, .color10]
    
    @Published var currentUser: UserModel?
    
    private let service = AuthenticationVM.shared
    
    init(selectedModel: NoteModel? = nil) {
        super.init()
        
        self.selectedNote = selectedModel
        if let note = selectedModel {
            self.id = note.id
            self.title = note.title
            self.description = note.description
            self.timestamp = doubleToDate(note.timestamp)
        }
    }
    
    override func loadData() {
        service.$currentUser.sink { [weak self] currentUser in
            DispatchQueue.main.async {
                self?.currentUser = currentUser
            }
        }.store(in: &cancellableSet)
    }
    
    override func subcribe() {
        service.onReceiveError.sink { [weak self] error in
            self?.alert.message = error
            self?.isShowError = true
        }.store(in: &cancellableSet)
    }
    
    func save() async throws {
        let note = NoteModel(id: id,
                             title: title,
                             description: description,
                             timestamp: getCurrentTime().toTimestampDouble() ?? 0,
                             color: selectedColor.rawValue)
        
        if selectedNote != nil {
            try await service.update(note: note)
        } else {
            try await service.save(note: note)
        }
    }
    
    private func getCurrentTime() -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = DateFormatType.full.rawValue
        return timeFormatter.string(from: date)
    }
    
    private func doubleToDate(_ data: Double) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatType.full.rawValue
        return formatter.string(from: Date(timeIntervalSince1970: data))
    }
}
