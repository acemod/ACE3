#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Generic handler for submunitionCreated
 *
 * Arguments:
 * 0: Old Projectile <OBJECT>
 * 1: New Projectile <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [a,b] call ace_clgp_fnc_submunition_submunitionCreated
 *
 * Public: No
 */

params ["_projectile", "_submunitionProjectile"];

private _guidanceArgs = _projectile getVariable [QGVAR(guidanceArgs), []];
TRACE_2("submunitionCreated",typeOf _projectile,typeOf _submunitionProjectile);
if (isNull _submunitionProjectile) exitWith { WARNING_1("null %1",_this); };

if (_guidanceArgs isNotEqualTo []) then { // Inject the submunition projectile and time into guidance args
    _guidanceArgs params ["_firedEH", "", "", "", "_stateParams"];
    _firedEH set [6, _submunitionProjectile]; // _firedEH params ["","","","","","","_projectile"];
    _stateParams set [0, diag_tickTime]; // _stateParams params ["_lastRunTime"] 
    TRACE_2("-Starting missileGuidance",_submunitionProjectile,count _guidanceArgs); 
    [EFUNC(missileguidance,guidancePFH), 0, _guidanceArgs] call CBA_fnc_addPerFrameHandler;
};

if (!isNil QEFUNC(frag,addPfhRound)) then { // todo make frag work for original and sub
    TRACE_1("-Starting frag track",_submunitionProjectile); 
    [_firedEH # 0, _firedEH # 4, _submunitionProjectile] call EFUNC(frag,addPfhRound);
};

// if negative then ignore, any other value is a coefficent
private _deployApplyDrag = getNumber ((configOf _projectile) >> QGVAR(deployApplyDrag));
TRACE_1("",_deployApplyDrag);
if (_deployApplyDrag >= 0) then {
    private _kFactor = _projectile getVariable [QEGVAR(artillerytables,kFactor), 0];
    _kFactor = _kFactor * _deployApplyDrag; // maybe be 0 from either source
    TRACE_3("-Applying Drag",_submunitionProjectile,_deployApplyDrag,_kFactor);
    private _dragArray = [_submunitionProjectile, _kFactor, CBA_missionTime];
    _submunitionProjectile setVariable [QGVAR(dragArray), _dragArray];
};
