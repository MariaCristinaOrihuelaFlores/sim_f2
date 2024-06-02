%% Transmisión focal
%% Parameters
% medium parameters
c0              = 1540;     % sound speed [m/s]
rho0            = 1000;     % density [kg/m^3]

% source parameters
source_f0       = 6.66e6;   % source frequency [Hz]
source_amp      = 1e6;      % source pressure [Pa]
source_cycles   = 4;      % number of toneburst cycles
source_focus    = 20e-3;    % focal length [m]
element_pitch   = 0.3e-3;   % pitch [m]
element_width   = 0.25e-3;  % width [m]
focal_number    = 2;
nLines          = 96;

% grid parameters
grid_size_x     = 50e-3;    % [m]
grid_size_y     = 40e-3;    % [m]

% transducer position
translation     = [-20e-3, 0];
rotation        = 0;

% computational parameters
DATA_CAST       = 'gpuArray-single'; % set to 'single' or 'gpuArray-single'
ppw             = 6;        % number of points per wavelength, 4 to 8
depth           = 40e-3;    % imaging depth [m]
cfl             = 0.3;      % CFL number, could be 0.3 or 0.5
%% GRID
% calculate the grid spacing based on the PPW and F0
dx = c0 / (ppw * source_f0);   % [m]
Nx = roundEven(grid_size_x / dx);
Ny = roundEven(grid_size_y / dx);
kgrid = kWaveGrid(Nx, dx, Ny, dx);
t_end           = depth*2/c0;     % [s];    % total compute time [s]
kgrid.makeTime(c0, cfl, t_end);
%% MEDIUM










