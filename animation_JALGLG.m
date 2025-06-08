figure(gcf); % reuse the current figure
shading interp; % smooth shading like PDE toolbox

% Fix color axis across all frames
cmin = min(u(:));
cmax = max(u(:));

for i = 1:size(u, 2)
    clf; % clear figure to keep only one frame at a time
    pdeplot(p, e, t, ...
        'XYData', u(:, i), ...
        'ZData', u(:, i), ...
        'Mesh', 'off', ...
        'ColorMap', cool);  % same colormap as default

    shading interp;         % smooth shading
    caxis([cmin cmax]);     % lock color scaling
    axis tight;
    view(3);                % enable 3D view like in PDE GUI
    camlight; lighting gouraud; % nice lighting

    title(sprintf('Time step: %d / %d', i, size(u,2)), 'FontSize', 12);
    drawnow;
    
end
