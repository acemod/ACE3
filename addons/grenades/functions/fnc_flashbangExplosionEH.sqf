#include "..\script_component.hpp"
/*
 * Author: KoffeinFlummi
 * Creates the flashbang effect and knock out AI units.
 *
 * Arguments:
 * 0: Flashbang position ASL <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[0,0,0]] call ace_grenades_fnc_flashbangExplosionEH
 *
 * Public: No
 */

params ["_grenadePosASL"];
TRACE_1("params",_grenadePosASL);

// Affect local AI (players are not local, except for ACE_player)
// @todo: Affect units in static weapons, turned out, etc
private _affected = ((ASLToAGL _grenadePosASL) nearEntities ["CAManBase", 20]) - [ACE_player];

{
    private _unit = _x;
    private _strength = 1 - (((eyePos _unit) vectorDistance _grenadePosASL) min 20) / 20;

    TRACE_3("FlashBangEffect Start",_unit,((getPosASL _unit) vectorDistance _grenadePosASL),_strength);

    [_unit, true] call EFUNC(common,disableAI);

    // Make AI try to look away
    private _dirToFlash = _unit getDir _grenadePosASL;
    _unit setDir (_dirToFlash + linearConversion [0.2, 1, _strength, 40, 135] * selectRandom [-1, 1]);

    private _flashReactionDebounce = _unit getVariable [QGVAR(flashReactionDebounce), 0];
    _unit setVariable [QGVAR(flashReactionDebounce), _flashReactionDebounce max (CBA_missionTime + (7 * _strength))];

    if (_flashReactionDebounce < CBA_missionTime) then {
        // Not used internally but could be useful for other mods
        _unit setVariable [QGVAR(flashStrength), _strength, true];

        [QGVAR(flashbangedAI), [_unit, _strength, _grenadePosASL]] call CBA_fnc_localEvent;

        {
            _unit setSkill [_x, (_unit skill _x) / 50];
        } forEach SUBSKILLS;

        [{
            CBA_missiontime >= _this getVariable [QGVAR(flashReactionDebounce), 0]
        }, {
            params ["_unit"];

            _unit setVariable [QGVAR(flashStrength), 0, true];

            // Make sure we don't enable AI for unconscious units
            if (_unit call EFUNC(common,isAwake)) then {
                [_unit, false] call EFUNC(common,disableAI);
            };

            {
                _unit setSkill [_x, (_unit skill _x) * 50];
            } forEach SUBSKILLS;
        }, _unit] call CBA_fnc_waitUntilAndExecute;
    };
} forEach (_affected select {local _x && {_x call EFUNC(common,isAwake)}});

if (!hasInterface) exitWith {};

// Create flash to illuminate environment
private _light = "#lightpoint" createVehicleLocal ASLToAGL _grenadePosASL;
_light setPosASL _grenadePosASL;

_light setLightBrightness 20;
_light setLightAmbient [1,1,1];
_light setLightColor [1,1,1];
_light setLightDayLight true;
_light setLightAttenuation [0, 1, 5, 1000, 0, 20];

// Reduce the light after 0.1 seconds
[{
    _this setLightBrightness 5;

    // Delete the light after 0.2 more seconds
    [{deleteVehicle _this}, _this, 0.2] call CBA_fnc_waitAndExecute;
}, _light, 0.1] call CBA_fnc_waitAndExecute;

// Ignore dead and placeable logic (zeus / spectator)
if (!alive ACE_player || {(getNumber (configOf ACE_player >> "isPlayableLogic")) == 1}) exitWith {};

// Affect local player, independently of distance
// Check for line of sight to the grenade
private _eyePos = eyePos ACE_player; // PositionASL
_grenadePosASL set [2, (_grenadePosASL select 2) + 0.2]; // compensate for grenade glitching into ground

private _strength = 1 - ((_eyePos vectorDistance _grenadePosASL) min 20) / 20;

