#include "..\script_component.hpp"
/*
 * Author: tcvm
 * MCLOS seeker
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Position of wanted missile pos relative to the camera direction <ARRAY>
 *
 * Example:
 * [] call ace_missileguidance_fnc_seekerType_MCLOS
 *
 * Public: No
 */
params ["", "_args"];
_args params ["_firedEH", "", "_flightParams", "", "_stateParams"];
_firedEH params ["_shooter","","","","","","_projectile","_gunner"];
_flightParams params ["_pitchRate", "_yawRate"];
_stateParams params ["", "_seekerStateParams"];

private _projectilePos = getPosASLVisual _projectile;
private _source = _projectile getVariable [QGVAR(source), _projectile];
private _mclosInput = (_source getVariable [QGVAR(MCLOS_direction), [0, 0, 0]]);

if (_seekerStateParams isNotEqualTo []) then { // Handle AI
    _seekerStateParams params ["_launchPos", "_launchVec"];
    if (!(alive _shooter && {alive _gunner} && {(vehicle _gunner) == _shooter} && {_gunner call EFUNC(common,isAwake)})) exitWith {};

    private _distance = _launchPos vectorDistance _projectilePos;
    private _projectedPath = _launchPos vectorAdd (_launchVec vectorMultiply _distance);

    private _hOffset = (_projectilePos # 2) - (_projectedPath # 2);
    private _vv = (velocity _projectile) # 2;
    _mclosInput = switch (true) do {
        case (_hOffset < 0): { [0, 0, 1] }; // gross h adjust
        case (_hOffset > 50): { [0, 0, -1] };
        case ((_hOffset + 2 * _vv) < 0): { [0, 0, 1] }; // gross v adjust
        case ((_hOffset + 2 * _vv) > 10): { [0, 0, -1] };
        case ((_hOffset + _vv) > 5): { [0, 0, -1] }; // fine v adjust
        default { [0, 0, 0] };
    };
};

private _accelerationDirection = _projectile vectorModelToWorldVisual _mclosInput;
private _returnPos = _projectilePos vectorAdd (_accelerationDirection vectorMultiply (_pitchRate max _yawRate));

//IGNORE_PRIVATE_WARNING["_targetData"]
_targetData set [0, _projectilePos vectorFromTo _returnPos];
_targetData set [2, _returnPos distance _projectilePos];

_returnPos

