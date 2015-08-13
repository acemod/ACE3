//#define DEBUG_MODE_FULL
#include "script_component.hpp"
TRACE_1("enter", _this);

#define __TRACKINTERVAL 0    // how frequent the check should be.
#define __LOCKONTIME 3    // Lock on won't occur sooner

private["_apos", "_aposX", "_aposY", "_args", "_boundsInput", "_bpos", "_canFire", "_constraintBottom"];
private["_constraintLeft", "_constraintRight", "_constraintTop", "_currentTarget", "_fireDisabledEH"];
private["_firedEH", "_fov", "_lastTick", "_lockTime", "_maxX", "_maxY", "_minX", "_minY", "_newTarget"];
private["_offsetX", "_offsetY", "_pos", "_randomLockInterval", "_randomPosWithinBounds", "_range"];
private["_runTime", "_soundTime", "_targetArray", "_zamerny", "_currentShooter"];

_currentShooter = (vehicle ACE_player);

#define __OffsetX ((ctrlPosition __JavelinIGUITargetingLineV) select 0) - 0.5
#define __OffsetY ((ctrlPosition __JavelinIGUITargetingLineH) select 1) - 0.5

// Reset arguments if we havnt rendered in over a second
_args = uiNamespace getVariable[QGVAR(arguments), [] ];
if( (count _args) > 0) then {
    _lastTick = _args select 0;
    if(ACE_diagTime - _lastTick > 1) then {
        [] call FUNC(onOpticLoad);
    };
};

TRACE_1("Running", "Running");

// Pull the arguments
_currentTarget = _args select 1;
_runTime = _args select 2;
_lockTime = _args select 3;
_soundTime = _args select 4;
_randomLockInterval = _args select 5;
_fireDisabledEH = _args select 6;

private["_ammo", "_magazineConfig", "_weaponConfig"];
_weaponConfig = configProperties [configFile >> "CfgWeapons" >> (currentWeapon _currentShooter), QUOTE(configName _x == QUOTE(QGVAR(enabled))), false];
_magazineConfig = if ((currentMagazine _currentShooter) != "") then {
    _ammo = getText (configFile >> "CfgMagazines" >> (currentMagazine _currentShooter) >> "ammo");
    configProperties [(configFile >> "CfgAmmo" >> _ammo), "(configName _x) == 'ace_missileguidance'", false];
} else {
    []
};

//If weapon does not have "javelin enabled", then exit PFEH
if (((count _weaponConfig) < 1) || {(getNumber (_weaponConfig select 0)) != 1}) exitWith {
    __JavelinIGUITargeting ctrlShow false;
    __JavelinIGUITargetingGate ctrlShow false;
    __JavelinIGUITargetingLines ctrlShow false;
    __JavelinIGUITargetingConstraints ctrlShow false;

    if(!isNil "_fireDisabledEH") then {
        _fireDisabledEH = [_fireDisabledEH] call FUNC(enableFire);
    };

    [(_this select 1)] call cba_fnc_removePerFrameHandler;
    GVAR(pfehID) = -1;
};

// Find a target within the optic range
_newTarget = objNull;

// Bail on fast movement
if ((velocity ACE_player) distance [0,0,0] > 0.5 && {cameraView == "GUNNER"} && {cameraOn == ACE_player}) exitWith {    // keep it steady.
    ACE_player switchCamera "INTERNAL";
};

// Refresh the firemode
[] call FUNC(showFireMode);

_ammo = _currentShooter ammo (currentWeapon _currentShooter);
// not loaded or not "javelin enabled" for magazine, hide targeting and enable firing
if ((_ammo == 0) || {(count _magazineConfig) < 1} || {(getNumber ((_magazineConfig select 0) >> "enabled")) != 1}) exitWith {
    __JavelinIGUITargeting ctrlShow false;
    __JavelinIGUITargetingGate ctrlShow false;
    __JavelinIGUITargetingLines ctrlShow false;
    __JavelinIGUITargetingConstraints ctrlShow false;

    if(!isNil "_fireDisabledEH") then {
        _fireDisabledEH = [_fireDisabledEH] call FUNC(enableFire);
    };
};

_range = parseNumber (ctrlText __JavelinIGUIRangefinder);
TRACE_1("Viewing range", _range);
if (_range > 50 && {_range < 2500}) then {
    _pos = positionCameraToWorld [0,0,_range];
    _targetArray = _pos nearEntities ["AllVehicles", _range/100];
    TRACE_1("Searching at range", _targetArray);
    if (count (_targetArray) > 0) then {
        _newTarget = _targetArray select 0;
    };
};

if (isNull _newTarget) then {
    _newTarget = cursorTarget;
};

