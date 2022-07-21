TIFFWarning
===========

Synopsis
--------

.. highlight:: c

::

    #include <tiffio.h>
    #include <stdarg.h>

.. c:function:: void TIFFWarning(const char* module, const char* fmt, ...)
.. c:function:: void TIFFWarningExt(thandle_t fd, const char* module, const char* fmt, ...)

.. c:type:: void (*TIFFWarningHandler)(const char* module, const char* fmt, va_list ap);
.. c:type:: void (*TIFFWarningHandlerExt)(thandle_t fd, const char* module, const char* fmt, va_list ap);

.. c:function:: TIFFWarningHandler TIFFSetWarningHandler(TIFFWarningHandler handler)
.. c:function:: TIFFWarningHandlerExt TIFFSetWarningHandlerExt(TIFFWarningHandlerExt handler)

Description
-----------

:c:func:`TIFFWarning` invokes the library-wide warning handler function
to (normally) write a warning message to the ``stderr``.
The *fmt* parameter is a :c:func:`printf` format string, and any number
arguments can be supplied. The *module* parameter is interpreted as a
string that, if non-zero, should be printed before the message; it
typically is used to identify the software module in which a warning is
detected.

Applications that desire to capture control in the event of a warning should
use :c:func:`TIFFSetWarningHandler` to override the default warning handler.
A :c:macro:`NULL` (0) warning handler function may be installed to suppress
warning messages.

The function :c:func:`TIFFWarningExt` provides a file handle in order 
to write the warning message to a file. Often the file handle used is ``tif->tif_clientdata``

Note
----
In ``libtiff`` only a default warning handler is defined, writing the message to ``stderr``.
For writing warning messages to file, an extra *TIFFWarningHandlerExt* function has to be set.
:c:func:`TIFFWarning` and :c:func:`TIFFWarningExt` will try to call both handler functions if defined. 
However, :c:func:`TIFFWarningExt` will pass "0" as file handle to the extended warning handler.


Return values
-------------

:c:func:`TIFFSetWarningHandler` and :c:func:`TIFFSetWarningHandlerExt` returns 
a reference to the previous warning handling function.

See also
--------

:doc:`TIFFError` (3tiff),
:doc:`libtiff` (3tiff),
printf (3)
