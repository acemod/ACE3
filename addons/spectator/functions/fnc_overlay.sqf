/*
    Author:
    voiper

    Description:
    Spectator unit list.

    Arguments:
    0: Specific function to use <String>
    1: Function params <Array>

    Example:
    ["Init", [display]] call ace_spectator_fnc_overlay;

    Return Value:
    None

    Public:
    No
*/

#include "script_component.hpp"

_mode = _this select 0;
_this = _this select 1;

switch _mode do {
    
    case "Init": {
    
        _display = _this select 0;
        _ctrl = _display displayCtrl 0;
        _count = _ctrl tvCount [];
        for "_i" from 0 to _count do {
            _ctrl tvDelete [_x];
        };
        
        _ctrl tvAdd [[], "Blufor"];
        _ctrl tvAdd [[], "Opfor"];
        _ctrl tvAdd [[], "Independent"];
        _ctrl tvAdd [[], "Civilian"];
        
        _unitList = [];
        
        {
            _units = units _x;
            private ["_groupNum"];
            {
                if ((GVAR(units) find _x > -1) && alive _x) then {
                    _info = [_x] call FUNC(unitInfo);
                    _text = _info select 0;
                    _team = _info select 1;
                    _side = switch (_team) do {
                        case BLUFOR: {0};
                        case OPFOR: {1};
                        case INDEPENDENT: {2};
                        case CIVILIAN: {3};
                    };
                    
                    _icon = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "Icon");
                    _picture = "\a3\ui_f\data\map\VehicleIcons\" + _icon + "_ca.paa";
                    _treeIndex = [];
                    _unitList pushBack _x;
                    
                    _savedUnit = GVAR(savedUnits) find _x;
                    if (_savedUnit > -1) then {_text = _text + " (#" + str (_savedUnit + 1) + ")"};
                            
                    if (_forEachIndex == 0) then {
                        _groupNum = _ctrl tvAdd [[_side], _text];
                        _treeIndex = [_side, _groupNum];
                    } else {
                        _num = _ctrl tvAdd [[_side, _groupNum], _text];
                        _treeIndex = [_side, _groupNum, _num];
                    };

                    _ctrl tvSetPicture [_treeIndex, _picture];
                    _ctrl tvSetData [_treeIndex, [_x] call FUNC(unitVar)];
                    _unitList pushBack _treeIndex;
                };
            } forEach _units;
        } forEach allGroups;
        
        if (!isNull GVAR(unit)) then {
            if (alive GVAR(unit)) then {
                _treeIndex = _unitList select ((_unitList find GVAR(unit)) + 1);
                _ctrl tvSetCurSel _treeIndex;
            };
        };
    };
    
    case "Select": {
    
        _ctrl = _this select 0;
        _selection = _this select 1;
        if (count _selection < 2) exitWith {};
        
        _str = _ctrl tvData _selection;
        _unit = missionNamespace getVariable _str;
        GVAR(unit) = _unit;
        if (GVAR(cameraOn)) then {
            ["Camera", ["Third"]] call FUNC(camera);
        } else {
            ["Camera", ["SwitchUnit"]] call FUNC(camera);
        };
    };
};