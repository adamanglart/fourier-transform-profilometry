%% Basic parameters of the experimental setup

h=0.025; % water depth [m]
Fs=125;  % frames per second

%% Dimensions
L=1.88;     % [m] distance camera/projector - surface
D=0.45;     % [m] distance camera - projector

%% Pixel size
T10=148;        % Number of pixels per 10 wavelengths (carrier frequency);
cm = 10;        % How many centimiteres for...
pxs= 346.67;    % ...how many pixels?
fac=1;          % image resize factor (0 - 1/original image)

%% Phase difference
th=0.6;     % width of the gaussian window
ns=1;     % 1 - Gaussian window, <1 - Tukey window

