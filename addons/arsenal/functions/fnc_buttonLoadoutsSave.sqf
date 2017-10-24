#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

if !(ctrlEnabled _control) exitWith {};

private _data = profileNamespace getVariable [QGVAR(saved_loadouts), []];
private _loadout = getUnitLoadout GVAR(center);

private _contentPanelCtrl = _display displayCtrl IDC_contentPanel;
private _loadoutName = _contentPanelCtrl lnbText [(lnbCurSelRow _contentPanelCtrl), 1];

private _editBoxCtrl = _display displayCtrl IDC_textEditBox;
private _editBoxContent = ctrlText _editBoxCtrl;

switch (GVAR(currentLoadoutsTab)) do {

    case IDC_buttonMyLoadouts: {
        private _sameNameLoadoutsList = _data select {_x select 0 == _editBoxContent};

        if (count _sameNameLoadoutsList == 0) then {

            _data pushBack [_editBoxContent, _loadout];

            private _newRow = _contentPanelCtrl lnbAddRow ["",_editBoxContent];

            _contentPanelCtrl lnbSetPicture [[_newRow, 2], getText (configFile >> "cfgWeapons" >> ((_loadout select 0) select 0) >> "picture")];
            _contentPanelCtrl lnbSetPicture [[_newRow, 3], getText (configFile >> "cfgWeapons" >> ((_loadout select 1) select 0) >> "picture")];
            _contentPanelCtrl lnbSetPicture [[_newRow, 4], getText (configFile >> "cfgWeapons" >> ((_loadout select 2) select 0) >> "picture")];
            _contentPanelCtrl lnbSetPicture [[_newRow, 5], getText (configFile >> "cfgWeapons" >> ((_loadout select 3) select 0) >> "picture")];
            _contentPanelCtrl lnbSetPicture [[_newRow, 6], getText (configFile >> "cfgWeapons" >> ((_loadout select 4) select 0) >> "picture")];
            _contentPanelCtrl lnbSetPicture [[_newRow, 7], getText (configFile >> "cfgVehicles" >> ((_loadout select 5) select 0) >> "picture")];
            _contentPanelCtrl lnbSetPicture [[_newRow, 8], getText (configFile >> "cfgWeapons" >> (_loadout select 6) >> "picture")];
            _contentPanelCtrl lnbSetPicture [[_newRow, 9], getText (configFile >> "cfgGlasses" >> (_loadout select 7) >> "picture")];

            _contentPanelCtrl lnbSort [1, false];

            for '_i' from 0 to (((lnbsize _contentPanelCtrl) select 0) - 1) do {
                if ((_contentPanelCtrl lnbText [_i, 1]) == _editBoxContent) exitwith {_contentPanelCtrl lnbSetCurSelRow _i};
            };

        } else {
            _data set [_data find (_sameNameLoadoutsList select 0), [[_editBoxContent, _loadoutName] select (_loadoutName isEqualTo _editBoxContent), _loadout]];
        };

        [(findDisplay IDD_ace_arsenal), format ["Loadout '%1' was saved", _editBoxContent]] call FUNC(message); // TBL
    };

    case IDC_buttonDefaultLoadouts: {
        //TODO
    };

    case IDC_buttonSharedLoadouts: {
        //TODO
    };
};

profileNamespace setVariable [QGVAR(saved_loadouts), _data];
