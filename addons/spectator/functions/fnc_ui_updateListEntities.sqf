/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Updates spectator UI list of units/groups
 *
 * Public: No
 */

#include "script_component.hpp"

private _newUnits = [];
private _newGroups = [];
private _newList = [
    [west, "west", localize "str_west", []],
    [east, "east", localize "str_east", []],
    [independent, "indy", localize "str_guerrila", []],
    [civilian, "civ", localize "str_civilian", []]
];

// Go through groups and get the valid ones only, also cache group units information
{
    private _group = _x;
    private _groupTexture = ["GetGroupTexture", [_group]] call BIS_fnc_dynamicGroups;
    private _groupInfo = [_group, str _group, _groupTexture, groupID _group];
    private _unitsInfo = [];

    // Validate units
    {
        if (
            simulationEnabled _x &&
            {!isObjectHidden _x} &&
            {simulationEnabled vehicle _x} &&
            {!isObjectHidden vehicle _x}
            // TODO: whitelist & blacklist
        ) then {
            _newUnits pushBack ([_x] call BIS_fnc_objectVar);

            private _name = [_x, false, false, NAME_MAX_CHARACTERS] call EFUNC(common,getName);
            if !(isPlayer _x) then { _name = format ["%1: %2", localize "str_player_ai", _name]; };

            _unitsInfo pushBack [
                _x,
                alive _x,
                alive _x && { NEEDS_REVIVE(_x) },
                _name
            ];
        };
        nil // Speed loop
    } count (units _x);

    // If we have valid units in the group, group is deemed valid
    if !(_unitsInfo isEqualTo []) then {
        _newGroups pushBack (str _group);
        {
            if ((side _group) == (_x select 0)) exitWith {
                (_x select 3) pushBack [_groupInfo, _unitsInfo];
            };
        } forEach _newList;
    };
    nil // Speed loop
} count ([] call FUNC(getTargetGroups));

