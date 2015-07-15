# E1x
E1x Printer Files - "Lulzbot special"

BOM located here - http://goo.gl/RWq3ZI

Wiki page (with some assembly instructions) - http://reprap.org/wiki/E1x


This is the 10mm branch, which has a parametric Y bearing holder and modified X motor end and idler end. 

Expect your printbed to ride up another 2mm or so. It's prudent to print the
padded 5mm y belt gripper, measure how far you are off, and then make a new STL
to fit your bed from the SCAD.

If using the 300x300 Y Carriage for the TAZ and the accompanying borosilicate glass plate, these corner pieces are recommended: 
http://devel.lulzbot.com/TAZ/Juniper/production_parts/printed_parts/bed_corner/

Otherwise, edit SCAD/lulz-cornermount to suit the size of your printbed.
The STL is pre-sized for a 12"x12" piece.

It is recommended to increase the Y extrusions to 485mm and the Y smooth rod length to 505mm. It may be advantageous to use 10mm smooth rods instead at these lengths. For 10mm smooth rods, either use LM10UU bearings or RJM-01-10 polymer bushings (https://www.lulzbot.com/products/solid-polymer-bearing-rjm-01-10mm) or nylon.

10mm bearing holder in STL Files is a copy of and was made by Lulzbot:
http://devel.lulzbot.com/TAZ/Juniper/production_parts/printed_parts/bearing_holder/

