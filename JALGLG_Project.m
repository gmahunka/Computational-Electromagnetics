% This script is written and read by pdetool and should NOT be edited.
% There are two recommended alternatives:
% 1) Export the required variables from pdetool and create a MATLAB script
%    to perform operations on these.
% 2) Define the problem completely using a MATLAB script. See
%    https://www.mathworks.com/help/pde/examples.html for examples
%    of this approach.
function pdemodel
[pde_fig,ax]=pdeinit;
pdetool('appl_cb',1);
pdetool('snapon','on');
set(ax,'DataAspectRatio',[1 1 1]);
set(ax,'PlotBoxAspectRatio',[1 2.0000029541663662 13.333353027775779]);
set(ax,'XLimMode','auto');
set(ax,'YLimMode','auto');
set(ax,'XTickMode','auto');
set(ax,'YTickMode','auto');
pdetool('gridon','on');

% Geometry description:
pdecirc(0,0,0.14999999999999999,'C1');
pderect([0 0.2 -0.2 0.2],'SQ1');
pderect([0.050000000000000003 0 0 0.0050000000000000001],'SQ2');
pderect([0.0080000000000000002 0.016 0.010999999999999999 0.0060000000000000001],'R1');
set(findobj(get(pde_fig,'Children'),'Tag','PDEEval'),'String','C1*SQ1')

% Boundary conditions:
pdetool('changemode',0)
pdesetbd(12,...
'dir',...
1,...
'1',...
'0')
pdesetbd(11,...
'dir',...
1,...
'1',...
'0')
pdesetbd(8,...
'dir',...
1,...
'1',...
'0')
pdesetbd(7,...
'dir',...
1,...
'1',...
'0')
pdesetbd(6,...
'dir',...
1,...
'1',...
'0')

% Mesh generation:
setappdata(pde_fig,'Hgrad',1.3);
setappdata(pde_fig,'refinemethod','regular');
setappdata(pde_fig,'jiggle',char('on','mean',''));
setappdata(pde_fig,'MesherVersion','preR2013a');
pdetool('initmesh')
pdetool('jiggle')
pdetool('jiggle')
pdetool('refine')
pdetool('refine')
pdetool('refine')

% PDE coefficients:
pdeseteq(2,...
'-1./(x*pi*4e-7)!-1./(x*pi*4e-7)!-1./(x*pi*4e-7)',...
'0!0.0!0',...
'0!framp(t)!0',...
'3.77e7./x!0!0',...
'linspace(0,500,1000)',...
'0',...
'0.0',...
'[0 100]')
setappdata(pde_fig,'currparam',...
['-1./(x*pi*4e-7)!-1./(x*pi*4e-7)!-1./(x*pi*4e-7)              ';...
'0!0.0!0                                                      ';...
'0!framp(t)!0                                                 ';...
'3.77e7./x!0!0                                                '])

% Solve parameters:
setappdata(pde_fig,'solveparam',...
char('0','72768','10','pdeadworst',...
'0.5','longest','0','1E-4','','fixed','Inf'))

% Plotflags and user data strings:
setappdata(pde_fig,'plotflags',[4 1 1 1 1 1 1 1 1 0 0 84 1 1 0 0 0 1]);
setappdata(pde_fig,'colstring','u./x');
setappdata(pde_fig,'arrowstring','');
setappdata(pde_fig,'deformstring','');
setappdata(pde_fig,'heightstring','');

% Solve PDE:
pdetool('solve')
