cmake_minimum_required(VERSION 3.0.2)
project(template CXX)

add_executable(${PROJECT_NAME} Codestyle/src/main.cpp) #CMAKE_PROJECT_NAME - is the name from the last project call from the root CMakeLists.txt

message("Processing CMakeLists.txt...")
