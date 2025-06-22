#include "..\script_component.hpp"

["recompile", "recompile", "recompile", {
    private _start = diag_tickTime;
    [] call ACE_PREP_RECOMPILE;
    [] call ace_common_fnc_dumpPerformanceCounters;
    private _end = diag_tickTime;
    systemChat format ["recompile took [%1 ms]", (1000 * (_end - _start)) toFixed 1];

    if (productVersion #4 == "Diag") then {
        call compile "diag_mergeConfigFile ['P:\z\ace\addons\missile_clgp\config.cpp']";
    };
    false
}, {false}, [59, [false, false, false]], false] call CBA_fnc_addKeybind; // F1 Key

DFUNC(dev_trackShell) = {
    params ["_projectile"];
    [{
        params ["_projectile", "_time", "_lastVel"];
        if (isNull _projectile) exitWith { true };
        
        private _ammo = typeOf _projectile;
        if (_ammo isKindOf "SubmunitionBase") then {
            private _projectilePos = getPosASL _projectile;
            private _forwardPosition = _projectilePos vectorAdd ((vectorNormalized (velocity _projectile)) vectorMultiply 15);
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [1,0,0,1], ASLToAGL _projectilePos, 0.75, 0.75, 0, _ammo, 1, 0.025, "TahomaB"];
            drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\selectover_ca.paa", [0.5,0,1,1], ASLToAGL _forwardPosition, 0.75, 0.75, 0, 
                format ["V: %1 (%2)", round vectorMagnitude velocity _projectile, round ((velocity _projectile) # 2)], 1, 0.025, "TahomaB"];
            drawLine3D [ASLToAGL _projectilePos, ASLToAGL _forwardPosition, [0.5,0,1,1]];
        };

        private _deltaT = CBA_missionTime - _time;
        if (_deltaT < 0.25) exitWith { false };

        private _curVelocity = velocity _projectile;
        private _avgSpeed = 0.5 * vectorMagnitude (_curVelocity vectorAdd _lastVel);
        systemChat format ["Vel %1 (%2)", _curVelocity, _avgSpeed];

        private _diff = _curVelocity vectorDiff _lastVel;
        _diff = _diff vectorMultiply (1/_deltaT);
        _diff = _diff vectorAdd [0,0,GRAVITY];
        private _drag = (vectorMagnitude _diff) / ((_avgSpeed max 1) ^ 2);
        systemChat format ["Drag %1", (100000 * _drag) toFixed 2];

        // systemChat format ["E %1", (GRAVITY * ((getposasl _projectile) # 2)) + (_avgSpeed ^2)];

        _this set[1, CBA_missionTime];
        _this set[2, _curVelocity];
        false
    }, {}, [_projectile, CBA_missionTime, velocity _projectile]] call CBA_fnc_waitUntilAndExecute;
};


 ["turret", {
    params ["_player", "_turret"];
    private _veh = vehicle _player;
    if (("ace_1rnd_155mm_m712" in compatibleMagazines ((_veh weaponsTurret [0]) param [0, ""])) && {_veh getVariable [QGVAR(needSetup), true]}) then {
        _veh setVariable [QGVAR(needSetup), false];
        systemChat "Setting up...";
        for "_i" from 0 to 9 do { _veh addMagazineTurret ["ace_1rnd_155mm_m712", [0], 1]; };
        _veh loadMagazine [[0], "mortar_155mm_AMOS", "ace_1rnd_155mm_m712"];
    };
 }, true] call CBA_fnc_addPlayerEventHandler;

{
    _x addEventHandler ["Fired", {
        params ["", "", "", "", "", "", "_projectile"];
        _projectile call FUNC(dev_trackShell);
        _projectile addEventHandler ["SubmunitionCreated", {
            params ["_projectile", "_submunitionProjectile"];
            hint format ["sub\n%1\n=%2 %3\n\n%4\n%5 %6", 
                velocity _projectile, vectorMagnitude velocity _projectile, local _projectile,
                velocity _submunitionProjectile, vectorMagnitude velocity _submunitionProjectile, local _submunitionProjectile];
            _submunitionProjectile call FUNC(dev_trackShell);
        }];
    }];
} forEach (vehicles + [player]);
