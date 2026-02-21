#include "..\script_component.hpp"
/*
 * Author: alganthe
 * Garrison function used to garrison AI inside buildings.
 *
 * Arguments:
 * 0: The building(s) nearest this position are used <ARRAY>
 * 1: Limit the building search to those type of building <ARRAY>
 * 2: Units that will be garrisoned <ARRAY>
 * 3: Radius to fill building(s) <NUMBER> (default: 50)
 * 4: 0: even filling, 1: building by building, 2: random filling <NUMBER> (default: 0)
 * 5: True to fill building(s) from top to bottom <BOOL> (default: false) (note: only works with filling mode 0 and 1)
 * 6: Teleport units <BOOL> (default: false)

 * Return Value:
 * Units not garrisoned <ARRAY>
 *
 * Example:
 * [position, nil, [unit1, unit2, unit3, unitN], 200, 1, false, false] call ace_ai_fnc_garrison
 *
 * Public: Yes
*/

params [["_startingPos",[0,0,0], [[]], 3], ["_buildingTypes", ["Building"], [[]]], ["_unitsArray", [], [[]]], ["_fillingRadius", 50, [0]], ["_fillingType", 0, [0]], ["_topDownFilling", false, [true]], ["_teleport", false, [true]]];

TRACE_6("fnc_garrison: Start",_startingPos,_buildingTypes,count _unitsArray,_fillingRadius,_fillingTYpe,_topDownFilling);

_unitsArray = _unitsArray select {alive _x && {!isPlayer _x}};
private _currentUnitMoveList = missionNamespace getVariable [QGVAR(garrison_unitMoveList), []];

if (_startingPos isEqualTo [0,0,0]) exitWith {
    TRACE_1("fnc_garrison: StartingPos error",_startingPos);
    [LSTRING(GarrisonInvalidPosition)] call EFUNC(common,displayTextStructured);
    _unitsArray
};

if (_unitsArray isEqualTo [] || {isNull (_unitsArray select 0)}) exitWith {
    TRACE_1("fnc_garrison: Units error",_unitsArray);
    [LSTRING(GarrisonNoUnits)] call EFUNC(common,displayTextStructured);
    _unitsArray
};

private _buildings = nearestObjects [_startingPos, _buildingTypes, ([_fillingRadius, 50] select (_fillingRadius < 50))];
if (_fillingRadius >= 50) then {
    _buildings = [_buildings] call CBA_fnc_shuffle;
};

if (_buildings isEqualTo []) exitWith {
    TRACE_1("fnc_garrison: Building error",_buildings);
    [LSTRING(GarrisonNoBuilding)] call EFUNC(common,displayTextStructured);
    _unitsArray
};

private _buildingsIndex = [];

if (_topDownFilling) then {
    {
        private _buildingPos = _x buildingPos -1;

        // Those reverse are necessary, as dumb as it is there's no better way to sort those subarrays in sqf
        {
            reverse _x;
        } forEach _buildingPos;

        _buildingPos sort false;

        {
            reverse _x;
        } forEach _buildingPos;

        _buildingsIndex pushBack _buildingPos;
    } forEach _buildings;
} else {
    {
        _buildingsIndex pushBack (_x buildingPos -1);
    } forEach _buildings;
};

// Remove buildings without positions
{
    _buildingsIndex deleteAt (_buildingsIndex find _x);
} forEach (_buildingsIndex select {count _x == 0});

//Remove positions units are already pathing to
_buildingsIndex = _buildingsIndex apply {
    _x select {
        private _testedPos = _x;
        (missionNamespace getVariable [QGVAR(garrison_unitMoveList), []]) findIf {(_x select 1) isEqualTo _testedPos} == -1
    }
};

// Warn the user that there's not enough positions to place all units
private _count = 0;
{_count = _count + count _x} forEach _buildingsIndex;
if ( (count _unitsArray) - _count > 0) then {
    TRACE_4("fnc_garrison: Not enough spots to place all units",_unitsArray,count _unitsArray,_count,((count _unitsArray) - _count > 0));
    [LSTRING(GarrisonNotEnoughPos)] call EFUNC(common,displayTextStructured);
};

