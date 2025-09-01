#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Sets up IR state arrays (called from missileGuidance's onFired).
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_IR_onFired
 *
 * Public: No
 */
params ["_firedEH", "_launchParams", "", "", "_stateParams"];
_firedEH params ["_shooter","_weapon","","","","","_projectile"];
_stateParams params ["", "_seekerStateParams"];
_launchParams params ["", "_targetLaunchParams"];
_targetLaunchParams params ["_target"];

private _initialPosition = getPosASLVisual _projectile;
private _initialVelocity = velocity _projectile;

private _waypoints = [
    ["CAPTURE", [22122.3, 17551.3, 75]],
    ["SCAN", [20557.4, 17354.8, 150], [20029.3, 17326.5, 150]],
    ["FLYTO", [16964.6, 18765.8, 50]],
    ["FLYTO", [16318.9, 19463.8, 45]],
    ["GPS", [15812, 19754.7, 45]],
    ["FLYTO", [14562, 19633.7, 70]],
    ["FLYTO", [13604.6, 20329.2, 80]],
    ["SCAN", [13138.5, 20840.5, 180], [12458.1, 21547.4, 180]],
    ["FLYTO", [11664.3, 22881, 60]],
    ["FLYTO", [11177.3, 23834.8, 5]],
    ["FLYTO", [10713.752, 25054.92, 5]],
    ["FLYTO", [9834.04, 25869.5, 5]],
    ["FLYTO", [8428.36, 26046.3, 30]],
    ["FLYTO", [7632.43, 25278.3, 50]],
    ["FLYTO", [7800, 24454.5, 80]],
    ["FLYTO", [8223.563, 23542.188, 160]],
    ["SCAN", [8402.69, 23062.4, 180], [8758.8, 22388.65, 180]],
    ["TARGET", [9182.74, 21656.9, 10], 60]
];

private _preplannedTerrain = [];
{
    _x params ["", "_startPos", "_endPos"];
    private _direction = _startPos vectorFromTo _endPos;
    private _dNorm = [_direction select 1, -(_direction select 0), _direction select 2];
    _startPos = _startPos vectorAdd (_direction vectorMultiply -(TERCOM_PRECISION * 5));
    _endPos = _endPos vectorAdd (_direction vectorMultiply (TERCOM_PRECISION * 5));

    private _z = _startPos select 2;

    private _profiles = [];
    private _startPositions = [];
    private _cornerOffset = [_startPos vectorAdd (_dNorm vectorMultiply (-6 * TERCOM_PRECISION)), _direction, _dNorm];
    for "_i" from -6 to 6 do {
        private _offset = _dNorm vectorMultiply (_i * TERCOM_PRECISION);
        ([_startPos vectorAdd _offset, _endPos vectorAdd _offset, TERCOM_PRECISION] call CBA_fnc_getTerrainProfile) params ["", "", "_profile"];

        private _offsets = [];
        private _terrain = [];

        private _startOffset = _startPos vectorAdd _offset;
        {
            _x params ["", "", "_p"];
            _terrain pushBack ((ATLtoASL _p) select 2);

            _offsets pushBack (_startOffset vectorAdd (_direction vectorMultiply (_forEachIndex * TERCOM_PRECISION)));
        } forEach _profile;
        _profiles pushBack _terrain;
        _startPositions pushBack _offsets;
    };

    _preplannedTerrain pushBack [_profiles, _startPositions, _cornerOffset];
} forEach (_waypoints select { (_x select 0) isEqualTo "SCAN" });

_seekerStateParams set [0, CBA_missionTime];
_seekerStateParams set [1, _initialPosition];
_seekerStateParams set [2, _initialVelocity];
_seekerStateParams set [3, _waypoints];
_seekerStateParams set [4, SEEKER_STATE_LAUNCH];
_seekerStateParams set [5, []];
_seekerStateParams set [6, []];
_seekerStateParams set [7, [0, 0, 0]];
_seekerStateParams set [8, _preplannedTerrain];
_seekerStateParams set [9, [0, 0, 0]];

