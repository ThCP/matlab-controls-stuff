% Spectrogram

function [P] = Spectrogram(x,Istep,Nfft,h,PlotFlag)

N=length(x);

I=[1:Istep:N];
NI=length(I);

Nw=length(h);
P=zeros(Nfft/2+1,NI);

k=0;
for n=I-1
    k=k+1;
    
    n1=n-Nw/2;
    n2=n+Nw/2-1;
    if n1<0
        xn=[zeros(1,abs(n1)) x(1:n2+1)];
    elseif n2>N-1
        xn=[x(n1+1:N) zeros(1,n2-(N-1))];
    else
        xn=x(n1+1:n2+1);
    end    
    
    Pxn=abs(fft(xn,Nfft)).^2;
    P(:,k)=Pxn(1:Nfft/2+1);
end

if PlotFlag
    f=1/Nfft*[0:Nfft/2];
    figure,imagesc(I,f,P),axis xy;
    xlabel('n'),ylabel('f');
end