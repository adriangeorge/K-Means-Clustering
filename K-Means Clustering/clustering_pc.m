function [centroids] = clustering_pc(points, NC)
	
		%initializing centroid vector and counter vector
		centroids = zeros(NC,size(points,2));
		%counter retains how many points were added to each centroid
		%each counter index coresponds to a centroid
		counter = zeros(1, NC);
		
		for i = 1:1:size(points, 1)
			index = mod(i,NC);	
			if(index == 0)
				index = NC;
			endif
			centroids(index,:) += points(i,:);
			counter(1, index)++; 
		endfor
		
		%computing initial centroids
		for i = 1:1:NC
			centroids(i , :) = centroids(i, :) / counter(i); 
  		endfor
		
		%iterative
		prev_centroids = centroids;
		
		while 1
		
			%for each point the euclidian distance between itself and each centroid from the previous iteration will be computed
			%each point will be added to the index of the nearest centroid 
			centroids = zeros(NC,size(points,2));
			counter = zeros(1, NC);
			for i = 1:1:size(points,1)
				
				dist = sum((prev_centroids - points(i, :)) .^ 2, 2);
				[coords, coords_index] = min(dist);
				
				centroids(coords_index, :) += points(i, :);
				counter(1, coords_index)++;
				
			endfor	
			

		
			for i = 1:1:NC
			centroids(i , :) = centroids(i, :) / counter(i); 
			endfor
			
			if(centroids == prev_centroids)
				break;
			endif
			prev_centroids = centroids;
  		endwhile
		
endfunction
