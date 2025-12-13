#include "script_component.hpp"

if (isServer) then {
    [QGVAR(registerObjects), LINKFUNC(registerObjects)] call CBA_fnc_addEventHandler;
    [QXGVAR(objectPlaced), {
        params ["_unit", "_side", "_object"];
        TRACE_3("objectPlaced",_unit,_side,_object);
        private _jipID = [QGVAR(addActionToObject), [_side, _object]] call CBA_fnc_globalEventJIP;
        [_jipID, _object] call CBA_fnc_removeGlobalEventJIP; // idealy this function should be called on the server

        if (GVAR(markObjectsOnMap) isNotEqualTo 0 && {_object isKindOf "Static"}) then {
            // Wait ensures correct marker pos/rot as object is moved into position after creation
            [
                FUNC(createObjectMarker),
                [_unit, _object],
                1
            ] call CBA_fnc_waitAndExecute;
        };
    }] call CBA_fnc_addEventHandler;
};

if (!hasInterface) exitWith {};

GVAR(isPlacing) = PLACE_CANCEL;
["ace_interactMenuOpened", {GVAR(isPlacing) = PLACE_CANCEL}] call CBA_fnc_addEventHandler;

GVAR(objectRotationX) = 0;
GVAR(objectRotationY) = 0;
GVAR(objectRotationZ) = 0;

// Register CBA Chat command for admins (Example: #ace-fortify west small 200)
["ace-fortify", LINKFUNC(handleChatCommand), "admin"] call CBA_fnc_registerChatCommand;

[QGVAR(sideBudgetHint), {
    params ["_side"];
    if (_side isEqualTo side group ACE_player && {XGVAR(settingHint) isEqualTo 2 || {XGVAR(settingHint) isEqualTo 1 && {"ACE_Fortify" in (ACE_player call EFUNC(common,uniqueItems))}}}) then {
        private _budget = [_side, "side"] call FUNC(getBudget);
        TRACE_2("sideBudgetHint",_side,_budget);
        [format ["%1 $%2", LLSTRING(Budget), _budget]] call EFUNC(common,displayTextStructured);
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(addActionToObject), {
    params ["_side", "_object"];
    TRACE_2("addActionToObject EH",_side,_object);
    if (isNull _object) exitWith {};
    if (_side isEqualTo side group ace_player) then {
        private _budget = [_side] call FUNC(getBudget);
        private _cost = [_side, typeOf _object] call FUNC(getCost);
        private _text = [format ["Remove Object +$%1", _cost], "Remove Object"] select (_budget == -1);

        // Remove object action
        private _removeAction = [
            QGVAR(removeObject),
            _text,
            "",
            {
                params ["_target", "_player", "_params"];
                _params params ["_side", "_cost"];
                TRACE_2("deleting placed object",_target,_params);
                [QXGVAR(objectDeleted), [_player, _side, _target]] call CBA_fnc_globalEvent;
                private _tokensUsed = _target getVariable [QGVAR(tokensUsed), 0];
                deleteVehicle _target;
                [_side, _cost, nil, _tokensUsed] call FUNC(updateBudget);
            },
            {(missionNamespace getVariable [QGVAR(fortifyAllowed), true]) && {"ACE_Fortify" in (_player call EFUNC(common,uniqueItems))}},
            {},
            [_side, _cost],
            {[0, 0, 0]},
            5
        ] call EFUNC(interact_menu,createAction);

        [_object, 0, ["ACE_MainActions"], _removeAction] call EFUNC(interact_menu,addActionToObject);
    };
}] call CBA_fnc_addEventHandler;

// Place object event handler
[QGVAR(deployFinished), {
    params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
    _args params ["_unit", "_side", "_typeOf", "_posASL", "_vectorDir", "_vectorUp", "_cost", "_tokensUsed"];

    private _newObject = _typeOf createVehicle _posASL;
    _newObject setVariable [QGVAR(tokensUsed), _tokensUsed, true];
    _newObject setPosASL _posASL;
    _newObject setVectorDirAndUp [_vectorDir, _vectorUp];

    // Server will use this event to run the jip compatible QGVAR(addActionToObject) event and create the related map marker
    [QXGVAR(objectPlaced), [_unit, _side, _newObject]] call CBA_fnc_globalEvent;

    if (cba_events_control) then {
        // Re-run if ctrl key held
        [_unit, _unit, [_side, _typeOf, [GVAR(objectRotationX), GVAR(objectRotationY), GVAR(objectRotationZ)]]] call FUNC(deployObject);
    };

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
}] call CBA_fnc_addEventHandler;

[QGVAR(deployCanceled), {
    params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
    _args params ["_unit", "_side", "_typeOf", "_posASL", "_vectorDir", "_vectorUp", "_cost", "_tokensUsed"];

    // Refund if deploy was canceled
    [_side, _cost, nil, _tokensUsed] call FUNC(updateBudget);

    // Reset animation
    [_unit, "", 1] call EFUNC(common,doAnimation);
}] call CBA_fnc_addEventHandler;
