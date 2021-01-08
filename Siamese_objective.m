function 	Siamese_objective(config_file)

%%  load config file
try
eval(config_file);
catch
end

if (random_sample>0)
    load([DATA_DIR,DATASET_NAME,'/',DATASET_NAME,'_indices_',num2str(set_length),'.mat'], 'random_idices');
end

sim_matrix = [];
classify_results = cell(1,length(Categories.Test_Frames));
for cID = 1:Categories.Number    
    classify_results{cID} = zeros(1,length(Categories.Test_Frames{cID}));
    for testID = 1:length(Categories.Test_Frames{cID})
        fprintf('Classifying %s Instance %d ',Categories.Name{cID},testID);
        X1 = ImgData{Categories.Test_Frames{cID}(testID)};
        if (random_sample>0)
            X1 = X1(:,random_idices{Categories.Test_Frames{cID}(testID)});
        else
            X1 = X1(:,1:min(set_length,size(X1,2)));
        end
        param.type = 2;
        param.low_D_percent = subspace_th;
        [U1,new_X1] = SET_PCA(X1,param);
        mu1 = mean(X1,2);
        clear new_X1;
        
        min_dist = inf;
        dists = [];
        for cID2 = 1:length(Categories.Train_Frames)
            for trainID = 1:length(Categories.Train_Frames{cID2})
                X2 = ImgData{Categories.Train_Frames{cID2}(trainID)};
                if (random_sample>0)
                    X2 = X2(:,random_idices{Categories.Train_Frames{cID2}(trainID)});
                else
                    X2 = X2(:,1:min(set_length,size(X2,2)));
                end
                [U2,new_X2] = SET_PCA(X2,param);
                mu2 = mean(X2,2);
                clear new_X2;
                
                opt.w1 = w1;
                opt.w2 = w2;                
                [v1,v2,coef1,coef2,fval_vec,itr_counter] = accel_grad_solver(X1,mu1,U1,X2,mu2,U2,lambda*max(abs((2*opt.w2).*(X1'*mu1))),lambda*max(abs((2*opt.w2).*(X2'*mu2))),opt);
                dist = (w1*norm((mu1+U1*v1)-(mu2+U2*v2))^2+w2*norm(mu1+U1*v1-X1*coef1)^2+w2*norm(mu2+U2*v2-X2*coef2)^2)*(length(v1)+length(v2));%fval_vec(end)*(length(v1)+length(v2));
                
                dists = [dists,dist];
                fprintf('Distance between %s %d and %s %d is %f\n',Categories.Name{cID}, testID, Categories.Name{cID2}, trainID, dist);
                if (dist<min_dist)
                    min_dist = dist;
                    classify_results{cID}(testID) = cID2;
                end
                fprintf('.');
            end
        end
        fprintf('%s\n',Categories.Name{classify_results{cID}(testID)});
        sim_matrix = [sim_matrix;dists];
    end
end

if (random_sample>0)
    save([RESULT_DIR,EXPERIMENT_TYPE,'_',DATASET_NAME,'_result_',num2str(set_length),'_random.mat'], 'classify_results','sim_matrix');
else
    save([RESULT_DIR,EXPERIMENT_TYPE,'_',DATASET_NAME,'_result_',num2str(set_length),'.mat'], 'classify_results','sim_matrix');
end
