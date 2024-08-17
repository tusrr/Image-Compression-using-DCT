clc;
I1 = imread('flower.jpg');
imshow(I1);
Size12 = dir('flower.jpg');
Size1 = (Size12.bytes)/1024;
        %%For first channel
            %%   
            I = I1(:,:,1);
            I = im2double(I);
            T = dctmtx(8);
            B = blkproc(I,[8 8],'P1*x*P2',T,T');
            mask = [1   1   1   1   0   0   0   0
                1   1   1   0   0   0   0   0
                1   1   0   0   0   0   0   0
                1   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0];
            B2 = blkproc(B,[8 8],'P1.*x',mask);
            I2 = blkproc(B2,[8 8],'P1*x*P2',T',T);
            %%For second channel
            %%
            I = I1(:,:,2);
            I = im2double(I);
            T = dctmtx(8);
            B = blkproc(I,[8 8],'P1*x*P2',T,T');
            mask = [1   1   1   1   0   0   0   0
                1   1   1   0   0   0   0   0
                1   1   0   0   0   0   0   0
                1   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0];
            B2 = blkproc(B,[8 8],'P1.*x',mask);
            I3 = blkproc(B2,[8 8],'P1*x*P2',T',T);
            %% 3 rd channel %%
            I = I1(:,:,3);
            I = im2double(I);
            T = dctmtx(8);
            B = blkproc(I,[8 8],'P1*x*P2',T,T');
            mask = [1   1   1   1   0   0   0   0
                1   1   1   0   0   0   0   0
                1   1   0   0   0   0   0   0
                1   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0
                0   0   0   0   0   0   0   0];
            B2 = blkproc(B,[8 8],'P1.*x',mask);
            I4 = blkproc(B2,[8 8],'P1*x*P2',T',T);
            %%
            L =cat(3,I2,I3,I4);
             imshow(L);
            
            imwrite(L,'final.jpg');
            
            size23= dir('final.jpg');
            Size2 = (size23.bytes)/1024;
            fprintf('The original is %f and compressed is %f',Size1,Size2);
           

      
