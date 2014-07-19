pdsheefa library sources


The pdsheefa library provides a mix of abstractions and externs to provide for digital signal processing (DSP), pd-based SPIN (http://spinframework.org/) client development, and 3D audio rendering.

Included are objects for SPIN scene management ("show control"), audio rendering, and other things.

This library consolidates patches and externals taken from other (now frozen) repositories,
such as "audioscsape", spinwidgets, and pdsheefa-0.3.6.


As of Sept. 2012, The pdsheefa library now includes the "xjimmies" library (formerly located at: https://code.sat.qc.ca/nslam/trunk/xjimmies), upon which, certain abstractions in pdsheefa depend, mainly for audio processing.


DEPENDENCIES: 

liblo library for OSC support





INSTALLATION 

All externs and abstractions in pdsheefa, and in xjimmies will be installed to:

for OSX: 
	~/Library/Pd/pdsheefa
	
for Linux:
	/usr/local/lib/pd-externals/pdsheefa

note: you will need to add the above directory to your pd search path, according to your OS

--z.settel 2012



