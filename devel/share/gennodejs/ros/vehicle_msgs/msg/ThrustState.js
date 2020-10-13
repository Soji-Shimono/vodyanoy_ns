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

class ThrustState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rpm = null;
      this.force = null;
      this.valtage = null;
      this.wattage = null;
    }
    else {
      if (initObj.hasOwnProperty('rpm')) {
        this.rpm = initObj.rpm
      }
      else {
        this.rpm = 0.0;
      }
      if (initObj.hasOwnProperty('force')) {
        this.force = initObj.force
      }
      else {
        this.force = 0.0;
      }
      if (initObj.hasOwnProperty('valtage')) {
        this.valtage = initObj.valtage
      }
      else {
        this.valtage = 0.0;
      }
      if (initObj.hasOwnProperty('wattage')) {
        this.wattage = initObj.wattage
      }
      else {
        this.wattage = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ThrustState
    // Serialize message field [rpm]
    bufferOffset = _serializer.float64(obj.rpm, buffer, bufferOffset);
    // Serialize message field [force]
    bufferOffset = _serializer.float64(obj.force, buffer, bufferOffset);
    // Serialize message field [valtage]
    bufferOffset = _serializer.float64(obj.valtage, buffer, bufferOffset);
    // Serialize message field [wattage]
    bufferOffset = _serializer.float64(obj.wattage, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ThrustState
    let len;
    let data = new ThrustState(null);
    // Deserialize message field [rpm]
    data.rpm = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [force]
    data.force = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [valtage]
    data.valtage = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [wattage]
    data.wattage = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/ThrustState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'af651f71f9d4dcc5b82ba1ba790dfa01';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 rpm
    float64 force
    float64 valtage
    float64 wattage
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ThrustState(null);
    if (msg.rpm !== undefined) {
      resolved.rpm = msg.rpm;
    }
    else {
      resolved.rpm = 0.0
    }

    if (msg.force !== undefined) {
      resolved.force = msg.force;
    }
    else {
      resolved.force = 0.0
    }

    if (msg.valtage !== undefined) {
      resolved.valtage = msg.valtage;
    }
    else {
      resolved.valtage = 0.0
    }

    if (msg.wattage !== undefined) {
      resolved.wattage = msg.wattage;
    }
    else {
      resolved.wattage = 0.0
    }

    return resolved;
    }
};

module.exports = ThrustState;
