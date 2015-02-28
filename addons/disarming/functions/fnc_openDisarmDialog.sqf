//openDisarmDialog

#include "script_component.hpp"

PARAMS_2(_caller,_target);

//Sanity Checks
if (_caller != ACE_player) exitwith {ERROR("Player isn't caller?");};
if (!([_target] call FUNC(canDisarm))) exitWith {ERROR("Unit Cannot Be Disarmed");};
if (!([] call EGVAR(common,canInteract))) exitWith {ERROR("Player cannot Interact");};

closeDialog 0;
createDialog QGVAR(remoteInventory);

disableSerialization;

_display = uiNamespace getVariable ["ACE_remoteInventory", displayNull];
if (isNull _display) exitWith {ERROR("Display is Null");};

GVAR(disarmTarget) = _target;

//Setup Drop Event (on right pannel)
(_display displayCtrl 632) ctrlAddEventHandler ["LBDrop", {
    if (isNull GVAR(disarmTarget)) exitWith {};
    PARAMS_5(_ctrl,_xPos,_yPos,_idc,_itemInfo);
    EXPLODE_3_PVT((_itemInfo select 0),_displayText,_value,_data);

    if (isNull GVAR(disarmTarget)) exitWith {ERROR("disarmTarget is null");};
    
    systemChat format ["Debug: Droping %1 from %2", _data, GVAR(disarmTarget)];
    ["DisarmDropItems", [GVAR(disarmTarget)], [ACE_player, GVAR(disarmTarget), [_data]]] call EFUNC(common,targetEvent);
    
    false //not sure what this does
}];

//Setup PFEH
[{
    disableSerialization;
    EXPLODE_2_PVT(_this,_args,_pfID);
    EXPLODE_3_PVT(_args,_player,_target,_display);


    if ((!([_target] call FUNC(canDisarm))) ||
            {isNull _display} ||
            {_player != ACE_player} ||
            {!([] call EGVAR(common,canInteract))}) then {

        [_pfID] call CBA_fnc_removePerFrameHandler;
        GVAR(disarmTarget) = objNull;
        if (!isNull _display) then {closeDialog 0;}; //close dialog if still open
    } else {
        _groundContainer = _display displayCtrl 632;
        _targetContainer = _display displayCtrl 633;
        _playerName = _display displayCtrl 111;
        _rankPicture = _display displayCtrl 1203;

        _rankPicture ctrlSetText "\A3\Ui_f\data\GUI\Cfg\Ranks\corporal_gs.paa";
        _playerName ctrlSetText ([GVAR(disarmTarget)] call EFUNC(common,getName));

        lbClear _groundContainer;
        lbClear _targetContainer;

        _targetUniqueItems = [GVAR(disarmTarget)] call FUNC(getAllGearUnit);
        [_targetContainer, _targetUniqueItems] call FUNC(showItemsInListbox);


        _holder = objNull;
        {
            if ((_x getVariable [QGVAR(disarmUnit), objNull]) == _target) exitWith {
                _holder = _x;
            };
        } forEach ((getpos _target) nearObjects ["GroundWeaponHolder", 3]);

        if (!isNull _holder) then {
            _holderUniqueItems = [_holder] call FUNC(getAllGearContainer);
            [_groundContainer, _holderUniqueItems] call FUNC(showItemsInListbox);
        };

    };
}, 0.05, [_caller, _target, _display]] call CBA_fnc_addPerFrameHandler;
