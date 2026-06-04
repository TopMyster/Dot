//
//  ContentView.swift
//  Dot
//
//  Created by Toope Oladunjoye on 6/3/26.
//

import SwiftUI
import AppKit

struct ContentView: View {
    @State var notes: [Note] = []
    @State private var listNotes: Bool = true
    @State private var title: String = ""
    @State private var content: String = ""
    
    var body: some View {
        VStack {
            
            if listNotes {
                
                Button("New Note", systemImage: "text.pad.header.badge.plus") {
                    withAnimation {
                        listNotes = false
                    }
                }.buttonStyle(.bordered)
                
                if !notes.isEmpty {
                    List {
                        ForEach(notes) {note in
                            VStack(alignment: .leading) {
                                Text(note.date)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                                    .padding(.bottom, 2)
                                HStack {
                                    Text(note.title)
                                        .font(.title)
                                    Spacer()
                                    Button {
                                        let pasteboard = NSPasteboard.general
                                        pasteboard.clearContents()
                                        pasteboard.setString(note.content, forType: .string)
                                    } label: {
                                        Image(systemName: "document.on.document")
                                    }
                                    .help("Copy Text")
                                }
                                Divider()
                                Text(note.content)
                            }
                            .padding()
                        }
                        .onDelete {indexSet in
                            withAnimation {
                                notes.remove(atOffsets: indexSet)
                            }
                        }
                    }
                    .textSelection(.enabled)
                } else {
                    Text("No notes yet...")
                        .foregroundStyle(.secondary)
                        .padding()
                }
                
            } else {
                HStack {
                    Text(Date().formatted(date: .abbreviated, time: .shortened))
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Spacer()
                    Button("Save", systemImage: "bookmark") {
                        notes.append(Note(title: title, content: content))
                        title = ""
                        content = ""
                        withAnimation {
                            listNotes = true
                        }
                    }
                    .buttonStyle(.bordered)
                    .disabled(title.isEmpty || content.isEmpty ? true : false)
                }
                .padding(.horizontal, 15)
                
                VStack {
                    TextField("Title", text: $title)
                        .font(.title)
                        .textFieldStyle(.plain)
                    Divider()
                    ScrollView {
                        TextEditor(text: $content)
                            .font(.custom("default", size: 15))
                            .scrollContentBackground(.hidden) 
                    }
                }.padding()
            }
        }
        .padding()
        .frame(width: 450, height: 250)
    }
}

#Preview {
    ContentView()
}
