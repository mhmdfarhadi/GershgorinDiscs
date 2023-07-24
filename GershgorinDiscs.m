function [CentOut1,RadOut1,CentOut2,RadOut2] = GershgorinDiscs(A)
%{
A is a square matrix as input
centout is center output of gershgorin discs
radout is radius of each disc
%}


%condition check
if size(A,1) ~= size(A,2)
    error('given matrix should be a square matrix');
end

syms Rad Cent


%start of horizontal progress
for i = 1:size(A,1)
    Rad(i)=0;
    for j= 1:size(A,2)
        if i==j
            Cent(i)=A(i,j);
        else 
            Rad(i) = A(i,j) + Rad(i);
        end %if state
        
    end %for j
    
hold on
y=0;
theta = 0:pi/50:2*pi;
xunit = Rad(i) * cos(theta) + Cent(i);
yunit = Rad(i) * sin(theta) + y;
grid;
subplot(2,1,1);
if yunit == 0
    plot(xunit,0,'x');
    title('Horizontal progress');
    hold off
else
    plot(xunit, yunit);
    title('Horizontal progress');
    hold off
end%if

CentOut1(i,:) = [Cent(i)];
RadOut1(i,:) = [Rad(i)];


end %for i
%end of horizontal progress
   

%start of vertical progress
for j = 1:size(A,1)
    Rad(j)=0;
    for i= 1:size(A,2)
        if i==j
            Cent(j)=A(i,j);
        else 
            Rad(j) = A(i,j) + Rad(j);
        end %if state
        
    end %for j
    
hold on
y=0;
theta = 0:pi/50:2*pi;
xunit = Rad(j) * cos(theta) + Cent(j);
yunit = Rad(j) * sin(theta) + y;
grid;
subplot(2,1,2);
if yunit == 0
    plot(xunit,0,'x');
    title('Vertical progress');
    hold off
else
    plot(xunit, yunit);
    title('Vertical progress');
    hold off
end%if

CentOut2(j,:) = [Cent(j)];
RadOut2(j,:) = [Rad(j)];


end %for i
%end of vertical progress

grid;


end

