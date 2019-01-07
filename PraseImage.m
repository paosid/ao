classdef PraseImage < handle
    properties
        bw          % says if pic is black and white
        bin         % says if pic is binary
        originalIm  % variable that remember look of original pic
        bwIm        % black&white image
        binIm       % binary Imagine (only ones and zeros)
        currentIm   % image on which all operations are executed
    end
    methods 
        % nothing more than setting flags
        function obj = PraseImage()
            obj.bw = false;
            obj.bin = false;
        end
        % reading image
        function obj = readIm(obj)
            obj.originalIm = double (imread('kaczki.jpg'))/255;
            obj.currentIm = obj.originalIm;
        end
        % changes the original image to black&white
        function obj = changeToBw(obj)
            obj.bwIm = rgb2gray(obj.originalIm);
            obj.bw = true;
            obj.currentIm = obj.bwIm;
        end
        % changing brightness
        function obj = makeLighter(obj,number)
            if (obj.bw)
                obj.currentIm = obj.currentIm + number;
            end
        end
        % changing contrast
        function obj = changeContrast(obj,number)
            if (obj.bw)
                obj.currentIm = obj.currentIm * number;
            end
        end
        % changing corelation
        function obj = changeCorelation(obj,number)
            if (obj.bw)
                obj.currentIm = obj.currentIm.^number;
            end
        end
        % changing imiage to binary
        function obj = binOtsu(obj)
            if (obj.bw)
                T = graythresh(obj.bwIm);
                obj.binIm = obj.bwIm;
                obj.binIm(obj.binIm>T) = 1;
                obj.binIm(obj.binIm<T) = 0;
                obj.bin = true;
                obj.currentIm = obj.binIm;
            end
        end
        %adding gradient to pic
        function obj = gradient(obj, start_value,end_value, mode)
            [h,w,z] = size(obj.originalIm);
            m = linspace(start_value,end_value,w);
            m = repmat(m,[h,1,3]);
            switch (mode)
                case 'bw'
                    obj.currentIm = obj.bwIm.*m;a
                case 'bin'
                    obj.currentIm = obj.binIm.*m;
                otherwise
                    obj.currentIm = obj.originalIm.*m;
            end
        end
        
    end
end