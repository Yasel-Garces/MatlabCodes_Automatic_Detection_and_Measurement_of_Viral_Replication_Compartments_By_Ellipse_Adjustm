# <center> Automatic detection and measurement of viral replication compartments by ellipse adjustment. <center>
This code is part of the article "Automatic detection and measurement of viral replication compartments by ellipse adjustment" available in [Scientific Reports](http://www.nature.com/srep/). The code can be used and distributed for any scientific application, provided that a reference to this article is included. 

In the repository a set of 10 images was included as example to run the algorithm. These images are stored in the folder "ForTest" and are a subset of all images that were used in this work. 

The principal script is "RUN.m". It is only necessary to run this script to generate the results for the images in "Forest". The output of the algorithm is divided in two parts:

1. Visual result: Images with the adjustment using ellipses.

2. Data result: When the program completes the segmentation of all images, we store the results of the segmentation in a .csv file. These files contain 13 variables (columns), these are:

    1.  Column 1: Number of the image.
    2.  Column 2: Major semiaxis (A) (in pixel).
    3.  Column 3: Minor semiaxis (B) (in pixel).
    4.  Column 4 and 5: Center of the ellipse (cx,xy).
    5.  Column 6: Rotation angle of the ellipse (in radians).
    6.  Column 7: Area of the ellipse (in pixeles^2).
    7.  Column 8: Perimeter of the ellipse (in pixeles).
    8.  Column 9: Eccentricity  of the ellipse.
    9.  Column 10: Mean of the pixel intensity inside the ellipse (normalize integral).
    10. Column 11: Sum of the pixels intensity inside the ellipse (integral).
    11. Column 12: Threshold intensity for the ellipses detection.
    12. Column 13: Number of the ellipses detected in this image.

For the points 9-11 the values are in the interval [0,255]. In some variables (Column 2,3,7 and 8), we decided to use the parameters in pixels because the conversion to microns or nanometers depend on the image resolution. All Matlab codes are discussed in detail. To run the algorithm using other images we recommend that you read the documentation of the principal functions. 