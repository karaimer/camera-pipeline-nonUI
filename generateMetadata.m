function generateMetadata( inputFileName, currentfilename )
    path_for_metadata = [inputFileName '\metadata\'];
    mkdir_if_not_exist(path_for_metadata);

    inputFileName = [inputFileName '\' currentfilename];

    system_command = ['.\dngOneExeSDK\dng_validate.exe -d 9999' ' ' inputFileName];
    outputFileName = [path_for_metadata '' currentfilename(1:end-4) '.txt'];
    
    system([system_command ' >' outputFileName ]);   
end
    