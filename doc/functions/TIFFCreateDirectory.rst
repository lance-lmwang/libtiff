TIFFCreateDirectory
===================

Synopsis
--------

.. highlight:: c

::

    #include <tiffio.h>

.. c:function:: int TIFFCreateDirectory(TIFF* tif)

.. c:function:: int TIFFNumberOfDirectories(TIFF* tif)

.. todo: is also defined in TIFFquery but should be defined here 
        or all directory query functions should be defined there: .. c:function:: tdir_t TIFFCurrentDirectory(TIFF* tif)
.. c:function:: int TIFFCurrentDirOffset(TIFF* tif)

.. todo: is also defined in TIFFquery but should be defined here: .. c:function:: int TIFFLastDirectory(TIFF* tif)
.. c:function:: int TIFFFreeDirectory(TIFF* tif)

.. c:function:: int TIFFUnlinkDirectory(TIFF* tif, uint16_t dirn)

Description
-----------

The following routines create, a Directory and retrieve information about directories in an open TIFF file.
Be aware that until a directory is not written to file AND read back, the query functions won't retrieve the correct information!

:c:func:`TIFFCreateDirectory` setup for a directory in a open TIFF file. 
The newly created directory will not exist on the file till :c:func:`TIFFWriteDirectory`, :c:func:`TIFFCheckpointDirectory`, 
:c:func:`TIFFFlush` or :c:func:`TIFFClose` is called. :c:func:`TIFFWriteDirectory` also creates a new directory, 
frees the ``*tif`` structure and sets up a new one.

:c:func:`TIFFNumberOfDirectories` returns the number of directories in a file. 
Be aware that just created directories, which are not "written" to file do not count.

.. ToDo: should be defined here or ALL query related functions should be defined in TIFFquery:
        :c:func:`TIFFCurrentDirectory` returns the index of the current directory (directories are numbered starting at 0). 
        This number is suitable for use with the :c:func:`TIFFSetDirectory` routine. 
        Be aware that the return value is not valid until the directory is "written" to file.

:c:func:`TIFFCurrentDirOffset` returns the file offset of the current directory (instead of an index). 
The file offset is suitable for use with the :c:func:`TIFFSetSubDirectory` routine. 
This is required for accessing subdirectories linked through a ``SubIFD`` tag. 
Be aware that the return value is not valid until the directory is "written" to file AND read with e.g. :c:func:`TIFFSetDirectory` or :c:func:`TIFFReadDirectory`.

.. ToDo: should be defined here or ALL query related functions should be defined in TIFFquery:
        :c:func:`TIFFLastDirectory` returns a non-zero value if the current 
        directory is the last directory in the file; otherwise zero is returned.

:c:func:`TIFFFreeDirectory` releases allocated storage associated with a directory, especially custom-fields. 
However, the main part of the directory is not touched. This routine may be used to clear a custom directory e.g. :c:func:`TIFFCleanup`.

:c:func:`TIFFUnlinkDirectory` unlink the specified directory from the directory chain.

Notes
-----

Be aware

- that until a directory is not written to file AND read back, the query functions won't retrieve the correct information!
- that the newly created directory will not exist on the file till :c:func:`TIFFWriteDirectory`,
  :c:func:`TIFFCheckpointDirectory`, :c:func:`TIFFFlush` or :c:func:`TIFFClose` has been called.
- that :c:func:`TIFFCreateDirectory` and :c:func:`TIFFWriteDirectory` create a new directory, free the ``*tif`` structure and set up a new one.
- that unlike :c:func:`TIFFWriteDirectory`, :c:func:`TIFFCheckpointDirectory` does not free up the directory data structures in memory.

Diagnostics
-----------

All error messages are directed to the :c:func:`TIFFError` routine.
Likewise, warning messages are directed to the :c:func:`TIFFWarning` routine.

See also
--------

:doc:`libtiff` (3tiff),
:doc:`TIFFSetDirectory` (3tiff),
:doc:`TIFFquery` (3tiff),
:doc:`TIFFWriteDirectory` (3tiff),
:doc:`TIFFCustomDirectory` (3tiff)