// Create constants
_constraintTop = __ConstraintTop;
_constraintLeft = __ConstraintLeft;
_constraintBottom = __ConstraintBottom;
_constraintRight = __ConstraintRight;

_offsetX = __OffsetX;
_offsetY = __OffsetY;

__JavelinIGUITargeting ctrlShow true;
__JavelinIGUITargetingConstrains ctrlShow true;

_zamerny = if (_currentTarget isKindOf "CAManBase") then {_currentTarget selectionPosition "body"} else {_currentTarget selectionPosition "zamerny"};
_randomPosWithinBounds = [(_zamerny select 0) + 1 - (random 2.0),(_zamerny select 1) + 1 - (random 2.0),(_zamerny select 2) + 0.5 - (random 1.0)];

_apos = worldToScreen (_currentTarget modelToWorld _randomPosWithinBounds);

_aposX = 0;
_aposY = 0;
if (count _apos < 2) then {
    _aposX = 1;
    _aposY = 0;
} else {
    _aposX = (_apos select 0) + _offsetX;
    _aposY = (_apos select 1) + _offsetY;
};

if((call CBA_fnc_getFoV) select 1 > 9) then {
    __JavelinIGUINFOV ctrlSetTextColor __ColorGreen;
    __JavelinIGUIWFOV ctrlSetTextColor __ColorGray;
} else {
    __JavelinIGUINFOV ctrlSetTextColor __ColorGray;
    __JavelinIGUIWFOV ctrlSetTextColor __ColorGreen;
};

FUNC(disableFire) = {
    _firedEH = _this select 0;

    if(_firedEH < 0 && difficulty > 0) then {
        _firedEH = [ACE_player, "DefaultAction", {true}, {
            _canFire = (_this select 1) getVariable["ace_missileguidance_target", nil];
            if(!isNil "_canFire") exitWith { false };
            true
        }] call EFUNC(common,addActionEventHandler);
    };
    _firedEH
};
FUNC(enableFire) = {
    _firedEH = _this select 0;

    if(_firedEH > 0 && difficulty > 0) then {
        [ACE_player, "DefaultAction", _firedEH] call EFUNC(common,removeActionEventHandler);
    };
    -1
};

