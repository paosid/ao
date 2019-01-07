classdef PraseImage < handle
    properties
        bw
        bin
        originalIm
        bwIm
        binIm
        currentIm
    end
    methods 
        function obj = PraseImage()
            obj.bw = false;
            obj.bin = false;
        end
        function obj = readIm(obj, path)
            obj.originalIm = double (imread(path))/255;
            obj.currentIm = obj.originalIm;
        end
            
        function obj = changeToBw(obj)
            obj.bwIm = rgb2gray(obj.originalIm);
            obj.bw = true;
            obj.currentIm = obj.bwIm;
        end
        function obj = makeLighter(obj,number)
            if (obj.bw)
                obj.currentIm = obj.bwIm + number;
            end
        end
        function obj = changeContrast(obj,number)
            if (obj.bw)
                obj.currentIm = obj.bwIm * number;
            end
        end
        function obj = changeCorelation(obj,number)
            if (obj.bw)
                obj.currentIm = obj.bwIm.^number;
            end
        end
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