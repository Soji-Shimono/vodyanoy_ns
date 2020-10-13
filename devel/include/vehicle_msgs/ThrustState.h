// Generated by gencpp from file vehicle_msgs/ThrustState.msg
// DO NOT EDIT!


#ifndef VEHICLE_MSGS_MESSAGE_THRUSTSTATE_H
#define VEHICLE_MSGS_MESSAGE_THRUSTSTATE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace vehicle_msgs
{
template <class ContainerAllocator>
struct ThrustState_
{
  typedef ThrustState_<ContainerAllocator> Type;

  ThrustState_()
    : rpm(0.0)
    , force(0.0)
    , valtage(0.0)
    , wattage(0.0)  {
    }
  ThrustState_(const ContainerAllocator& _alloc)
    : rpm(0.0)
    , force(0.0)
    , valtage(0.0)
    , wattage(0.0)  {
  (void)_alloc;
    }



   typedef double _rpm_type;
  _rpm_type rpm;

   typedef double _force_type;
  _force_type force;

   typedef double _valtage_type;
  _valtage_type valtage;

   typedef double _wattage_type;
  _wattage_type wattage;





  typedef boost::shared_ptr< ::vehicle_msgs::ThrustState_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::vehicle_msgs::ThrustState_<ContainerAllocator> const> ConstPtr;

}; // struct ThrustState_

typedef ::vehicle_msgs::ThrustState_<std::allocator<void> > ThrustState;

typedef boost::shared_ptr< ::vehicle_msgs::ThrustState > ThrustStatePtr;
typedef boost::shared_ptr< ::vehicle_msgs::ThrustState const> ThrustStateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::vehicle_msgs::ThrustState_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::vehicle_msgs::ThrustState_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace vehicle_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'vehicle_msgs': ['/home/ubuntu/catkin_ws/src/vehicle_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::vehicle_msgs::ThrustState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vehicle_msgs::ThrustState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vehicle_msgs::ThrustState_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vehicle_msgs::ThrustState_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vehicle_msgs::ThrustState_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vehicle_msgs::ThrustState_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::vehicle_msgs::ThrustState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "af651f71f9d4dcc5b82ba1ba790dfa01";
  }

  static const char* value(const ::vehicle_msgs::ThrustState_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xaf651f71f9d4dcc5ULL;
  static const uint64_t static_value2 = 0xb82ba1ba790dfa01ULL;
};

template<class ContainerAllocator>
struct DataType< ::vehicle_msgs::ThrustState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "vehicle_msgs/ThrustState";
  }

  static const char* value(const ::vehicle_msgs::ThrustState_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::vehicle_msgs::ThrustState_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 rpm\n"
"float64 force\n"
"float64 valtage\n"
"float64 wattage\n"
;
  }

  static const char* value(const ::vehicle_msgs::ThrustState_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::vehicle_msgs::ThrustState_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.rpm);
      stream.next(m.force);
      stream.next(m.valtage);
      stream.next(m.wattage);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ThrustState_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::vehicle_msgs::ThrustState_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::vehicle_msgs::ThrustState_<ContainerAllocator>& v)
  {
    s << indent << "rpm: ";
    Printer<double>::stream(s, indent + "  ", v.rpm);
    s << indent << "force: ";
    Printer<double>::stream(s, indent + "  ", v.force);
    s << indent << "valtage: ";
    Printer<double>::stream(s, indent + "  ", v.valtage);
    s << indent << "wattage: ";
    Printer<double>::stream(s, indent + "  ", v.wattage);
  }
};

} // namespace message_operations
} // namespace ros

#endif // VEHICLE_MSGS_MESSAGE_THRUSTSTATE_H
