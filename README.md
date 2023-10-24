# nc_aen_noma_2023
This repository contains codebooks for noncoherent nonorthogonal multiple access (NOMA) system. The codebooks have been obtained using autoencoder neural network.

These results are presented in the following paper:

Alexander B. Sergienko, "Direct Optimization of Codebooks for Code-Domain Nonorthogonal Multiple Access with Noncoherent Reception," 
presented at the conference "XVIII International Symposium on Problems of Redundancy in Information and Control Systems" (REDUNDANCY 2023).

The codebooks are presented in two formats: as MATLAB data files (`*.mat`, folder `MAT`) and as ASCII files (`*.txt`, folder `ASCII`)

File names have the following form: `cb_noma_n*_U*_M*`
The number after "n" shows the number of samples in the codebook signals.
The number after "U" shows the number of users in the codebook
The number after "M" shows the number of signals in the codebook of one user (i.e., the number of bits that can be transmitted by one user using this codebook is `log2(M)`)
For example, the file `cb_noma_n6_U5_M4.txt` contains the set of codebooks for U=5 users, every codebook consists of M=4 signals (2 bits per user) with the length of n=6 samples, codebooks in the file are presented in ASCII format.

Every `.MAT` file contains a single variable with the name "ssc". This variable is a 3D complex-valued array with dimensions `[n M U]`, i.e., the signal samples are along the 1st dimension, signals in the codebook are placed along the 2nd dimension, and users are placed along the 3rd dimension. 

Every `.TXT` file contains an ASCII table of numbers with `M*U` rows and `2*n` columns. Every row of the table represents one signal from one of the users' codebook. Columns with even numbers (0-based indexing assumed) contain real parts of signal samples, columns with odd numbers contain imaginary parts of signal samples. First M rows of the file contain the codebook of the 1st user, next M rows contain the codebook of the 2nd user, and so on.

The ASCII folder also contains the file `read_noma_codebook_from_ascii_file.m` - MATLAB function for reading a codebook from these ASCII files. The functiuon returns a MATLAB variable in the format described above for "ssc" variable in `.MAT` files.

