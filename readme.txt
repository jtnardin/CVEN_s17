Code to calculate cell densities and velocities given path finder data.

imagecrop.sh Will take an imagej frame and split it into 10 frame. This way pathfinder can actually run on each individual frame. 

Then run pathfinder on these images (currently using cell outer = 3, percentile = 10 , disp/frame = 10 , interval/frame = 1, min traj. length = 10). 
