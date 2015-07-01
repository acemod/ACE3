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
 * Nothing
 *
 * Example:
 * (args from progressBar) call ace_magazinerepack_fnc_magazineRepackFinish
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_structuredOutputText", "_picture", "_fullMags", "_partialMags", "_fullMagazineCount"];

PARAMS_4(_args,_elapsedTime,_totalTime,_errorCode);
EXPLODE_2_PVT(_args,_magazineClassname,_lastAmmoCount);
_fullMagazineCount = getNumber (configfile >> "CfgMagazines" >> _magazineClassname >> "count");

//Don't show anything if player can't interact:
if (!([ACE_player, objNull, ["isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith))) exitWith {};

_structuredOutputText = if (_errorCode == 0) then {
    format ["<t align='center'>%1</t><br/>", (localize LSTRING(RepackComplete))];
} else {
    format ["<t align='center'>%1</t><br/>", (localize LSTRING(RepackInterrupted))];
};

_picture = getText (configFile >> "CfgMagazines" >> _magazineClassname >> "picture");
_structuredOutputText = _structuredOutputText + format ["<img align='center' size='1.8' color='#ffffff' image='%1'/> <br/>", _picture];

//EFUNC(common,displayTextStructured) doesn't have room for this, and I don't think it's nessacary, can fix in the future if wanted:

// _fullMags = 0;
// _partialMags = 0;
// {
    // EXPLODE_2_PVT(_x,_xClassname,_xCount);
    // if ((_xClassname == _magazineClassname) && {_xCount > 0}) then {
        // if (_xCount == _fullMagazineCount) then {
            // _fullMags = _fullMags + 1;
        // } else {
            // _partialMags = _partialMags + 1;
        // };
    // };
// } forEach (magazinesAmmoFull ACE_player);
// _structuredOutputText = _structuredOutputText + format [("<t align='center'>" + (localize LSTRING(RepackedMagazinesCount)) + "</t>"), _fullMags, _partialMags];

[parseText _structuredOutputText, 2] call EFUNC(common,displayTextStructured);
