function renderStage4Image( inputFileName, currentfilename )
    a = [1 0 1 0]; % with gain [1 0 ...
    fileID = fopen('wbAndGainSettings.txt','w');
    fprintf(fileID,'%d\n', a);
    fclose(fileID);

    rwSettings = [0]; 
    fileID = fopen('rwSettings.txt','w');
    fprintf(fileID,'%d\n', rwSettings);
    fclose(fileID);
    
    stageSettings_indicator = [4];
    fileID = fopen('stageSettings.txt','w');
    fprintf(fileID,'%d\n', stageSettings_indicator);
    fclose(fileID);

    cam_settings = [0]; 
    fileID = fopen('cam_settings.txt','w');
    fprintf(fileID,'%d\n',cam_settings);
    fclose(fileID);   
    inputFileName = [inputFileName '\' currentfilename];
    
    stage4OutputFileName = ['.\' currentfilename(1:end-4) '_stage4_raw.tif'];
    fileID = fopen('lastStage.txt','w');
    fprintf(fileID,'%d\n', stageSettings_indicator);
    fclose(fileID);
    system_command = ['.\dngOneExeSDK\dng_validate.exe -16 -cs1 -tif '  stage4OutputFileName ' ' inputFileName];
    system(system_command);   
    delete(stage4OutputFileName);
end

