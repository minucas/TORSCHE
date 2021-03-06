function varargout=inc(G)
%INC   Return incidence matrix of graph
%
% Synopsis
%   C = inc(G)
%   [From,To] = inc(G)
%
% Description
%  Return incidence matrix. Eventualy return matrixes Pre and Post.
%  Incidence matrix C is computed as From - To.
%
%  Parameters:
%   G:
%     - Instance of Graph object
%   C:
%     - Incidence matrix
%   From:
%     - Preincidence matrix
%   To:
%     - Postincidence matrix
%
% See also GRAPH/ADJ.


% Author: Michal Kutil <kutilm@fel.cvut.cz>
% Originator: Michal Kutil <kutilm@fel.cvut.cz>
% Originator: Premysl Sucha <suchap@fel.cvut.cz>
% Project Responsible: Zdenek Hanzalek
% Department of Control Engineering
% FEE CTU in Prague, Czech Republic
% Copyright (c) 2004 - 2009 
% $Revision: 2896 $  $Date:: 2009-03-18 12:20:12 +0100 #$


% This file is part of TORSCHE Scheduling Toolbox for Matlab.
% TORSCHE Scheduling Toolbox for Matlab can be used, copied 
% and modified under the next licenses
%
% - GPL - GNU General Public License
%
% - and other licenses added by project originators or responsible
%
% Code can be modified and re-distributed under any combination
% of the above listed licenses. If a contributor does not agree
% with some of the licenses, he/she can delete appropriate line.
% If you delete all lines, you are not allowed to distribute 
% source code and/or binaries utilizing code.
%
% --------------------------------------------------------------
%                  GNU General Public License  
%
% TORSCHE Scheduling Toolbox for Matlab is free software;
% you can redistribute it and/or modify it under the terms of the
% GNU General Public License as published by the Free Software
% Foundation; either version 2 of the License, or (at your option)
% any later version.
% 
% TORSCHE Scheduling Toolbox for Matlab is distributed in the hope
% that it will be useful, but WITHOUT ANY WARRANTY;
% without even the implied warranty of MERCHANTABILITY or 
% FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
% General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with TORSCHE Scheduling Toolbox for Matlab; if not, write
% to the Free Software Foundation, Inc., 59 Temple Place,
% Suite 330, Boston, MA 02111-1307 USA


numEdges = size(G.eps,1);
incFrom = zeros(length(G.N), numEdges);
incTo = zeros(length(G.N), numEdges);
for i = 1:numEdges
    incFrom(G.eps(i,1),i) = +1; % initial node (of an edge)
    incTo(G.eps(i,2),i) = +1; % terminal vertex (of an edge)   
end

if nargout < 2
    varargout{1} = incFrom - incTo;
elseif nargout == 2
    varargout{1} = incFrom;
    varargout{2} = incTo;
else
    error('TORSCHE:Too_many_output_arguments','Too many output arguments.');
end
%end .. @graph/inc
