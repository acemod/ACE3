#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineResincl.inc"
#include "..\defines.hpp"
/*
 * Author: Alganthe, johnb43
 * Update arsenal's info box.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Current panel control <CONTROL>
 * 2: Current panel selection <NUMBER>
 * 3: Item config entry <CONFIG>
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_curSel", "_itemCfg"];

private _ctrlInfo = _display displayCtrl IDC_infoBox;

if (isClass _itemCfg) then {
    _ctrlInfo ctrlSetFade 0;
    _ctrlInfo ctrlCommit FADE_DELAY;

    [QGVAR(displayStats), [_display, _control, _curSel, _itemCfg]] call CBA_fnc_localEvent;
    [QGVAR(displayActions), [_display, _control, _curSel, _itemCfg]] call CBA_fnc_localEvent;

    // Name + author
    (_display displayCtrl IDC_infoName) ctrlSetText ([_control lbText _curSel, _control lnbText [_curSel, 1]] select (ctrlType _control == CT_LISTNBOX));

    private _itemAuthor = getText (_itemCfg >> "author");
    (_display displayCtrl IDC_infoAuthor) ctrlSetText ([localize "STR_AUTHOR_UNKNOWN", format [localize "STR_FORMAT_AUTHOR_SCRIPTED", _itemAuthor]] select (_itemAuthor != ""));

    // DLC / mod icon
    private _ctrlDLC = _display displayCtrl IDC_DLCIcon;
    private _ctrlDLCBackground = _display displayCtrl IDC_DLCBackground;
    private _dlc = _itemCfg call EFUNC(common,getAddon);

    if (_dlc != "") then {
        (modParams [_dlc, ["name", "logo", "logoOver"]]) params ["_name", "_logo", "_logoOver"];

        _ctrlDLC ctrlSetTooltip _name;
        _ctrlDLC ctrlSetText _logo;
        _ctrlDLCBackground ctrlSetFade 0;
        _ctrlDLC ctrlSetFade 0;

        // If an item is from a DLC, set it so when you press the icon on the bottom right it opens the DLC page
        if ((getNumber (configFile >> "CfgMods" >> _dlc >> "appId")) > 0) then {
            _ctrlDLC ctrlSetEventHandler ["MouseExit", format ["(_this select 0) ctrlSetText '%1';", _logo]];
            _ctrlDLC ctrlSetEventHandler ["MouseEnter", format ["(_this select 0) ctrlSetText '%1';", _logoOver]];
            _ctrlDLC ctrlSetEventHandler [
                "ButtonClick",
                format ["uiNamespace setVariable ['RscDisplayDLCPreview_dlc','%1']; ctrlParent (_this select 0) createDisplay 'RscDisplayDLCPreview';", _dlc]
            ];
        } else {
            _ctrlDLC ctrlRemoveAllEventHandlers "MouseExit";
            _ctrlDLC ctrlRemoveAllEventHandlers "MouseEnter";
            _ctrlDLC ctrlRemoveAllEventHandlers "ButtonClick";
        };
    } else {
        _ctrlDLC ctrlSetFade 1;
        _ctrlDLCBackground ctrlSetFade 1;
    };

    _ctrlDLC ctrlCommit 0;
    _ctrlDLCBackground ctrlCommit 0;

} else {
    [QGVAR(displayStats), [_display, _control, -1, nil]] call CBA_fnc_localEvent;
    [QGVAR(displayActions), [_display, _control, -1, nil]] call CBA_fnc_localEvent;

    _ctrlInfo ctrlSetFade 1;
    _ctrlInfo ctrlCommit FADE_DELAY;
};
