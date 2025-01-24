
cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# flex must be available.
# - Windows: I installed it with Chocolatey (package: winflexbison3)
# - Linux: apt install bison flex
# - MacOS: macports (port install bison flex)... brew?
find_package(FLEX)

include_directories(${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR})

FLEX_TARGET(Test1Scanner test1.l  ${CMAKE_CURRENT_BINARY_DIR}/test1.cpp)
add_executable(test1 test1.cpp ${FLEX_Test1Scanner_OUTPUTS})

FLEX_TARGET(GermanScanner german.l  ${CMAKE_CURRENT_BINARY_DIR}/german.cc)
add_executable(german  ${FLEX_GermanScanner_OUTPUTS})

project(lexfun)
