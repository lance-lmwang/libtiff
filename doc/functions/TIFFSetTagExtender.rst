TIFFSetTagExtender
==================

Synopsis
--------

.. highlight:: c

::

    #include <tiffio.h>


.. c:function:: TIFFExtendProc TIFFSetTagExtender(TIFFExtendProc extender)


Description
-----------

:c:func:`TIFFSetTagExtender` is used to register the merge function 
for user defined tags as an extender callback with libtiff.
A brief description can be found at :ref:`define_application_tags`.

See also
--------

:doc:`/functions/libtiff` (3tiff)
:doc:`/addingtags`
:doc:`/functions/TIFFMergeFieldInfo`
