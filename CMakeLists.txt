cmake_minimum_required(VERSION 3.8)

include(cmake/HunterGate.cmake)
HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.23.124.tar.gz"
    SHA1 "f17f3b4b537955a7a96102d758a47db16233ae20"
)


project(flow LANGUAGES CXX CUDA)

hunter_add_package(Catch)
find_package(Catch2 CONFIG REQUIRED)




set(FLOW_CU_HEADERS "")
add_subdirectory(include/flow)

add_library(flow INTERFACE)
add_library(flow::flow ALIAS flow)
target_include_directories(flow INTERFACE include)

target_compile_features(flow INTERFACE 
  cxx_std_11
)

enable_testing()
add_subdirectory(test)