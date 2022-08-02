
function stream = brain_myFiltration(matrix, diagonalLength, vector, rows, column)
import edu.stanford.math.plex4.*;
stream = api.Plex4.createExplicitSimplexStream(10);

D = matrix;

% add vertices for all possible points still
for i = 1:diagonalLength
    stream.addVertex(i,0);
end

%% add edges based on the given vector
% for i = 2:length
%     for j = 1:i - 1
%         if D(i,j) == 0
%             disp('');
%         else
%             stream.addElement([i,j], D(i,j))
%         end
%     end
% end

vectorLength = length(vector);
for i = 1:vectorLength
    stream.addElement([rows(i),column(i)], vector(i));
end

% adding triangles -- works up to 500x500 matrix
% for i=1:diagonalLength
%     for j = i + 1 : diagonalLength
%         for k = j + 1 : diagonalLength
%             if D(i,j) == 0 || D(j,k) == 0 || D(k,i) == 0
%                 disp('');
%             else
%                 d = max([D(i,j) D(j,k) D(k,i)]);
%                 stream.addElement([i,j,k], d);
%             end
%         end
%     end
% end


% adding triangles
for i = 1:diagonalLength

    % use only the upper triangular part of the matrix
    temp = triu(D,1);
    % for row i in the upper triangular part, find the non-zero values
    [~,colt,valuet]=find(temp(i,:));
    [~,numCols] = size(valuet);
   
    for j = 1 : numCols
        for k = j + 1 : numCols
            if D(colt(j),colt(k)) == 0 
%                 disp("0");
            else
                d = max([valuet(j) D(colt(j),colt(k)) valuet(k)]);
                stream.addElement([i,colt(j),colt(k)], d);
%                 disp(i); disp(colt(j)); disp(colt(k)); disp("end");
            end
        end
    end
%   disp("end");
end



% adding triangles - using the vector to then test possible 3rd vertices -- not efficient
% for i = 1:vectorLength
%     a = column(i);
%     b = rows(i);
%    
%     for c = a + 1 : diagonalLength
%         if b == c || D(a,c) == 0 || D(b,c) == 0
%             disp('');
%         else
%             
%             d = max([vector(i), D(b,c), D(c,a)]);
%                 stream.addElement([a,b,c], d);
%         end
%     end
% end

stream.ensureAllFaces();
stream.finalizeStream();

end

