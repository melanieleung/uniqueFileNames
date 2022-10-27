mainFolder = "Y:\Planet_kelp\california\miscellaneous\CNN\trainingData_final\baja\islaNavidad\"; % main folder path
mainFolderContents = dir(fullfile(mainFolder,'*')); % lists everything inside the main folder
subfolders = setdiff({mainFolderContents([mainFolderContents.isdir]).name},{'.','..'}); % list of subfolders of mainFolder

% loop through all the regional subfolders in the "regions" folder and
% locates its respective "surfaceReflectance" subfolder
array = [];
for i = 1:numel(subfolders)
    cd(strcat(mainFolder, subfolders{i}, 'finalOutputs\')) % subfolder name of interest
    files= dir('*.tif'); % specifies unique pattern string that you're interested in extracting out of the folders
    fileNames = {files.name};
    fileNameInfo = ~startsWith(fileNames,'.');
    fileNames = fileNames(fileNameInfo)';
    
    array = [array; fileNames];
    array = unique(array);
    i
end