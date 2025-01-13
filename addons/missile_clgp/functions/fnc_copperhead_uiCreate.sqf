#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Shows copperhead dialog
 *
 * Arguments:
 * Args
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, player] call ace_missile_clgp_fnc_copperhead_uiCreate
 *
 * Public: No
 */

[{ // execNextFrame to prevent issues with interaction menu closing

    params ["_vehicle", "_player"];
    TRACE_2("copperhead_uiCreate",_vehicle,_player);

    createDialog QGVAR(copperhead_dialog);

    private _display = uiNamespace getVariable [QGVAR(copperhead_dialog), displayNull];
    if (isNull _display) exitWith { ERROR("bad dialog");};

    private _copperheadSettings = _vehicle getVariable [QGVAR(copperhead_settings), COPPERHEAD_DEFUALT_SETTINGS];
    TRACE_1("current",_copperheadSettings);
    _display setVariable ["vehicle", _vehicle];
    _display setVariable ["settings", _copperheadSettings];


    // Scale and center model
    private _scale = 1 / (getResolution # 5); // keep object the same size for any interface size
    private _base = ["3d", [0,-0.338, 0.3333], _scale] call EFUNC(common,rscObjectHelper);
    (_display displayCtrl 100) ctrlSetPosition _base;
    (_display displayCtrl 100) ctrlSetModelScale _scale;


    // Handle mouse clicks on the dials
    private _fnc_dialClick = {
        params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];  
        private _display = ctrlParent _control;
        private _settings = _display getVariable "settings";

        private _add = if (_button == 0) then { 1 } else { -1 };
        
        private _dialIndex = ((ctrlIDC _control) % 10) - 1; 
        private _newValue = ((_add + _settings # _dialIndex) max 1) min 8;
        _settings set [_dialIndex, _newValue];
    };
    {
        (_display displayCtrl _x) ctrlAddEventHandler ["MouseButtonUp", _fnc_dialClick];
    } forEach [111, 112, 113, 114, 115];


    // Update display each frame
    private _fnc_eachFrame = {
        params ["_display"];
        private _vehicle = _display getVariable "vehicle";
        private _settings = _display getVariable "settings";

        if (!([_vehicle, ace_player] call FUNC(copperhead_uiCanOpen))) exitWith {
            closeDialog 5; 
        };
        {
            private _animName = format ["Dial%1", _forEachIndex + 1];
            private _phase = linearConversion [1,8,_x,0,1]; // ~40deg per click, handled by model.cfg
            (_display displayCtrl 100) ctrlAnimateModel [_animName, _phase];
        } forEach _settings;
    };
    _display displayAddEventHandler ["MouseMoving", _fnc_eachFrame];
    _display displayAddEventHandler ["MouseHolding", _fnc_eachFrame];


    // Save data to vehicle on close
    _display displayAddEventHandler ["Unload", {
        params ["_display", "_exitCode"];
        private _vehicle = _display getVariable "vehicle";
        private _settings = _display getVariable "settings";
        TRACE_3("Unload",_exitCode,_vehicle,_settings);
        if ((!alive _vehicle) || {_settings isEqualTo []}) exitWith { ERROR_2("unloaded with bad input %1-%2",_vehicle,_settings); };

        _vehicle setVariable [QGVAR(copperhead_settings), _settings, true]; // global
    }];
}, _this] call CBA_fnc_execNextFrame;
