function [sys,x0,str,ts] = dsfunc2(t,x,u,flag, x0a)
%DSFUNC An example M-file S-function for defining a discrete system.  
%   Example M-file S-function implementing discrete equations: 
%      x(n+1) = Ax(n) + Bu(n)
%      y(n)   = Cx(n) + Du(n)
%   
%   See sfuntmpl.m for a general S-function template.
%
%   See also SFUNTMPL.
    
%   Copyright 1990-2009 The MathWorks, Inc.
%   $Revision: 1.1.6.1 $

% Generate a discrete linear system:


%n=3;      %number of state
%q=1;    %std of process 
%r=1e-3;   %std of measurement
Q=[1e-4 0 0; 0 1e-10 0;0 0 1e-10];
R=1e-1;        % covariance of measurement 

%f=@(x)[x(1);x(2)+0.01*x(3); 0];  % nonlinear state equations
%b=0;
%h=@(x)[x(1)-x(1)*x(3)];                               % measurement equation

%resistência , soc , corrente
%s=[0.325;1; 0];                                % initial state
%x=[0.1;0.5; 0]; %initial state          % initial state with noise
                              % initial state covraiance

switch flag,

  %%%%%%%%%%%%%%%%%%
  % Initialization %
  %%%%%%%%%%%%%%%%%%
  case 0,

        sizes = simsizes;
        sizes.NumContStates  = 0;
        sizes.NumDiscStates  = 12;
        sizes.NumOutputs     = 7;
        sizes.NumInputs      = 2;
        sizes.DirFeedthrough = 1;
        sizes.NumSampleTimes = 1;

        sys = simsizes(sizes);
        P = [1e-1 0 0;0 1e-4 0; 0 0 1e-4]; 
        x0 =[x0a(1:3) P(1,:) P(2,:) P(3,:) ]; 
        str = [];
        ts  = [0.1 0]; 

% end mdlInitializeSizes

  %%%%%%%%%%
  % Update %
  %%%%%%%%%%
  case 2,  
  % 
    P=[x(4) x(5) x(6); x(7) x(8) x(9);x(10) x(11) x(12)];
    
    %
    %
    C=2070;
    R0=0.174;
    T=0.1;
    alfa1=0.9985507;
    R1=0.115;
    alfa2=0.9962963;
    R2=0.066;
% 
%     x_t=x(1)-T*u(2)/(C);
%     if (x_t<0)
%         x_t=eps;
%     elseif x_t>1
%         x_t=1-eps;
%     end
        
    
    %f=@(x)[x(1)-T*u(2)/(C);x(2)*alfa1 + R1*u(2)*(1-alfa1);x(3)*alfa2 + R2*u(2)*(1-alfa2)];  % nonlinear state equations
    
    %%z=(3.15-0.01*(1/x(1))-0.15*real(log(1-x(1))));
    
    %h=@(x)[(3.37-0.09*(1/(x(1)+0.115))-R0*u(2)-x(2)-x(3))];%-R*u(2)          % measurement equation
    %%V=max((K0-K1/SOC-K3*log(1-SOC)),0);

    f=@(x)[x(1)-T*u(2)/(C);x(2)*alfa1 + R1*u(2)*(1-alfa1);x(3)*alfa2 + R2*u(2)*(1-alfa2)];  % nonlinear state equations
    
    %z=(3.15-0.01*(1/x(1))-0.15*real(log(1-x(1))));
    
    h=@(x)[(3.37-0.09*(1/(0.115+x(1))))-x(2)-x(3)-R0*u(2)];%-R*u(2)          % measurement equation
    %V=max((K0-K1/SOC-K3*log(1-SOC)),0);

    if x0a(4)==1
        [a,P]=ukf2(f,[x(1:3)],P,h,u(1),Q,R);
    else
        [a,P]=ekf(f,[x(1:3)],P,h,u(1),Q,R);
    end

    
    sys =[a' P(1,:) P(2,:) P(3,:)];  
  %%%%%%%%%%
  % Output %
  %%%%%%%%%%
  case 3,           
    %z=u(3:6);
    %a= [(z(2)-0.01*(z(3)/x(1))-z(4)*0.1*real(log(1-x(1))))-z(1)*u(2)];
    %a= [(z(2)-0.01*(z(3)/x(1))-z(4)*0.1*real(log(1-x(1))))];
    z=(3.37-0.09*(1/(x(1)+0.115)-x(2)-x(3)-u(2)*R));
    b=x(4);
    c=x(8);
    d=x(12);
    
    sys = [x(1) x(2) x(3) z b c d];

  %%%%%%%%%%%%%
  % Terminate %
  %%%%%%%%%%%%%
  case 9,                                                
    sys = []; % do nothing

  %%%%%%%%%%%%%%%%%%%%
  % Unexpected flags %
  %%%%%%%%%%%%%%%%%%%%
  otherwise
    DAStudio.error('Simulink:blocks:unhandledFlag', num2str(flag));
end

%end dsfunc

%
%=======================================================================
% mdlInitializeSizes
% Return the sizes, initial conditions, and sample times for the S-function.
%=======================================================================
%
