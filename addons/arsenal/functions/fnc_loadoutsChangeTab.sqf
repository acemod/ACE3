#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

systemChat str [_display, _control];

if !(ctrlEnabled _control) exitWith {};

private _centerBoxTitleCtrl = _display displayCtrl IDC_centerTitle;

switch (ctrlIDC _control) do {
    case IDC_buttonMyLoadouts: {
        _centerBoxTitleCtrl ctrlSetText "My loadouts"; // TBL
        // Call filling func
    };
    case IDC_buttonDefaultLoadouts: {
        _centerBoxTitleCtrl ctrlSetText "Default loadouts"; // TBL
        // Call filling func
    };
    case IDC_buttonSharedLoadouts: {
        _centerBoxTitleCtrl ctrlSetText "Shared loadouts"; // TBL
        // Call filling func
    };
};