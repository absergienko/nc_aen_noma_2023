function [x, n, M] = read_noma_codebook_from_ascii_file(filename, N_Users)
% function [x, n, M] = read_noma_codebook_from_ascii_file(filename, N_Users)
% reads a complex-valued NOMA codebook from ASCII file
% ASCII file should contain a table of real-valued numbers
% Each row represents one signal from one of the users' codebooks
% 1, 3, 5,... columns represent real part of numbers,
% 2, 4, 6,... columns represent imaginary part of numbers
% filename - ASCII file name, including extension
% N_Users - number of users in the codebook. The number of rows in the 
%           ASCII file shold be a multiple of this value
% x - codebook, complex-valued 3D (n-by-M-by-N_Users) array, signals along 1st dimension
% n - number of complex-valued time-domain samples in the codebook signals
% M - number of signals in the codebook

s = load(filename, '-ascii');
if mod(size(s, 2), 2)
    error('ASCII table should contain even number of columns!')
end
if mod(size(s, 1), N_Users)
    error('The number of rows in the ASCII table should be a multiple of N_Users input parameter!')
end
n = size(s, 2)/2;
M = size(s, 1)/N_Users;
x = complex(s(:,1:2:end), s(:,2:2:end)); % 2D array (M*N_Users)-by-n
x = x.'; % 2D array n-by-(M*N_Users)
x = reshape(x, [n M N_Users]); % 3D array n-by-M-by-N_Users
