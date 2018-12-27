classdef PraseImage
    properties
        bw
        originalIm
        bwIm
        binIm
        currentIm
        histogram
    end
    methods 
        function obj = PraseImage()
            obj.bw=false;
        end
        function obj = showHist()
            if (histogram)
                obj.histogram = imhist(currentIm);
            end
        end
        function obj = readIm(nameOfFile)
            obj.originalIm = double (imread(nameOfFile))/255;
        end
        function obj = changeToBin()
            obj.bwIm = rgb2gray(imToBin);
            obj.bw = true;
        end
        function obj = makeLighter(number)
            if (bw)
                obj.currentIm = bwIm + number;
            end
        end
        function obj = changeContrast(number)
            if (bw)
                obj.currentIm = bwIm + number;
            end
        end
        function obj = changeCorelation(number)
            if (bw)
                obj.currentIm = bwIm.^number;
            end
        end
        function obj = bwOtsu()
            if (bw)
                T = graythresh(obj.bwIm);
                obj.bwIm(obj.bwIm>T) = 1;
                obj.bwIm(obj.bwIm<T) = 0;
            end
        end
        function obj = gradient()
            [h,w,z] = size(obj.originalIm);
            m = linspace(0,1,w);
            m = repmat(m,[h,1,3]);
            obj.currentIm = obj.originalIm.*m;
        end
    end
end