// Whether an update to the list is required (really only if something changed)
if !(GVAR(curList) isEqualTo _newList) then {
    // Remove groups/units that are no longer there
    private _ctrl = CTRL_LIST;
    for "_sideIndex" from (_ctrl tvCount []) to 1 do {
        for "_groupIndex" from (_ctrl tvCount [_sideIndex - 1]) to 1 do {
            for "_unitIndex" from (_ctrl tvCount [_sideIndex - 1, _groupIndex - 1]) to 1 do {
                private _lookup = _newUnits find (_ctrl tvData [_sideIndex - 1, _groupIndex - 1, _unitIndex - 1]);
                if (_lookup < 0) then {
                    _ctrl tvDelete [_sideIndex - 1, _groupIndex - 1, _unitIndex - 1];
                } else {
                    _newUnits deleteAt _lookup;
                };
            };
            private _lookup = _newGroups find (_ctrl tvData [_sideIndex - 1, _groupIndex - 1]);
            if (_lookup < 0) then {
                _ctrl tvDelete [_sideIndex - 1, _groupIndex - 1];
            } else {
                _newGroups deleteAt _lookup;
            };
        };
    };


    // Hash location lookups, note hashing assumes unique group/unit data
    private _groupDataToPathHash = [[], []];
    private _unitDataToPathHash = [[], []];

    for "_sideIndex" from 0 to ((_ctrl tvCount []) - 1) do {
        for "_groupIndex" from 0 to ((_ctrl tvCount [_sideIndex]) - 1) do {
            (_groupDataToPathHash select 0) pushBack (_ctrl tvData [_sideIndex, _groupIndex]);
            (_groupDataToPathHash select 1) pushBack [_sideIndex, _groupIndex];
            for "_unitIndex" from 0 to ((_ctrl tvCount [_sideIndex, _groupIndex]) - 1) do {
                (_unitDataToPathHash select 0) pushBack (_ctrl tvData [_sideIndex, _groupIndex, _unitIndex]);
                (_unitDataToPathHash select 1) pushBack [_sideIndex, _groupIndex, _unitIndex];
            };
        };
    };

    // Update/add the values
    {
        _x params ["_side", "_sideStr", "_sideTitle", "_nestedGroupData"];
        private _sideIndex = _forEachIndex;
        private _sideColor = [_side] call BIS_fnc_sideColor;

        if (_ctrl tvCount [] == _sideIndex) then {
            _ctrl tvAdd [[], _sideTitle];
            _ctrl tvSetData [[_sideIndex], _sideStr];
        };

        _ctrl tvExpand [_sideIndex];

        {
            _x params ["_groupInfo", "_nestedUnitData"];
            _groupInfo params ["_group", "_groupStr", "_groupTexture", "_groupId"];

            private _groupIndex = -1;
            private _lookup = (_groupDataToPathHash select 0) find _groupStr;
            if (_lookup < 0) then {
                _groupIndex = _ctrl tvAdd [[_sideIndex], _groupId];
                _ctrl tvSetData [[_sideIndex, _groupIndex], _groupStr];
                _ctrl tvSetPicture [[_sideIndex, _groupIndex], _groupTexture];
                _ctrl tvSetPictureColor [[_sideIndex, _groupIndex], [1,1,1,0.5]];
                _ctrl tvSetTooltip [[_sideIndex, _groupIndex], _groupId];
                _ctrl tvExpand [_sideIndex, _groupIndex];
            } else {
                // pop data out of hash to improve later lookups
                (_groupDataToPathHash select 0) deleteAt _lookup;
                private _path = (_groupDataToPathHash select 1) deleteAt _lookup;
                _groupIndex = _path select 1;

                _ctrl tvSetText [_path, _groupId];
                _ctrl tvSetPicture [[_sideIndex, _groupIndex], _groupTexture];
                _ctrl tvSetPictureColor [[_sideIndex, _groupIndex], [1,1,1,0.5]];
                _ctrl tvSetTooltip [_path, _groupId];
            };

            {
                _x params ["_unit", "_isAlive", "_isIncapacitated", "_name"];

                private _tooltip = format ["%1 - %2", _name, _groupId];
                private _texture = [_isAlive, _isIncapacitated, _unit] call {
                    if !(_this select 0) exitWith { ICON_DEAD };
                    if (_this select 1) exitWith { ICON_REVIVE };
                    [_this select 2] call EFUNC(common,getVehicleIcon)
                };

                private _lookup = (_unitDataToPathHash select 0) find ([_unit] call BIS_fnc_objectVar);
                if (_lookup < 0) then {
                    private _unitIndex = _ctrl tvAdd [[_sideIndex, _groupIndex], _name];
                    _ctrl tvSetData [[_sideIndex, _groupIndex, _unitIndex], [_unit] call BIS_fnc_objectVar];
                    _ctrl tvSetPicture [[_sideIndex, _groupIndex, _unitIndex], _texture];
                    _ctrl tvSetPictureColor [[_sideIndex, _groupIndex, _unitIndex], _sideColor];
                    _ctrl tvSetTooltip [[_sideIndex, _groupIndex, _unitIndex], _tooltip];
                } else {
                    // pop data out of hash to improve later lookups
                    (_unitDataToPathHash select 0) deleteAt _lookup;
                    private _path = (_unitDataToPathHash select 1) deleteAt _lookup;
                    _ctrl tvSetText [_path, _name];
                    _ctrl tvSetPicture [_path, _texture];
                    _ctrl tvSetPictureColor [_path, _sideColor];
                    _ctrl tvSetTooltip [_path, _tooltip];
                };
                nil // Speed loop
            } count _nestedUnitData;
            nil // Speed loop
        } count _nestedGroupData;
    } forEach _newList;

    // Store the new list as the current list
    GVAR(curList) = _newList;
};

// Update focus if required
[] call FUNC(ui_updateListFocus);
