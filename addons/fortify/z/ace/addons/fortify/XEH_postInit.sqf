#include "script_component.hpp"

if (isServer) then {
    [QGVAR(objectPlaced), {
        params ["_unit", "_object","_cost","_time"];
        private _jipID = [QGVAR(addActionToObject), [_object, _cost, _time]] call CBA_fnc_globalEventJIP;
        [_jipID, _object] call CBA_fnc_removeGlobalEventJIP; // idealy this function should be called on the server
    }] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

GVAR(isPlacing) = PLACE_CANCEL;
["ace_interactMenuOpened", {GVAR(isPlacing) = PLACE_CANCEL}] call CBA_fnc_addEventHandler;

GVAR(objectRotationX) = 0;
GVAR(objectRotationY) = 0;
GVAR(objectRotationZ) = 0;

[QGVAR(addActionToObject), {
    params ["_object", "_cost","_time"];
    if (isNull _object || typeOf _object == "ACE_Construction_ServicePoint") exitWith {};

    // Remove object action
    private _removeAction = [
        QGVAR(removeObject),
        "Destroy",
        "",
        {   
            // Parameter Init
            params ["_target", "_player", "_params"];
            _params params ["_cost" ,"_time"];
            private _timeAdjusted = _time; 

            // Check if Specialist
            if ([_unit] call ace_fortify_fnc_isSpecialist) then {
                _timeAdjusted = round (_time / 2);
};
            // Play Annimatioon
            if (_timeAdjusted >= 20) then {
                [_player, "Acts_carFixingWheel", 1] call ace_common_fnc_doAnimation;
            } else {
                 if (_timeAdjusted > 3) then {
                    [_player, "AinvPknlMstpSnonWnonDnon_medic_1", 1] call ace_common_fnc_doAnimation;
                } else {
                    [_player, "AinvPknlMstpSnonWnonDnon_Putdown_AmovPknlMstpSnonWnonDnon", 1] call ace_common_fnc_doAnimation;
                };
            };

            // Progressbar
            [_timeAdjusted, [_player,_target,_cost], {
                // Parameter Init
                _args = _this select 0;
                _args params ["_unit", "_object","_cost"];
                                   
                // Delete Fortification
                deleteVehicle _object;

                // Return of Materials
                if (_cost > 0) then {
                    private _return = floor (_cost / 2);
                    ace_trenches_trenchSupplies = ace_trenches_trenchSupplies + _return;
                    publicVariable "ace_trenches_trenchSupplies";
                    private _str = format ["%1 Resources left", ace_trenches_trenchSupplies];
                    [_str, 1.5] call ace_common_fnc_displayTextStructured;
                };
                // Return of Sandbags
                if (_cost == -1) then {
                    _unit addItem "ACE_Fortication_Material";
                };
            },{["Canceled", 1.5] call ace_common_fnc_displayTextStructured;}, "Deconstructing..."] call ace_common_fnc_progressBar;
        },
        {(_this select 2 select 0) < 0 || ('ACE_EntrenchingTool' in items (_this select 1))},
        {},
        [_cost,_time],
        {[0, 0, 0]},
        5
    ] call DEFUNC(interact_menu,createAction);
    [_object, 0, ["ACE_MainActions"], _removeAction] call DEFUNC(interact_menu,addActionToObject);
}] call CBA_fnc_addEventHandler;
