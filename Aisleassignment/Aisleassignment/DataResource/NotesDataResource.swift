//
//  NotesDataResource.swift
//  Aisleassignment
//
//  Created by Dhanush S on 16/03/23.
//

import Foundation


struct NotesDataResource {
    func getNotesData(completionHandler: @escaping (_ results: NotesAPIResponse?) -> Void) {
        guard let notesListURL = URL(string: AppConfigure.shared.getAPIURL(endPoints: AppConfigure.shared.NotesList)) else {return}
        let headerParam = UserDefaults.standard.value(forKey: "AuthToken")
        let request = NotesApiRequest(AuthToken: headerParam as! String)
        HttpUtility.shared.getApiDataWithHeader(requestUrl: notesListURL, requestHeader: headerParam as! String, resultType: NotesAPIResponse.self) { notesApiResponse in
                _ = completionHandler(notesApiResponse)
            }
    }
}