if (isNull _newTarget) then {
    // No targets found
    _currentTarget = objNull;
    _lockTime = 0;

    __JavelinIGUISeek ctrlSetTextColor __ColorGray;
    __JavelinIGUITargeting ctrlShow false;
    __JavelinIGUITargetingGate ctrlShow false;
    __JavelinIGUITargetingLines ctrlShow false;
    __JavelinIGUITargetingConstraints ctrlShow false;

    _currentShooter setVariable ["ace_missileguidance_target",nil, false];

    // Disallow fire
    _fireDisabledEH = [_fireDisabledEH] call FUNC(disableFire);
} else {
    _fov = [] call CBA_fnc_getFoV;
    TRACE_1("FOV", _fov);
    if (_newTarget distance ACE_player < 2500
            && {(call CBA_fnc_getFoV) select 1 > 9}
            && { (currentVisionMode ACE_player == 2)}
            && GVAR(isLockKeyDown)
            ) then {
        // Lock on after 3 seconds
        if(_currentTarget != _newTarget) then {
            TRACE_1("New Target, reseting locking", _newTarget);
            _lockTime = ACE_diagTime;
            _currentTarget = _newTarget;

            playSound "ACE_Javelin_Locking";
        } else {
            if(ACE_diagTime - _lockTime > __LOCKONTIME + _randomLockInterval) then {
                TRACE_2("LOCKED!", _currentTarget, _lockTime);

                __JavelinIGUISeek ctrlSetTextColor __ColorGreen;

                __JavelinIGUITargeting ctrlShow true;
                __JavelinIGUITargetingConstrains ctrlShow false;
                __JavelinIGUITargetingGate ctrlShow true;
                __JavelinIGUITargetingLines ctrlShow true;

                // Move target marker to coords.
                //__JavelinIGUITargetingLineV ctrlSetPosition [_aposX,ctrlPosition __JavelinIGUITargetingLineV select 1];
                //__JavelinIGUITargetingLineH ctrlSetPosition [ctrlPosition __JavelinIGUITargetingLineH select 0,_aposY];
                //{_x ctrlCommit __TRACKINTERVAL} forEach [__JavelinIGUITargetingLineH,__JavelinIGUITargetingLineV];

                _boundsInput = if (_currentTarget isKindOf "CAManBase") then {
                    [_currentTarget,[-1,-1,-2],_currentTarget selectionPosition "body"];
                } else {
                    [_currentTarget,[-1,-1,-2],_currentTarget selectionPosition "zamerny"];
                };

                _bpos = _boundsInput call EFUNC(common,worldToScreenBounds);

                _minX = ((_bpos select 0) + _offsetX) max _constraintLeft;
                _minY = ((_bpos select 1) + _offsetY) max _constraintTop;
                _maxX = ((_bpos select 2) + _offsetX) min (_constraintRight - 0.025*(3/4)*SafezoneH);
                _maxY = ((_bpos select 3) + _offsetY) min (_constraintBottom - 0.025*SafezoneH);

                TRACE_4("", _boundsInput, _bpos, _minX, _minY);

                __JavelinIGUITargetingGateTL ctrlSetPosition [_minX,_minY];
                __JavelinIGUITargetingGateTR ctrlSetPosition [_maxX,_minY];
                __JavelinIGUITargetingGateBL ctrlSetPosition [_minX,_maxY];
                __JavelinIGUITargetingGateBR ctrlSetPosition [_maxX,_maxY];

                {_x ctrlCommit __TRACKINTERVAL} forEach [__JavelinIGUITargetingGateTL,__JavelinIGUITargetingGateTR,__JavelinIGUITargetingGateBL,__JavelinIGUITargetingGateBR];

                _currentShooter setVariable["ace_missileguidance_target", _currentTarget, false];

                // Allow fire
                _fireDisabledEH = [_fireDisabledEH] call FUNC(enableFire);

                if(ACE_diagTime > _soundTime) then {
                    playSound "ACE_Javelin_Locked";
                    _soundTime = ACE_diagTime + 0.25;
                };
            } else {
                __JavelinIGUITargeting ctrlShow true;
                __JavelinIGUITargetingGate ctrlShow true;
                __JavelinIGUITargetingConstrains ctrlShow true;
                __JavelinIGUITargetingLines ctrlShow false;

                _currentShooter setVariable["ace_missileguidance_target", nil, false];

                _boundsInput = if (_currentTarget isKindOf "CAManBase") then {
                    [_newTarget,[-1,-1,-2],_currentTarget selectionPosition "body"];
                } else {
                    [_newTarget,[-1,-1,-1],_currentTarget selectionPosition "zamerny"];
                };

                _bpos = _boundsInput call EFUNC(common,worldToScreenBounds);

                _minX = ((_bpos select 0) + _offsetX) max _constraintLeft;
                _minY = ((_bpos select 1) + _offsetY) max _constraintTop;
                _maxX = ((_bpos select 2) + _offsetX) min (_constraintRight - 0.025*(3/4)*SafezoneH);
                _maxY = ((_bpos select 3) + _offsetY) min (_constraintBottom - 0.025*SafezoneH);

                TRACE_4("", _boundsInput, _bpos, _minX, _minY);

                __JavelinIGUITargetingGateTL ctrlSetPosition [_minX,_minY];
                __JavelinIGUITargetingGateTR ctrlSetPosition [_maxX,_minY];
                __JavelinIGUITargetingGateBL ctrlSetPosition [_minX,_maxY];
                __JavelinIGUITargetingGateBR ctrlSetPosition [_maxX,_maxY];

                {_x ctrlCommit __TRACKINTERVAL} forEach [__JavelinIGUITargetingGateTL,__JavelinIGUITargetingGateTR,__JavelinIGUITargetingGateBL,__JavelinIGUITargetingGateBR];

                if(ACE_diagTime > _soundTime) then {
                    playSound "ACE_Javelin_Locking";
                    _soundTime = ACE_diagTime + 0.25;
                };
                // Disallow fire
                _fireDisabledEH = [_fireDisabledEH] call FUNC(disableFire);
            };
        };
    } else {
        // No targets found
        _currentTarget = objNull;
        _lockTime = 0;

        __JavelinIGUISeek ctrlSetTextColor __ColorGray;
        __JavelinIGUITargeting ctrlShow false;
        __JavelinIGUITargetingGate ctrlShow false;
        __JavelinIGUITargetingLines ctrlShow false;
        __JavelinIGUITargetingConstraints ctrlShow false;

        _currentShooter setVariable ["ace_missileguidance_target",nil, false];

        // Disallow fire
        _fireDisabledEH = [_fireDisabledEH] call FUNC(disableFire);
    };
};

//TRACE_2("", _newTarget, _currentTarget);

// Save arguments for next run
_args set[0, ACE_diagTime];
_args set[1, _currentTarget];
_args set[2, _runTime];
_args set[3, _lockTime];
_args set[4, _soundTime];
_args set[6, _fireDisabledEH];

uiNamespace setVariable[QGVAR(arguments), _args ];