private _placedUnits = [];
private _unitMoveList = [];

// Force all units to un-garrison
[QGVAR(unGarrison), [_unitsArray], _unitsArray] call CBA_fnc_targetEvent;

private _fnc_comparePos = {
    params ["_nearestUnits", "_pos"];
    (_nearestUnits findIf {
        if (surfaceIsWater getPos _x) then {
            floor ((getPosASL _x) select 2) == floor ((AGLToASL _pos) select 2)
        } else {
            floor ((getPosATL _x) select 2) == floor (_pos select 2)
        };
    }) != -1
};

// Do the placement
switch (_fillingType) do {

    // Even filling
    case 0: {

        while {_unitsArray isNotEqualTo []} do {
            if (_buildingsIndex isEqualTo []) exitWith {};
            private _building = _buildingsIndex select 0;

            if (_building isEqualTo []) then {
                LOG(format [ARR_2("fnc_garrison: Empty building array | removing building from buildingsIndex | %1 buildings remaining",count _buildingsIndex)]);
                _buildingsIndex deleteAt 0;

            } else {
                private _pos = _building select 0;
                private _nearestUnits = (_pos nearEntities ["CAManBase", 2]);
                LOG(format [ARR_3("fnc_garrison: Unit detection | %1 units nearby | %2 units within height",count _nearestUnits,{floor ((getPos _x) select 2) == floor (_pos select 2)} count _nearestUnits)]);

                if ((_nearestUnits isNotEqualTo []) && {[_nearestUnits, _pos] call _fnc_comparePos}) then {
                    LOG(format [ARR_2("fnc_garrison: Unit present | removing position | %1 positions remaining for this building",count (_buildingsIndex select (_buildingsIndex find _building)) - 1)]);
                    _buildingsIndex set [0,  _building - [_pos]];

                } else {
                    private _unit = _unitsArray select 0;
                    private _posSurface = surfaceIsWater _pos;

                    if (_teleport) then {
                        doStop _unit;
                        if (_posSurface) then {
                            _unit setPosASL (AGLToASL _pos);
                        } else {
                            _unit setPosATL _pos;
                        };

                        _currentUnitMoveList deleteAt (_currentUnitMoveList findIf {_x select 0 == _unit});

                    } else {
                        _unitMoveList pushBack [_unit,[_pos, AGLToASL _pos] select (_posSurface)];
                    };

                    _placedUnits pushBack _unit;
                    _unitsArray deleteAt (_unitsArray find _unit);
                    _building deleteAt 0;
                    _buildingsIndex deleteAt 0;
                    _buildingsIndex pushBackUnique _building;
                    _unit setVariable [QGVAR(garrisonned), true, true];
                };
            };
        };
    };

    // Building by building
    case 1: {

        while {_unitsArray isNotEqualTo []} do {
            if (_buildingsIndex isEqualTo []) exitWith {};
            private _building = _buildingsIndex select 0;

            if (_building isEqualTo []) then {
                LOG(format [ARR_2("fnc_garrison: empty building array | removing building from buildingsIndex | %1 buildings remaining",count _buildingsIndex)]);
                _buildingsIndex deleteAt 0;

            } else {
                private _pos = _building select 0;
                private _nearestUnits = (_pos nearEntities ["CAManBase", 2]);
                LOG(format [ARR_3("fnc_garrison: Unit detection | %1 units nearby | %2 units within height",count _nearestUnits,{floor ((getPos _x) select 2) == floor (_pos select 2)} count _nearestUnits)]);

                if ((_nearestUnits isNotEqualTo []) && {[_nearestUnits, _pos] call _fnc_comparePos}) then {
                    LOG(format [ARR_2("fnc_garrison: Unit present | removing position | %1 positions remaining for this building",count (_buildingsIndex select (_buildingsIndex find _building)) - 1)]);
                    _buildingsIndex set [0, _building - [_pos]];

                } else {
                    private _unit = _unitsArray select 0;
                    private _posSurface = surfaceIsWater _pos;

                    if (_teleport) then {
                        doStop _unit;
                        if (_posSurface) then {
                            _unit setPosASL (AGLToASL _pos);
                        } else {
                            _unit setPosATL _pos;
                        };

                        _currentUnitMoveList deleteAt (_currentUnitMoveList findIf {_x select 0 == _unit});

                    } else {
                        _unitMoveList pushBack [_unit,[_pos, AGLToASL _pos] select (_posSurface)];
                    };

                    _placedUnits pushBack _unit;
                    _unitsArray deleteAt (_unitsArray find _unit);
                    _buildingsIndex set [0, _building - [_pos]];
                    _unit setVariable [QGVAR(garrisonned), true, true];
                };
            };
        };
    };

    // Random
    case 2: {

        while {_unitsArray isNotEqualTo []} do {
            if (_buildingsIndex isEqualTo []) exitWith {};
            private _building = selectRandom _buildingsIndex;

            if (_building isEqualTo []) then {
                LOG(format [ARR_2("fnc_garrison: empty building array | removing building from buildingsIndex | %1 buildings remaining",count _buildingsIndex)]);
                _buildingsIndex deleteAt (_buildingsIndex find _building);

            } else {
                private _pos = selectRandom _building;
                private _nearestUnits = (_pos nearEntities ["CAManBase", 2]);
                LOG(format [ARR_3("fnc_garrison: Unit detection | %1 units nearby | %2 units within height",count _nearestUnits,{floor ((getPos _x) select 2) == floor (_pos select 2)} count _nearestUnits)]);

                if ((_nearestUnits isNotEqualTo []) && {[_nearestUnits, _pos] call _fnc_comparePos}) then {
                    LOG(format [ARR_2("fnc_garrison: Unit present | removing position | %1 positions remaining for this building",count (_buildingsIndex select (_buildingsIndex find _building)) - 1)]);
                    _buildingsIndex set [(_buildingsIndex find _building), _building - [_pos]];

                } else {
                    private _unit = _unitsArray select 0;
                   private _posSurface = surfaceIsWater _pos;

                    if (_teleport) then {
                        doStop _unit;
                        if (_posSurface) then {
                            _unit setPosASL (AGLToASL _pos);
                        } else {
                            _unit setPosATL _pos;
                        };

                        _currentUnitMoveList deleteAt (_currentUnitMoveList findIf {_x select 0 == _unit});

                    } else {
                        _unitMoveList pushBack [_unit,[_pos, AGLToASL _pos] select (_posSurface)];
                    };

                    _placedUnits pushBack _unit;
                    _unitsArray deleteAt (_unitsArray find _unit);
                    _buildingsIndex set [(_buildingsIndex find _building), _building - [_pos]];
                    _unit setVariable [QGVAR(garrisonned), true, true];
                };
            };
        };
    };
};

TRACE_1(format [ARR_2("fnc_garrison: while loop ended | %1 units ready to be treated by PFH",count _unitMoveList)],_teleport);

// Update the unit list and remove duplicate positions and units
private _garrison_unitMoveList = missionNamespace getVariable [QGVAR(garrison_unitMoveList), []];

_garrison_unitMoveList = _garrison_unitMoveList select {
    _x params ["_testedUnit", "_testedPos"];
    _unitMoveList findIf {(_x select 0) isEqualTo _testedUnit} == -1
};

_garrison_unitMoveList append _unitMoveList;

missionNamespace setVariable [QGVAR(garrison_unitMoveList), _garrison_unitMoveList, true];

if (_teleport) then {
    [QGVAR(AISection), [_placedUnits, ["PATH"], false], _placedUnits] call CBA_fnc_targetEvent;

} else {
    [_unitMoveList] call FUNC(garrisonMove);
};

TRACE_1(format [ARR_3("fnc_garrison: End | %1 units left | %2 buildings left",count _unitsArray,count _buildingsIndex)],_unitsArray);
_unitsArray
