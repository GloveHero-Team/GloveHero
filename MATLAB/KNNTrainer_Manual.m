inputTable = dataTrain;
predictorNames = {'xRange', 'yRange', 'zRange', 'Finger1Min', 'Finger2Min', 'Finger3Min', 'Finger4Min', 'Finger5Min'};
predictors = inputTable(:, predictorNames);
response = inputTable.Label;

classificationKNN = fitcknn(...
    predictors, ...
    response, ...
    'Distance', 'euclidean', ...
    'Exponent', [], ...
    'NumNeighbors', 7, ...
    'DistanceWeight', 'Equal', ...
    'Standardize', true, ...
    'ClassNames', categorical({'P2'; 'P3'; 'P4'; 'P5'; 'N'; 'F';'S'}, {'P2' 'P3' 'P4' 'P5' 'N' 'F' 'S'}));

classes = predict(classificationKNN,dataTest(:,1:end-1));
