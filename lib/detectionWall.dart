import 'dart:io';
import 'package:opencv/opencv.dart';

class Detection{

  Future<dynamic> detectionEdges(File image) async{
    double cannyThreshold = 30;
    double ratio = 2.5;

    try{
        // Detection of grayscale in the image
        var greyScale = await image.readAsBytes();                                                 //Read the image in bytes
              greyScale = await ImgProc.cvtColor(greyScale,ImgProc.colorRGB2GRAY);                 //Change normal color to grayscale
              greyScale = await ImgProc.medianBlur(greyScale,13);                                  //Smooth contours of the image
        var cannyGray = await ImgProc.canny(greyScale, cannyThreshold, cannyThreshold * ratio);    //Edge detection

        // Detection of HSV scale in the image
        var hsvScale = await image.readAsBytes();                                               //Read the image in bytes
            hsvScale = await ImgProc.cvtColor(hsvScale, ImgProc.colorRGB2HSV);                  //Change normal color to HSV Scale

        var hsvColor = [];                                                                      //VSH (Value, Saturation, Hue) - (0, 1, 2)
            hsvColor = ImgProc.split(hsvScale) as List;                                         //Get the S-channel from the HSV image

        return hsvScale;

        var sChannel = await ImgProc.merge(hsvColor[1]);                                        //Create an image based on s-channel
            sChannel = await ImgProc.medianBlur(sChannel,3);                                    //Smooth contours of the image
        var cannyHSV = await ImgProc.canny(sChannel, cannyThreshold, cannyThreshold * ratio);   //Edge detection

        // return cannyHSV;
    }
    catch(error){

    }
}
}
