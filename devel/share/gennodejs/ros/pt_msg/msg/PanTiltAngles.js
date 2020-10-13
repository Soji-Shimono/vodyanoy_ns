// Auto-generated. Do not edit!

// (in-package pt_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PanTiltAngles {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pan = null;
      this.tilt = null;
    }
    else {
      if (initObj.hasOwnProperty('pan')) {
        this.pan = initObj.pan
      }
      else {
        this.pan = 0.0;
      }
      if (initObj.hasOwnProperty('tilt')) {
        this.tilt = initObj.tilt
      }
      else {
        this.tilt = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PanTiltAngles
    // Serialize message field [pan]
    bufferOffset = _serializer.float64(obj.pan, buffer, bufferOffset);
    // Serialize message field [tilt]
    bufferOffset = _serializer.float64(obj.tilt, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PanTiltAngles
    let len;
    let data = new PanTiltAngles(null);
    // Deserialize message field [pan]
    data.pan = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [tilt]
    data.tilt = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'pt_msg/PanTiltAngles';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'da61f3d6b381bd4af7a066f22fdfa441';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 pan
    float64 tilt
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PanTiltAngles(null);
    if (msg.pan !== undefined) {
      resolved.pan = msg.pan;
    }
    else {
      resolved.pan = 0.0
    }

    if (msg.tilt !== undefined) {
      resolved.tilt = msg.tilt;
    }
    else {
      resolved.tilt = 0.0
    }

    return resolved;
    }
};

module.exports = PanTiltAngles;
