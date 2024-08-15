Overview
This guide introduces a MATLAB script crafted to streamline the task of reading and processing soil moisture data stored across various NetCDF (.nc) files. Here's a breakdown of what the script accomplishes:

Navigating Directories: The script is programmed to locate and move to a designated directory where your .nc files are kept.

Extracting Metadata: By examining the first .nc file, the script gathers essential metadata, focusing on details related to the Soil_Moisture variable.

Applying Scale Factors: It intelligently retrieves and applies the scale_factor attribute linked to the Soil_Moisture variable, ensuring accurate data representation.

Reading Data: The script efficiently reads longitude (lon) and latitude (lat) variables, alongside the Soil_Moisture variable, from every .nc file within the directory.

Storing Data: All soil moisture data collected from the files are neatly organized into a three-dimensional array. Each layer of this array corresponds to data from a unique .nc file.

How to Utilize the Script
To get started with using the script, follow these simple steps:

Specify the Data Directory: You'll need to update the dataDir variable within the script to match the path of your directory that houses the .nc files.

Execute the Script: Run the script using MATLAB. Upon completion, you'll find the processed soil moisture data stored in the SMOS array, ready for further analysis.

Important Notes
Please ensure every .nc file in your chosen directory includes the Soil_Moisture variable. Additionally, confirm that this variable carries a scale_factor attribute.

The script operates under the assumption that the structure of variables in the first .nc file is representative of the others.
