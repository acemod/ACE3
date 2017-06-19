/*
 * Author: jaynus, PabstMirror
 * Main loop, handles scaning for targets and drawing the javelin optic
 *
 * Arguments:
 * 0: Last run frame <NUMBER>
 * 0: Current target (what we locked last run) <OBJECT>
 * 0: Lock start time (cba mission time) <NUMBER>
 * 0: Next sound play time (ticktime) <NUMBER>
 * 0: Next target scan (ticktime) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_javelin_fnc_mapHelperDraw
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

// TRACE_1("onOpticDraw",diag_frameno);

#define __TRACKINTERVAL 0       // how frequent the ui update should be.
#define __SCANNTERVAL 0.05      // how frequent the target scan check should be.
#define __LOCKONTIME 3          // Lock on won't occur sooner

// Pull the arguments
params ["_lastRunFrame", "_currentTarget", "_lockStartTime", "_soundNextPlayTime", "_fireDisabledEH", "_nextTargetScan"];

// Get shooter info
private _currentShooter = if (ACE_player call CBA_fnc_canUseWeapon) then {ACE_player} else {vehicle ACE_player};
private _currentWeapon = currentWeapon _currentShooter;
private _currentMagazine = currentMagazine _currentShooter;

// Get weapon / ammo configs
private _ammoCount = _currentShooter ammo _currentWeapon;
private _weaponConfig = configProperties [configFile >> "CfgWeapons" >> _currentWeapon, QUOTE(configName _x == QUOTE(QGVAR(enabled))), false];
private _ammoConfig = if (_currentMagazine != "") then {
    private _ammoType = getText (configFile >> "CfgMagazines" >> _currentMagazine >> "ammo");
    configProperties [(configFile >> "CfgAmmo" >> _ammoType), "(configName _x) == 'ace_missileguidance'", false];
} else {
    []
};

// Check if loaded and javelin enabled for wepaon and missile guidance enabled for loaded ammo
if ((_ammoCount == 0) || // No ammo loaded
        {(count _weaponConfig) < 1} || {(getNumber (_weaponConfig select 0)) != 1} || // Not enabled for weapon
        {(count _ammoConfig) < 1} || {(getNumber ((_ammoConfig select 0) >> "enabled")) != 1} // Not enabled for ammo
        ) exitWith {

    __JavelinIGUITargeting ctrlShow false;
    __JavelinIGUISeek ctrlSetTextColor __ColorGray;

    _fireDisabledEH = [_fireDisabledEH] call FUNC(enableFire);
    _this set [0, diag_frameno];
    _this set [4, _fireDisabledEH];
};


// Bail on fast movement (keep it steady)
if ((velocity ACE_player) distance [0,0,0] > 0.75 && {cameraView == "GUNNER"} && {cameraOn == ACE_player}) exitWith {
    TRACE_1("exiting gunner because movement",velocity ACE_player);
    ACE_player switchCamera "INTERNAL";
    if (player != ACE_player) then {
        TRACE_2("Zeus, manually reseting RC after switchCamera",player,ACE_player);
        player remoteControl ACE_player;
    };
};

// Refresh the firemode (top/dir)
[] call FUNC(showFireMode);

// Get UI constants
private _offsetX = 0.5 * safeZoneW - safeZoneX - 0.5;
private _offsetY = 0.5 * safeZoneH - safeZoneY - 0.5;

private _newTarget = objNull;
if (GVAR(isLockKeyDown) && {cameraView == "GUNNER"} && {(currentVisionMode ACE_player) == 2}) then {
    // Attempting to lock; getTarget can be  expensive so it's rate is limited
    if (diag_tickTime > _nextTargetScan) then {
        BEGIN_COUNTER(getTarget);
        _newTarget = [_currentTarget, 2500, 0.6] call FUNC(getTarget);
        END_COUNTER(getTarget);
        _nextTargetScan = diag_tickTime + __SCANNTERVAL;
    } else {
        _newTarget = _currentTarget;
    };

    // Show gate box
    private _boundsInput = if (_currentTarget isKindOf "CAManBase") then {
        [_currentTarget,[-0.5,-0.5,-0.25],[0,0,0]];
    } else {
        [_currentTarget,[-1,-1,-1],_currentTarget selectionPosition "zamerny"]; 
    };

    private _bpos = _boundsInput call EFUNC(common,worldToScreenBounds);
    
    private _lockTime = if (isNull _currentTarget) then {0} else {CBA_missionTime - _lockStartTime};
    private _minX = ((linearConversion [1, (__LOCKONTIME - 0.5), _lockTime, 0.5 - 0.075*safeZoneW, (_bpos select 0), true]) + _offsetX) max __ConstraintLeft;
    private _minY = ((linearConversion [1, (__LOCKONTIME - 0.5), _lockTime, 0.5 - 0.075*safeZoneH, (_bpos select 1), true]) + _offsetY) max __ConstraintTop;
    private _maxX = (((linearConversion [1, (__LOCKONTIME - 0.5), _lockTime, 0.5 + 0.075*safeZoneW, (_bpos select 2), true]) + _offsetX) min __ConstraintRight) - (0.025 * (3 / 4) * safeZoneH);
    private _maxY = (((linearConversion [1, (__LOCKONTIME - 0.5), _lockTime, 0.5 + 0.075*safeZoneH, (_bpos select 3), true]) + _offsetY) min __ConstraintBottom) - (0.025 * safeZoneH);

    // TRACE_3("",_boundsInput,_bpos,_lockTime);
    // TRACE_4("",_minX,_maxX,_minY,_maxY);

    __JavelinIGUITargetingGateTL ctrlSetPosition [_minX, _minY];
    __JavelinIGUITargetingGateTR ctrlSetPosition [_maxX, _minY];
    __JavelinIGUITargetingGateBL ctrlSetPosition [_minX, _maxY];
    __JavelinIGUITargetingGateBR ctrlSetPosition [_maxX, _maxY];
    {_x ctrlCommit __TRACKINTERVAL} forEach [__JavelinIGUITargetingGateTL, __JavelinIGUITargetingGateTR, __JavelinIGUITargetingGateBL, __JavelinIGUITargetingGateBR];

    __JavelinIGUITargeting ctrlShow true;
    __JavelinIGUITargetingGate ctrlShow true;
} else {
    // Not trying to lock
    __JavelinIGUITargeting ctrlShow false;
    __JavelinIGUITargetingGate ctrlShow false;
    __JavelinIGUITargetingLines ctrlShow false;
};

if (isNull _newTarget) then {
    // No target found
    _currentTarget = objNull;
    _lockStartTime = 0;
    __JavelinIGUISeek ctrlSetTextColor __ColorGray;
    _currentShooter setVariable ["ace_missileguidance_target", nil, false];

    __JavelinIGUITargetingLines ctrlShow false;
        
    // Disallow fire
    _fireDisabledEH = [_fireDisabledEH] call FUNC(disableFire);
} else {
    if ((!isNull _newTarget) && {_currentTarget != _newTarget}) then {
        TRACE_1("New Target, reseting locking", _newTarget);
        _lockStartTime = CBA_missionTime;
        _currentTarget = _newTarget;
    };

    if ((CBA_missionTime - _lockStartTime) > __LOCKONTIME) then { // Lock on after 3 seconds
        TRACE_2("LOCKED!", _currentTarget, _lockStartTime);
        __JavelinIGUISeek ctrlSetTextColor __ColorGreen;
        __JavelinIGUITargetingLines ctrlShow true;

        // Move target marker (the crosshair) to aimpoint on the target
        private _aimPointOnTarget = _currentTarget selectionPosition (["zamerny", "body"] select (_currentTarget isKindOf "CAManBase"));
        (worldToScreen (_currentTarget modelToWorld _aimPointOnTarget)) params [["_aposX", 0.5], ["_aposY", 0.5]];
        private _ctrlPos = ctrlPosition __JavelinIGUITargetingLineV;
        _ctrlPos set [0, _aposX + _offsetX];
        __JavelinIGUITargetingLineV ctrlSetPosition _ctrlPos;
        __JavelinIGUITargetingLineV ctrlCommit __TRACKINTERVAL;
        _ctrlPos = ctrlPosition __JavelinIGUITargetingLineH;
        _ctrlPos set [1, _aposY + _offsetY];
        __JavelinIGUITargetingLineH ctrlSetPosition _ctrlPos;
        __JavelinIGUITargetingLineH ctrlCommit __TRACKINTERVAL;

        _currentShooter setVariable ["ace_missileguidance_target", _currentTarget, false];

        // Allow fire
        _fireDisabledEH = [_fireDisabledEH] call FUNC(enableFire);

        if (diag_tickTime > _soundNextPlayTime) then {
            playSound "ACE_Javelin_Locked";
            _soundNextPlayTime = diag_tickTime + 0.25;
        };
    } else {
        // Lock in progress
        __JavelinIGUISeek ctrlSetTextColor __ColorGray;
        __JavelinIGUITargetingLines ctrlShow false;

        _currentShooter setVariable ["ace_missileguidance_target", nil, false];

        if (diag_tickTime > _soundNextPlayTime) then {
            playSound "ACE_Javelin_Locking";
            _soundNextPlayTime = diag_tickTime + 0.25;
        };
        // Disallow fire
        _fireDisabledEH = [_fireDisabledEH] call FUNC(disableFire);
    };
};

// Save arguments for next run
_this set [0, diag_frameno];
_this set [1, _currentTarget];
_this set [2, _lockStartTime];
_this set [3, _soundNextPlayTime];
_this set [4, _fireDisabledEH];
_this set [5, _nextTargetScan];
