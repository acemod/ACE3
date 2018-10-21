#include "script_component.hpp"
/*
 * Author: PabstMirror, Jonpas
 * When interact_menu starts rendering (from "interact_keyDown" event).
 * Add pick up helpers to all nearby throwables and keep setting them to their position (setVariable and attachTo does not work on CfgAmmo).
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_advanced_throwing_fnc_renderPickUpInteraction
 *
 * Public: No
 */

[{
    params ["_args", "_idPFH"];
    _args params ["_setPosition", "_addedPickUpHelpers", "_throwablesHelped", "_nearThrowables"];

    // isNull is necessarry to prevent rare error when ending mission with interact key down
    if (EGVAR(interact_menu,keyDown) && {!isNull ACE_player}) then {
        // Rescan when player moved >5 meters from last pos, nearObjects can be costly with a lot of objects around
        if ((getPosASL ACE_player) distance _setPosition > 5) then {
             // Grenades inherit from GrenadeHand, IR throwbles from IRStrobeBase, IR Chemlights are special snowflakes
             // nearEntities does not see throwables
            _nearThrowables = ACE_player nearObjects ["GrenadeHand", PICK_UP_DISTANCE];
            _nearThrowables append (ACE_player nearObjects ["IRStrobeBase", PICK_UP_DISTANCE]);
            _nearThrowables append (ACE_player nearObjects ["ACE_Chemlight_IR_Dummy", PICK_UP_DISTANCE]);

            {
                if (!(_x in _throwablesHelped) &&
                    {!(_x isKindOf "SmokeShellArty")} && {!(_x isKindOf "G_40mm_Smoke")} && // All smokes inherit from "GrenadeHand" >> "SmokeShell"
                    {GVAR(enablePickUpAttached) || {!GVAR(enablePickUpAttached) && {isNull (attachedTo _x)}}}
                ) then {
                    TRACE_2("Making PickUp Helper",_x,typeOf _x);
                    private _pickUpHelper = QGVAR(pickUpHelper) createVehicleLocal [0, 0, 0];

                    _pickUpHelper attachTo [_x, [0, 0, 0]];
                    _pickUpHelper setVariable [QGVAR(throwable), _x];

                    _addedPickUpHelpers pushBack _pickUpHelper;
                    _throwablesHelped pushBack _x;
                };
                nil
            } count _nearThrowables;

            _args set [0, getPosASL ACE_player];
            _args set [3, _nearThrowables];
        };

        // Make sure helper is on correct location as it will not automatically move
        // attachTo is not supported with CfgAmmo, it is only used to get location
        {
            // Only handling with attachTo works nicely
            _x attachTo [_x getVariable [QGVAR(throwable), objNull], [0, 0, 0]];
            nil
        } count _addedPickUpHelpers;
    } else {
        TRACE_1("Cleaning Pick Up Helpers",count _addedPickUpHelpers);
        {deleteVehicle _x} count _addedPickUpHelpers;
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [(getPosASL ACE_player) vectorAdd [-100, 0, 0], [], [], []]] call CBA_fnc_addPerFrameHandler;
