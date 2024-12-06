//
//  GroupsList.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 06.12.2024.
//

import Foundation

struct GroupsListResponse: Codable {
    let isCache: Bool?
    let items: [Group]
}

struct Group: Codable {
    let name: String?
    let groups: [String]?
}

struct GroupSection {
    let title: String
    let groups: [String]
}

