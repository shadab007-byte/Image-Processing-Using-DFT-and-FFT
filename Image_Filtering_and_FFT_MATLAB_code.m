% Program for Image Filtering and Fourier Transform Analysis in Frequency Domain

% Step 1: Select a grayscale image
[filename, pathname] = uigetfile('*.*', 'Select a grayscale Image');
filewithpath = fullfile(pathname, filename);
img = imread(filewithpath);

% Step 2: Convert to grayscale if it’s not already
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Step 3: Get image dimensions
[row, col] = size(img);

% Step 4: Compute the 2D Fourier Transform of the image
F = fft2(double(img));

% Step 5: Shift the zero frequency component to the center of the spectrum
% which is useful for better visualization...
Fs = fftshift(F);

% Step 6: Prompt the user to choose the filter type
filterType = menu('Choose a filter type:', ...
    'Ideal Low-Pass Filter', ...
    'Gaussian Low-Pass Filter', ...
    'Gaussian High-Pass Filter', ...
    'Butterworth Low-Pass Filter');

cutoff = 50; % Define cutoff frequency

% Step 7: Define the filter based on the chosen type
switch filterType
    case 1
        H = idealLowPassFilter(row, col, cutoff);
    case 2
        H = gaussianLowPassFilter(row, col, cutoff);
    case 3
        H = gaussianHighPassFilter(row, col, cutoff);
    case 4
        order = 2; % Order of the Butterworth filter (you can adjust this)
        H = butterworthLowPassFilter(row, col, cutoff, order);
    otherwise
        error('No filter selected.');
end

% Step 8: Apply the filter to the frequency domain image
Fsf = Fs .* H;

% Step 9: Compute the inverse Fourier Transform to obtain the filtered image
fimg = ifft2(fftshift(Fsf));
imgr = uint8(real(fimg)); % Convert the result to an 8-bit integer format

% Step 10: Display the original image, 2D magnitude spectrum, filtered image, and its 2D spectrum
figure;

subplot(2, 2, 1);
imshow(img);
title('Original Image (Spatial Domain)');

subplot(2, 2, 2);
imshow(log(1 + abs(Fs)), []);
title('Magnitude Spectrum (Original Image)');

subplot(2, 2, 3);
imshow(imgr, []);
title('Filtered Image (Spatial Domain)');

subplot(2, 2, 4);
imshow(log(1 + abs(Fsf)), []);
title('Magnitude Spectrum (Filtered Image)');

% Step 11: Display the 3D surface plot of the magnitude spectrum of the original image
figure;
F_log = log(1 + abs(Fs)); % Log transform for better visualization
surf(F_log, 'EdgeColor', 'none'); % Remove edges for smooth surface
title('3D Surface of Magnitude Spectrum (Original Image)');
xlabel('Frequency X');
ylabel('Frequency Y');
zlabel('Magnitude');
axis tight;
view(45, 30); % Set viewing angle
colorbar; % Add colorbar for better magnitude visibility
grid on;

% Normalize for a better visual comparison
zlim([0, max(F_log(:))]);

% Step 12: Display the 3D surface plot of the magnitude spectrum of the filtered image
figure;
Fsf_log = log(1 + abs(Fsf)); % Log transform for better visualization
surf(Fsf_log, 'EdgeColor', 'none'); % Remove edges for smooth surface
title('3D Surface of Magnitude Spectrum (Filtered Image)');
xlabel('Frequency X');
ylabel('Frequency Y');
zlabel('Magnitude');
axis tight;
view(45, 30); % Set viewing angle
colorbar; % Add colorbar for better magnitude visibility
grid on;

% Set z-axis limits to match the original for comparison
zlim([0, max(F_log(:))]);


% --- Filter Functions ---

% Function to create an Ideal Low-Pass Filter
function H = idealLowPassFilter(rows, cols, cutoff)
    [u, v] = meshgrid(1:cols, 1:rows);
    D = sqrt((u - cols/2).^2 + (v - rows/2).^2);
    H = double(D <= cutoff);
end

% Function to create a Gaussian Low-Pass Filter
function H = gaussianLowPassFilter(rows, cols, cutoff)
    [u, v] = meshgrid(1:cols, 1:rows);
    D = sqrt((u - cols/2).^2 + (v - rows/2).^2);
    H = exp(-(D.^2) / (2 * (cutoff^2)));
end

% Function to create a Gaussian High-Pass Filter
function H = gaussianHighPassFilter(rows, cols, cutoff)
    [u, v] = meshgrid(1:cols, 1:rows);
    D = sqrt((u - cols/2).^2 + (v - rows/2).^2);
    H = 1 - exp(-(D.^2) / (2 * (cutoff^2)));
end

% Function to create a Butterworth Low-Pass Filter
function H = butterworthLowPassFilter(rows, cols, cutoff, order)
    [u, v] = meshgrid(1:cols, 1:rows);
    D = sqrt((u - cols/2).^2 + (v - rows/2).^2);
    H = 1 ./ (1 + (D / cutoff).^(2 * order));
end
