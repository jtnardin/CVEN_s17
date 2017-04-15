Code to calculate cell densities and velocities given path finder data.

imagecrop.sh Will take an imagej frame and split it into 10 frame. This way pathfinder can actually run on each individual frame. 

Then run pathfinder on these images (currently using cell outer = 3, percentile = 10 , disp/frame = 10 , interval/frame = 1, min traj. length = 10). And get 10 .tif files for the 10 different regions of the image.

Then use save_xls_data.m to write these .xls files into cells in matlab. From here, we can call combine_cells to put all the cells into one large array in matlab.

Given the large array in matlab, we can then run speed_calc_4_14_loop_cells.m to get an estimate of the cell speeds and densities over time in the video. Use plot_speed_density_results.m to plot speed results over image (need .avi of image in file).
