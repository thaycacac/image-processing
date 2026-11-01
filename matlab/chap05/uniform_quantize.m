function Iq = uniform_quantize(I, L)
%UNIFORM_QUANTIZE Luong tu hoa anh thanh L muc deu trong [0,1].
%   Iq = uniform_quantize(I,L) nhan anh so va tra anh double [0,1].
    if ~isnumeric(I) || ~isreal(I)
        error('I must be a real numeric image.');
    end
    if ~isscalar(L) || L ~= floor(L) || L < 2 || L > 256
        error('L must be an integer between 2 and 256.');
    end
    I01 = im2double(I);
    I01 = min(max(I01,0),1);
    Iq = round(I01 * (L - 1)) / (L - 1);
end
