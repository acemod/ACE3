#include "script_component.hpp"
/*
 * Author: KoffeinFlummi and esteldunedain
 * Calculates average g-forces and triggers g-effects
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 * 1: pfh_id <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[args], 5] call ace_gforces_fnc_pfhUpdateGForces
 *
 * Public: No
 */

// Update the g-forces at constant mission time intervals (taking accTime into account)
if ((CBA_missionTime - GVAR(lastUpdateTime)) < INTERVAL) exitWith {};
GVAR(lastUpdateTime) = CBA_missionTime;

if (GVAR(playerIsVirtual) || {!alive ACE_player}) exitWith {};

BEGIN_COUNTER(everyInterval);

private _newVel = velocity (vehicle ACE_player);
private _accel = ((_newVel vectorDiff GVAR(oldVel)) vectorMultiply (1 / INTERVAL)) vectorAdd [0, 0, 9.8];
// Cap maximum G's to +- 10 to avoid g-effects when the update is low fps.
private _currentGForce = (((_accel vectorDotProduct vectorUp (vehicle ACE_player)) / 9.8) max -10) min 10;

GVAR(GForces) set [GVAR(GForces_Index), _currentGForce];
GVAR(GForces_Index) = (GVAR(GForces_Index) + 1) % 30; // 30 = round (AVERAGEDURATION / INTERVAL);
GVAR(oldVel) = _newVel;

/* Source: https://github.com/KoffeinFlummi/AGM/issues/1774#issuecomment-70341573
*
* For untrained people without g-suits:
* GLOC: 5G for 6 s
* RedOut: 2.5G for 6 s
*
* For trained jet pilots without g-suits:
* GLOC: 9G for 6 s
* RedOut: 4.5G
*
* For trained jet pilots with g-suits:
* GLOC: 10.5G for 6 s
* RedOut: 4.5G
*
* Effects and camera shake start 30% the limit value, and build gradually
*/

private _average = 0;
private _count = {
    _average = _average + _x;
    true
} count GVAR(GForces);

if (_count > 0) then {
    _average = _average / _count;
};

private _classCoef = (ACE_player getVariable ["ACE_GForceCoef",
    getNumber (configFile >> "CfgVehicles" >> (typeOf ACE_player) >> "ACE_GForceCoef")]) max 0.001;
private _suitCoef = if ((uniform ACE_player) != "") then {
    (getNumber (configFile >> "CfgWeapons" >> (uniform ACE_player) >> "ACE_GForceCoef")) max 0.001
} else {
    1
};

private _gBlackOut = MAXVIRTUALG / _classCoef + MAXVIRTUALG / _suitCoef - MAXVIRTUALG;

// Unconsciousness
if ((_average > _gBlackOut) and {isClass (configFile >> "CfgPatches" >> "ACE_Medical") and {!(ACE_player getVariable ["ACE_isUnconscious", false])}}) then {
    [ACE_player, true, (10 + floor(random 5)), true] call EFUNC(medical,setUnconscious);
};

GVAR(GForces_CC) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];

if !(ACE_player getVariable ["ACE_isUnconscious", false]) then {
    if (_average > 0.30 * _gBlackOut) then {
        private _strength = ((_average - 0.30 * _gBlackOut) / (0.70 * _gBlackOut)) max 0;
        GVAR(GForces_CC) ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[2 * (1 - _strength),2 * (1 - _strength),0,0,0,0.1,0.5]];
        addCamShake [_strength, 1, 15];
    } else {
        private _gRedOut = MINVIRTUALG / _classCoef;

        if (_average < -0.30 * _gRedOut) then {
            private _strength = ((abs _average - 0.30 * _gRedOut) / (0.70 * _gRedOut)) max 0;
            GVAR(GForces_CC) ppEffectAdjust [1,1,0,[1,0.2,0.2,1],[0,0,0,0],[1,1,1,1],[2 * (1 - _strength),2 * ( 1 -_strength),0,0,0,0.1,0.5]];
            addCamShake [_strength / 1.5, 1, 15];
        };
    };
};

GVAR(GForces_CC) ppEffectCommit INTERVAL;

END_COUNTER(everyInterval);
