load("ME_494_HW7_sine_input")
load("ME_494_HW7_step_input")
load("ME_494_HW7_sine_data")
load("ME_494_HW7_step_data")
load("ME_494_HW7_sine_data_KO")

%time%
t = simout_sine.time;
% inputs %
sin_in = simout_sine.signals.values(:,1);
step_in = simout_step.signals.values(:,1);

% angle %
sin_ang = simout_sine.signals.values(:,2);
step_ang = simout_step.signals.values(:,2);
sin_ang_ko = simout_sine_ko.signals.values;

% angular velocity %
% sin_vel = deriv(sin_ang,.002);
% step_vel = deriv(step_ang,.002);
sin_vel_ko = deriv(sin_ang_ko,.002);
sin_vel = simout_sine.signals.values(:,3);
step_vel = simout_sine.signals.values(:,3);

% angular accelaeration %
% sin_acc = deriv(sin_vel,.002);
% step_acc = deriv(step_vel,.002);
sin_acc_ko = deriv(sin_vel_ko,.002);
sin_acc = simout_sine.signals.values(:,4);
step_acc = simout_sine.signals.values(:,4);

% cutting the first np points %
np = 20;
%time%
t = t(np:end,1);

% inputs %
sin_in = sin_in(np:end,1);
step_in = step_in(np:end,1);

% angle %
sin_ang = sin_ang(np:end,1);
step_ang = step_ang(np:end,1);
sin_ang_ko = sin_ang_ko(np:end,1);

% angular velocity %
sin_vel = sin_vel(np:end,1);
step_vel = step_vel(np:end,1);
sin_vel_ko = sin_vel_ko(np:end,1);

% angular accelaeration %
sin_acc = sin_acc(np:end,1);
step_acc = step_acc(np:end,1);
sin_acc_ko = sin_acc_ko(np:end,1);

N = length(t);
bias = ones(N,1);


% OLS for Qube with step data %
x = [bias, step_in, step_ang, step_vel];
T_hat =(x'*x)\x'*step_acc;
Y_hat = x*T_hat;
T_hat_step = T_hat
disp('The step R squared value is:')
v = step_acc - Y_hat;
s_sq = sum(v.^2)/(length(v) -length(T_hat));
R_sq_step = (T_hat'*x'*step_acc - length(step_acc)*mean(step_acc)^2) / (step_acc'*step_acc - length(step_acc) * mean(step_acc)^2)

% OLS for Qube with sin data %
x2 = [bias, sin_in, sin_ang, sin_vel];
T_hat2 =(x2'*x2)\x2'*sin_acc;
Y_hat2 = x2*T_hat2;
T_hat_sin = T_hat2
disp('The sine R squared value is:')
v2 = step_acc - Y_hat2;
s_sq2 = sum(v2.^2)/(length(v2) -length(T_hat2));
R_sq_sin = (T_hat2'*x2'*sin_acc - length(sin_acc)*mean(sin_acc)^2) / (sin_acc'*sin_acc - length(sin_acc) * mean(sin_acc)^2)

% plot multistep input%
figure(1)
plot(steven_step.time, steven_step.signals.values)
title('multi-step input vs. time')
xlabel('time(s)')
ylabel('voltage(V)')

% plot multisine input %
figure(2)
plot(steven_sin.time, steven_sin.signals.values)
title('multi-sine input vs. time')
xlabel('time(s)')
ylabel('voltage(V)')

% plot multistep angular acceleration%
figure(3)
plot(t, step_acc, t, Y_hat, t, Y_hat + 2 * sqrt(s_sq),'--b', t, Y_hat - 2 * sqrt(s_sq),'--b')
title('desired and modeled multi-step acceleration output vs. time')
xlabel('time (s)')
ylabel('angular acc (rad/s2)')
legend('measured','modeled', 'confidence interval')

% plot multisine angular acceleration%
figure(4)
plot(t, sin_acc, t, Y_hat2, t, Y_hat2 + 2 * sqrt(s_sq2),'--b', t, Y_hat2 - 2 * sqrt(s_sq2),'--b')
title('desired and modeled multi-sin acceleration output vs. time')
xlabel('time (s)')
ylabel('angular acc (rad/s2)')
legend('measured','modeled', 'confidence interval')

% plot multisine angular velocity %
% figure(5)
% plot(t, sin_vel)
% title('multi-sin velocity output vs. time')
% xlabel('time (s)')
% ylabel('angular vel (rad/s)')
% 
%% plot multistep angular velocity %
% figure(6)
% plot(t, step_vel)
% title('multi-step velocity output vs. time')
% xlabel('time (s)')
% ylabel('angular vel (rad/s)')
% 
%% plot multisine angle %
% figure(7)
% plot(t, sin_ang)
% title('multi-sine angle output vs. time')
% xlabel('time (s)')
% ylabel('angle (rad)')
% 
%% plot multistep angle %
% figure(8)
% plot(t, step_ang)
% title('multi-step angle output vs. time')
% xlabel('time (s)')
% ylabel('angle (rad)')