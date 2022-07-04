
add_library(Qt5::DrmEglServerBufferIntegrationPlugin MODULE IMPORTED)


_populate_WaylandCompositor_plugin_properties(DrmEglServerBufferIntegrationPlugin RELEASE "wayland-graphics-integration-server/libdrm-egl-server.so" FALSE)

list(APPEND Qt5WaylandCompositor_PLUGINS Qt5::DrmEglServerBufferIntegrationPlugin)
set_property(TARGET Qt5::WaylandCompositor APPEND PROPERTY QT_ALL_PLUGINS_wayland_graphics_integration_server Qt5::DrmEglServerBufferIntegrationPlugin)
set_property(TARGET Qt5::DrmEglServerBufferIntegrationPlugin PROPERTY QT_PLUGIN_TYPE "wayland-graphics-integration-server")
set_property(TARGET Qt5::DrmEglServerBufferIntegrationPlugin PROPERTY QT_PLUGIN_EXTENDS "")
