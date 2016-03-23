project(test_pointeur LANGUAGES CXX)
cmake_minimum_required(VERSION 3.1 FATAL_ERROR)

find_package(Qt5 5.5 REQUIRED COMPONENTS Core Widgets Gui Quick Qml Multimedia)

set(EXECNAME test_pointeur)
set(RECEIVER receiver)

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_PREFIX_PATH "${CMAKE_PREFIX_PATH};/usr/jamoma/share/cmake/Jamoma/")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

function(target_transfer_options TheTarget TheLib)
    target_include_directories(${TheTarget} PUBLIC
        $<TARGET_PROPERTY:${TheLib},INTERFACE_INCLUDE_DIRECTORIES>
        )
    target_compile_definitions(${TheTarget} PRIVATE
        $<TARGET_PROPERTY:${TheLib},INTERFACE_COMPILE_DEFINITIONS>
        )
    target_compile_options(${TheTarget} PRIVATE
        $<TARGET_PROPERTY:${TheLib},INTERFACE_COMPILE_OPTIONS>
        )
endfunction()

if (OSSIA_API)
	add_subdirectory(${OSSIA_API} API)

        add_library(SceneLib OBJECT
            main.cpp
            transmitter.h transmitter.cpp
            publisher.h publisher.cpp
            OssiaProperty.hpp OssiaProperty.cpp
            OssiaImpulse.hpp OssiaImpulse.cpp
            QMLOssiaPlugin.hpp QMLOssiaPlugin.cpp)
        target_transfer_options(SceneLib Qt5::Core)
        target_transfer_options(SceneLib Qt5::Widgets)
        target_transfer_options(SceneLib Qt5::Gui)
        target_transfer_options(SceneLib Qt5::Qml)
        target_transfer_options(SceneLib Qt5::Multimedia)
        target_transfer_options(SceneLib APIJamoma)

        function(add_scene Name)
            qt5_add_resources(QRCS_${Name} ${Name}/resources_${Name}.qrc)

            add_executable(${Name}_scene ${QRCS_${Name}} $<TARGET_OBJECTS:SceneLib>)
            target_link_libraries(${Name}_scene PUBLIC Qt5::Core Qt5::Widgets Qt5::Gui APIJamoma Qt5::Qml Qt5::Multimedia)
        endfunction()

        add_scene(Left)
        add_scene(Center)
        add_scene(Right)
else()
	message( SEND_ERROR "Please specify the path to the OSSIA API in the variable OSSIA_API (-DOSSIA_API=/path/to/api)" )
endif()
