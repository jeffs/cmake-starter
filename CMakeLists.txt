cmake_minimum_required(VERSION 3.9)

project(Play LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS OFF)

include_directories(${PROJECT_SOURCE_DIR} $ENV{HOME}/opt/gsl/include)

include_directories(/brew/include)
link_directories(/brew/lib)

include_directories(/brew/Cellar/nlohmann_json/3.1.2/include)

add_executable(main main.cc)

set(CMAKE_MODULE_PATH
    ${CMAKE_CURRENT_LIST_DIR}
    ${CMAKE_MODULE_PATH}
)

# Uncomment to use Boost:
# find_package(Boost REQUIRED)
# include_directories(${Boost_INCLUDE_DIRS}) 
# target_link_libraries(main ${Boost_LIBRARIES})

# Uncomment to use gmp_int, if GMP is installed:
# find_package(GMP REQUIRED)
# target_link_libraries(main gmp)

add_custom_target(run
    COMMAND main
    DEPENDS main
    WORKING_DIRECTORY ${CMAKE_PROJECT_DIR})

target_include_directories(main PUBLIC $ENV{HOME}/opt/range-v3/include)
target_link_libraries(main PUBLIC stdc++fs)

if(NOT MSVC)
    target_compile_options(main
        PRIVATE
            -Wall               # "all" warnings
            -Wextra             # extra warnings
            -pedantic           # even more warnings
            -O                  # optimize
            -ftrapv             # trap on integer overflow
            -Wno-unused-variable)
endif()
