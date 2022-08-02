clc; clear; close all;
import edu.stanford.math.plex4.*;

load sub5_run1.mat
D = brain_filterMatrix(sub00005Run1rmat, 0.3);
[row,col,v] = brain_createList(D);

dimension = 2;

% create a stream with clique complexes
stream = brain_myFiltration(D, 1088, v, row, col);
num_simplices = stream.getSize();

persistence = api.Plex4.getModularSimplicialAlgorithm(3, 2);
intervals = persistence.computeIntervals(stream);


% create the barcode plots
options.filename = 'Subject 5';
options.max_filtration_value = 0.4;
options.max_dimension = 1;
options.file_format = 'png';
plot_barcodes(intervals, options);

% compute the betti numbers
betti_numbers_string = intervals.getBettiNumbers();
intervals = persistence.computeAnnotatedIntervals(stream);

% % validate
% stream.validateVerbose()
