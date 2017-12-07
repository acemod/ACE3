/*
 * Author: Alganthe
 * Update arsenal's info box.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Current panel control <CONTROL>
 * 2: Current panel selection <SCALAR>
 * 3: Item config entry <CONFIG>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control", "_curSel" ,"_itemCfg"];

private _ctrlInfo = _display displayCtrl IDC_infoBox;

if (isClass _itemCfg) then {

    _ctrlInfo ctrlSetFade 0;
    _ctrlInfo ctrlCommit FADE_DELAY;

    // Name + author
    private _ctrlInfoName = _display displayCtrl IDC_infoName;
    _ctrlInfoName ctrlSetText  ([_control lbText _curSel, _control lnbText [_curSel, 1]] select (ctrlType _control == 102));

    private _ctrlInfoAuthor = _display displayctrl IDC_infoAuthor;
    _ctrlInfoAuthor ctrlSetText "";

    private _itemAuthor = getText (_itemCfg >> "author");
    _ctrlInfoAuthor ctrlSetText ([localize "STR_AUTHOR_UNKNOWN", format [localize "STR_FORMAT_AUTHOR_SCRIPTED",_itemAuthor]] select (_itemAuthor != ""));

    // DLC / mod icon
    private _ctrlDLC = _display displayctrl IDC_DLCIcon;
    private _ctrlDLCBackground = _display displayctrl IDC_DLCBackground;
    private _dlc = _itemCfg call GETDLC;
    if (_dlc != "") then {

        private _dlcParams = modParams [_dlc, ["name", "logo", "logoOver"]];
        _dlcParams params ["_name", "_logo", "_logoOver"];
        private _appId = getnumber (configfile >> "CfgMods" >> _dlc >> "appId");

        _ctrlDLC ctrlsettooltip _name;
        _ctrlDLC ctrlsettext _logo;
        _ctrlDLCBackground ctrlsetfade 0;
        _ctrlDLC ctrlsetfade 0;
        if (_appId > 0) then {
            _ctrlDLC ctrlseteventhandler ["mouseexit",format ["(_this select 0) ctrlsettext '%1';",_logo]];
            _ctrlDLC ctrlseteventhandler ["mouseenter",format ["(_this select 0) ctrlsettext '%1';",_logoOver]];
            _ctrlDLC ctrlseteventhandler [
                "buttonclick",
                format ["uiNamespace setvariable ['RscDisplayDLCPreview_dlc','%1']; ctrlparent (_this select 0) createDisplay 'RscDisplayDLCPreview';", _dlc]
            ];
        } else {
            _ctrlDLC ctrlRemoveAllEventHandlers "buttonclick";
            _ctrlDLC ctrlRemoveAllEventHandlers "mouseexit";
            _ctrlDLC ctrlRemoveAllEventHandlers "mouseenter";
        };
    } else {
        _ctrlDLC ctrlsetfade 1;
        _ctrlDLCBackground ctrlsetfade 1;
    };

    _ctrlDLC ctrlcommit 0;
    _ctrlDLCBackground ctrlcommit 0;

} else {
    _ctrlInfo ctrlSetFade 1;
    _ctrlInfo ctrlCommit FADE_DELAY;
};
