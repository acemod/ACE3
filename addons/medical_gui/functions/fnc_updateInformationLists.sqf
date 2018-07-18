/*
 * Author: Glowbal
 * Update the treatment information list
 *
 * Arguments:
 * 0: display <DISPLAY>
 * 1: message collection <ARRAY>
 * 2: injury collection <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [DISPLAY, [messagecollection], [injurycollection]] call ACE_medical_menu_fnc_updateInformationLists
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_display", "_genericMessages", "_allInjuryTexts"];

private _lbCtrl = _display displayCtrl 213;
lbClear _lbCtrl;
{
    _x params ["_add", "_color"];
    _lbCtrl lbAdd _add;
    _lbCtrl lbSetColor [_forEachIndex, _color];
} forEach _genericMessages;

private _amountOfGeneric = count _genericMessages;
{
    _x params ["_add", "_color"];
    _lbCtrl lbAdd _add;
    _lbCtrl lbSetColor [_forEachIndex + _amountOfGeneric, _color];
} forEach _allInjuryTexts;

if (_allInjuryTexts isEqualTo []) then {
    _lbCtrl lbAdd localize ELSTRING(medical,NoInjuriesBodypart);
};
