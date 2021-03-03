#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Fired event handler for submunition projectiles that will become missiles
 *
 * Arguments:
 * Guidance Arg Array <ARRAY>
 *
 * Return Value:
 * Handeled <BOOL>
 *
 * Example:
 * [args] call ace_missileguidance_fnc_deploySubmunition
 *
 * Public: No
 */

params ["_firedEH", "", "", "", "_stateParams"];
_firedEH params ["","","","","_ammo","","_projectile"];
_stateParams params ["_lastRunTime", "_seekerStateParams", "_attackProfileStateParams", "_lastKnownPosState", "_submunitionArray"];
_submunitionArray params ["_submunitionCondition", "_replacementAmmo", "_curPosASL"];


#ifdef DRAW_GUIDANCE_INFO
drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLtoAGL getPosASL _projectile, 0.75, 0.75, 0, format ["Sub: %1", _ammo], 1, 0.025, "TahomaB"];
#endif

private _handled = false;  // return value

if (_submunitionCondition != "#Triggered") then {
    if (isNull _projectile) exitWith { WARNING_1("projectile became null before triggered - %1", _this); };
    _handled = true; // exit back in main loop
    if (_this call (missionNamespace getVariable _submunitionCondition)) then {
        private _curPosASL = getPosASL _projectile;
        triggerAmmo _projectile; // will be available next frame
        _submunitionArray set [0, "#Triggered"];
        _submunitionArray set [2, _curPosASL];
        TRACE_2("triggered shell",_projectile,_submunitionArray);
    };
} else {
    private _matches = ((ASLtoAGL _curPosASL) nearObjects [_replacementAmmo, 100]);
    _matches = _matches apply { [_curPosASL vectorDistance (getPosASL _x), _x] };
    _matches sort true;
    TRACE_2("",_replacementAmmo,_matches);
    private _newProjectile = (_matches param [0, [0, objNull]]) select 1; 

    if (!alive _newProjectile || {!local _newProjectile}) exitWith {
        WARNING_3("submunition null %1",_newProjectile,alive _newProjectile, local _newProjectile);
    };
    _stateParams set [0, cba_missionTime]; // reset guidance time to now
    _stateParams set [4, []]; // so this never runs anymore
    _firedEH set [4, _replacementAmmo]; 
    _firedEH set [6, _newProjectile];

    m = _newProjectile;
};

_handled
