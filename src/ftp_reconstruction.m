%--------------------------------------------------------------------------
% Function Name:  ftp_reconstruction.m
% Author:         Adam Anglart
% Date:           June 13, 2024
% Description:    This basic function computes phase difference maps between deformed
%                 and reference images using the principles of Fourier Transform Profilometry (FTP), 
%                 a technique in optical metrology for precise 3D surface measurement based on 
%                 Fourier transform analysis of fringe patterns. It applies FFT to extract phase 
%                 information and utilizes Gaussian or Tukey windows for spectral filtering.
%
% Inputs:         
%   dY  = deformed image
%   dY0 = reference image
%   th  = width parameter for Gaussian window
%   ns  = 'gaussianness' of the filter (ns = 1 for Gaussian, ns < 1 for Tukey)
%
% Outputs:        
%   dphase  = phase difference map between images        
%--------------------------------------------------------------------------

function dphase = ftp_reconstruction(dY,dY0,th,ns)

% Basic definitions
[nx,ny]=size(dY);

phase0 = zeros(nx,ny);
phase  = zeros(nx,ny);

for lin=1:nx
    
    fY0 = fft(dY0(lin,:));
    fY  = fft(dY(lin,:));

    % Search for the maximum frequency in the spectrum from point 10 on
    % (arbitrary at first, could be enhanced later on)
    [~,imax]=max(abs(fY0(10:floor(end/2))));
    if imax==1
        disp('Problem with analysis, max is located at null frequency in FFT.')
        stop
    end
   
    % Next line uses also the value 10 to be consistent with codeline number
    % 30 (change both lines accordingly if needed).
    ifmax = imax+ (10-1);
    
    HW = round(ifmax*th);
    W = 2*HW;
    win = tukeywin(W,ns);
    
    gausfilt1D = zeros(1,ny);
    gausfilt1D((ifmax-HW):(ifmax-HW+W-1)) = win.';
    
    % Multiplication by the filter
    Nfy0 = fY0.*gausfilt1D;
    Nfy = fY.*gausfilt1D;
    
    % Inverse Fourier transform of both images
    Ny0=ifft(Nfy0);
    Ny=ifft(Nfy);
    
    phase0(lin,:) = unwrap(angle(Ny0.'));
    phase(lin,:)  = unwrap(angle(Ny.'));
end

% Second step
% [Cross-unwrapping through column #500 (chosen arbitrarily)]

p0=phase0(:,1000);
up0=unwrap(p0);
p=phase(:,1000); up=unwrap(p);
phase0=phase0+(up0-p0)*ones(1,ny);
phase=phase+(up-p)*ones(1,ny);

% Definition of the phase difference map
dphase=(phase-phase0);
