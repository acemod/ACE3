#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

private _contentListCtrl = _display displayCtrl IDC_contentPanel;
private _textEditBoxCtrl= _display displayCtrl IDC_textEditBox;
_textEditBoxCtrl ctrlSetText "";

_contentListCtrl lnbSetCurSelRow -1;
lnbClear _contentListCtrl;

private _data = +(profileNamespace getvariable [QGVAR(saved_loadouts),[]]);

if (ctrlIDC _control != IDC_buttonSharedLoadouts) then {

    {
        _x params ["_loadoutName", "_loadoutData"];

        ([_loadoutData] call FUNC(verifyLoadout)) params ["_loadout", "_nullItemsAmount", "_unavailableItemsAmount"];

        private _newRow = _contentListCtrl lnbAddRow ["",_loadoutName];

        _contentListCtrl lnbSetPicture [[_newRow, 2], getText (configFile >> "cfgWeapons" >> ((_loadout select 0) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 3], getText (configFile >> "cfgWeapons" >> ((_loadout select 1) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 4], getText (configFile >> "cfgWeapons" >> ((_loadout select 2) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 5], getText (configFile >> "cfgWeapons" >> ((_loadout select 3) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 6], getText (configFile >> "cfgWeapons" >> ((_loadout select 4) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 7], getText (configFile >> "cfgVehicles" >> ((_loadout select 5) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 8], getText (configFile >> "cfgWeapons" >> (_loadout select 6) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 9], getText (configFile >> "cfgGlasses" >> (_loadout select 7) >> "picture")];

        if (_nullItemsAmount > 0) then {

            _contentListCtrl lnbSetColor [[_newRow, 1], [1, 0, 0, 0.5]];
        } else {

            if (_unavailableItemsAmount > 0) then {
                _contentListCtrl lnbSetColor [[_newRow, 1], [1, 1, 1, 0.25]];
            };
        };

        _contentListCtrl setVariable [_loadoutName, _loadout];
    } foreach ([_data, ([GVAR(defaultLoadoutsList), []] select (isNil QGVAR(defaultLoadoutsList)))] select (ctrlIDC _control == IDC_buttonDefaultLoadouts));
} else {

};

_contentListCtrl lnbSort [1, false];