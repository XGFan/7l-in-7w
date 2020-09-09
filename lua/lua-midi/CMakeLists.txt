project(play)

#link_directories(/usr/local/include/lua)
include_directories(/usr/local/Cellar/lua/5.3.5_1/include/lua)
include_directories(/usr/local/Cellar/Rtmidi/4.0.0/include)
file(GLOB LUA "/usr/local/Cellar/lua/5.3.5_1/lib/*.dylib")
file(GLOB RtMidi "/usr/local/Cellar/Rtmidi/4.0.0/lib/*.dylib")
message("LIBRARIES = ${LUA}")

#find_library(lua REQUIRED)
add_executable(play play.cpp)
target_link_libraries(play ${LUA} ${RtMidi})

cmake_minimum_required(VERSION 2.8)
