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
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_display", "_genericMessages", "_allInjuryTexts", "_lbCtrl"];
_display = _this select 0;
_genericMessages = _this select 1;
_allInjuryTexts = _this select 2;

_lbCtrl = (_display displayCtrl 213);
lbClear _lbCtrl;
{
    _lbCtrl lbAdd (_x select 0);
    _lbCtrl lbSetColor [_foreachIndex, _x select 1];
}foreach _genericMessages;

_amountOfGeneric = count _genericMessages;
{
    _lbCtrl lbAdd (_x select 0);
    _lbCtrl lbSetColor [_foreachIndex + _amountOfGeneric, _x select 1];
}foreach _allInjuryTexts;
if (count _allInjuryTexts == 0) then {
    _lbCtrl lbAdd (localize ELSTRING(medical,NoInjuriesBodypart));
};
