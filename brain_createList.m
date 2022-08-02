function [row, col, v] = brain_createList(matrix)
import edu.stanford.math.plex4.*;

% for the lower triangular matrix, get a list of non-zero values 
% with their corresponding row and column positions in separate lists
[row,col,v] = find(tril(matrix,-1));

% sort A in descending order (decreasing A values) 
% and keep the sort index in "sortIdx"
[v,sortIdx] = sort(v,'ascend');
% sort B using the sorting index
col = col(sortIdx);
row = row(sortIdx);


end
