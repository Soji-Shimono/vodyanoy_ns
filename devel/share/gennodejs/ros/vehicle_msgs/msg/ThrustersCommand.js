// Auto-generated. Do not edit!

// (in-package vehicle_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let ThrustCommand = require('./ThrustCommand.js');

//-----------------------------------------------------------

class ThrustersCommand {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Thruster1 = null;
      this.Thruster2 = null;
      this.Thruster3 = null;
      this.Thruster4 = null;
      this.Thruster5 = null;
      this.Thruster6 = null;
      this.mode = null;
    }
    else {
      if (initObj.hasOwnProperty('Thruster1')) {
        this.Thruster1 = initObj.Thruster1
      }
      else {
        this.Thruster1 = new ThrustCommand();
      }
      if (initObj.hasOwnProperty('Thruster2')) {
        this.Thruster2 = initObj.Thruster2
      }
      else {
        this.Thruster2 = new ThrustCommand();
      }
      if (initObj.hasOwnProperty('Thruster3')) {
        this.Thruster3 = initObj.Thruster3
      }
      else {
        this.Thruster3 = new ThrustCommand();
      }
      if (initObj.hasOwnProperty('Thruster4')) {
        this.Thruster4 = initObj.Thruster4
      }
      else {
        this.Thruster4 = new ThrustCommand();
      }
      if (initObj.hasOwnProperty('Thruster5')) {
        this.Thruster5 = initObj.Thruster5
      }
      else {
        this.Thruster5 = new ThrustCommand();
      }
      if (initObj.hasOwnProperty('Thruster6')) {
        this.Thruster6 = initObj.Thruster6
      }
      else {
        this.Thruster6 = new ThrustCommand();
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ThrustersCommand
    // Serialize message field [Thruster1]
    bufferOffset = ThrustCommand.serialize(obj.Thruster1, buffer, bufferOffset);
    // Serialize message field [Thruster2]
    bufferOffset = ThrustCommand.serialize(obj.Thruster2, buffer, bufferOffset);
    // Serialize message field [Thruster3]
    bufferOffset = ThrustCommand.serialize(obj.Thruster3, buffer, bufferOffset);
    // Serialize message field [Thruster4]
    bufferOffset = ThrustCommand.serialize(obj.Thruster4, buffer, bufferOffset);
    // Serialize message field [Thruster5]
    bufferOffset = ThrustCommand.serialize(obj.Thruster5, buffer, bufferOffset);
    // Serialize message field [Thruster6]
    bufferOffset = ThrustCommand.serialize(obj.Thruster6, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.string(obj.mode, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ThrustersCommand
    let len;
    let data = new ThrustersCommand(null);
    // Deserialize message field [Thruster1]
    data.Thruster1 = ThrustCommand.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster2]
    data.Thruster2 = ThrustCommand.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster3]
    data.Thruster3 = ThrustCommand.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster4]
    data.Thruster4 = ThrustCommand.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster5]
    data.Thruster5 = ThrustCommand.deserialize(buffer, bufferOffset);
    // Deserialize message field [Thruster6]
    data.Thruster6 = ThrustCommand.deserialize(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.mode.length;
    return length + 100;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vehicle_msgs/ThrustersCommand';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '39aeea5206baf8dd8128d11e0a1a393a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    ThrustCommand Thruster1
    ThrustCommand Thruster2
    ThrustCommand Thruster3
    ThrustCommand Thruster4
    ThrustCommand Thruster5
    ThrustCommand Thruster6
    string        mode
    
    ================================================================================
    MSG: vehicle_msgs/ThrustCommand
    float64 rpm
    float64 parsentage
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ThrustersCommand(null);
    if (msg.Thruster1 !== undefined) {
      resolved.Thruster1 = ThrustCommand.Resolve(msg.Thruster1)
    }
    else {
      resolved.Thruster1 = new ThrustCommand()
    }

    if (msg.Thruster2 !== undefined) {
      resolved.Thruster2 = ThrustCommand.Resolve(msg.Thruster2)
    }
    else {
      resolved.Thruster2 = new ThrustCommand()
    }

    if (msg.Thruster3 !== undefined) {
      resolved.Thruster3 = ThrustCommand.Resolve(msg.Thruster3)
    }
    else {
      resolved.Thruster3 = new ThrustCommand()
    }

    if (msg.Thruster4 !== undefined) {
      resolved.Thruster4 = ThrustCommand.Resolve(msg.Thruster4)
    }
    else {
      resolved.Thruster4 = new ThrustCommand()
    }

    if (msg.Thruster5 !== undefined) {
      resolved.Thruster5 = ThrustCommand.Resolve(msg.Thruster5)
    }
    else {
      resolved.Thruster5 = new ThrustCommand()
    }

    if (msg.Thruster6 !== undefined) {
      resolved.Thruster6 = ThrustCommand.Resolve(msg.Thruster6)
    }
    else {
      resolved.Thruster6 = new ThrustCommand()
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = ''
    }

    return resolved;
    }
};

module.exports = ThrustersCommand;
