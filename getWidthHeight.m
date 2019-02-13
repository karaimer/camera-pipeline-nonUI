function [width, height] = getWidthHeight( currentfilename )
    renderToGetIntermediateSize(currentfilename);

    inputFileNameforTXTfile = [currentfilename(1:end-4) '.txt'];
    fid = fopen(inputFileNameforTXTfile );
    neutral = textscan(fid,'%s');
    fclose(fid);
    width = str2num(neutral{1}{6});
    height = str2num(neutral{1}{8});
end

