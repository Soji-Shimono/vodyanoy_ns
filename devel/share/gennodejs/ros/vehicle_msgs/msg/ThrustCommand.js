// Auto-generated. Do not edit!

// (in-package vehicle_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ThrustCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rpm = null;
      this.parsentage = null;
    }
    else {
      if (initObj.hasOwnProperty('rpm')) {
        this.rpm = initObj.rpm
      }
      else {
        this.rpm = 0.0;
      }
      if (initObj.hasOwnProperty('parsentage')) {
        this.parsentage = initObj.parsentage
      }
      else {
        this.parsentage = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ThrustCommand
    // Serialize message field [rpm]
    bufferOffset = _serializer.float64(obj.rpm, buffer, bufferOffset);
    // Serialize message field [parsentage]
    bufferOffset = _serializer.float64(obj.parsentage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ThrustCommand
    let len;
    let data = new ThrustCommand(null);
    // Deserialize message field [rpm]
    data.rpm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [parsentage]
    data.parsentage = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/ThrustCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1ddf5f4cc143c036adb2fabd0af5bfc0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 rpm
    float64 parsentage
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ThrustCommand(null);
    if (msg.rpm !== undefined) {
      resolved.rpm = msg.rpm;
    }
    else {
      resolved.rpm = 0.0
    }

    if (msg.parsentage !== undefined) {
      resolved.parsentage = msg.parsentage;
    }
    else {
      resolved.parsentage = 0.0
    }

    return resolved;
    }
};

module.exports = ThrustCommand;
