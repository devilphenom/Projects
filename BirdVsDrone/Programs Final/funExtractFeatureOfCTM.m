


% Date: 15 October, 2006
% Place: Research lab DoS in CS.
% Function: funExtractFeatureOfCTM(x1, x2, x3).
% description: To extract the features for the three images (x1, x2, x3).

%------------------------- Function begins here --------------------------

function [feature] = funExtractFeatureOfCTM(x1, x2, x3)

% The templates A, B, C, D, E, F, G, and H are given tmeplates in the
% paper.

% For x1 image we have calculated the 8 templates response.
matrix11 = funMoveTemplateA(x1);
matrix12 = funMoveTemplateB(x1);
matrix13 = funMoveTemplateC(x1);
matrix14 = funMoveTemplateD(x1);
matrix15 = funMoveTemplateE(x1);
matrix16 = funMoveTemplateF(x1);
matrix17 = funMoveTemplateG(x1);
matrix18 = funMoveTemplateH(x1);


% For x2 image we have calculated the 8 templates response.
matrix21 = funMoveTemplateA(x2);
matrix22 = funMoveTemplateB(x2);
matrix23 = funMoveTemplateC(x2);
matrix24 = funMoveTemplateD(x2);
matrix25 = funMoveTemplateE(x2);
matrix26 = funMoveTemplateF(x2);
matrix27 = funMoveTemplateG(x2);
matrix28 = funMoveTemplateH(x2);


% For x3 image we have calculated the 8 templates response.
matrix31 = funMoveTemplateA(x3);
matrix32 = funMoveTemplateB(x3);
matrix33 = funMoveTemplateC(x3);
matrix34 = funMoveTemplateD(x3);
matrix35 = funMoveTemplateE(x3);
matrix36 = funMoveTemplateF(x3);
matrix37 = funMoveTemplateG(x3);
matrix38 = funMoveTemplateH(x3);

%------------------ Extract First and Second order moment -----------------

% For x1 image we have calculated the first and second order moment.
feature(1) = funGetFirstMoment(matrix11);
feature(2) = funGetSecondMoment(matrix11);

feature(3) = funGetFirstMoment(matrix12);
feature(4) = funGetSecondMoment(matrix12);

feature(5) = funGetFirstMoment(matrix13);
feature(6) = funGetSecondMoment(matrix13);

feature(7) = funGetFirstMoment(matrix14);
feature(8) = funGetSecondMoment(matrix14);

feature(9) = funGetFirstMoment(matrix15);
feature(10) = funGetSecondMoment(matrix15);

feature(11) = funGetFirstMoment(matrix16);
feature(12) = funGetSecondMoment(matrix16);

feature(13) = funGetFirstMoment(matrix17);
feature(14) = funGetSecondMoment(matrix17);

feature(15) = funGetFirstMoment(matrix18);
feature(16) = funGetSecondMoment(matrix18);


% For x2 image we have calculated the first and second order moment.
feature(17) = funGetFirstMoment(matrix21);
feature(18) = funGetSecondMoment(matrix21);

feature(19) = funGetFirstMoment(matrix22);
feature(20) = funGetSecondMoment(matrix22);

feature(21) = funGetFirstMoment(matrix23);
feature(22) = funGetSecondMoment(matrix23);

feature(23) = funGetFirstMoment(matrix24);
feature(24) = funGetSecondMoment(matrix24);

feature(25) = funGetFirstMoment(matrix25);
feature(26) = funGetSecondMoment(matrix25);

feature(27) = funGetFirstMoment(matrix26);
feature(28) = funGetSecondMoment(matrix26);

feature(29) = funGetFirstMoment(matrix27);
feature(30) = funGetSecondMoment(matrix27);

feature(31) = funGetFirstMoment(matrix28);
feature(32) = funGetSecondMoment(matrix28);

% For x3 image we have calculated the first and second order moment.
feature(33) = funGetFirstMoment(matrix31);
feature(34) = funGetSecondMoment(matrix31);

feature(35) = funGetFirstMoment(matrix32);
feature(36) = funGetSecondMoment(matrix32);

feature(37) = funGetFirstMoment(matrix33);
feature(38) = funGetSecondMoment(matrix33);

feature(39) = funGetFirstMoment(matrix34);
feature(40) = funGetSecondMoment(matrix34);

feature(41) = funGetFirstMoment(matrix35);
feature(42) = funGetSecondMoment(matrix35);

feature(43) = funGetFirstMoment(matrix36);
feature(44) = funGetSecondMoment(matrix36);

feature(45) = funGetFirstMoment(matrix37);
feature(46) = funGetSecondMoment(matrix37);

feature(47) = funGetFirstMoment(matrix38);
feature(48) = funGetSecondMoment(matrix38);

%--------------------------------------------------------------------------