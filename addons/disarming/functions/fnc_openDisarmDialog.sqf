#include "script_component.hpp"
/*
 * Author: PabstMirror
 *
 * Opens the disarm dialog (allowing a person to remove items)
 *
 * Arguments:
 * 0: Caller (player) <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, bob] call ace_disarming_fnc_openDisarmDialog
 *
 * Public: No
 */
params ["_caller", "_target"];
#define DEFUALTPATH "\A3\Ui_f\data\GUI\Cfg\Ranks\%1_gs.paa"
//Sanity Checks
if (_caller != ACE_player) exitWith {ERROR("Player isn't caller?");};
if (!([_player, _target] call FUNC(canPlayerDisarmUnit))) exitWith {ERROR("Can't Disarm Unit");};
if (dialog) then {ERROR("Dialog open when trying to open disarm dialog"); closeDialog 0;};

disableSerialization;

createDialog QGVAR(remoteInventory);

private _display = uiNamespace getVariable ["ACE_remoteInventory", displayNull];
if (isNull _display) exitWith {ERROR("Display is Null");};

GVAR(disarmTarget) = _target;

//Setup Drop Event (on right pannel)
(_display displayCtrl 632) ctrlAddEventHandler ["LBDrop", {
    if (isNull GVAR(disarmTarget)) exitWith {};
    params ["_ctrl", "_xPos", "_yPos", "_idc", "_itemInfo"];
    (_itemInfo select 0) params ["_displayText", "_value", "_data"];

    if (isNull GVAR(disarmTarget)) exitWith {ERROR("disarmTarget is null");};

    TRACE_2("Debug: Droping %1 from %2",_data,GVAR(disarmTarget));
    [QGVAR(dropItems), [ACE_player, GVAR(disarmTarget), [_data]], [GVAR(disarmTarget)]] call CBA_fnc_targetEvent;

    false //not sure what this does
}];

//Setup PFEH
[{
    disableSerialization;
    params ["_args", "_idPFH"];
    _args params ["_player", "_target", "_display"];

    if ((!([_player, _target] call FUNC(canPlayerDisarmUnit))) ||
            {isNull _display} ||
            {_player != ACE_player}) then {

        [_idPFH] call CBA_fnc_removePerFrameHandler;
        GVAR(disarmTarget) = objNull;
        if (!isNull _display) then { closeDialog 0; }; //close dialog if still open
    } else {

        private _groundContainer = _display displayCtrl 632;
        private _targetContainer = _display displayCtrl 633;
        private _playerName = _display displayCtrl 111;
        private _rankPicture = _display displayCtrl 1203;

        //Show rank and name (just like BIS's inventory)
        private _icon = format [DEFUALTPATH, toLower (rank _target)];
        if (_icon isEqualTo DEFUALTPATH) then {_icon = ""};
        _rankPicture ctrlSetText _icon;
        _playerName ctrlSetText ([GVAR(disarmTarget), false, true] call EFUNC(common,getName));

        //Clear both inventory lists:
        lbClear _groundContainer;
        lbClear _targetContainer;

        //Show the items in the ground disarmTarget's inventory
        private _targetUniqueItems = [GVAR(disarmTarget)] call FUNC(getAllGearUnit);
        [_targetContainer, _targetUniqueItems] call FUNC(showItemsInListbox);

        //Try to find a holder that the target is using to drop items into:
        private _holder = objNull;
        {
            if ((_x getVariable [QGVAR(disarmUnit), objNull]) == _target) exitWith {
                _holder = _x;
            };
        } count ((getpos _target) nearObjects [DISARM_CONTAINER, 3]);

        //If a holder exists, show it's inventory
        if (!isNull _holder) then {
            private _holderUniqueItems = [_holder] call FUNC(getAllGearContainer);
            [_groundContainer, _holderUniqueItems] call FUNC(showItemsInListbox);
        };
    };
}, 0, [_caller, _target, _display]] call CBA_fnc_addPerFrameHandler;
