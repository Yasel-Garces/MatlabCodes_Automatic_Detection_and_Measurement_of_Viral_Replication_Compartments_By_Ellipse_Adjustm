# <center> Automatic detection and measurement of viral replication compartments by ellipse adjustment. <center>
This code is part of the article "Automatic detection and measurement of viral replication compartments by ellipse adjustment" available in [Scientific Reports](http://www.nature.com/srep/). All codes can be used and distributed for any scientific application, only is important to reference this article.

In the repository was included a set of 10 images as example to run the algorithm. This images are store in the folder "ForTest" and are a subset of all images that was used in this investigation. 

The principal script is "RUN.m", only is necessary run this script to generate the results for the images in "Forest". The output of the algorithm is divided in two parts:

1. Visual result: Images with the adjustment using ellipses.

2. Data result: When the program ends to do the segmentation of all images, we store the results of the segmentation in a .csv file. This files contain 13 variables (columns), these are:

    1.  Column 1: Number of the image.
    2.  Column 2: Major semiaxis (A) (in pixel).
    3.  Column 3: Minor semiaxis (B) (in pixel).
    4.  Column 4 and 5: Center of the ellipse (cx,xy).
    5.  Column 6: Rotation angle of the ellipse (in radians).
    6.  Column 7: Area of the ellipse (in pixeles^2).
    7.  Column 8: Perimeter of the ellipse (in pixeles).
    8.  Column 9: Eccentricity  of the ellipse.
    9.  Column 10: Mean of the pixel intensitive inside the ellipse (normalize integral).
    10. Column 11: Sum of the pixels intensitive inside the ellipse (integral).
    11. Column 12: Umbral intensity for the ellipses detection.
    12. Column 13: Number of the ellipses detected in this image.

For the points 9-11 the values are in the interval [0,255]. In some variables (Column 2,3,7 and 8), we decide to give the parameters in pixels because the conversion to microns or nanometers depend of the image resolution. All Matlab codes are discussed in detail, so, if you want to run the algorithm in other images we recommend that you read the documentation of the principal functions. 