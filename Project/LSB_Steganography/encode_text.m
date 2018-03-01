clear;

c = imread('baboon256.gif');
figure;
imshow(c);

fid = fopen('C:\Users\swaro\Dropbox\sdevaraju1\Project\LSB_Steganography\message.txt','r');
F = fread(fid);
message = char(F);
fclose(fid);

message = strtrim(message);
m = length(message) * 8;
AsciiCode = uint8(message); 
binaryString = transpose(dec2bin(AsciiCode,8));
binaryString = binaryString(:);
N = length(binaryString);
b = zeros(N,1);

for k = 1:N
    if(binaryString(k) == '1')
        b(k) = 1;
    else
        b(k) = 0;
    end
end

s = c;
height = size(c,1);
width = size(c,2);

s(1,1) = uint8(m/8);
s(1,2) = uint8(2);

k = 1;
for i = 1 : height
    for j = 3 : width
        if(k<=m)
            LSB = mod(double(s(i,j)),2);
            s(i,j)=s(i,j)+LSB+b(k);
            k=k+1;
        end

    end
end
imwrite(s,'output.png');

figure;
imshow(s);