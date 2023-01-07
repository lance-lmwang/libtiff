# Release support
#
# Copyright © 2021 Roger Leigh <rleigh@codelibre.net>
# Written by Roger Leigh <rleigh@codelibre.net>
#
# Permission to use, copy, modify, distribute, and sell this software and
# its documentation for any purpose is hereby granted without fee, provided
# that (i) the above copyright notices and this permission notice appear in
# all copies of the software and related documentation, and (ii) the names of
# Sam Leffler and Silicon Graphics may not be used in any advertising or
# publicity relating to the software without the specific, prior written
# permission of Sam Leffler and Silicon Graphics.
#
# THE SOFTWARE IS PROVIDED "AS-IS" AND WITHOUT WARRANTY OF ANY KIND,
# EXPRESS, IMPLIED OR OTHERWISE, INCLUDING WITHOUT LIMITATION, ANY
# WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
#
# IN NO EVENT SHALL SAM LEFFLER OR SILICON GRAPHICS BE LIABLE FOR
# ANY SPECIAL, INCIDENTAL, INDIRECT OR CONSEQUENTIAL DAMAGES OF ANY KIND,
# OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS,
# WHETHER OR NOT ADVISED OF THE POSSIBILITY OF DAMAGE, AND ON ANY THEORY OF
# LIABILITY, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE
# OF THIS SOFTWARE.



# Update version information in all relevant files
message(STATUS "Setting release version to ${LIBTIFF_VERSION}")
message(STATUS "Setting release date to ${LIBTIFF_RELEASE_DATE}")

# Only needed here, for manual build of tiff_release
# because otherwise generated when building all targets.
configure_file(${CMAKE_BASIC_SOURCE_DIR}/libtiff/tiffvers.h.cmake.in
               ${CMAKE_BASIC_BINARY_DIR}/libtiff/tiffvers.h
               @ONLY)

# Write versioninfo and release date to root files when configure.ac has been updated.
FILE(WRITE ${CMAKE_BASIC_SOURCE_DIR}/VERSION "${LIBTIFF_VERSION}" \n) 
FILE(WRITE ${CMAKE_BASIC_SOURCE_DIR}/RELEASE-DATE "${LIBTIFF_RELEASE_DATE}" \n)

