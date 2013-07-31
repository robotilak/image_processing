// key is to look for the feature you want to extract :)
S = imread('four.jpg');
ShowColorImage(S,'0');
S2 = rgb2gray(S);
ShowImage(S2,'0');
S3 = S2>180;
ShowImage(S3,'0');
se = CreateStructureElement('vertical_line', 10);
S4 = ErodeImage(S3, se);
se = CreateStructureElement('horizontal_line', 10);
S4 = ErodeImage(S4, se);
ShowImage(S4,'0');
S5 = S4.*1;
IsCalculated = CreateFeatureStruct(%f);
IsCalculated.Centroid = %t;
S6 = AnalyzeBlobs(S5, IsCalculated);
ShowColorImage(S,'0');
plot(S6(1).Centroid(1),S6(1).Centroid(2),'r*');
