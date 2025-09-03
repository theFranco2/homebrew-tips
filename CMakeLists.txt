# Specify the minimum version of CMake required. 3.10 is a safe choice.
cmake_minimum_required(VERSION 3.10)

# Define the project name and specify that it's a C project.
project(tips VERSION 1.0.0 LANGUAGES C)

# Define the executable
add_executable(tips Formula/main.c)

# Handle the Data Directory
set(TIPS_PAGES_PATH "${CMAKE_INSTALL_PREFIX}/share/tips/tips-pages" CACHE PATH "Path to tips pages files")

# Create a macro to store the path
target_compile_definitions(tips PRIVATE "-DTIPS_PAGES_PATH=\"${TIPS_PAGES_PATH}\"")

# Install tips
install(TARGETS tips DESTINATION bin)

# Store the data in a folder
install(DIRECTORY tips-pages/ DESTINATION share/tips)
