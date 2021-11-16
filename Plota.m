% %save('media.mat');
% %save('minimo.mat');
% Volt_bkp=Volt;
% SoC_bkp=SoC;
% SoC1_bkp=SoC1;
% corrente_bkp=corrente;
% energia_bkp=energia;


%clear all
load('media.mat');
Volt_me=Volt;
SoC_me=SoC;
SoC_me1=SoC1;
corrente_me=corrente;
energia_me=energia;
energia_me1=energia1;
clear Volt SoC corrente energia;

load('minimo.mat');
Volt_mi=Volt;
SoC_mi=SoC;
SoC_mi1=SoC1;
corrente_mi=corrente;
energia_mi=energia;
energia_mi1=energia1;
% 
% load('minimoEKF.mat');
% Volt_miE=Volt;
% SoC_miE=SoC;
% SoC_mi1E=SoC1;
% corrente_miE=corrente;
% energia_miE=energia;
% 
% load('mediaEKF.mat');
% Volt_meE=Volt;
% SoC_meE=SoC;
% SoC_me1E=SoC1;
% corrente_meE=corrente;
% energia_meE=energia;

%clear Volt SoC corrente energia;
opt='o';
while opt~= 'X'
opt = upper(input(['O que deseja plotar? (\nT - Tensões, \nS - SoC, \nS1 - SoC estimado \nS2 - SoC real x estimado '...
 '\nC - corrente de descarga, \nE - energia/potência de balanceamento \nE1 - energia/potência de carga/descarga \nX-sair'],'s'));
%t = upper('str')

 switch opt
   case 'T'
        subplot(2,1,1)
        plot(Volt_me.time,Volt_me.signals.values(:,1), '--b',...
             Volt_me.time,Volt_me.signals.values(:,2),':g',...
             Volt_me.time,Volt_me.signals.values(:,4), '-.c',...
             Volt_me.time,Volt_me.signals.values(:,3), '-r','LineWidth',2 )
        
        subplot(2,1,2)
        plot(Volt_mi.time,Volt_mi.signals.values(:,1), '--b',...
             Volt_mi.time,Volt_mi.signals.values(:,2),':g',...
             Volt_mi.time,Volt_mi.signals.values(:,4), '-.c',...
             Volt_mi.time,Volt_mi.signals.values(:,3), '-r','LineWidth',2 )
   case 'S'
        subplot(2,1,1)
        plot(SoC_me.time,SoC_me.signals.values(:,1), '--b',...
             SoC_me.time,SoC_me.signals.values(:,2),':g',...
             SoC_me.time,SoC_me.signals.values(:,4), '-.c',...
             SoC_me.time,SoC_me.signals.values(:,3), '-r','LineWidth',2 )
        %plot(SoC_me.time,SoC_me.signals.values)
        subplot(2,1,2)
        plot(SoC_mi.time,SoC_mi.signals.values(:,1), '--b',...
             SoC_mi.time,SoC_mi.signals.values(:,2),':g',...
             SoC_mi.time,SoC_mi.signals.values(:,4), '-.c',...
             SoC_mi.time,SoC_mi.signals.values(:,3), '-r','LineWidth',2 )
        %plot(SoC_mi.time,SoC_mi.signals.values)
%    case 'SE'
%         subplot(2,1,1)
%         plot(SoC_meE.time,SoC_meE.signals.values(:,1), '--b',...
%              SoC_meE.time,SoC_meE.signals.values(:,2),':g',...
%              SoC_meE.time,SoC_meE.signals.values(:,4), '-.c',...
%              SoC_meE.time,SoC_meE.signals.values(:,3), '-r','LineWidth',2 )
%         %plot(SoC_me.time,SoC_me.signals.values)
% %         subplot(2,1,2)
% %         plot(SoC_miE.time,SoC_miE.signals.values(:,1), '--b',...
% %              SoC_miE.time,SoC_miE.signals.values(:,2),':g',...
% %              SoC_miE.time,SoC_miE.signals.values(:,4), '-.c',...
% %              SoC_miE.time,SoC_miE.signals.values(:,3), '-r','LineWidth',2 )
% %         %plot(SoC_mi.time,SoC_mi.signals.values)
        
   case 'S1'
        subplot(2,1,1)
        %plot(SoC_me1.time,SoC_me1.signals.values)
        plot(SoC_me1.time,SoC_me1.signals.values(:,1), '--b',...
             SoC_me1.time,SoC_me1.signals.values(:,2),':g',...
             SoC_me1.time,SoC_me1.signals.values(:,4), '-.c',...
             SoC_me1.time,SoC_me1.signals.values(:,3), '-r','LineWidth',2 )
        subplot(2,1,2)
        %plot(SoC_mi1.time,SoC_mi1.signals.values)
        plot(SoC_mi1.time,SoC_mi1.signals.values(:,1), '--b',...
             SoC_mi1.time,SoC_mi1.signals.values(:,2),':g',...
             SoC_mi1.time,SoC_mi1.signals.values(:,4), '-.c',...
             SoC_mi1.time,SoC_mi1.signals.values(:,3), '-r','LineWidth',2 )
