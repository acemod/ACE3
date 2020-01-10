#include "script_component.hpp"
/*
 * Author: jaynus / nou
 * Seeker Type: Optic
 *
 * Arguments:
 * 1: Guidance Arg Array <ARRAY>
 * 2: Seeker State <ARRAY>
 *
 * Return Value:
 * Missile Aim PosASL <ARRAY>
 *
 * Example:
 * [[], [], []] call ace_missileguidance_fnc_seekerType_Optic;
 *
 * Public: No
 */

params ["_projectile", "_shooter","_extractedInfo"];
_extractedInfo params ["_seekerType", "_attackProfile", "_target", "_targetPos", "_targetVector", "_launchPos", "_launchTime", "_miscManeuvering", "_miscSensor", "_miscSeeker", "_miscProfile"];
_miscManeuvering params ["_degreesPerSecond", "_lastRunTime"];
_miscSensor params ["_seekerAngle", "_seekerMinRange", "_seekerMaxRange"];
_miscSeeker params ["_lastAcquireTime"];

_projPos = getPosASL _projectile;
_checkVector = vectorDir _projectile;
_seekerAngle = 25;
_seekerMaxRange = 2000;

//Get Targets and Countermeasures
_targetsList = [];
{
	private _xPos = getPosASL _x;
	private _angleOkay = [_projPos, _xPos, _checkVector, _seekerAngle] call FUNC(checkSeekerAngle);

	private _losOkay = false;
	if (_angleOkay) then {
		_losOkay = [_projectile, _x, true] call FUNC(checkLos);
	};
	if (_angleOkay && _losOkay && isEngineOn _x) then {
		_targetsList = _targetsList + [_x];
        //drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0.5,1,1], ASLtoAGL _xPos, 0.75, 0.75, 0, str(_x), 1, 0.025, "TahomaB"];
	} else {
        //drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0.5,0,1], ASLtoAGL _xPos, 0.75, 0.75, 0, str(_x), 1, 0.025, "TahomaB"];
	};
} forEach ((ASLToAGL _projPos) nearEntities [["Air"], _seekerMaxRange]);

//Get Countermeasures
{
	private _xPos = getPosASL _x;
	private _angleOkay = [_projPos, _xPos, _checkVector, _seekerAngle] call FUNC(checkSeekerAngle);

	private _losOkay = false;
	if (_angleOkay) then {
		_losOkay = [_projectile, _x, true] call FUNC(checkLos);
	};
	if (_angleOkay && _losOkay) then {
		_targetsList = _targetsList + [_x];
        //drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,1,1], ASLtoAGL _xPos, 0.75, 0.75, 0, str(_x), 1, 0.025, "TahomaB"];
	} else {
        //drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0,1,0,1], ASLtoAGL _xPos, 0.75, 0.75, 0, str(_x), 1, 0.025, "TahomaB"];
    };
} forEach ((ASLToAGL _projPos) nearObjects ["CMflareAmmo", _seekerMaxRange]);

/*
if (!(count _targetsList > 0) ) exitWith {
    if((time - _lastAcquireTime) > 0.5) then {
        _extractedInfo set [4, vectorDir _projectile];
    };
    [0,0,0];
};
*/

//find best target
private _seekerTargetsList = [];
private _angleThreshold = 0.1;

private _flareCoeff = 1.5; //treats a flare of having an angle (1/x) times its actual angle

while {count _seekerTargetsList < 1} do {
	{
		private _xPos = getPosASL _x;
		private _checkAngleThreshold = _angleThreshold - 0.5 + (random 0.8); // add a bit of jitter
//		private _checkAngleThreshold = _angleThreshold;
		if (_x isKindOf "CMflareAmmo") then {
			_checkAngleThreshold = _checkAngleThreshold * _flareCoeff;
		};

    	if (
            [_projPos, _xPos, _checkVector, _seekerAngle] call FUNC(checkSeekerAngle) &&
            ([_projectile, _x, true] call FUNC(checkLos))
        ) then {
	        _seekerTargetsList = _seekerTargetsList + [_x];
	    };

	} forEach _targetsList;
	_angleThreshold = _angleThreshold + 0.1;
};

//get engine position, if none, center of the model isn't bad either. :P
//private _foundTargetPos = AGLToASL ((_seekerTargetsList select 0) modelToWorld ((_seekerTargetsList select 0) selectionPosition ["HitEngine","HitPoints"]));
_foundTargetPos = getPosASL (_seekerTargetsList select 0);
_miscSeeker set [0, time];

_extractedInfo set [2, _seekerTargetsList select 0];
_extractedInfo set [3, _foundTargetPos];
_extractedInfo set [4, _projPos vectorFromTo _foundTargetPos];

_foundTargetPos;
