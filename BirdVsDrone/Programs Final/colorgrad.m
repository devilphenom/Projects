


% Date: 16 october, 2006.
% Place: Research Lab, DoS in CS.
% Funcion: funColorGrad(f,T).
% Description: Computes the vector gradient, VG, and corresponding angle
% array, VA, (in radians) of RGB image f. It also computes PPG, the
% perplane coposite gradient obtained by summing the 2D gradient of the
% individual color planes. Input I is a threshold in the range [0, 1]. If
% it is included in the argument list, the values of VG and PPG are
% thresholded by letting VG9X,Y0 = 0 for values of VG and PPG are
% thresholded by letting VG(X,Y) = 0 for values <= T and VG(X,Y) = VG(X,y)
% otherwise. Similar comments apply to PPG. If T is not included in the
% argument list then T is set to ). Both output gradients are scaled to the
% range [0,1].


%------------------------------ Functions begins---------------------------

function [VG, A, PPG] = colorgrad(f, T)
if(ndims(f) ~= 3) | (size(f,3) ~= 3)
    error('input Image must be in RGB.');
end

% compute the  X and Y derivatives of the three component images using
% Sobel operators.
sh = fspecial('sobel');
sv = sh';
Rx = imfilter(double(f(:,:,1)),sh,'replicate');
Ry = imfilter(double(f(:,:,1)),sv,'replicate');

Gx = imfilter(double(f(:,:,2)),sh,'replicate');
Gy = imfilter(double(f(:,:,2)),sv,'replicate');

Bx = imfilter(double(f(:,:,3)),sh,'replicate');
By = imfilter(double(f(:,:,3)),sv,'replicate');

% compute the parameters of the vector gradient.
gxx = Rx.^2 + Gx.^2 + Bx.^2;
gyy = Ry.^2 + Gy.^2 + By.^2;
gxy = Rx.*Ry  + Gx.*Gy + Bx.*By;

A = 0.5*(atan(2*gxy./(gxx - gyy + eps)));
G1 = 0.5*((gxx+gyy)+(gxx-gyy).*cos(2*A)+2*gxy.*sin(2*A));

% Now repeat for angle + pi/2. The select the maximum at each point.
A = A + pi/2;
G2 = 0.5*((gxx+gyy)+(gxx-gyy).*cos(2*A)+2*gxy.*sin(2*A));
G1 = G1.^0.5;
G2 = G2.^0.5;

% from VG by picking the maximum at each (x,y)and then scale to the range
% [0,1].
VG = mat2gray(max(G1, G2));

% Compute the per-plane gradients.
RG = sqrt(Rx.^2 + Ry.^2);
GG = sqrt(Gx.^2 + Gy.^2);
BG = sqrt(Bx.^2);

% Form the composite by adding the individual results and scale to [0, 1].
PPG = mat2gray(RG + GG + BG);

% Threshold the result.
if nargin == 2
    VG = (VG > T).*VG;
    PPG = (PPG > T).*PPG;
end

%------------------------------ Functions ends ----------------------------



                                                                                    
                                        
                                            
                                        
            
                    

                
            


