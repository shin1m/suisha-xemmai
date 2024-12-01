add_library(suishadbus SHARED dbus.cc)
target_link_libraries(suishadbus suisha dbus-1)
target_include_directories(suishadbus PUBLIC
	"$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>"
	"$<INSTALL_INTERFACE:include>"
)
