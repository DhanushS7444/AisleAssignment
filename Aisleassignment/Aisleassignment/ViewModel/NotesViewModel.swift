//
//  NotesViewModel.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation

protocol NotesViewDelegate {
    func getDataNotes(results: NotesAPIResponse)
}

struct NotesViewModel {
    var notesDelegate: NotesViewDelegate?
    
    func getNotesData() {
        let notesDataResource = NotesDataResource()
        notesDataResource.getNotesData { NotesResult in
            if let results = NotesResult {
                self.notesDelegate?.getDataNotes(results: results)
            }
        }
    }
}
