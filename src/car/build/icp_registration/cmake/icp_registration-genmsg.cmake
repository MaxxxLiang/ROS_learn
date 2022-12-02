# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "icp_registration: 0 messages, 2 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/melodic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(icp_registration_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/Laserdata.srv" NAME_WE)
add_custom_target(_icp_registration_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "icp_registration" "/home/kk/car/src/icp_registration/srv/Laserdata.srv" "geometry_msgs/Vector3:sensor_msgs/LaserScan:geometry_msgs/Transform:geometry_msgs/Quaternion:std_msgs/Header"
)

get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/mapdata.srv" NAME_WE)
add_custom_target(_icp_registration_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "icp_registration" "/home/kk/car/src/icp_registration/srv/mapdata.srv" "sensor_msgs/PointCloud2:sensor_msgs/PointField:geometry_msgs/Vector3:geometry_msgs/Transform:std_msgs/Header:geometry_msgs/Quaternion"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(icp_registration
  "/home/kk/car/src/icp_registration/srv/Laserdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/icp_registration
)
_generate_srv_cpp(icp_registration
  "/home/kk/car/src/icp_registration/srv/mapdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/icp_registration
)

### Generating Module File
_generate_module_cpp(icp_registration
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/icp_registration
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(icp_registration_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(icp_registration_generate_messages icp_registration_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/Laserdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_cpp _icp_registration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/mapdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_cpp _icp_registration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(icp_registration_gencpp)
add_dependencies(icp_registration_gencpp icp_registration_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS icp_registration_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(icp_registration
  "/home/kk/car/src/icp_registration/srv/Laserdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/icp_registration
)
_generate_srv_eus(icp_registration
  "/home/kk/car/src/icp_registration/srv/mapdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/icp_registration
)

### Generating Module File
_generate_module_eus(icp_registration
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/icp_registration
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(icp_registration_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(icp_registration_generate_messages icp_registration_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/Laserdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_eus _icp_registration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/mapdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_eus _icp_registration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(icp_registration_geneus)
add_dependencies(icp_registration_geneus icp_registration_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS icp_registration_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(icp_registration
  "/home/kk/car/src/icp_registration/srv/Laserdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/icp_registration
)
_generate_srv_lisp(icp_registration
  "/home/kk/car/src/icp_registration/srv/mapdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/icp_registration
)

### Generating Module File
_generate_module_lisp(icp_registration
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/icp_registration
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(icp_registration_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(icp_registration_generate_messages icp_registration_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/Laserdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_lisp _icp_registration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/mapdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_lisp _icp_registration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(icp_registration_genlisp)
add_dependencies(icp_registration_genlisp icp_registration_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS icp_registration_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(icp_registration
  "/home/kk/car/src/icp_registration/srv/Laserdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/icp_registration
)
_generate_srv_nodejs(icp_registration
  "/home/kk/car/src/icp_registration/srv/mapdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/icp_registration
)

### Generating Module File
_generate_module_nodejs(icp_registration
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/icp_registration
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(icp_registration_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(icp_registration_generate_messages icp_registration_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/Laserdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_nodejs _icp_registration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/mapdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_nodejs _icp_registration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(icp_registration_gennodejs)
add_dependencies(icp_registration_gennodejs icp_registration_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS icp_registration_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(icp_registration
  "/home/kk/car/src/icp_registration/srv/Laserdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/LaserScan.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/icp_registration
)
_generate_srv_py(icp_registration
  "/home/kk/car/src/icp_registration/srv/mapdata.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/melodic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Transform.msg;/opt/ros/melodic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Quaternion.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/icp_registration
)

### Generating Module File
_generate_module_py(icp_registration
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/icp_registration
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(icp_registration_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(icp_registration_generate_messages icp_registration_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/Laserdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_py _icp_registration_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/kk/car/src/icp_registration/srv/mapdata.srv" NAME_WE)
add_dependencies(icp_registration_generate_messages_py _icp_registration_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(icp_registration_genpy)
add_dependencies(icp_registration_genpy icp_registration_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS icp_registration_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/icp_registration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/icp_registration
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(icp_registration_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(icp_registration_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(icp_registration_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/icp_registration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/icp_registration
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(icp_registration_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(icp_registration_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(icp_registration_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/icp_registration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/icp_registration
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(icp_registration_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(icp_registration_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(icp_registration_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/icp_registration)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/icp_registration
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(icp_registration_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(icp_registration_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(icp_registration_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/icp_registration)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/icp_registration\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/icp_registration
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(icp_registration_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(icp_registration_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(icp_registration_generate_messages_py geometry_msgs_generate_messages_py)
endif()
