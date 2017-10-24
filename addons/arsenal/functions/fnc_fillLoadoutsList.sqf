#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

private _contentListCtrl = _display displayCtrl IDC_contentPanel;

_contentListCtrl lnbSetCurSelRow -1;
lnbClear _contentListCtrl;

private _data = profileNamespace getvariable [QGVAR(saved_loadouts),[]];

if (ctrlIDC _control == IDC_buttonMyLoadouts) then {

    {
        _x params ["_loadoutName", "_loadoutData"];

        private _newRow = _contentListCtrl lnbAddRow ["",_loadoutName];

        _contentListCtrl lnbSetPicture [[_newRow, 2], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 0) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 3], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 1) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 4], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 2) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 5], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 3) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 6], getText (configFile >> "cfgWeapons" >> ((_loadoutData select 4) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 7], getText (configFile >> "cfgVehicles" >> ((_loadoutData select 5) select 0) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 8], getText (configFile >> "cfgWeapons" >> (_loadoutData select 6) >> "picture")];
        _contentListCtrl lnbSetPicture [[_newRow, 9], getText (configFile >> "cfgGlasses" >> (_loadoutData select 7) >> "picture")];

        if (false) then {
            _contentListCtrl lnbSetColor [[_newRow, 0], [1, 1, 1, 0.25]];
            _contentListCtrl lbSetValue [_newRow, -1];
        };

        _contentListCtrl lnbSort [1, false];
    } foreach _data;
} else {

};