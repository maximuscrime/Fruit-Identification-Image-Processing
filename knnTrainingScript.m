clear all
close all
clc

%initialize filter
vector = zeros(1,4);

%train Oranges
for i = 35:46
    image = imread(strcat(['Fruit Database/Picture ',num2str(i),'.jpg']));
    [ featureVector ] = FruitFeatureExtract( image );
    vector(i - 34,:) = featureVector;
    Y(i - 34,:) = 'O';
end

%train grapes
for i = 47:54
    image = imread(strcat(['Fruit Database/Picture ',num2str(i),'.jpg']));
    [ featureVector ] = FruitFeatureExtract( image );
    vector(i - 34,:) = featureVector;
    Y(i - 34,:) = 'G';
end

%train banana
for i = 55:61
    image = imread(strcat(['Fruit Database/Picture ',num2str(i),'.jpg']));
    [ featureVector ] = FruitFeatureExtract( image );
    vector(i - 34,:) = featureVector;
    Y(i - 34,:) = 'B';
end

%train apple
for i = 62:69
    image = imread(strcat(['Fruit Database/Picture ',num2str(i),'.jpg']));
    [ featureVector ] = FruitFeatureExtract( image );
    vector(i - 34,:) = featureVector;
    Y(i - 34,:) = 'A';
end

save('featureVectors.mat', 'vector', 'Y');

%% 
clear all
close all
clc

load('featureVectors.mat');
% x - Predictor values, specified as a numeric matrix. Each column of X 
% represents one variable, and each row represents one observation.
% y - Classification values, specified as a numeric vector, categorical vector,
% logical vector, character array, or cell array of strings, with the same
% number of rows as X. Each row of y represents the classification of the 
% corresponding row of X.
%mdl = fitcknn(vector,Y,'NumNeighbors',3,'Standardize',1);
mdl = ClassificationKNN.fit(vector,Y,'NumNeighbors',3);

% returns a matrix of scores, indicating the likelihood that a label comes 
% from a particular class.
[label,POSTERIOR, score] = ClassificationKNN.predict(mdl,Xnew);