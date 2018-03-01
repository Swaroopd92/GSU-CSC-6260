function [ OT,c,bim ] = rd( a,t )

    a = a+1;
    c = 2;
    [mx, mi] = size(a);
    if nargin<2
        s1 = a(1:6,1:6);
        s2 = a(1:6,mi-5:mi);
        s3 = a(mx-5:mx,1:6);
        s4 = a(mx-5:mx,mi-5:mi);
        t = ceil(mean(mean([s1 s2 s3 s4])));
        gg = t;
    else
        t=t+1;
    end
    
    oa = a(:);
    j = find(oa<t);
    i = find(oa<t);
    n1 = (length(j));
    n2 = (length(i));
    z1 = sum(oa(j))/n1;
    z2 = sum(oa(i))/n2;
    T(1) = t;
    T(2) = floor(((z2*.5+z1*.5)));
    h = hist(im2double(a));
    if t~=floor(((z2*.5+z1*.5)))
        while T(c-1)~=T(c)
            j = find(oa<=T(c));
            i = find(oa>T(c));
            c = c + 1;
            n1 = (length(j));
            n2 = (length(i));
            z1 = sum(oa(j))/n1;
            z2 = sum(oa(i))/n2;
            t = floor(((z2*.5+z1*.5)));
            while h(t)==0
                h(t);
                t = t+1;
            end
            OT=t;
            T(c) = floor(t);
        end
    else
    end
    n = 0:255;
    bim = im2bw(a, t/255);
    
    subplot(221);
    colormap(gray(256));
    image(a);
    title('Gray-level Image') 
    
    subplot(222);
    bar(n, n);
    axis([0 256 0 256]);
    title('Image Histiogram');
    
    subplot(223);
    colormap(gray(256));
    image(bim);
    title('Binary Image');
    
    figure(gcf)
    s = sprintf('Optimum T = %d', OT);
    xlabel(s);
    
    subplot(224);
    img = 180.*ones(64,64);
    image(img);
    axis([0 64 0 64]);
    text(10,20,'Thresholding Using');
    text(10,30,'Iterative Technique');
end

