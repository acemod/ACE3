#include "script_component.hpp"
/*
 * Author: Glowbal
 * Display the available treatment options in category
 *
 * Arguments:
 * 0: Category name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["some category"] call ace_medical_menu_fnc_handleUI_DisplayOptions
 *
 * Public: No
 */

#define START_IDC 20
#define END_IDC 27
#define AMOUNT_OF_ENTRIES (count _entries)

if (!hasInterface) exitWith{};

params ["_name"];

disableSerialization;

private _display = uiNamespace getVariable QGVAR(medicalMenu);
if (isNil "_display") exitWith {}; // no valid dialog present

if (_name isEqualTo "toggle") exitWith {
    private _newTarget = ACE_player;
    //If we are on the player, and only if our old target is still valid, switch to it:
    if ((GVAR(INTERACTION_TARGET) == ACE_player) &&
            {[ACE_player, GVAR(INTERACTION_TARGET_PREVIOUS), ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)} &&
            {[ACE_player, GVAR(INTERACTION_TARGET_PREVIOUS)] call FUNC(canOpenMenu)}) then {
        _newTarget = GVAR(INTERACTION_TARGET_PREVIOUS);
    };

    GVAR(INTERACTION_TARGET_PREVIOUS) = GVAR(INTERACTION_TARGET);

    closeDialog 0;
    [{
        [_this select 0] call FUNC(openMenu);
    }, [_newTarget], 0.1] call CBA_fnc_waitAndExecute;
};

// Clean the dropdown options list from all actions
for [{_x = START_IDC}, {_x <= END_IDC}, {_x = _x + 1}] do {
    private _ctrl = (_display displayCtrl (_x));
    _ctrl ctrlSetText "";
    _ctrl ctrlShow false;
    _ctrl ctrlSetEventHandler ["ButtonClick",""];
    _ctrl ctrlSetTooltip "";
    _ctrl ctrlCommit 0;
};

GVAR(LatestDisplayOptionMenu) = _name;

// The triage card has no options available
lbClear 212;
if (_name isEqualTo "triage") exitWith {

    ctrlEnable [212, true];
    private _log = GVAR(INTERACTION_TARGET) getVariable [QEGVAR(medical,triageCard), []];
    private _triageCardTexts = [];
    {
        _x params ["_item", "_amount", "_time"];
        private _message = _item;
        if (isClass(configFile >> "CfgWeapons" >> _item)) then {
            _message = getText(configFile >> "CfgWeapons" >> _item >> "DisplayName");
        } else {
            if (isLocalized _message) then {
                _message = localize _message;
            };
        };
        _triageCardTexts pushBack format["%1x - %2 (%3m)", _amount, _message, round((CBA_missionTime - _time) / 60)];
        nil;
    } count _log;

    if (count _triageCardTexts == 0) exitWith {
        lbAdd [212,(localize ELSTRING(medical,TriageCard_NoEntry))];
    };
    {
        lbAdd [212,_x];
        nil;
    }count _triageCardTexts;
};

ctrlEnable [212, false];

_entries = [ACE_player, GVAR(INTERACTION_TARGET), _name] call FUNC(getTreatmentOptions);

{
    //player sidechat format["TRIGGERED: %1",_x];
    if (_forEachIndex > END_IDC) exitWith {};
    _ctrl = (_display displayCtrl (START_IDC + _forEachIndex));
    if (!(_forEachIndex > AMOUNT_OF_ENTRIES)) then {
        _ctrl ctrlSetText (_x select 0);
        private _code = format ["ace_medical_menu_pendingReopen = true; call %1;", (_x select 3)];
        _ctrl ctrlSetEventHandler ["ButtonClick", _code];
        _ctrl ctrlSetTooltip (_x select 0); // TODO implement
        _ctrl ctrlShow true;
    } else {
        _ctrl ctrlSetText "";
        _ctrl ctrlSetEventHandler ["ButtonClick", ""];
    };
    _ctrl ctrlCommit 0;
} forEach _entries;
