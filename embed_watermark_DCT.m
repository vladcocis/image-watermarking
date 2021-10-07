function w_img = embed_watermark_DCT(img, w1,w2,w3,L)

% convert image to DCT domain
dct = dct2(double(img));

%get size of watermark (size is equal for w1, w2, w3)
[M,N]=size(w1);

% embed watermark in each of the square regions
dct(1:M,N+1:2*N)=dct(1:M,N+1:2*N)+w1.*L;
dct(M+1:2*M,N+1:2*N)=dct(M+1:2*M,N+1:2*N)+w2.*L;
dct(M+1:2*M,1:N)=dct(M+1:2*M,1:N)+w3.*L;

% convert DCT back to image
w_img = uint8(idct2(dct));

end