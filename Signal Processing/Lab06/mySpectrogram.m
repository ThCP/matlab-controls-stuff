%% Lab 06
% Spectrogram

function [P] = mySpectrogram (x, Istep, Nfft, h, PlotFlag, name)

N = length(x);
Nw = length(h);

I=1:Istep:N;
NI = length(I);

if (mod(Nw, 2) ~= 0)
    Nw
    return
end

P = zeros(Nfft/2+1, NI);
k=0;
% for I=1:Istep:N
for n=I-1
    k=k+1;
%     n = I-1;
    n1 = n - Nw/2;
    n2 = n + Nw/2-1;
    
    if n1<0
        xn=[zeros(1,abs(n1)) x(1:n2+1)];
    elseif n2>N-1
        xn=[x(n1+1:N) zeros(1,n2-(N-1))];
    else
        xn=x(n1+1:n2+1);
    end
    
    PXn = (abs(fft(xn, Nfft))).^2;
    PXn_pos = PXn(1:Nfft/2+1);
    P(:, k) = PXn_pos;
end

if (PlotFlag == 1)
    f = 1/Nfft * [0:Nfft/2];
    figure, imagesc(I,f,P), axis xy;
    if nargin == 6
        title(name);
    end
    xlabel('n'),ylabel('f');
end
