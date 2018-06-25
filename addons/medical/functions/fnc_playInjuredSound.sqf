#include "script_component.hpp"
/*
 * Author: Glowbal
 * Play the injured sound for a unit if the unit is damaged. The sound broadcasted across MP.
 * Will not play if the unit has already played a sound within to close a time frame.
 * Delay: With minimal damage (below 1), the delay is (10 + random(50)) seconds. Otherwise it is 60 seconds / damage.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Amount of Pain <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, 5] call ACE_medical_fnc_playInjuredSound
 *
 * Public: No
 */

params ["_unit", "_pain"];
if (!local _unit || !GVAR(enableScreams)) exitWith{};

// Lock if the unit is already playing a sound.
if ((_unit getVariable [QGVAR(playingInjuredSound),false])) exitWith {};
_unit setVariable [QGVAR(playingInjuredSound),true];

// Play the sound if there is any damage present.
if (_pain > 0 && {[_unit] call EFUNC(common,isAwake)}) exitWith {
    // Classnames of the available sounds.
    private _availableSounds_A = [
        "WoundedGuyA_01",
        "WoundedGuyA_02",
        "WoundedGuyA_03",
        "WoundedGuyA_04",
        "WoundedGuyA_05",
        "WoundedGuyA_06",
        "WoundedGuyA_07",
        "WoundedGuyA_08"
    ];
    private _availableSounds_B = [
        "WoundedGuyB_01",
        "WoundedGuyB_02",
        "WoundedGuyB_03",
        "WoundedGuyB_04",
        "WoundedGuyB_05",
        "WoundedGuyB_06",
        "WoundedGuyB_07",
        "WoundedGuyB_08"
    ];
    private _availableSounds_C = [
        "WoundedGuyC_01",
        "WoundedGuyC_02",
        "WoundedGuyC_03",
        "WoundedGuyC_04",
        "WoundedGuyC_05"
    ];
    private _sound = "";

    // Select the to be played sound based upon damage amount.
    if (_pain > 0.5) then {
        if (random(1) > 0.5) then {
            _sound = selectRandom _availableSounds_A;
        } else {
            _sound = selectRandom _availableSounds_B;
        };
    } else {
        _sound = selectRandom _availableSounds_B;
    };
    // Play the sound
    playSound3D [(getArray(configFile >> "CfgSounds" >> _sound >> "sound") select 0) + ".wss", objNull, false, getPos _unit, 15, 1, 25]; // +2db, 15 meters.

    // Figure out what the delay will be before it is possible to play a sound again.
    private _delay = (30 - (random(25) * _pain)) max (3.5 + random(2));

    // Clean up the lock
    [{
        (_this select 0) setVariable [QGVAR(playingInjuredSound), nil];
    }, [_unit], _delay, _delay] call CBA_fnc_waitAndExecute;
};

// Clean up in case there has not been played any sounds.
_unit setVariable [QGVAR(playingInjuredSound), nil];
