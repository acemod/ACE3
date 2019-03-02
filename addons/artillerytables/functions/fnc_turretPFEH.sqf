#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Shows real azimuth and elevation on hud
 *
 * Arguments:
 * 0: PFEH Args <ARRAY>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [[]] call ace_artillerytables_fnc_turretPFEH
 *
 * Public: No
 */
(_this select 0) params ["_mortarVeh", "_turret", "_fireModes", "_useAltElevation"];


if (shownArtilleryComputer && {GVAR(disableArtilleryComputer)}) then {
    // Still Don't like this solution, but it works
    closeDialog 0;
    [parseText "Computer Disabled"] call EFUNC(common,displayTextStructured);
};

// Restart display if null (not just at start, this will happen periodicly)
if (isNull (uiNamespace getVariable [QGVAR(display), displayNull])) then {
    TRACE_1("creating display",_this);
    ([QGVAR(modeDisplay)] call BIS_fnc_rscLayer) cutRsc [QGVAR(modeDisplay), "PLAIN", 1, false];
};

private _ctrlGroup = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl 1000;
if (cameraView != "GUNNER") exitWith { // need to be in gunner mode, so we can check where the optics are aiming at
    _ctrlGroup ctrlShow false;
};
_ctrlGroup ctrlShow true;

BEGIN_COUNTER(pfeh);

private _currentFireMode = (weaponState [_mortarVeh, _turret]) select 2;
private _currentChargeMode = _fireModes find _currentFireMode;

private _lookVector = (AGLtoASL (positionCameraToWorld [0,0,0])) vectorFromTo (AGLtoASL (positionCameraToWorld [0,0,1]));
private _weaponDir = _mortarVeh weaponDirection (currentWeapon _mortarVeh);

// Calc real azimuth/elevation
// (looking at the sky VS looking at ground will radicaly change fire direction because BIS)
private _display = uiNamespace getVariable ["ACE_dlgArtillery", displayNull];
private _useRealWeaponDir = if ((isNull (_display displayCtrl 173)) || {(_mortarVeh ammo (currentWeapon _mortarVeh)) == 0}) then {
    // With no ammo, distance display will be empty, but gun will still fire at wonky angle if aimed at ground
    private _testSeekerPosASL = AGLtoASL (positionCameraToWorld [0,0,0]);
    private _testPoint = _testSeekerPosASL vectorAdd (_lookVector vectorMultiply viewDistance);
    !((terrainIntersectASL [_testSeekerPosASL, _testPoint]) || {lineIntersects [_testSeekerPosASL, _testPoint, _mortarVeh]});
} else {
    ((ctrlText (_display displayCtrl 173)) == "--")
};

private _realElevation = asin (_weaponDir select 2);
private _realAzimuth = if (_useRealWeaponDir) then {
    // No range (looking at sky), it will follow weaponDir:
    (_weaponDir select 0) atan2 (_weaponDir select 1)
} else {
    // Valid range, will fire at camera dir
    // Azimuth will still be look dir EVEN IF elevation has flipped over 90! (on steep hills)
    if (_useAltElevation) then {
        // Some mortars have odd launch angles... still not sure why
        // This gets very close, (should be less than 0.5deg deviation on a 20deg slope)
        private _turretRot = [vectorDir _mortarVeh, vectorUp _mortarVeh, (180 / PI) * (_mortarVeh animationPhase "mainTurret")] call FUNC(rotateVector3d);
        _realElevation = acos (_turretRot vectorDotProduct _weaponDir) + ((_turretRot call CBA_fnc_vect2polar) select 2);
        if (_realElevation > 90) then { _realElevation = 180 - _realElevation; }; // does not flip azimuth!
    };
    ((_lookVector select 0) atan2 (_lookVector select 1))
};
if (_realAzimuth < 0) then { _realAzimuth = _realAzimuth + 360; };

private _ctrlCharge = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_CHARGE;
private _ctrlAzimuth = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_AZIMUTH;
private _ctrlElevation = (uiNamespace getVariable [QGVAR(display), displayNull]) displayCtrl IDC_ELEVATION;

_ctrlAzimuth ctrlSetText Format ["AZ: %1", [DEGTOMILS * _realAzimuth, 4, 0] call CBA_fnc_formatNumber];
_ctrlElevation ctrlSetText Format ["EL: %1", [DEGTOMILS * _realElevation, 4, 0] call CBA_fnc_formatNumber];
_ctrlCharge ctrlSetText format ["CH: %1", _currentChargeMode];

END_COUNTER(pfeh);

#ifdef DEBUG_MODE_FULL
// private _lookVector = (AGLtoASL (positionCameraToWorld [0,0,0])) vectorFromTo (AGLtoASL (positionCameraToWorld [0,0,10]));
// systemChat format ["AZ: %1 EL: %2", _realAzimuth toFixed 1, _realElevation toFixed 1];
// systemChat format ["Slope: %1 - Look: %2 [%3]", (acos ((vectorUp _mortarVeh) select 2)) toFixed 1, ((_lookVector select 0) atan2 (_lookVector select 1)), ["GND","SKY"] select _useRealWeaponDir];
GVAR(prediction) = _realElevation;
#endif
