# Image Filtering and Fourier Transform Analysis

This repository contains MATLAB code for image filtering and Fourier Transform analysis in the frequency domain. It demonstrates how to apply various filters and visualize their effects on images using Fourier Transform techniques.

## Features
- Load and process grayscale images.
- Apply frequency domain filters:
  - Ideal Low-Pass Filter
  - Gaussian Low-Pass Filter
  - Gaussian High-Pass Filter
  - Butterworth Low-Pass Filter
- Visualize:
  - Original and filtered images.
  - Magnitude spectra of images.
  - 3D surface plots of magnitude spectra.
- Demonstrate zero-padding effects on frequency resolution.

## Files Included
1. **`Image_Filtering_and_FFT_MATLAB_code.m`**: Main script for image filtering and Fourier Transform analysis.
2. **`Zero_Padding.m`**: Demonstrates the impact of zero-padding on frequency resolution.
3. **`DFT_and_FFT_of_Images_in_MATLAB.pdf`**: Documentation explaining Fourier Transform concepts and their application in image processing.

## Usage
1. Clone this repository:
https://github.com/shadab007-byte/Image-Processing-Using-DFT-and-FFT

2. Open MATLAB and run `Image_Filtering_and_FFT_MATLAB_code.m` to start the image filtering process.
3. To explore zero-padding effects, run `Zero_Padding.m`.

## Dependencies
- MATLAB R2020b or later (earlier versions may work but are not tested).
- Image Processing Toolbox (optional but recommended).

## How It Works
1. The main script (`Image_Filtering_and_FFT_MATLAB_code.m`) allows you to:
- Load a grayscale image.
- Choose a filter type from a menu.
- Apply the selected filter in the frequency domain.
- Visualize the results in both spatial and frequency domains.

2. The `Zero_Padding.m` script demonstrates how zero-padding improves frequency resolution by comparing DFT results with and without padding.

## Documentation
For detailed theoretical explanations of Fourier Transform concepts, refer to `DFT_and_FFT_of_Images_in_MATLAB.pdf`.



