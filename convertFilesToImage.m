function convertFilesToImage(xSize, ySize, path, filename)
    fd1 = fopen('.\image\r.txt','r');
    fd2 = fopen('.\image\g.txt','r');
    fd3 = fopen('.\image\b.txt','r');
    r = fread(fd1,[ xSize ySize], 'double');
    fclose(fd1);
    g = fread(fd2,[ xSize ySize], 'double');
    fclose(fd2);
    b = fread(fd3,[ xSize ySize], 'double');
    fclose(fd3);
           
    image = zeros(ySize, xSize, 3);
    image(:,:,1) = r';
    image(:,:,2) = g';
    image(:,:,3) = b';
    image = im2double(image);

    path_for_stg4 = [path '\stage4\'];
    mkdir_if_not_exist (path_for_stg4 );
    currentfilename = [path_for_stg4 filename(1:end-4) '_st4.tif'];
    filename = currentfilename;
    outputFileName = filename;
    t = Tiff(outputFileName,'w');
    image = uint16(image*65535);
    output_unit16 = image;
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
    delete('.\image\r.txt');
    delete('.\image\g.txt');
    delete('.\image\b.txt');
end

