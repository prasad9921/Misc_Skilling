function randomized_idx_vect=get_randomized_idx_vect(idx_vect)
   % stream = RandStream.getDefaultStream;
    % reset(stream);
    randomized_idx_vect=[];
    while length(idx_vect) > 1
        curr_idx=round(0.5+rand*length(idx_vect));
        if curr_idx > length(idx_vect)
            curr_idx=length(idx_vect);
        end
        randomized_idx_vect=cat(2, randomized_idx_vect, idx_vect(curr_idx));
        idx_vect(curr_idx)=[];
    end
    if length(idx_vect) == 1
        randomized_idx_vect=cat(2, randomized_idx_vect, idx_vect);
    end