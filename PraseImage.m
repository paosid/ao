classdef PraseImage < handle
    properties
        bw          % says if pic is black and white
        bin         % says if pic is binary
        originalIm  % variable that remember look of original pic
        bwIm        % black&white image
        binIm       % binary Imagine (only ones and zeros)
        currentIm   % image on which all operations are executed
        lastOperation % tells if last operation was on original pic - 'o', 
                      % black&white pic - 'w'
                      % binary pic - 'b'
    end
    methods 
        % nothing more than setting flags
        function obj = PraseImage()
            obj.bw = false;
            obj.bin = false;
        end
        % reading image
        function obj = readIm(obj, path)
            obj.originalIm = double (imread(path))/255;
            obj.currentIm = obj.originalIm;
            obj.lastOperation = 'o';
        end

        % changes the original image to black&white
        function obj = changeToBw(obj)
            obj.bwIm = rgb2gray(obj.originalIm);
            obj.bw = true;
            obj.currentIm = obj.bwIm;
            obj.lastOperation = 'w';
        end
        % changing brightness
        function obj = makeLighter(obj,number)
            if (obj.bw && obj.lastOperation == 'w')
                obj.currentIm = obj.currentIm + number;
            end
        end
        % changing contrast
        function obj = changeContrast(obj,number)
            if (obj.bw && obj.lastOperation == 'w')
                obj.currentIm = obj.currentIm * number;
            end
        end
        % changing corelation
        function obj = changeCorelation(obj,number)
            if (obj.bw && obj.lastOperation == 'w')
                obj.currentIm = obj.currentIm.^number;
            end
        end
        % changing imiage to binary
        function obj = binOtsu(obj)
            if (obj.bw && obj.lastOperation == 'w')
                T = graythresh(obj.bwIm);
                obj.binIm = obj.bwIm;
                obj.binIm(obj.binIm>T) = 1;
                obj.binIm(obj.binIm<T) = 0;
                obj.bin = true;
                obj.currentIm = obj.binIm;
                obj.lastOperation = 'b';
            end
        end
        %adding gradient to pic
        function obj = gradient(obj, start_value,end_value)
            [h,w,z] = size(obj.originalIm);
            m = linspace(start_value,end_value,w);
            m = repmat(m,[h,1,3]);
           
            switch (obj.lastOperation)
                case 'w'
                    obj.currentIm = obj.currentIm.*m;
                case 'b'
                    obj.currentIm = obj.currentIm.*m;
                otherwise
                    obj.currentIm = obj.currentIm.*m;
            end
        end
        % eliminates noise through removing high frequency elements
        function obj = removeHighFre(obj)
            if (obj.bw && obj.lastOperation == 'w')
                f = ones(3);
                f = f/sum(f(:));
                obj.currentIm = imfilter(obj.currentIm,f);
            end
        end
        
       %suppress low frequency elements and strengthen high ones
       function obj = removeLowFre(obj)
           if (obj.bw && obj.lastOperation == 'w')
               f2 = [0,-1,0;-1,5,-1;0,-1,0];
               f2 = f2/sum(f2(:));
               obj.currentIm = imfilter (obj.currentIm,f2);
           end
       end
       %motion blur, in one direction blured, the other sharpen
       function obj = motionBlur(obj)
           if (obj.bw && obj.lastOperation == 'w')
               f3 = [0,-1,0;-1,1,-1;0,-1,0];
               f3 = f3/sum(f3(:));
               obj.currentIm = imfilter (obj.currentIm,f3);
           end
       end
       %elminates point interference
       function obj = medfiltr(obj)
           if (obj.bw && obj.lastOperation == 'w')
               obj.currentIm = medfilt2(obj.currentIm);
           end
       end
       function obj = erose(obj, number)
           if (obj.bw && obj.lastOperation == 'b')
               obj.currentIm = imerode(obj.currentIm,ones(number));
           end
       end
       function obj = dilate(obj,number)
           if (obj.bw && obj.lastOperation == 'b')
               obj.currentIm = imdilate(obj.currentIm, ones(number));
           end
       end
       %shows the edges of objects
       function obj = showEdges(obj)
           if (obj.bw && obj.lastOperation == 'b')
                obj.currentIm = obj.currentIm - imerode(obj.binIm,ones(3));
           end
       end
    end
end