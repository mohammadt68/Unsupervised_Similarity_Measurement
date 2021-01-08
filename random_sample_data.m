function random_sample_data(config_file)

%%  load config file
try
    eval(config_file);
catch
end

random_idices = cell(1,size(ImgData,2));
for idx = 1:size(ImgData,2)
    fprintf('Processing sample %d ...\n ',idx);
    X1 = ImgData{idx};

    % random permutation of image ids
    indices = randperm(size(X1,2));
    % pick the top
    random_idices{idx} = indices(1:min(set_length,size(X1,2)));
end

save([EXPERIMENT_TYPE,'_',DATASET_NAME,'_indices_',num2str(set_length),'.mat'], 'random_idices');