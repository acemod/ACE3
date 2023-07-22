// execVM "z\ace\addons\interaction\dev\initReplaceTerrainCursorObject.sqf";
// use "J" key to replace terrain cursorObject and add dragging actions to it

#include "\z\ace\addons\interaction\script_component.hpp"

DFUNC(replaceTerrainModelsAdd) = {
    params ["_model", ["_class", ""]];
    if (_model isEqualType objNull) then {
        _model = getModelInfo _model select 1;
    };
    if (_model isEqualTo "") exitWith {systemChat "fail model"; false};

    private _savedClass = GVAR(replaceTerrainModels) get _model;
    if (!isNil "_savedClass") exitWith {systemChat ("was " + _savedClass); true};

    private _parent = "";
    if (_class isEqualTo "") then {
        private _configClasses = QUOTE(getNumber (_x >> 'scope') == 2 && {!(configName _x isKindOf 'AllVehicles')}) configClasses (configFile >> "CfgVehicles");
        {
            private _xmodel = toLower getText (_x >> "model");
            if (_xmodel select [0, 1] == "\") then {
                _xmodel = _xmodel select [1];
            };
            if ((_xmodel select [count _xmodel - 4]) != ".p3d") then {
                _xmodel = _xmodel + ".p3d"
            };
            if (_model == _xmodel) then {
                _class = configName _x;
                _parent = configName inheritsFrom _x;
                break;
            };
        } forEach _configClasses;
    };
    if (_class isEqualTo "") exitWith {systemChat "fail class"; false};
    GVAR(replaceTerrainModels) set [_model, _class];
    QEGVAR(interact_menu,renderNearbyActions) call CBA_fnc_localEvent;
    systemChat ("found " + _class);
    diag_log format ["replaceTerrain: class %1: %2", _class, _parent];
    true
};

// DIK_J
[0x24, [false, false, false], {
    if (
        cursorObject call FUNC(replaceTerrainModelsAdd)
        && {["ace_dragging"] call EFUNC(common,isModLoaded)}
    ) then {
        // wait while server replaces object, then init dragging on all clients
        [{
            if (typeOf cursorObject == "") exitwith {};
            [cursorObject, {
                if !hasInterface exitWith {};
                [_this, true] call EFUNC(dragging,setDraggable);
                [_this, true] call EFUNC(dragging,setCarryable);
            }] remoteExec ["call", 0];
        }, [], 1] call CBA_fnc_waitAndExecute;
    };
    true
}, nil, nil, false] call CBA_fnc_addKeyHandler;
