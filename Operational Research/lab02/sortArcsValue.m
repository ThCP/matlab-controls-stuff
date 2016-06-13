%% sortArcsValue
% arcsSorted = sortArcsValue(arcs);
% This script sorts arcs by value (i.e. amount of traffic flowing from s to
% d according to trf_m).

function arcsSorted = sortArcsValue(arcs)

arcsFields = fieldnames(arcs);
arcsCell = struct2cell(arcs);
sz = size(arcsCell);

arcsCell = reshape(arcsCell, sz(1), []);
arcsCell = arcsCell';
arcsCell = sortrows(arcsCell, 3);
arcsCell = flip(arcsCell); % decreasing order
arcsCell = reshape(arcsCell', sz);
arcsSorted = cell2struct(arcsCell, arcsFields, 1);
