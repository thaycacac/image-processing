function tb = tinh_trung_binh_anh(anh)
%TINH_TRUNG_BINH_ANH Tinh trung binh tat ca pixel cua ma tran anh.
%   tb = tinh_trung_binh_anh(anh)
    tb = mean(double(anh(:)));
end
