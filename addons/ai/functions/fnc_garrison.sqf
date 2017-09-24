/*
 * Author: alganthe
 * Garrison function used to garrison AI inside buildings.
 *
 * Arguments:
 * 0: The building(s) nearest this position are used <POSITION>
 * 1: Limit the building search to those type of building <ARRAY>
 * 2: Units that will be garrisoned <ARRAY>
 * 3: Radius to fill building(s) <SCALAR> (default: 50)
 * 4: 0: even filling, 1: building by building, 2: random filling <SCALAR> (default: 0)
 * 5: True to fill building(s) from top to bottom <BOOL> (default: false)

 * Return Value:
 * Units not garrisoned <ARRAY>
 *
 * Example:
 * [position, nil, [unit1, unit2, unit3, unitN], 200, 1, false] call ace_ai_fnc_garrison
 *
 * Public: Yes
*/
#include "script_component.hpp"

params [["_startingPos",[0,0,0], [[]], 3], ["_buildingTypes", ["Building"], [[]]], ["_unitsArray", [], [[]]], ["_fillingRadius", 50, [0]], ["_fillingType", 0, [0]], ["_topDownFilling", false, [true]]];

TRACE_6("fnc_garrison start",_startingPos,_buldingTypes,_unitsArray,_fillingRadius,_fillingTYpe,_topDownFilling);

_unitsArray = _unitsArray select {alive _x && {!isPlayer _x}};

if (_startingPos isEqualTo [0,0,0]) exitWith {
    TRACE_1("fnc_garrison startingPos error",_startingPos);
    [LSTRING(GarrisonInvalidPosition)] call EFUNC(common,displayTextStructured);
};

if (count _unitsArray == 0 || {isNull (_unitsArray select 0)}) exitWith {
    TRACE_1("fnc_garrison units error",_unitsArray);
    [LSTRING(GarrisonNoUnits)] call EFUNC(common,displayTextStructured);
};

private _buildings = nearestObjects [_startingPos, _buildingTypes, ([_fillingRadius, 50] select (_fillingRadius < 50))];
if (_fillingRadius >= 50) then {
    _buildings = [_buildings] call CBA_fnc_shuffle;
};

if (count _buildings == 0) exitWith {
    TRACE_1("fnc_garrison building error",_buildings);
    [LSTRING(GarrisonNoBuilding)] call EFUNC(common,displayTextStructured);
};

private _buildingsIndexes = [];

if (_topDownFilling) then {
    {
        private _buildingPos = _x buildingPos -1;

        // Those reverse are necessary, as dumb as it is there's no better way to sort those subarrays in sqf
        {
            reverse _x;
        } foreach _buildingPos;

        _buildingPos sort false;

        {
            reverse _x;
        } foreach _buildingPos;

        _buildingsIndexes pushBack _buildingPos;
    } foreach _buildings;
} else {
    {
        _buildingsIndexes pushBack (_x buildingPos -1);
    } foreach _buildings;
};

// Remove buildings without positions
{
    _buildingsIndexes deleteAt (_buildingsIndexes find _x);
} foreach (_buildingsIndexes select {count _x == 0});

// Warn the user that there's not enough positions to place all units
private _count = 0;
{_count = _count + count _x} foreach _buildingsIndexes;
if ( (count _unitsArray) - _count > 0) then {
    TRACE_4("fnc_garrison not enough spots",_unitsArray,count _unitsArray,_count,((count _unitsArray) - _count > 0));
    [LSTRING(GarrisonNotEnoughPos)] call EFUNC(common,displayTextStructured);
};

private _placedUnits = [];

// Do the placement
switch (_fillingType) do {
    
    // Even filling
    case 0: {
        while {count _unitsArray > 0} do {
            if (count _buildingsIndexes == 0) exitWith {};
            private _building = _buildingsIndexes select 0;

            if (_building isEqualTo []) then {
                _buildingsIndexes deleteAt 0;
            } else {
                private _pos = _building select 0;
                private _nearestUnits = (_pos nearEntities ["CAManBase", 1]);

                if (count _nearestUnits  > 0 && {count (_nearestUnits select {getPos _x select 2 == _pos select 2}) > 0}) then {
                    _buildingsIndexes set [0,  _building - [_pos]];
                } else {
                    private _unit = _unitsArray select 0;
                    _unit setPos _pos;
                    _placedUnits pushBack _unit;
                    _unitsArray deleteAt (_unitsArray find _unit);
                    _building deleteAt 0;
                    _buildingsIndexes deleteAt 0;
                    _buildingsIndexes pushBackUnique _building;
                };
            };
        };
    };

    // Building by building
    case 1: {
        while {count _unitsArray > 0} do {
            if (count _buildingsIndexes == 0) exitWith {};
            private _building = _buildingsIndexes select 0;

            if (_building isEqualTo []) then {
                _buildingsIndexes deleteAt 0;
            } else {
                private _pos = _building select 0;
                private _nearestUnits = (_pos nearEntities ["CAManBase", 1]);

                if (count _nearestUnits  > 0 && {count (_nearestUnits select {getPos _x select 2 == _pos select 2}) > 0}) then {
                    _buildingsIndexes set [0, _building - [_pos]];
                } else {
                    private _unit = _unitsArray select 0;
                    _unit setPos _pos;
                    _placedUnits pushBack _unit;
                    _unitsArray deleteAt (_unitsArray find _unit);
                    _buildingsIndexes set [0, _building - [_pos]];
                };
            };
        };
    };

    // Random
    case 2: {
        while {count _unitsArray > 0} do {
            if (count _buildingsIndexes == 0) exitWith {};
            private _building = selectRandom _buildingsIndexes;

            if (_building isEqualTo []) then {
                _buildingsIndexes deleteAt (_buildingsIndexes find _building);
            } else {
                private _pos = selectRandom _building;
                private _nearestUnits = (_pos nearEntities ["CAManBase", 1]);

                if (count _nearestUnits  > 0 && {count (_nearestUnits select {getPos _x select 2 == _pos select 2}) > 0}) then {
                    _buildingsIndexes set [(_buildingsIndexes find _building), _building - [_pos]];
                } else {
                    private _unit = _unitsArray select 0;
                    _unit setPos _pos;
                    _unitsArray deleteAt (_unitsArray find _unit);
                    _placedUnits pushBack _unit;
                    _buildingsIndexes set [(_buildingsIndexes find _building), _building - [_pos]];
                };
            };
        };
    };
};

[QGVAR(disableAI), [_placedUnits, "AUTOCOMBAT"], _placedUnits] call CBA_fnc_targetEvent;
[QGVAR(disableAI), [_placedUnits, "PATH"], _placedUnits] call CBA_fnc_targetEvent;
TRACE_2("fnc_garrison ended, leftover units",_unitsArray,count _unitsArray);
_unitsArray
