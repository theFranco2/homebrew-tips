# Specify the minimum version of CMake required. 3.10 is a safe choice.
cmake_minimum_required(VERSION 3.10)

# Define the project name and specify that it's a C project.
project(tips VERSION 1.0.1 LANGUAGES C)

# Define the executable
add_executable(tips Formula/main.c)

# Handle the data directory
set(TIPS_PAGES_PATH "${CMAKE_INSTALL_PREFIX}/share/tips-pages" CACHE PATH "Path to tips pages files")

# Create a macro to store the path
target_compile_definitions(tips PRIVATE "-DTIPS_PAGES_PATH=\"${TIPS_PAGES_PATH}\"")

# Install tips
install(TARGETS tips DESTINATION bin)

# Handle the pages directory
install(DIRECTORY pages/ DESTINATION share/tips-pages)
