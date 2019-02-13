close all
clear all


folderName = '.\test';
pathname = [folderName '\*.dng'];

imagefiles = dir(pathname);
nfiles = length(imagefiles); % Number of files found

for ii=1:nfiles
    currentfilename = imagefiles(ii).name;
    file = [folderName '\' currentfilename];
    [width, height] = getWidthHeight(file);   
    
    renderStage4Image(folderName, currentfilename);
    convertFilesToImage (width, height, folderName, currentfilename );
    
    path_for_stg11 = [folderName '\stage11\'];
    mkdir_if_not_exist(path_for_stg11);
    st11OutputFileName = [path_for_stg11 currentfilename(1:end-4) '_st11.tif'];    
    renderStage11Image(folderName, currentfilename, st11OutputFileName);
    
    generateMetadata(folderName, currentfilename);
end
