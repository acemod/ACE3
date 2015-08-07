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
 * Public: No
 */
#include "script_component.hpp"

private "_lbCtrl";

params["_display", "_genericMessages", "_allInjuryTexts"];

_lbCtrl = _display displayCtrl 213;
lbClear _lbCtrl;
{
    _lbCtrl lbAdd (_x select 0);
    _lbCtrl lbSetColor [_forEachIndex, _x select 1];
    nil
} count _genericMessages;

_amountOfGeneric = count _genericMessages;
{
    _lbCtrl lbAdd (_x select 0);
    _lbCtrl lbSetColor [_forEachIndex + _amountOfGeneric, _x select 1];
    nil
} count _allInjuryTexts;

if (count _allInjuryTexts == 0) then {
    _lbCtrl lbAdd localize ELSTRING(medical,NoInjuriesBodypart);
};
