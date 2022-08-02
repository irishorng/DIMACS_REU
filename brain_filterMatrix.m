function output = brain_filterMatrix(matrix, threshold)
import edu.stanford.math.plex4.*;

output2 = 1 - matrix;

% make sure all zeroes on diagonal
v=zeros(size(output2,2));
output = output2 - diag(diag(output2)) + diag(v);

% change values greater than or equal to threshold to 0
output( output <= threshold) = 0;

end
