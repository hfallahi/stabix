% Copyright 2013 Max-Planck-Institut f�r Eisenforschung GmbH
function handles = preCPFE_buttons_AFM_indenter_topo(x0, hu, wu)
%% Function to create buttons to set indenter topography (mesh and rotation)
% x0: origin of x coordinate
% hu: heigth unit
% wu: width unit

% authors: d.mercier@mpie.de

parent = gcf;

gui = guidata(gcf);

handles.pm_indenter_mesh_quality = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Position', [x0 hu*19.3 wu*2.8 x0],...
    'Style', 'popup',...
    'String', {'Indenter - Very coarse mesh'; 'Indenter - Coarse mesh';...
    'Indenter - Fine mesh'; 'Indenter - Very fine mesh';....
    'Indenter - Ultra fine mesh'},...
    'BackgroundColor', [0.9 0.9 0.9],...
    'FontWeight', 'bold',...
    'FontSize', 10,...
    'HorizontalAlignment', 'center',...
    'Value', 2,...
    'visible', 'off');

if strcmp(gui.GB.active_data, 'SX') == 1
    set(handles.pm_indenter_mesh_quality, 'Callback', 'femproc_indentation_setting_SX');
elseif strcmp(gui.GB.active_data, 'BX') == 1
    set(handles.pm_indenter_mesh_quality, 'Callback', 'femproc_indentation_setting_BX');
end

handles.rotate_loaded_indenter_str = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Position', [x0 hu*18.7 wu*2.8 x0],...
    'Style', 'text',...
    'String', 'Rotation of the indenter (from 0 to 360�)',...
    'BackgroundColor', [0.9 0.9 0.9],...
    'HorizontalAlignment', 'center',...
    'FontSize', 10,...
    'visible', 'off');

handles.rotate_loaded_indenter = uicontrol('Parent', parent,...
    'Units', 'normalized',...
    'Style', 'slider',...
    'Min', 0, 'Max', 360, 'Value', 0,...
    'Position', [x0 hu*18.1 wu*2.8 x0],...
    'visible', 'off');

if strcmp(gui.GB.active_data, 'SX') == 1
    set(handles.rotate_loaded_indenter, 'Callback', 'femproc_indentation_setting_SX');
elseif strcmp(gui.GB.active_data, 'BX') == 1
    set(handles.rotate_loaded_indenter, 'Callback', 'femproc_indentation_setting_BX');
end

end
