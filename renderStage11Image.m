function renderStage11Image( inputFileName, currentfilename, outputFileName )
    % a = [1 0 1 0]; % with gain [1 0 ...
    a = [1 0 1 0]; % with gain [1 0 ...
    fileID = fopen('wbAndGainSettings.txt','w');
    fprintf(fileID,'%d\n', a);
    fclose(fileID);

    rwSettings = [2];
    fileID = fopen('rwSettings.txt','w');
    fprintf(fileID,'%d\n', rwSettings);
    fclose(fileID);

    stageSettings_indicator = [11];
    fileID = fopen('stageSettings.txt','w');
    fprintf(fileID,'%d\n', stageSettings_indicator);
    fclose(fileID);

    cam_settings = [0];
    fileID = fopen('cam_settings.txt','w');
    fprintf(fileID,'%d\n',cam_settings);
    fclose(fileID);
    inputFileName = [inputFileName '\' currentfilename];

    stage4OutputFileName = ['.\' currentfilename(1:end-4) '_stage11_raw.tif'];
    fileID = fopen('lastStage.txt','w');
    laststage_indicator = [5];
    fprintf(fileID,'%d\n', laststage_indicator);
    fclose(fileID);
    system_command = ['.\dngOneExeSDK\dng_validate.exe -16 -cs1 -tif '  stage4OutputFileName ' ' inputFileName];
    system(system_command);   
    handles.myData.image = imread(stage4OutputFileName);
    delete(stage4OutputFileName);
    
    saved_image =handles.myData.image;

    t = Tiff(outputFileName,'w');
    output_unit16 = saved_image;

    tagstruct.ImageLength = size(output_unit16,1);
    tagstruct.ImageWidth = size(output_unit16,2);
    tagstruct.BitsPerSample = 16;
    tagstruct.SamplesPerPixel = 3;
    tagstruct.Photometric = Tiff.Photometric.RGB;
    % tagstruct.RowsPerStrip = 16;
    tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky;
    tagstruct.Software = 'MATLAB';
    % tagstruct.DNGVersion = [1; 4; 0; 0];
    t.setTag(tagstruct);
    t.write(output_unit16);
    t.close();
end
