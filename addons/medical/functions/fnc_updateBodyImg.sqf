/**
 * fn_updateBodyImg.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_interactionDialog", "_openWounds", "_part", "_total", "_amountOfWoundsSmall", "_amountOfWoundsMedium", "_amountOfWoundsLarge", "_bandagedWounds","_alphaLevel", "_damaged"];
_openWounds = _this select 0;
_bandagedWounds = _this select 1;

disableSerialization;
_interactionDialog = uiNamespace getvariable QGVAR(medicalMenu);
if (isnil "_interactionDialog") exitwith {};

_colorCalculationsOpenWounds = {
    if (_total >0) then {
        _green = 0.9;
        _blue = 0.9;
        for [{_i = 0},{ _i < round(_total)},{ _i = _i +1;}] do {
            _green = _green - 0.75;
            _blue = _blue - 0.75;
        };
        if (_green < 0.0) then {
            _green = 0.0;
            _blue = 0.0;
        };
        _damaged set[_part,true];
    };
};
_alphaLevel = 1.0;
_damaged = [false,false,false,false,false,false];
_availableSelections = [50,51,52,53,54,55];
_part = 0;

{
    private ["_red", "_green", "_blue"];
    _amountOfWoundsSmall = (_x select 0);
    _amountOfWoundsMedium = (_x select 1);
    _amountOfWoundsLarge = (_x select 2);
    _total = (_amountOfWoundsSmall) + _amountOfWoundsMedium + (_amountOfWoundsLarge);

    _red = 1;
    _green = 1;
    _blue = 1;
    call _colorCalculationsOpenWounds;
    (_interactionDialog displayCtrl (_availableSelections select _part)) ctrlSetTextColor [_red,_green,_blue,_alphaLevel];
    _part = _part + 1;
}foreach _openWounds;

{
    if (!(_damaged select _foreachIndex)) then {
        _amountOfWoundsSmall = (_x select 0);
        _amountOfWoundsMedium = (_x select 1);
        _amountOfWoundsLarge = (_x select 2);

        _total = (_amountOfWoundsSmall) + _amountOfWoundsMedium + (_amountOfWoundsLarge);
        if (_total>0) then {
            private ["_red", "_green", "_blue"];
            _red = 1.0;
            _green = 0.7;
            _blue = 0.7;
            (_interactionDialog displayCtrl (_availableSelections select _foreachIndex)) ctrlSetTextColor [_red,_green,_blue,_alphaLevel];
        };
    };
}foreach _bandagedWounds;
