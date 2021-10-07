function X = detect_watermark(ch,w)

% detect watermark in requested channel using formula
t=(sum(w.*sign(ch),'all'))^2/sum(w.^2,'all');

% calculate standard deviation of matrix elements of requested channel
s=std2(ch);

%detect if watermark is present
if(t>10*s)
    X=1;
else
    X=0;
end