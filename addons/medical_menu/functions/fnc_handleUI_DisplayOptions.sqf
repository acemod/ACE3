/*
 * Author: Glowbal
 * Display the available treatment options in category
 *
 * Arguments:
 * 0: Category name <STRING>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

#define START_IDC             20
#define END_IDC             27
#define AMOUNT_OF_ENTRIES     (count _entries)

private ["_name","_entries","_display","_newTarget","_counter","_card","_ctrl","_code"];
_name = _this select 0;
if (!hasInterface) exitwith{};

disableSerialization;
_display = uiNamespace getVariable QGVAR(medicalMenu);
if (isNil "_display") exitwith {}; // no valid dialog present

if ((_name == "toggle")) exitwith {

    if (GVAR(INTERACTION_TARGET) != ACE_player) then {
        _newTarget = ACE_player;
    } else {
        _newTarget = GVAR(INTERACTION_TARGET_PREVIOUS);
    };

    GVAR(INTERACTION_TARGET_PREVIOUS) = GVAR(INTERACTION_TARGET);
    [_newTarget] spawn {
        closeDialog 0;
        sleep 0.1;
        [_this select 0] call FUNC(openMenu);
    };
};

// Clean the dropdown options list from all actions
for [{_x=START_IDC},{_x <= END_IDC},{_x=_x+1}] do {
    _ctrl = (_display displayCtrl (_x));
    _ctrl ctrlSetText "";
    _ctrl ctrlShow false;
    _ctrl ctrlSetEventHandler ["ButtonClick",""];
    _ctrl ctrlSetTooltip "";
    _ctrl ctrlCommit 0;
};

GVAR(LatestDisplayOptionMenu) = _name;

// The triage card has no options available
lbClear 212;
if (_name == "triage") exitwith {
    ctrlEnable[212,true];
    _card = ([GVAR(INTERACTION_TARGET)] call FUNC(getTriageList));
    {
        lbadd[212,format["%1 x%2", getText(configFile >> "CfgWeapons" >> (_x select 0) >> "displayName"), _x select 1]];
    }foreach _card;
    if (count _card == 0) then {
        lbadd[212,"No Entries"];
    };
};

ctrlEnable[212,false];

_entries = [ACE_player, GVAR(INTERACTION_TARGET), _name] call FUNC(getTreatmentOptions);

{
    //player sidechat format["TRIGGERED: %1",_x];
    if (_foreachIndex > END_IDC) exitwith {};
    _ctrl = (_display displayCtrl (START_IDC + _foreachIndex));
    if (!(_foreachIndex > AMOUNT_OF_ENTRIES)) then {
        _ctrl ctrlSetText (_x select 0);
        _code = format["ace_medical_menu_pendingReopen = true; call %1;",(_x select 3)];
        _ctrl ctrlSetEventHandler ["ButtonClick", _code];
        _ctrl ctrlSetTooltip (_x select 0); // TODO implement
        _ctrl ctrlShow true;
    } else {
        _ctrl ctrlSetText "";
        _ctrl ctrlSetEventHandler ["ButtonClick",""];
    };
    _ctrl ctrlCommit 0;
}foreach _entries;
