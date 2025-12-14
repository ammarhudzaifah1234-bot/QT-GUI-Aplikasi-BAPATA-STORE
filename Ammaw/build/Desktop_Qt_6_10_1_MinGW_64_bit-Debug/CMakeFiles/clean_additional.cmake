# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appAmmaw_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appAmmaw_autogen.dir\\ParseCache.txt"
  "appAmmaw_autogen"
  )
endif()
