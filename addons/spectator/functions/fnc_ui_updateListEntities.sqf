/*
 * Author: Nelson Duarte, AACO, SilentSpike
 * Updates spectator UI list of units/groups
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_spectator_fnc_ui_updateListEntities
 *
 * Public: No
 */

#include "script_component.hpp"

private _newUnits = [];
private _newGroups = [];
// Always show the 4 main sides in this intuative order
private _newSides = [str west, str east, str resistance, str civilian];
private _newList = [
    [west, str west, [west] call BIS_fnc_sideName, [west] call BIS_fnc_sideColor, []],
    [east, str east, [east] call BIS_fnc_sideName, [east] call BIS_fnc_sideColor, []],
    [resistance, str resistance, [resistance] call BIS_fnc_sideName, [resistance] call BIS_fnc_sideColor, []],
    [civilian, str civilian, [civilian] call BIS_fnc_sideName, [civilian] call BIS_fnc_sideColor, []]
];

// Go through entity groups and cache information (include dead entities)
private _entities = [true] call FUNC(getTargetEntities);
{
    // Add the group if new
    private _group = _x;
    if !(str _group in _newGroups) then {
        // Include the group if it contains valid entities
        private _entitiesGroup = units _group arrayIntersect _entities;

        if !(_entitiesGroup isEqualTo []) then {
            // Cache the info of valid units in the group
            private _unitsInfo = [];
            {
                _newUnits pushBack ([_x] call BIS_fnc_objectVar);

                private _name = ([_x] call EFUNC(common,getName)) select [0, NAME_MAX_CHARACTERS];
                if !(isPlayer _x) then { _name = format ["%1: %2", localize "str_player_ai", _name]; };

                _unitsInfo pushBack [
                    _x,
                    alive _x,
                    alive _x && { NEEDS_REVIVE(_x) },
                    _name
                ];
            } forEach _entitiesGroup;

            // Cache the info of the group itself
            private _groupTexture = [_group] call FUNC(getGroupIcon);
            private _groupInfo = [_group, str _group, _groupTexture, groupID _group];

            // Add the group to the correct side
            private _side = side _group;
            private _sideIndex = _newSides find (str _side);

            // Add the side if new
            if (_sideIndex < 0) then {
                _newList pushBack [
                    _side,
                    str _side,
                    [_side] call BIS_fnc_sideName,
                    [_side] call BIS_fnc_sideColor,
                    []
                ];

                _sideIndex = _newSides pushBack (str _side);
            };

            // Add it to the right index
            _newGroups pushBack (str _group);
            ((_newList select _sideIndex) select 4) pushBack [_groupInfo, _unitsInfo];
        };
    };
} forEach allGroups;

// Whether an update to the list is required (really only if something changed)
if !(GVAR(curList) isEqualTo _newList) then {
    private _ctrl = CTRL_LIST;

    // Remove groups/units that are no longer there
    for "_sideIndex" from ((_ctrl tvCount []) - 1) to 0 step -1 do {
        for "_groupIndex" from ((_ctrl tvCount [_sideIndex]) - 1) to 0 step -1 do {
            for "_unitIndex" from ((_ctrl tvCount [_sideIndex, _groupIndex]) - 1) to 0 step -1 do {
                private _lookup = _newUnits find (_ctrl tvData [_sideIndex, _groupIndex, _unitIndex]);
                if (_lookup < 0) then {
                    _ctrl tvDelete [_sideIndex, _groupIndex, _unitIndex];
                } else {
                    _newUnits deleteAt _lookup;
                };
            };
            private _lookup = _newGroups find (_ctrl tvData [_sideIndex, _groupIndex]);
            if (_lookup < 0) then {
                _ctrl tvDelete [_sideIndex, _groupIndex];
            } else {
                _newGroups deleteAt _lookup;
            };
        };
        private _lookup = _newSides find (_ctrl tvData [_sideIndex]);
        if (_lookup < 0) then {
            _ctrl tvDelete [_sideIndex];
        } else {
            _newSides deleteAt _lookup;
        };
    };

    // Hash location lookups, note hashing assumes unique side/group/unit data
    private _sideDataToPathHash = [[], []];
    private _groupDataToPathHash = [[], []];
    private _unitDataToPathHash = [[], []];

    for "_sideIndex" from 0 to ((_ctrl tvCount []) - 1) do {
        (_sideDataToPathHash select 0) pushBack (_ctrl tvData [_sideIndex]);
        (_sideDataToPathHash select 1) pushBack [_sideIndex];
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
        _x params ["_side", "_sideStr", "_sideTitle", "_sideColor", "_nestedGroupData"];

        private _sideIndex = -1;
        private _lookup = (_sideDataToPathHash select 0) find _sideStr;
        if (_lookup < 0) then {
            _sideIndex = _ctrl tvAdd [[], _sideTitle];
            _ctrl tvSetData [[_sideIndex], _sideStr];
            _ctrl tvExpand [_sideIndex];
        } else {
            // pop data out of hash to improve later lookups
            (_sideDataToPathHash select 0) deleteAt _lookup;
            private _path = (_sideDataToPathHash select 1) deleteAt _lookup;
            _sideIndex = _path select 0;

            _ctrl tvSetText [_path, _sideTitle];
        };

        {
            _x params ["_groupInfo", "_nestedUnitData"];
            _groupInfo params ["_group", "_groupStr", "_groupTexture", "_groupId"];

            private _groupIndex = -1;
            private _lookup = (_groupDataToPathHash select 0) find _groupStr;
            if (_lookup < 0) then {
                _groupIndex = _ctrl tvAdd [[_sideIndex], _groupId];
                _ctrl tvSetData [[_sideIndex, _groupIndex], _groupStr];
                _ctrl tvSetPicture [[_sideIndex, _groupIndex], _groupTexture];
                _ctrl tvSetPictureColor [[_sideIndex, _groupIndex], _sideColor];
                _ctrl tvSetTooltip [[_sideIndex, _groupIndex], _groupId];
                _ctrl tvExpand [_sideIndex, _groupIndex];
            } else {
                // pop data out of hash to improve later lookups
                (_groupDataToPathHash select 0) deleteAt _lookup;
                private _path = (_groupDataToPathHash select 1) deleteAt _lookup;
                _groupIndex = _path select 1;

                _ctrl tvSetText [_path, _groupId];
                _ctrl tvSetPicture [_path, _groupTexture];
                _ctrl tvSetPictureColor [_path, _sideColor];
                _ctrl tvSetTooltip [_path, _groupId];
            };

            {
                _x params ["_unit", "_isAlive", "_isIncapacitated", "_name"];

                // Show full name in tooltip + whether medic + whether engineer
                private _tooltip = [[_unit] call EFUNC(common,getName)];
                if ([_unit] call EFUNC(common,isMedic)) then { _tooltip pushBack (localize "str_support_medic"); };
                if ([_unit] call EFUNC(common,isEngineer)) then { _tooltip pushBack (localize LSTRING(TooltipEngineer)); };
                _tooltip = _tooltip joinString " - ";

                private _texture = [_isAlive, _isIncapacitated, _unit] call {
                    params ["","","_unit"];
                    if !(_this select 0) exitWith { ICON_DEAD };
                    if (_this select 1) exitWith { ICON_REVIVE };
                    [vehicle _unit] call EFUNC(common,getVehicleIcon)
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
            } forEach _nestedUnitData;
        } forEach _nestedGroupData;
    } forEach _newList;

    // Store the new list as the current list
    GVAR(curList) = _newList;
};

// Update focus if required
[] call FUNC(ui_updateListFocus);
