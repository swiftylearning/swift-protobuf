// Sources/SwiftProtobuf/Decoder.swift - Basic field setting
//
// Copyright (c) 2014 - 2016 Apple Inc. and the project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.txt for license information:
// https://github.com/apple/swift-protobuf/blob/master/LICENSE.txt
//
// -----------------------------------------------------------------------------
///
/// In this way, the generated code only knows about schema
/// information; the decoder logic knows how to decode particular
/// wire types based on that information.
///
// -----------------------------------------------------------------------------

import Swift
import Foundation

/// This is the abstract protocol used by the generated code
/// to deserialize data.
///
/// The generated code looks roughly like this:
///
/// ```
///   while fieldNumber = try decoder.nextFieldNumber() {
///      switch fieldNumber {
///      case 1: decoder.decodeRepeatedInt32Field(value: &_field)
///      ... etc ...
///   }
/// ```
///
/// For performance, this is mostly broken out into a separate method
/// for singular/repeated fields of every supported type.  Note that
/// we don't distinguish "packed" here, since all existing decoders
/// treat "packed" the same as "repeated" at this level.  (That is,
/// even when the serializer distinguishes packed and non-packed
/// forms, the deserializer always accepts both.)
///
/// Generics come into play at only a few points: Enums and Messages
/// use a generic type to locate the correct initializer.  Maps and
/// Extensions use generics to avoid the method explosion of having to
/// support a separate method for every map and extension type.  Maps
/// do distinguish Enum-valued and Message-valued maps to avoid
/// polluting the generated Enum and Message types with all of the
/// necessary generic methods to support this.

public protocol Decoder {
    // Called by a Oneof when it already has a value and is being
    // asked to accept a new value.  Some decoders specify that oneof
    // decoding must fail in this case.  Those decoders throw a
    // suitable error from this function; other decoders make it a
    // no-op.  No existing decoder actually needs this to be mutating,
    // but someone might want to track OneOf conflicts in the future.
    mutating func handleConflictingOneOf() throws

    // Get the next field number.  For JSON and Text, the decoder
    // translates name to number at this point, based on information
    // it obtained from the message when it was initialized.
    mutating func nextFieldNumber() throws -> Int?

    // Primitive field decoders
    mutating func decodeSingularFloatField(value: inout Float) throws
    mutating func decodeSingularFloatField(value: inout Float?) throws
    mutating func decodeRepeatedFloatField(value: inout [Float]) throws
    mutating func decodeSingularDoubleField(value: inout Double) throws
    mutating func decodeSingularDoubleField(value: inout Double?) throws
    mutating func decodeRepeatedDoubleField(value: inout [Double]) throws
    mutating func decodeSingularInt32Field(value: inout Int32) throws
    mutating func decodeSingularInt32Field(value: inout Int32?) throws
    mutating func decodeRepeatedInt32Field(value: inout [Int32]) throws
    mutating func decodeSingularInt64Field(value: inout Int64) throws
    mutating func decodeSingularInt64Field(value: inout Int64?) throws
    mutating func decodeRepeatedInt64Field(value: inout [Int64]) throws
    mutating func decodeSingularUInt32Field(value: inout UInt32) throws
    mutating func decodeSingularUInt32Field(value: inout UInt32?) throws
    mutating func decodeRepeatedUInt32Field(value: inout [UInt32]) throws
    mutating func decodeSingularUInt64Field(value: inout UInt64) throws
    mutating func decodeSingularUInt64Field(value: inout UInt64?) throws
    mutating func decodeRepeatedUInt64Field(value: inout [UInt64]) throws
    mutating func decodeSingularSInt32Field(value: inout Int32) throws
    mutating func decodeSingularSInt32Field(value: inout Int32?) throws
    mutating func decodeRepeatedSInt32Field(value: inout [Int32]) throws
    mutating func decodeSingularSInt64Field(value: inout Int64) throws
    mutating func decodeSingularSInt64Field(value: inout Int64?) throws
    mutating func decodeRepeatedSInt64Field(value: inout [Int64]) throws
    mutating func decodeSingularFixed32Field(value: inout UInt32) throws
    mutating func decodeSingularFixed32Field(value: inout UInt32?) throws
    mutating func decodeRepeatedFixed32Field(value: inout [UInt32]) throws
    mutating func decodeSingularFixed64Field(value: inout UInt64) throws
    mutating func decodeSingularFixed64Field(value: inout UInt64?) throws
    mutating func decodeRepeatedFixed64Field(value: inout [UInt64]) throws
    mutating func decodeSingularSFixed32Field(value: inout Int32) throws
    mutating func decodeSingularSFixed32Field(value: inout Int32?) throws
    mutating func decodeRepeatedSFixed32Field(value: inout [Int32]) throws
    mutating func decodeSingularSFixed64Field(value: inout Int64) throws
    mutating func decodeSingularSFixed64Field(value: inout Int64?) throws
    mutating func decodeRepeatedSFixed64Field(value: inout [Int64]) throws
    mutating func decodeSingularBoolField(value: inout Bool) throws
    mutating func decodeSingularBoolField(value: inout Bool?) throws
    mutating func decodeRepeatedBoolField(value: inout [Bool]) throws
    mutating func decodeSingularStringField(value: inout String) throws
    mutating func decodeSingularStringField(value: inout String?) throws
    mutating func decodeRepeatedStringField(value: inout [String]) throws
    mutating func decodeSingularBytesField(value: inout Data) throws
    mutating func decodeSingularBytesField(value: inout Data?) throws
    mutating func decodeRepeatedBytesField(value: inout [Data]) throws

    // Decode Enum fields
    mutating func decodeSingularEnumField<E: Enum>(value: inout E) throws where E.RawValue == Int
    mutating func decodeSingularEnumField<E: Enum>(value: inout E?) throws where E.RawValue == Int
    mutating func decodeRepeatedEnumField<E: Enum>(value: inout [E]) throws where E.RawValue == Int

    // Decode Message fields
    mutating func decodeSingularMessageField<M: Message>(value: inout M?) throws
    mutating func decodeRepeatedMessageField<M: Message>(value: inout [M]) throws

    // Decode Group fields
    mutating func decodeSingularGroupField<G: Message>(value: inout G?) throws
    mutating func decodeRepeatedGroupField<G: Message>(value: inout [G]) throws

    // Decode Map fields.
    // This is broken into separate methods depending on whether the value
    // type is primitive (ProtobufMap), enum (ProtobufEnumMap), or message
    // (ProtobufMessageMap)
    mutating func decodeMapField<KeyType: MapKeyType, ValueType: MapValueType>(fieldType: ProtobufMap<KeyType, ValueType>.Type, value: inout ProtobufMap<KeyType, ValueType>.BaseType) throws
    mutating func decodeMapField<KeyType: MapKeyType, ValueType: Enum>(fieldType: ProtobufEnumMap<KeyType, ValueType>.Type, value: inout ProtobufEnumMap<KeyType, ValueType>.BaseType) throws where ValueType.RawValue == Int
    mutating func decodeMapField<KeyType: MapKeyType, ValueType: Message>(fieldType: ProtobufMessageMap<KeyType, ValueType>.Type, value: inout ProtobufMessageMap<KeyType, ValueType>.BaseType) throws

    // Decode extension fields
    mutating func decodeExtensionField(values: inout ExtensionFieldValueSet, messageType: Message.Type, fieldNumber: Int) throws
}
