


% Date: 16 October, 2006
% Place: Research lab, 2006.
% Function: funEDH(Image).
% Description: To calculate the edge histogram.


%------------------------- Function begins here ---------------------------

function [EDH] = funEDH(Image)

T = 0.1;
[VG, A, PPG] = colorgrad(Image, T);
degreeMatrix = PPG.*(180/pi);

rows = size(PPG, 1);
cols = size(PPG, 2);
histBin = zeros(19,1);
for i = 1 : rows
    for j = 1 : cols
        if(degreeMatrix(i,j) == 0)
            histBin(19) = histBin(19) + 1;            
        else
            if((degreeMatrix(i,j) >= 1) && (degreeMatrix(i,j) <= 10))
                histBin(1) = histBin(1) + 1;
            else
                if((degreeMatrix(i,j) >= 11) && (degreeMatrix(i,j) <= 20))
                    histBin(2) = histBin(2) + 1;
                else
                    if((degreeMatrix(i,j) >= 21) && (degreeMatrix(i,j) <= 30))
                        histBin(3) = histBin(3) + 1;
                    else
                        if((degreeMatrix(i,j) >= 31) && (degreeMatrix(i,j) <= 40))
                            histBin(4) = histBin(4) + 1;
                        else
                            if((degreeMatrix(i,j) >= 41) && (degreeMatrix(i,j) <= 50))
                                histBin(5) = histBin(5) + 1;
                            else
                                if((degreeMatrix(i,j) >= 51) && (degreeMatrix(i,j) <= 60))
                                    histBin(6) = histBin(6) + 1;
                                else
                                    if((degreeMatrix(i,j) >= 61) && (degreeMatrix(i,j) <= 70))
                                        histBin(7) = histBin(7) + 1;
                                    else
                                        if((degreeMatrix(i,j) >= 71) && (degreeMatrix(i,j) <= 80))
                                            histBin(8) = histBin(8) + 1;
                                        else
                                            if((degreeMatrix(i,j) >= 81) && (degreeMatrix(i,j) <= 90))
                                                histBin(9) = histBin(9) + 1;
                                            else
                                                if((degreeMatrix(i,j) >= 91) && (degreeMatrix(i,j) <= 100))
                                                   histBin(10) = histBin(10) + 1;
                                                else
                                                    if((degreeMatrix(i,j) >= 101) && (degreeMatrix(i,j) <= 110))
                                                        histBin(11) = histBin(11) + 1;
                                                    else
                                                        if((degreeMatrix(i,j) >= 111) && (degreeMatrix(i,j) <= 120))
                                                            histBin(12) = histBin(12) + 1;
                                                        else
                                                            if((degreeMatrix(i,j) >= 121) && (degreeMatrix(i,j) <= 130))
                                                                histBin(13) = histBin(13) + 1;
                                                            else
                                                                if((degreeMatrix(i,j) >= 131) && (degreeMatrix(i,j) <= 140))
                                                                    histBin(14) = histBin(14) + 1;
                                                                else
                                                                    if((degreeMatrix(i,j) >= 141) && (degreeMatrix(i,j) <= 150))
                                                                        histBin(15) = histBin(15) + 1;
                                                                    else
                                                                        if((degreeMatrix(i,j) >= 151) && (degreeMatrix(i,j) <= 160))
                                                                            histBin(16) = histBin(16) + 1;
                                                                        else
                                                                            if((degreeMatrix(i,j) >= 161) && (degreeMatrix(i,j) <= 170))
                                                                                histBin(17) = histBin(17) + 1;
                                                                            else
                                                                                if((degreeMatrix(i,j) >= 171) && (degreeMatrix(i,j) <= 180))
                                                                                    histBin(17) = histBin(17) + 1;
                                                                                end
                                                                            end
                                                                        end
                                                                    end
                                                                end
                                                            end
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end % For end
end 
EDH = histBin;




%------------------------- Function end here ------------------------------