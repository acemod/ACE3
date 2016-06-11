/*
 * Author: PabstMirror (based on repack from commy2, esteldunedain, Ruthberg)
 * Simulates repacking a set of magazines.
 * Returns the timing and magazines counts at every stage.
 *
 * Arguments:
 * 0: Arguments [classname,lastAmmoStatus,events] <ARRAY>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time Repacking Will Take <NUMBER>
 * 3: Error Code <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * (args from progressBar) call ace_magazinerepack_fnc_magazineRepackFinish
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
_args params ["_magazineClassname", "_lastAmmoCount"];

private _fullMagazineCount = getNumber (configFile >> "CfgMagazines" >> _magazineClassname >> "count");

// Don't show anything if player can't interact
if (!([ACE_player, objNull, ["isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith))) exitWith {};

// Count mags
private _fullMags = 0;
private _partialMags = 0;
{
    _x params ["_classname", "_count"];

    if (_classname == _magazineClassname && {_count > 0}) then {
        if (_count == _fullMagazineCount) then {
            _fullMags = _fullMags + 1;
        } else {
            _partialMags = _partialMags + 1;
        };
    };
} forEach (magazinesAmmoFull ACE_player);

private _repackedMagsText = format [localize LSTRING(RepackedMagazinesCount), _fullMags, _partialMags];

private _structuredOutputText = if (_errorCode == 0) then {
    format ["<t align='center'>%1</t><br/>%2", localize LSTRING(RepackComplete), _repackedMagsText];
} else {
    format ["<t align='center'>%1</t><br/>%2", localize LSTRING(RepackInterrupted), _repackedMagsText];
};

private _picture = getText (configFile >> "CfgMagazines" >> _magazineClassname >> "picture");
[_structuredOutputText, _picture, nil, nil, 2.5] call EFUNC(common,displayTextPicture);
