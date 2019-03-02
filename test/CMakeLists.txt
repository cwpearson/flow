add_executable(vector vector.cu)

target_link_libraries(vector Catch2::Catch2)
target_link_libraries(vector flow::flow)

add_test(vector vector)