// Check for line of sight (check 4 points in case grenade is stuck in an object or underground)
private _losCount = {
    !lineIntersects [_grenadePosASL vectorAdd _x, _eyePos, ACE_player]
} count [[0, 0, 0], [0, 0, 0.2], [0.1, 0.1, 0.1], [-0.1, -0.1, 0.1]];
TRACE_1("Line of sight count (out of 4)",_losCount);

private _losCoefficient = [1, 0.1] select (_losCount <= 1);
_strength = _strength * _losCoefficient;

// Add ace_hearing ear ringing sound effect
if (["ace_hearing"] call EFUNC(common,isModLoaded) && {_strength > 0} && {EGVAR(hearing,damageCoefficent) > 0.25}) then {
    private _earringingStrength = 40 * _strength;
    [_earringingStrength] call EFUNC(hearing,earRinging);
    TRACE_1("Earringing Strength",_earringingStrength);
};

// Add ace_medical pain effect
if (GETEGVAR(medical,enabled,false) && {_strength > 0.1} && {isDamageAllowed ACE_player} && {ACE_player getVariable [QEGVAR(medical,allowDamage), true]}) then {
    [ACE_player, _strength / 2] call EFUNC(medical,adjustPainLevel);
};

// Effect on vision has a wider range, with a higher falloff
_strength = 1 - (((_eyePos vectorDistance _grenadePosASL) min 25) / 25) ^ 0.4;
_strength = _strength * _losCoefficient;

// Account for people looking away by slightly reducing the effect for visual effects.
private _eyeDir = ((AGLToASL positionCameraToWorld [0, 0, 1]) vectorDiff (AGLToASL positionCameraToWorld [0, 0, 0]));
private _dirToUnitVector = _eyePos vectorFromTo _grenadePosASL;
private _angleDiff = acos (_eyeDir vectorDotProduct _dirToUnitVector);
TRACE_2("",_angleDiff,((1 - (_angleDiff - 45) / (120 - 45)) max 0));

// From 0-45deg, full effect
if (_angleDiff > 45) then {
    _strength = _strength * ((1 - (_angleDiff - 45) / (120 - 45)) max 0);
};

// Blind player
if (_strength > 0.1) then {
    private _blend = [[1, 1, 1, 0], [0.3, 0.3, 0.3, 1]] select EGVAR(common,epilepsyFriendlyMode);

    GVAR(flashbangPPEffectCC) ppEffectEnable true;
    GVAR(flashbangPPEffectCC) ppEffectAdjust [1, 1, (0.8 + _strength) min 1, _blend, [0, 0, 0, 1], [0, 0, 0, 0]];
    GVAR(flashbangPPEffectCC) ppEffectCommit 0.01;

    // PARTIALRECOVERY - start decreasing effect over time
    [{
        params ["_strength", "_blend"];

        GVAR(flashbangPPEffectCC) ppEffectAdjust [1, 1, 0, _blend, [0, 0, 0, 1], [0, 0, 0, 0]];
        GVAR(flashbangPPEffectCC) ppEffectCommit (10 * _strength);
    }, [_strength, _blend], 7 * _strength] call CBA_fnc_waitAndExecute;

    // FULLRECOVERY - end effect
    [{
        GVAR(flashbangPPEffectCC) ppEffectEnable false;
    }, [], 17 * _strength] call CBA_fnc_waitAndExecute;
};

// Make player flinch
if (_strength <= 0.2) exitWith {};

private _minFlinch = linearConversion [0.2, 1, _strength, 0, 60, true];
private _maxFlinch = linearConversion [0.2, 1, _strength, 0, 95, true];
private _flinch    = (_minFlinch + random (_maxFlinch - _minFlinch)) * selectRandom [-1, 1];
ACE_player setDir (getDir ACE_player + _flinch);

[QGVAR(flashbangedPlayer), [_strength, _grenadePosASL]] call CBA_fnc_localEvent;
