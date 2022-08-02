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

% import mlreportgen.dom.*
% 
% %create second level list
% for i = 2:length
%     for j = 1:i - 1
%         valueij = ListItem(matrix(i,j));
%         ijLevelList = UnorderedList(valueij);
%     end
% end
% 
% % secondLevelList = OrderedList();
% % for i = 2:length
% %     for j = 1:i - 1
% %        append(secondLevelList,valueij);
% %     end
% % end
% 
% %create first level list
% for i = 2:length
%     for j = 1:i - 1
%         itemij = ListItem(i,j);
%     end
% end
% firstLevelList = OrderedList();
% for i = 2:length
%     for j = 1:i - 1
%        append(firstLevelList,itemij);
%        append(firstLevelList, ijLevelList);
%     end
% end
% 
% output = firstLevelList;



end