%    case 'S1E'
%         subplot(2,1,1)
% %         %plot(SoC_me1.time,SoC_me1.signals.values)
% %         plot(SoC_me1E.time,SoC_me1E.signals.values(:,1), '--b',...
% %              SoC_me1E.time,SoC_me1E.signals.values(:,2),':g',...
% %              SoC_me1E.time,SoC_me1E.signals.values(:,4), '-.c',...
% %              SoC_me1.time,SoC_me1E.signals.values(:,3), '-r','LineWidth',2 )
% %         subplot(2,1,2)
%         %plot(SoC_mi1.time,SoC_mi1.signals.values)
%         plot(SoC_mi1E.time,SoC_mi1E.signals.values(:,1), '--b',...
%              SoC_mi1E.time,SoC_mi1E.signals.values(:,2),':g',...
%              SoC_mi1E.time,SoC_mi1E.signals.values(:,4), '-.c',...
%              SoC_mi1E.time,SoC_mi1E.signals.values(:,3), '-r','LineWidth',2 )
   case 'S2'
        %subplot(1,1,1)
        %plot(SoC_me1.time,SoC_me1.signals.values)
        %plot(SoC_mi.time,SoC_me.signals.values(4), '-r',...
        %     SoC_mi1.time,SoC_mi1.signals.values(4), '--b',...
        %     SoC_mi1E.time,SoC_mi1E.signals.values(4), ':g','LineWidth',2)
        subplot(1,1,1)
        plot(SoC_mi.time,SoC_mi.signals.values(:,1), '-b',...
             SoC_mi.time,SoC_mi.signals.values(:,2),'-g',...
             SoC_mi.time,SoC_mi.signals.values(:,4), '-c', ...
             SoC_mi.time,SoC_mi.signals.values(:,3), '-r', ...
             SoC_mi1.time,SoC_mi1.signals.values(:,1), '--b',...
             SoC_mi1.time,SoC_mi1.signals.values(:,2), '--g',...
             SoC_mi1.time,SoC_mi1.signals.values(:,4), '--c', ...
             SoC_mi1.time,SoC_mi1.signals.values(:,3), '--r', ...
             'LineWidth',2 )
         %axis([0 15000 0 1])   
     case 'S3'
        %subplot(1,1,1)
        %plot(SoC_me1.time,SoC_me1.signals.values)
        %plot(SoC_mi.time,SoC_me.signals.values(4), '-r',...
        %     SoC_mi1.time,SoC_mi1.signals.values(4), '--b',...
        %     SoC_mi1E.time,SoC_mi1E.signals.values(4), ':g','LineWidth',2)
        subplot(1,1,1)
        plot(...%SoC_me.time,SoC_me.signals.values(:,1), ':b',...
             SoC_me.time,SoC_me.signals.values(:,2),'-dg',...
             ...%SoC_me.time,SoC_me.signals.values(:,4), ':c', ...
             ...%SoC_me.time,SoC_me.signals.values(:,3), ':r', ...
             ...%SoC_me1.time,SoC_me1.signals.values(:,1), '--b',...
             SoC_me1.time,SoC_me1.signals.values(:,2), '--g',...
             ...%SoC_me1.time,SoC_me1.signals.values(:,4), '--c', ...
             ...%SoC_me1.time,SoC_me1.signals.values(:,3), '--r', ...
             'LineWidth',2 )
         %axis([0 15000 0 1])
         

   case 'C'
        subplot(1,1,1)
        plot(corrente_me.time,corrente_me.signals.values,'--b',corrente_mi.time,corrente_mi.signals.values,'-r','LineWidth',2 )
        %subplot(2,1,2)
        %plot(corrente_mi.time,corrente_mi.signals.values,'LineWidth',2 )
    case 'E'
        [e0_me,e1_me]=energia_me.signals.values;
        [e0_mi,e1_mi]=energia_mi.signals.values;
        opt2 = upper(input('Deseja plotar Energia(E), Potência (P) ou Ambas (A)?','s'));
        
        switch opt2
            case 'E'
                subplot(1,1,1)
                plot(energia_me.time,e1_me,'--b',energia_mi.time,e1_mi,'-r','LineWidth',2)
                %subplot(2,1,2)
                %plot(energia_mi.time,e1_mi)  
            case 'P'
                subplot(1,1,1)
                plot(energia_me.time,e0_me,'--b',energia_mi.time,e0_mi,'-r','LineWidth',2)
                %subplot(2,1,2)
                %plot(energia_mi.time,e0_mi)  
            case 'A'
                subplot(2,1,1)
                plot(energia_me.time,e1_me,'--b',energia_mi.time,e1_mi,'-r','LineWidth',2)
                %subplot(2,2,2)
                %plot(energia_mi.time,e1_mi)  
                
                subplot(2,1,2)
                plot(energia_me.time,e0_me,'--b',energia_mi.time,e0_mi,'-r','LineWidth',2)
                %subplot(2,2,4)
                %plot(energia_mi.time,e0_mi)  
            otherwise
                fprintf('Erro!') 
        end
    case 'E1'
        %[e0_me,e1_me]=energia_me.signals.values;
        %[e0_mi,e1_mi]=energia_mi.signals.values;
        [e0_me,e1_me,e2_me]=energia_me1.signals.values;
        [e0_mi,e1_mi,e2_mi]=energia_mi1.signals.values;
        opt2 = upper(input('Deseja plotar Energia(E), Potência (P) ou Ambas (A)?','s'));
        
        switch opt2
            case 'E'
                subplot(2,1,1)
                plot(energia_me1.time,e1_me,'--b',energia_mi1.time,e1_mi,'-r','LineWidth',2)
                subplot(2,1,2)
                plot(energia_me1.time,e2_me,'--b',energia_mi1.time,e2_mi,'-r','LineWidth',2)
            case 'P'
                subplot(1,1,1)
                plot(energia_me1.time,e0_me,'--b',energia_mi1.time,e0_mi,'-r','LineWidth',2)
                %subplot(2,1,2)
                %plot(energia_mi.time,e0_mi)  
            case 'A'
                subplot(3,1,1)
                plot(energia_me1.time,e1_me,'--b',energia_mi1.time,e1_mi,'-r','LineWidth',2)
                %subplot(2,2,2)
                %plot(energia_mi.time,e1_mi)  
                subplot(3,1,2)
                plot(energia_me1.time,e2_me,'--b',energia_mi1.time,e2_mi,'-r','LineWidth',2)
                
                subplot(3,1,3)
                plot(energia_me1.time,e0_me,'--b',energia_mi1.time,e0_mi,'-r','LineWidth',2)
                %subplot(2,2,4)
                %plot(energia_mi.time,e0_mi)  
            otherwise
                fprintf('Erro!') 
        end
                
        
     case 'X'
      fprintf('Sair!')  
   otherwise
      fprintf('Erro!')
 end

end

%  clear e0_me e0_mi e1_me e1_mi opt2
%  clear Volt_me Volt_mi Volt_meE Volt_miE SoC_me SoC_mi  SoC_meE SoC_miE SoC_me1 SoC_mi1  SoC_me1E SoC_mi1E corrente_me corrente_mi corrente_meE corrente_miE energia_me energia_mi energia_meE energia_miE
%  
%  Volt=Volt_bkp;
%  SoC=SoC_bkp;
%  SoC1=SoC1_bkp;
%  corrente=corrente_bkp;
%  energia=energia_bkp;