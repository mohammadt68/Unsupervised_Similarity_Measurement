%%%%% Global configuration file %%%%%%

data_dim = 1475;
lambda = 0.1;
w1 = 1.0;
w2 = 0.01;
sig = 3;
subspace_th = 0.8;
set_length = inf;
random_sample = 0;

%%% add path
load('../../data/unbc/unbc.mat');


EXPERIMENT_TYPE = 'Siamese';
DATASET_NAME = 'UNBC';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% DIRECTORIES - change if copying the code to a new location
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Directory holding the experiment 
RUN_DIR = [ '/home/mydict/Workspace' ];

%%% Directory holding all the source images
DATA_DIR = [ '/home/mydict/Workspace/data/' ];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% GLOBAL PARAMETERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% File name that holds locations of objects.
Global.Ground_Truth_Name = 'ground_truth_locations';

%% how many zeros to prefix image, interest and model files by....
Global.Num_Zeros = 0;

%% subdirectory, file prefix and file extension of images 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% CATEGORIES 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% classes to use (cell array)
Categories.Name = {'1',
                   '2',
                   '3',
                   '4',
                   '5',
                   '6',
                   '7',
                   '8',
                   '9',
                   '10',
                   '11',
                   '12',
                   '13',
                   '14',
                   '15',
                   '16',
                   '17',
                   '18',
                   '19',
                   '20',
                   '21',
                   '22',
                   '23',
                   '24'
                  };

%% Frame range for each of the classes to use 
%% (must have an entry for each of the classes in Categories.Name)
Categories.Train_Frames = {[1],   % 1
                           [5],
                           [9],
                           [13],
                           [17],
                           [21],
                           [25],
                           [29],
                           [33],
                           [37],
                           [41],
                           [45],
                           [49],
                           [53],
                           [57],
                           [61],
                           [65],
                           [69],
                           [73],
                           [77],
                           [81],
                           [85],
                           [89],
                           [93]
                          };
Categories.Test_Frames = {[2:4],   % 1
                          [6:8],
                          [10:12],
                          [14:16],
                          [18:20],
                          [22:24],
                          [26:28],
                          [30:32],
                          [34:36],
                          [38:40],
                          [42:44],
                          [46:48],
                          [50:52],
                          [54:56],
                          [58:60],
                          [62:64],
                          [66:68],
                          [70:72],
                          [74:76],
                          [78:80],
                          [82:84],
                          [86:88],
                          [90:92],
                          [94:96]
                          };
Categories.Number = length(Categories.Name);
