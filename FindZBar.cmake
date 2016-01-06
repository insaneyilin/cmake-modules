find_path (ZBAR_INCLUDE_DIR
  NAMES
    zbar.h
  PATHS
    "/usr/local/include"
    "${ZBAR_ROOT}/include"
  DOC
    "ZBAR include directory"
)

# set ZBAR_INCLUDE_DIRS
set (ZBAR_INCLUDE_DIRS ${ZBAR_INCLUDE_DIR} )

# set ZBAR_LIBRARY
find_library (ZBAR_LIBRARY
  NAMES libzbar-0
  PATHS
    "/usr/local/lib"
    "${ZBAR_ROOT}/lib"
  DOC "ZBAR library location"
)

# set ZBAR_LIBRARIES
set ( ZBAR_LIBRARIES ${ZBAR_LIBRARY} )

# root dir
# try to guess root dir from include dir
if ( ZBAR_INCLUDE_DIR )
  string ( REGEX REPLACE "(.*)/include.*" "\\1" ZBAR_ROOT_DIR ${ZBAR_INCLUDE_DIR} )

# try to guess root dir from library dir
elseif ( ZBAR_LIBRARY )
  string ( REGEX REPLACE "(.*)/lib[/|32|64].*" "\\1" ZBAR_ROOT_DIR ${ZBAR_LIBRARY} )
endif ()

# handle REQUIRED and QUIET options
include ( FindPackageHandleStandardArgs )

find_package_handle_standard_args ( ZBAR DEFAULT_MSG ZBAR_LIBRARY
  ZBAR_INCLUDE_DIR
  ZBAR_INCLUDE_DIRS
  ZBAR_LIBRARIES
  ZBAR_ROOT_DIR
)


mark_as_advanced (
  ZBAR_LIBRARY
  ZBAR_LIBRARIES
  ZBAR_INCLUDE_DIR
  ZBAR_INCLUDE_DIRS
  ZBAR_ROOT_DIR
  ZBAR_INTERFACE_VERSION
)
