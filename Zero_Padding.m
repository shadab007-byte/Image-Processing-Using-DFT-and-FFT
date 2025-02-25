% Create a binary image 
f = zeros(30,30);         % Initialize a 30x30 matrix with all zeros 
f(5:24,13:17) = 1;        % Set a rectangular area to 1 (rectangle) in the center
subplot(2,2,1);           % Set position for first plot in a 2x2 grid
imshow(f, "InitialMagnification", "fit"); % Display the binary image
title('Original Image');  

% Compute and display the Discrete Fourier Transform (DFT) without zero-padding
F = fft2(f);              % Perform 2D Fourier Transform on the original image
F_log = log(abs(F));      % Take the log of the magnitude to improve visibility
subplot(2,2,2);           % Set position for second plot
imshow(F_log, [-1 5], "InitialMagnification", "fit"); % Display the DFT without padding
colormap(jet);            % Apply a jet colormap for better contrast
colorbar;                 % Add a color bar for reference
title('DFT without Zero-Padding'); 

% Compute and display the DFT with zero-padding for higher frequency resolution
F_padded = fft2(f, 256, 256); % Perform 2D Fourier Transform with zero-padding to 256x256
F_padded_log = log(abs(F_padded)); % Take the log of the magnitude
subplot(2,2,3);           % Set position for third plot
imshow(F_padded_log, [-1 5], "InitialMagnification", "fit"); % Display the DFT with padding
colormap(jet);            % Apply colormap for better visibility
colorbar;                 % Add color bar for reference
title('DFT with Zero-Padding');

% Shift the zero-frequency component to the center of the spectrum and display it
F_shifted = fftshift(F_padded); % Shift the quadrants so zero-frequency is at the center
F_shifted_log = log(abs(F_shifted)); % Take the log of the magnitude
subplot(2,2,4);           % Set position for fourth plot
imshow(F_shifted_log, [-1 5], "InitialMagnification", "fit"); % Display the centered DFT
colormap(jet);            % Apply colormap for visibility
colorbar;                 % Add color bar for reference
title('Centered DFT with Zero-Padding');