// Auto-generated. Do not edit!

// (in-package vehicle_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ThrustState = require('./ThrustState.js');

//-----------------------------------------------------------

class ThrustersState {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Thruster1 = null;
      this.Thruster2 = null;
      this.Thruster3 = null;
      this.Thruster4 = null;
      this.Thruster5 = null;
      this.Thruster6 = null;
    }
    else {
      if (initObj.hasOwnProperty('Thruster1')) {
        this.Thruster1 = initObj.Thruster1
      }
      else {
        this.Thruster1 = new ThrustState();
      }
      if (initObj.hasOwnProperty('Thruster2')) {
        this.Thruster2 = initObj.Thruster2
      }
      else {
        this.Thruster2 = new ThrustState();
      }
      if (initObj.hasOwnProperty('Thruster3')) {
        this.Thruster3 = initObj.Thruster3
      }
      else {
        this.Thruster3 = new ThrustState();
      }
      if (initObj.hasOwnProperty('Thruster4')) {
        this.Thruster4 = initObj.Thruster4
      }
      else {
        this.Thruster4 = new ThrustState();
      }
      if (initObj.hasOwnProperty('Thruster5')) {
        this.Thruster5 = initObj.Thruster5
      }
      else {
        this.Thruster5 = new ThrustState();
      }
      if (initObj.hasOwnProperty('Thruster6')) {
        this.Thruster6 = initObj.Thruster6
      }
      else {
        this.Thruster6 = new ThrustState();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ThrustersState
    // Serialize message field [Thruster1]
    bufferOffset = ThrustState.serialize(obj.Thruster1, buffer, bufferOffset);
    // Serialize message field [Thruster2]
    bufferOffset = ThrustState.serialize(obj.Thruster2, buffer, bufferOffset);
    // Serialize message field [Thruster3]
    bufferOffset = ThrustState.serialize(obj.Thruster3, buffer, bufferOffset);
    // Serialize message field [Thruster4]
    bufferOffset = ThrustState.serialize(obj.Thruster4, buffer, bufferOffset);
    // Serialize message field [Thruster5]
    bufferOffset = ThrustState.serialize(obj.Thruster5, buffer, bufferOffset);
    // Serialize message field [Thruster6]
    bufferOffset = ThrustState.serialize(obj.Thruster6, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ThrustersState
    let len;
    let data = new ThrustersState(null);
    // Deserialize message field [Thruster1]
    data.Thruster1 = ThrustState.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster2]
    data.Thruster2 = ThrustState.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster3]
    data.Thruster3 = ThrustState.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster4]
    data.Thruster4 = ThrustState.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster5]
    data.Thruster5 = ThrustState.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster6]
    data.Thruster6 = ThrustState.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 192;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/ThrustersState';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0fe2acc0070e119df72824cb8968d31b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ThrustState Thruster1
    ThrustState Thruster2
    ThrustState Thruster3
    ThrustState Thruster4
    ThrustState Thruster5
    ThrustState Thruster6
    
    ================================================================================
    MSG: vehicle_msgs/ThrustState
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
    const resolved = new ThrustersState(null);
    if (msg.Thruster1 !== undefined) {
      resolved.Thruster1 = ThrustState.Resolve(msg.Thruster1)
    }
    else {
      resolved.Thruster1 = new ThrustState()
    }

    if (msg.Thruster2 !== undefined) {
      resolved.Thruster2 = ThrustState.Resolve(msg.Thruster2)
    }
    else {
      resolved.Thruster2 = new ThrustState()
    }

    if (msg.Thruster3 !== undefined) {
      resolved.Thruster3 = ThrustState.Resolve(msg.Thruster3)
    }
    else {
      resolved.Thruster3 = new ThrustState()
    }

    if (msg.Thruster4 !== undefined) {
      resolved.Thruster4 = ThrustState.Resolve(msg.Thruster4)
    }
    else {
      resolved.Thruster4 = new ThrustState()
    }

    if (msg.Thruster5 !== undefined) {
      resolved.Thruster5 = ThrustState.Resolve(msg.Thruster5)
    }
    else {
      resolved.Thruster5 = new ThrustState()
    }

    if (msg.Thruster6 !== undefined) {
      resolved.Thruster6 = ThrustState.Resolve(msg.Thruster6)
    }
    else {
      resolved.Thruster6 = new ThrustState()
    }

    return resolved;
    }
};

module.exports = ThrustersState;
