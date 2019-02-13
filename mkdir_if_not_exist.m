function mkdir_if_not_exist(dirpath)
    if dirpath(end) ~= '/', dirpath = [dirpath '/']; end
    if ~exist(dirpath,'dir') mkdir(dirpath); end
end