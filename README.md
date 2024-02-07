# 3D-Reconstruction
## Overview
This project delves into one of the cornerstones of computer vision—3D reconstruction from 2D images. 3D reconstruction is a critical component in fields such as robotics, autonomous systems, and augmented reality, enabling machines to perceive and interact with the world in three dimensions. The project is divided into multiple parts, starting with sparse reconstruction to create a point cloud with a limited number of points, and then progressing to dense reconstruction for a detailed 3D model. The tasks span from fundamental matrix computation to epipolar geometry and finally to the application of multi-view stereo techniques for an enhanced reconstruction.

## Objectives:
### 1.Sparse Reconstruction:
      - Develop algorithms to compute a sparse point cloud using two images of a temple.
      - Calculate the fundamental matrix and utilize the epipolar constraint for point matching.
      - Implement triangulation to derive 3D points from 2D image correspondences.

### 2.Dense Reconstruction:
      - Extend the work from sparse reconstruction to achieve dense 3D reconstruction.
      - Implement image rectification to facilitate easier matching and compute dense depth maps.

### 3.Camera Parameter Estimation:
      - Estimate camera projection matrices from 2D-3D point correspondences.
      - Decompose the projection matrices into intrinsic and extrinsic parameters.

### 4.Multi-View Stereo:
      - Utilize multiple images to improve the quality of 3D reconstruction.
      - Develop an algorithm to compute depth maps for reference images using multi-view stereo techniques.

## Deliverables:
### 1.Code Implementations:
      - A set of well-documented Python or MATLAB functions that perform the various reconstruction tasks, from sparse to dense mapping.

### 2.Visual Results:
      - Visualizations of point correspondences, epipolar lines, disparity maps, and depth maps.
      - Screenshots of the sparse and dense reconstructions from various perspectives.

### 3.Detailed Report:
      - A comprehensive report explaining the implemented methods, results obtained, and any challenges encountered.
      - Include visual evidence of the algorithms' success, such as plots of 3D reconstructions and histograms of matched features.

#### This project is an exciting journey through the various aspects of 3D reconstruction, providing a hands-on experience with real-world applications in computer vision. It encourages innovative problem-solving and deepens understanding of how machines interpret and navigate their environment in three dimensions.
