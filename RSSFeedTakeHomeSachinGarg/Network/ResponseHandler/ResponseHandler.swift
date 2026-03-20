//
//  ResponseHandler.swift
//  RSSFeedTakeHomeSachinGarg
//
//  Created by sachin garg on 3/20/26.
//

import Foundation

class ResponseDecoder {
    static  func decode<T: Decodable>(_ type: T.Type, data: Data) throws -> T where T : Decodable {
        do {
            return try JSONDecoder().decode(type.self, from: data )
        } catch (let error) {
            throw AppError.decodingFailure(error)
        }
    }
}
