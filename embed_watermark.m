function new_ch = embed_watermark(ch,w)

%embed watermark in requested channel using aditive rule and with	
% a	watermark strength of 1.5
new_ch=ch+w.*1.5;

end