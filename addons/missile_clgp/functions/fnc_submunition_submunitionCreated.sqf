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
 * [a,b] call ace_missile_clgp_fnc_submunition_submunitionCreated
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

private _deployArtilleryDragConfig = (configOf _projectile) >> QGVAR(artilleryDrag);
if (isNumber _deployArtilleryDragConfig) then {
    private _deployArtilleryDrag = getNumber _deployArtilleryDragConfig;
    if (_deployArtilleryDrag < 0) exitWith { TRACE_1("-Ignoring Drag",_deployArtilleryDrag); };
    private _kFactor = _projectile getVariable [QEGVAR(artillerytables,kFactor), 0];
    TRACE_2("-Drag",_deployArtilleryDrag,_kFactor);
    _kFactor = _kFactor * _deployArtilleryDrag; // Can be 0 from either source (0 is valid and will keep nose pointed)
    private _dragArray = [_submunitionProjectile, _kFactor, CBA_missionTime];
    _submunitionProjectile setVariable [QGVAR(dragArray), _dragArray];
};
