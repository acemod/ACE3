#include "\z\ace\addons\missileguidance\script_component.hpp"
// tracks a projectile until it explodes
params ["_projectile"];

private _camera = "camera" camCreate getPosATL _projectile;
_camera camPrepareFOV 0.7;
_camera cameraEffect ["internal", "back"];

_camera camCommitPrepared 0;

[{
	params ["_args", "_pfh"];
	_args params ["_projectile", "_camera", "_projectilePos"];
	if !(alive _projectile) exitWith {
		[{
			params ["_camera"];

			_camera cameraEffect ["terminate", "back"];
			_camera camCommitPrepared 0;
			camDestroy _camera;
		}, [_camera], 1.5] call CBA_fnc_waitAndExecute;

		_camera camPrepareTarget _projectilePos;
		_camera camCommitPrepared 0;

		[_pfh] call CBA_fnc_removePerFrameHandler;
	};

	_camera camPrepareTarget _projectile;
	_camera camPrepareRelPos [0, -5, 1];
	_camera camCommitPrepared 0;

	_args set [2, getPosATL _projectile];
}, 0, [_projectile, _camera, getPosATL _projectile]] call CBA_fnc_addPerFrameHandler;