% Frequency range for the Bode diagram
frequencies = logspace(-3, 3, 1000);  % Adjust the frequency range as needed

% Plotting the Bode diagram axes and transparent lines
figure;

% Subplot for the magnitude axis
subplot('Position', [0.1, 0.55, 0.8, 0.4]);
semilogx(frequencies, zeros(size(frequencies)), 'Color', 'none');  % Magnitude axis
title('Diagrama de Bode');
ylabel('Magnitud (dB)');
xlim([min(frequencies), max(frequencies)]);
ylim([-80, 80]);  % Adjust the y-axis limits as needed
grid on;

% Add grid lines at every 20 dB
yTicks = -80:20:80;
yticks(yTicks);
grid on;

% Subplot for the phase axis
subplot('Position', [0.1, 0.1, 0.8, 0.4]);
semilogx(frequencies, -180 * ones(size(frequencies)), 'Color', 'none');  % Phase axis
xlabel('Frecuencia (rad/s)');
ylabel('Fase (°)');
xlim([min(frequencies), max(frequencies)]);
ylim([-120, 120]);  % Adjust the y-axis limits as needed
grid on;

% Add grid lines at every 30 °
yTicks = -120:30:120;
yticks(yTicks);
grid on;