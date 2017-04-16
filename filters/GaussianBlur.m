%Read an Image
Img = imread('static/images/in');
I = double(A); 

%Standard Deviation, controls degree of blurring
sigma = 3;
%Window size
sz = floor(sigma * 3);
[x,y]=meshgrid(-sz:sz,-sz:sz);

%Used to find edge of image
M = size(x,1)-1;
N = size(y,1)-1;

%Making the Gaussian Kernel
Exponent = -(x.^2+y.^2)/(2*sigma*sigma);
Kernel = exp(Exponent)/(2*pi*sigma*sigma);

%Initializing output
Output=zeros(size(I));

%Pad the vector with zeros 
I = padarray(I,[sz sz]);

%Convolving Image with Kernel, once for each dimension
for k = [1 2 3]
    for i = 1:size(I,1)-M
        for j =1:size(I,2)-N
            Temp = I(i:i+M,j:j+M, k).*Kernel;
            Output(i,j,k)=sum(Temp(:));
        end
    end
end
%Image without Noise after Gaussian blur

imwrite(O, 'static/images/out.png');
figure,imshow(Output);