mainFolder = "C:\Users\mleung\Desktop\trainingDataFinal\"; % main folder path
mainFolderContents = dir(fullfile(mainFolder,'*')); % lists everything inside the main folder
subfolders = setdiff({mainFolderContents([mainFolderContents.isdir]).name},{'.','..'}); % list of subfolders of mainFolder

% loops through all the subfolders in the main folder,
% locates a specific subfolder "final outputs" within the different site
% subfolders
array = [];
for i = 1:numel(subfolders)
    cd(strcat(mainFolder, subfolders{i}, '\finalOutputs\')) % subfolder name of interest
    files= dir('*.tif'); % specifies unique pattern string that you're interested in extracting out of the folders
    fileNames = {files.name};
    fileNameInfo = ~startsWith(fileNames,'.');
    fileNames = fileNames(fileNameInfo)';
    
    array = [array; fileNames];
    array = unique(array);
    i
end
