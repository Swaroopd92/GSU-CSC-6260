clear;

s = imread('output.png');
height = size(s,1);
width = size(s,2);

m = double(s(1,1))*8;
x = double(s(1,2));

k = 1;
for i = 1 : height
    for j = 3 : width
        if (k <= m)
            b(k) = mod(double(s(i,j)),x);
            k = k + 1;
        end
    end
end
for k = 1 : m
     binaryVector(k) = b(k);
end
binValues = [ 128 64 32 16 8 4 2 1 ];
binaryVector = binaryVector(:);
if mod(length(binaryVector),8) ~= 0
    error('Length of binary vector must be a multiple of 8.');
end
binMatrix = reshape(binaryVector,8,double(s(1,1)));
display(binMatrix);
textString = char(binValues*binMatrix);    
disp(textString);