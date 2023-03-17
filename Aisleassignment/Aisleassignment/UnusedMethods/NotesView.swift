//
//  NotesView.swift
//  Aisleassignment
//
//  Created by Dhanush S on 17/03/23.
//
import Foundation
import UIKit

class NotesView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        let bundle = Bundle.init(for: NotesView.self)
        if let viewToAdd = bundle.loadNibNamed("NotesView", owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }

}
