clc;
close all;
bit=input('enter number of bits to encode=');

f=input('enter frequency of sine wave=');
fs=100*f;
t=0:1/fs:100/fs;                       
Am=input('Enter the amplitude of wave=');
y=Am*sin(2*pi*f*t);
%    y=Am*cos(2*pi*f*t);
figure(1);
stem(t,y); title('sampled input');
Nsamples=length(y)                
quantised_out=zeros(1,Nsamples);    
quantised_out1=zeros(1,Nsamples);

del=2*(Am)/((2^bit)-1);                
Llow=-Am+del/2;
Lhigh=Am-del/2;

for i=Llow:del:Lhigh               

    for j=1:Nsamples               
     if(((i-del/2)<y(j))&&(y(j)<(i+del/2)))        
        quantised_out(j)=i;                       
     end
     if(y(j)>Lhigh)
            quantised_out(j)=Lhigh+del/2;
      end
       if(y(j)<Llow)
            quantised_out(j)=Llow-del/2;
       end
    end                               
end
figure(2);
plot(t,quantised_out);                  
hold on; grid on;
title('MID-TREAD type uniform quantisation');xlabel('x-axis');ylabel('signal amplitude');
plot(t,y,'color','r');
legend('mid-tread quantized','original signal','location','southeast')
del1=2*(Am)/((2^bit));                  
Llow1=-Am+del1/2;
Lhigh1=Am-del1/2;

for i=Llow1:del1:Lhigh1               
    for j=1:Nsamples                     
     if(((i-del1/2)<y(j))&&(y(j)<(i+del1/2)))      
        quantised_out1(j)=i;
     end
      if(y(j)>Lhigh1)
            quantised_out1(j)=Lhigh1+del1/2;
      end
       if(y(j)<Llow1)
            quantised_out1(j)=Llow1-del1/2;
       end
     end                                  
    end                            
figure(3);
plot(t,quantised_out1);
title('MID-RISER type uniform quantisation');xlabel('x-axis');ylabel('signal amplitude');
hold on; grid on;                                        
plot(t,y,'color','r');
legend('mid-riser quantized','original signal','location','southeast');
