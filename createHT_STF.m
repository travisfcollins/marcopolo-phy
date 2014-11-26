function HT_STF = createHT_STF()

% This sequence is an extension of the L-LTF where the four extra
% subcarriers are filled with +1 for negative frequencies and ?1 for
% positive frequencies.

% Create modulator
hPreambleMod = comm.OFDMModulator(...
    'NumGuardBandCarriers', [4; 3],...
    'CyclicPrefixLength',   0,...
    'FFTLength' ,           64,...
    'NumSymbols',           1);

LongPreamble =[1,  1,  1,  1, -1, -1,  1,  1, -1,  1, -1,  1,  1,  1,...
    1,  1,  1, -1, -1,  1,  1, -1,  1, -1,  1,  1,  1,  1, 0,...
    1, -1, -1,  1,  1, -1,  1, -1,  1, -1, -1, -1, -1, -1,...
    1,  1, -1, -1,  1, -1,  1, -1,  1,  1,  1,  1  -1  -1].';

% Modulate
HT_STF = step( hPreambleMod, complex(LongPreamble,0) );


end