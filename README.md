# Fourier Transform Profilometry (FTP) for 3D Surface Measurement

## Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
3. [Usage](#usage)
4. [Code Explanation](#code-explanation)
5. [Examples](#examples)
6. [Requirements](#requirements)
7. [References](#references)
8. [License](#license)

## Introduction

This repository contains MATLAB code for **Fourier Transform Profilometry (FTP)**, a non-contact optical method for measuring 3D surface profiles. FTP works by projecting a fringe pattern onto an object, capturing the deformed fringes, and applying Fourier analysis to extract phase information, which is used to reconstruct the surface height. This technique is ideal for applications in various fields, including mechanical engineering, material science, biomedical imaging, and here - fluid mechanics.

## Features

- **Synthetic and real data examples**: Demonstrates FTP on both simulated and real-world data.
- **Customizable parameters**: Easily adjust fringe pattern frequency, filter settings, and more.
- **Comprehensive documentation**: Includes detailed examples and code explanations.
- **Results visualization**: View surface profiles and reconstructed data from both synthetic and experimental data.

## Usage

You can use the example scripts provided in the `examples` folder to test the FTP method with synthetic or real data.

- For **synthetic data**:
    ```matlab
    run('examples/ftp_example_synthetic.m');
    ```

- For **real experimental data**:
    ```matlab
    run('examples/ftp_example_experiment.m');
    ```

The results will be saved in the `examples` folder and can be visualized as surface profiles.

## Code Explanation

1. **`ftp_reconstruction.m`**: This is the core function that processes the fringe data, applies the Fourier transform, and reconstructs the 3D surface profile.
2. **`ftp_parameters.m`**: This file contains the parameters and settings for the FTP algorithm, such as fringe frequency, phase unwrapping, and filtering options.


## Examples

### 1. **Synthetic Data Profilometry**
   - The synthetic example generates simulated fringe patterns and applies FTP to reconstruct the surface profile.
   - To run: 
     ```matlab
     run('examples/ftp_example_synthetic.m');
     ```

### 2. **Real Data Profilometry**
   - This example applies FTP to real-world fringe data captured from an experimental setup.
   - To run: 
     ```matlab
     run('examples/ftp_example_experiment.m');
     ```

Results will be displayed and saved automatically, showing the reconstructed 3D surface profiles.

## Requirements

- MATLAB R2020a or later

## References

1. **Takeda, M., Mutoh, K. (1983)**. "Fourier transform profilometry for the automatic measurement of 3-D object shapes." *Applied Optics*, 22(24), 3977-3982. [DOI](https://doi.org/10.1364/AO.22.003977)
2. **Su, X., Chen, W. (2001)**. "Fourier transform profilometry: A review." *Optics and Lasers in Engineering*, 35(3), 263-284. [DOI](https://doi.org/10.1016/S0143-8166(01)00023-9)
3. **Cobelli, P.J., Maurel, A., Pagneux, V., Petitjeans, P. (2009)**. "Global measurement of water waves by Fourier transform profilometry" *Experiments in Fluids*, 46(6), 1037-1047. [DOI](https://doi.org/10.1007/s00348-009-0611-z)

## License

This project is licensed under the MIT License.
