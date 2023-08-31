function [x,map]=imgread(FileName,Format)
% IMGREAD  Read an image file
%	[x,map]=imgread(FileName,Format) uses the Matlab function IMREAD as
%	backbone to read "any" image file format. In cases of formats unknown
%	by imread, the file is converted using imconv or other programs.
%	If the parameter Format is not given, the format is determined by
%	the extension of the FileName. See IMREAD for a description of the 
%	structure of x.
%	
%	Supported formats/format specifiers are
%	alias/pix      			Alias image
%	avs/mbfavs/mbfx/x		AVS X image
%	bmp           			Windows Bitmap
%	cur           			Microsoft Windows cursor image
%	cursor/icon/pr 			Sun Icon and Cursor
%	df/hdf/ncsa    			NCSA Hierarchical Data Format
%	epi/eps/epsf/epsi		Adobe Encapsulated PostScript
%	gif/giff      			Compuserve Graphics image
%	hips/h				HIPS-2 image
%	ico           			Microsoft Windows icon image
%	iff/suniff/taac/vff		Sun TAAC Image File Format
%	iris/rgb/sgi   			SGI RGB image
%	ivb/tga/vda    			Truevision Targa image
%	jpg/jpeg      			Joint Photographic Experts Group
%	macp/mpnt/pntg			Apple Macintosh MacPaint
%	pbm/pgm/pnm/ppm			PBM Portable Bit/Gray/aNy/Pixel Map
%	pcc/pcx        			ZSoft IBM PC Paintbrush
%	pic/picio/pixar  		PIXAR picture
%	pict/pict2     			Apple Macintosh QuickDraw/PICT
%	postscript/ps  			Adobe PostScript
%	rla/rlb        			Wavefront raster image
%	rle           			Utah Run length encoded image
%	scr/ras/sr/sun 			Sun Rasterfile
%	synu          			SDSC Synu image
%	tif/tiff      			Tagged Image File Format
%	viff/xv        			Khoros Visualization Image File Format
%	xwd/x11/xbm/bm 			X Window Dump

% "Defines"
ReadDirect=1;
ImConv=2;
HipsRead=3;

if exist('Format')~=1
  ExtStart=findstr(FileName,'.');
  if isempty(ExtStart)
    error('No extension in file name, can not determine format');
  end
  ExtStart=ExtStart(end)+1;
  Format=FileName(ExtStart:end);
end
Format=lower(Format);

Conversion=0;
switch Format
  case 	'bmp',		Conversion=ReadDirect;
  case	'ncsa',		Conversion=ReadDirect; Format='hdf';
  case	'df',		Conversion=ReadDirect; Format='hdf';
  case  'jpg',		Conversion=ReadDirect;
  case  'jpeg',		Conversion=ReadDirect;
  case  'pcx',		Conversion=ReadDirect;
  case  'pcc',		Conversion=ReadDirect; Format='pcx';
  case  'tif',		Conversion=ReadDirect;
  case  'tiff',		Conversion=ReadDirect;
  case  'xwd',		Conversion=ReadDirect;
  case  'x11',		Conversion=ReadDirect; Format='xwd';
  case  'xbm',		Conversion=ReadDirect; Format='xwd';
  case  'bm',		Conversion=ReadDirect; Format='xwd';
  case  'hips',		Conversion=HipsRead;
  case  'h',		Conversion=HipsRead;   Format='hips';
  otherwise,		Conversion=ImConv;
end

switch Conversion
  case ReadDirect,  [x,map]=imread(FileName,Format);
  case HipsRead,    error('HIPS read not yet supported');
  case ImConv,      [x,map]=imconv(FileName,Format);
  otherwise,        error('Illegal state. Internal error in imgread');
end


% -----------------------------------------------------------------------
function [x,map]=imconv(FileName,Format)
% Read an image converted by imconv

% Convert image to temporary TIFF file
TmpFN=tempnam;
if 0
  % ImTools 1995-edition
  eval(sprintf('!imconv -informat %s %s -outformat bmp %s',...
    Format,FileName,TmpFN));
else
  % ImTools 1992-edition
  eval(sprintf('!imconv -%s %s -bmp %s',...
        Format,FileName,TmpFN));
end
[x,map]=imread(TmpFN,'bmp');
eval(sprintf('!rm %s',TmpFN));


