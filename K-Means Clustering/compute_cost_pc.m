function [cost] = compute_cost_pc(points, centroids)
	cost = 0;
	for i = 1:1:size(points,1)
				
				min = inf;
				for j = 1:1:size(centroids, 1)
					dist = norm(centroids(j, :) - points(i, :));
					if(dist < min)
						min = dist;
					endif
					
				endfor
				
				cost += min;
	endfor	
endfunction

