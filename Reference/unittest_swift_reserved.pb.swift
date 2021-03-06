/*
 * DO NOT EDIT.
 *
 * Generated by the protocol buffer compiler.
 * Source: unittest_swift_reserved.proto
 *
 */

//  Protos/unittest_swift_reserved.proto - test proto
// 
//  This source file is part of the Swift.org open source project
// 
//  Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
//  Licensed under Apache License v2.0 with Runtime Library Exception
// 
//  See http://swift.org/LICENSE.txt for license information
//  See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
// 
//  -----------------------------------------------------------------------------
// /
// / Test Swift reserved words used as enum or message names
// /
//  -----------------------------------------------------------------------------

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that your are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _1: SwiftProtobuf.ProtobufAPIVersion_1 {}
  typealias Version = _1
}

struct ProtobufUnittest_SwiftReservedTest: SwiftProtobuf.Message, SwiftProtobuf.Proto2Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
  var protoMessageName: String {return "SwiftReservedTest"}
  var protoPackageName: String {return "protobuf_unittest"}
  static let _protobuf_fieldNames = FieldNameMap()

  var unknown = SwiftProtobuf.UnknownStorage()

  enum Enum: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case double // = 1
    case json // = 2
    case `class` // = 3
    case ___ // = 4
    case self_ // = 5
    case type // = 6

    init() {
      self = .double
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 1: self = .double
      case 2: self = .json
      case 3: self = .`class`
      case 4: self = .___
      case 5: self = .self_
      case 6: self = .type
      default: return nil
      }
    }

    init?(jsonName: String) {
      switch jsonName {
      case "DOUBLE": self = .double
      case "JSON": self = .json
      case "CLASS": self = .`class`
      case "_": self = .___
      case "SELF": self = .self_
      case "TYPE": self = .type
      default: return nil
      }
    }

    init?(protoName: String) {
      switch protoName {
      case "DOUBLE": self = .double
      case "JSON": self = .json
      case "CLASS": self = .`class`
      case "_": self = .___
      case "SELF": self = .self_
      case "TYPE": self = .type
      default: return nil
      }
    }

    var rawValue: Int {
      get {
        switch self {
        case .double: return 1
        case .json: return 2
        case .`class`: return 3
        case .___: return 4
        case .self_: return 5
        case .type: return 6
        }
      }
    }

    var _protobuf_jsonName: String? {
      get {
        switch self {
        case .double: return "DOUBLE"
        case .json: return "JSON"
        case .`class`: return "CLASS"
        case .___: return "_"
        case .self_: return "SELF"
        case .type: return "TYPE"
        }
      }
    }

  }

  enum ProtocolEnum: SwiftProtobuf.Enum {
    typealias RawValue = Int
    case a // = 1

    init() {
      self = .a
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 1: self = .a
      default: return nil
      }
    }

    init?(jsonName: String) {
      switch jsonName {
      case "a": self = .a
      default: return nil
      }
    }

    init?(protoName: String) {
      switch protoName {
      case "a": self = .a
      default: return nil
      }
    }

    var rawValue: Int {
      get {
        switch self {
        case .a: return 1
        }
      }
    }

    var _protobuf_jsonName: String? {
      get {
        switch self {
        case .a: return "a"
        }
      }
    }

  }

  struct classMessage: SwiftProtobuf.Message, SwiftProtobuf.Proto2Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
    var protoMessageName: String {return "class"}
    var protoPackageName: String {return "protobuf_unittest"}
    static let _protobuf_fieldNames = FieldNameMap()

    var unknown = SwiftProtobuf.UnknownStorage()

    mutating func _protoc_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
      while let fieldNumber = try decoder.nextFieldNumber() {
        try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
      }
    }

    mutating func _protoc_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    }

    func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
      unknown.traverse(visitor: visitor)
    }

    func _protoc_generated_isEqualTo(other: ProtobufUnittest_SwiftReservedTest.classMessage) -> Bool {
      if unknown != other.unknown {return false}
      return true
    }
  }

  struct TypeMessage: SwiftProtobuf.Message, SwiftProtobuf.Proto2Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
    var protoMessageName: String {return "Type"}
    var protoPackageName: String {return "protobuf_unittest"}
    static let _protobuf_fieldNames = FieldNameMap()

    var unknown = SwiftProtobuf.UnknownStorage()

    mutating func _protoc_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
      while let fieldNumber = try decoder.nextFieldNumber() {
        try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
      }
    }

    mutating func _protoc_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    }

    func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
      unknown.traverse(visitor: visitor)
    }

    func _protoc_generated_isEqualTo(other: ProtobufUnittest_SwiftReservedTest.TypeMessage) -> Bool {
      if unknown != other.unknown {return false}
      return true
    }
  }

  struct isEqualMessage: SwiftProtobuf.Message, SwiftProtobuf.Proto2Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf.ProtoNameProviding {
    var protoMessageName: String {return "isEqual"}
    var protoPackageName: String {return "protobuf_unittest"}
    static let _protobuf_fieldNames = FieldNameMap()

    var unknown = SwiftProtobuf.UnknownStorage()

    mutating func _protoc_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
      while let fieldNumber = try decoder.nextFieldNumber() {
        try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
      }
    }

    mutating func _protoc_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
    }

    func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
      unknown.traverse(visitor: visitor)
    }

    func _protoc_generated_isEqualTo(other: ProtobufUnittest_SwiftReservedTest.isEqualMessage) -> Bool {
      if unknown != other.unknown {return false}
      return true
    }
  }

  mutating func _protoc_generated_decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      try decodeField(decoder: &decoder, fieldNumber: fieldNumber)
    }
  }

  mutating func _protoc_generated_decodeField<D: SwiftProtobuf.Decoder>(decoder: inout D, fieldNumber: Int) throws {
  }

  func _protoc_generated_traverse(visitor: SwiftProtobuf.Visitor) throws {
    unknown.traverse(visitor: visitor)
  }

  func _protoc_generated_isEqualTo(other: ProtobufUnittest_SwiftReservedTest) -> Bool {
    if unknown != other.unknown {return false}
    return true
  }
}
