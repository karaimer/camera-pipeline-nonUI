function renderToGetIntermediateSize( inputFileName )
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
%     inputFileName = [inputFileName '\' currentfilename];
    
    stage4OutputFileName = ['.\' inputFileName(1:end-4) '_stage4_raw.tif'];
    % if (get(handles.radiobutton17,'Value') == 0 && get(handles.radiobutton18,'Value') == 1 )
    % this is for save txt images, no need to check if it is write or not.
    fileID = fopen('lastStage.txt','w');
    fprintf(fileID,'%d\n', stageSettings_indicator);
    fclose(fileID);
    system_command = ['.\dngOneExeSDK\dng_validate.exe -16 -cs1 -tif '  stage4OutputFileName ' ' inputFileName];
    system([system_command ' >' inputFileName(1:end-4) '.txt' ]);   
    delete(stage4OutputFileName);
end

