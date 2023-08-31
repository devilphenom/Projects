

function [Features] = funGetEntropyFeatures(blimg)
glcm = graycomatrix(blimg);
ghc = graycoprops(glcm, 'contrast');
ghco= graycoprops(glcm, 'Correlation');
ghe = graycoprops(glcm, 'energy');
ghh= graycoprops(glcm, 'Homogeneity');
eh =entropy(blimg);
Features = cat(1,ghc.Contrast,ghco.Correlation,ghh.Homogeneity,ghe.Energy);