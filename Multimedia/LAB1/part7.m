%% Step 7
% close all
[n_errors, p_errors] = generate_errors('lena512.jpg', 'lena512_out.jpg', 1e-4, 400);

% figure, imshow('lena512.jpg');
figure, imshow('lena512_out.jpg');