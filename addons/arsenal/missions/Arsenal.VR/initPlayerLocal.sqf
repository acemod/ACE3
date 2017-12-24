#include "script_component.hpp"

params ["_unit"];

private _loadout = profileNamespace getVariable QGVAR(missionLastLoadout);

if (!isNil "_loadout") then {
    _unit setUnitLoadout _loadout;
};

_unit allowDamage false;

//--- Static targets in various distance
{
    private _position = _unit getRelPos [_x, _forEachIndex];
    ["O_Soldier_VR_F", _position] call FUNC(createTarget);
} forEach [10, 20, 30, 40, 50, 100, 500, 1000, 2000];

//--- Target line
private _position = _unit getRelPos [20, -90];

for "_i" from 0 to 5 do {
    private _position = _position vectorAdd [0, -3 + _i, 0];
    ["O_Soldier_VR_F", _position] call FUNC(createTarget);
};

//--- Target cluster
_position = _unit getRelPos [20, 90];

for "_i" from 0 to 8 do {
    private _index = floor (_i / 3);
    private _position = _position vectorAdd [_index * 1.5, 1.5 + (_i % 3), 0];

    private _target = ["O_Soldier_VR_F", _position] call FUNC(createTarget);

    _target switchMove (["aidlpercmstpslowwrfldnon", "aidlpknlmstpslowwrfldnon_ai", "aidlppnemstpsraswrfldnon_ai"] select _index);
    _target setUnitPos (["UP", "MIDDLE", "DOWN"] select _index);
};

//--- Target patrol
private _group = createGroup east;

{
    private _position = _unit getRelPos [10, _x];
    private _waypoint = _group addWaypoint [_position, 0];

    if (_forEachIndex == 4) then {
        _waypoint setWaypointType "CYCLE";
    };
} forEach [0, 90, 180, 270, 0];

_position = _unit getRelPos [10, 180];

for "_i" from 0 to 1 do {
    private _target = ["O_Soldier_VR_F", _position] call FUNC(createTarget);

    [_target] join _group;
    _target stop false;
    _target enableAI "MOVE";
    _target setSpeedMode "LIMITED";
};

//--- Armored vehicles
private _vehicles = [];

private _step = 15;
_position = [position _unit select 0,(position _unit select 1) + 30,0];

{
    private _row = _forEachIndex;
    private _rowCount = (count _x - 1) * 0.5;

    {
        private _position = _position vectorAdd [(-_rowCount + _forEachIndex) * _step, _row * _step, 0];

        private _vehicle = createVehicle [_x, _position, [], 0, "NONE"];
        _vehicle setPos _position;
        _vehicle setDir 180;
        _vehicle setVelocity [0,0,-1];
        _vehicle call BIS_fnc_VRHitpart;

        private _marker = _vehicle call BIS_fnc_boundingBoxMarker;
        _marker setMarkerColor "ColorOrange";
        _vehicles pushBack _vehicle;
    } forEach _x;
} forEach [[
    "Land_VR_Target_MRAP_01_F",
    "Land_VR_Target_APC_Wheeled_01_F",
    "Land_VR_Target_MBT_01_cannon_F"
], [
    "Land_VR_Target_MRAP_01_F",
    "Land_VR_Target_APC_Wheeled_01_F",
    "Land_VR_Target_MBT_01_cannon_F"
]];

_vehicles spawn {
    waituntil {
        private _allDisabled = true;

        {
            _hitAlive = _x getVariable ["bis_fnc_VRHitParts_hitalive", []];
            _allDisabled = _allDisabled && ({!_x} count _hitAlive >= 2);
            sleep 0.1;
        } forEach _this;

        _allDisabled
    };

    setStatValue ["MarkMassVirtualDestruction", 1];
};

//--- Cover objects
private _coverObjects = [
    "Land_VR_CoverObject_01_kneel_F",
    "Land_VR_CoverObject_01_kneelHigh_F",
    "Land_VR_CoverObject_01_kneelLow_F",
    "Land_VR_CoverObject_01_stand_F",
    "Land_VR_CoverObject_01_standHigh_F"
];

for "_i" from 5 to 11 do {
    private _direction = 180 + _i * 45;
    private _position = _unit getRelPos [(abs sin _direction + abs cos _direction) * 3, _direction];
    private _block = createVehicle [_coverObjects select (_i % count _coverObjects), _position, [], 0, "NONE"];
    _block setPos _position;
};

//--- Starting point
private _square = createVehicle ["VR_Area_01_square_1x1_grey_F", position _unit, [], 0, "NONE"];
_square setPosASL getPosASL _unit;

private _marker = createMarker [QGVAR(start), getPosWorld _unit];
_marker setMarkerType "mil_start";

//--- Open Arsenal
[_unit, true, false] call FUNC(initBox);

[{!isNull findDisplay 46}, {
    [_this, _this, true] call FUNC(openBox);
}, _unit] call CBA_fnc_waitUntilAndExecute;

//--- Salute
_unit addEventHandler ["AnimChanged", {
    params ["_unit", "_anim"];
    _anim = _anim splitString "_";

    if ("salute" in _anim) then {
        {
            _x playAction "salute";
        } forEach ((_unit nearObjects ["CAManBase", 10]) - [_unit]);
    };
}];

["#(argb,8,8,3)color(0,0,0,1)", false, nil, 0.1, [0,0.5]] spawn BIS_fnc_textTiles;

//--- Target markers
private _markers = [];

{
    private _marker = createMarker [vehicleVarName _x, position _x];
    _marker setMarkerType "mil_dot";
    _marker setMarkerColor "ColorOrange";

    _markers pushBack _marker;
} forEach (allMissionObjects "CAManBase" - [_unit]);

_markers spawn {
    while {true} do {
        {
            private _target = missionNamespace getVariable _x;
            _x setMarkerPos position _target;
        } forEach _this;
        sleep 0.1;
    };
};
