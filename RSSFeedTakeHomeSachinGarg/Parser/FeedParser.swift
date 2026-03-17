//
//  FeedParser.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/16/26.
//

import Foundation

struct ParsedFeedItem {
    var guid: String = ""
    var title: String = ""
    var link: String = ""
    var publishDate: String = ""
    var description: String = ""
    var imageUrl: String = ""
}


class FeedParser: NSObject, XMLParserDelegate {
    private var Items: [ParsedFeedItem] = []
    private var current: ParsedFeedItem = ParsedFeedItem()
    private var currentItem = ""
    private var accumulator = ""
    
    func parseData(data: Data) throws -> [ParsedFeedItem] {
        // Remove all existing utem before start
        //TODO: Items.removeAll()
        let parser = XMLParser(data: data)
        parser.delegate = self
        guard parser.parse() else {
            throw parser.parserError ?? URLError(.cannotParseResponse)
        }
        return Items
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentItem = elementName.lowercased()
        
        if currentItem == "entry"{
            current = ParsedFeedItem()
        }
        
         if currentItem == "link" {
            
            // Image link with enclosure
            if let rel = attributeDict["rel"],
               rel == "enclosure",
               let type = attributeDict["type"],
               type.contains("image"),
               let href = attributeDict["href"] {
                current.imageUrl = href
                return
            }
            
            // Story link
            if let href = attributeDict["href"] {
                current.link = href
            }
        }

        accumulator = ""
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        accumulator += string
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        let value = accumulator.trimmingCharacters(in: .whitespacesAndNewlines)
        
        switch elementName.lowercased() {
        case "guid", "id":
            current.guid = current.guid.isEmpty ? value : current.guid
        case "title":
            current.title += value
        case "updated":
            current.publishDate += value
        case "description", "content:encoded", "content":
            if current.description.isEmpty {
                current.description = value
            }
        case "entry":
            if current.guid.isEmpty {
                current.description = current.link.isEmpty ? UUID().uuidString : current.link
            }
            Items.append(current)
        default: break
            
        }
        accumulator = ""
    }
}

 
