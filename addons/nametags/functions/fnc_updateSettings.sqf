/*
 * Author: Jonpas
 * Dynamically adds and removes Draw3D based on settings on run-time.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_nametags_fnc_updateSettings
 *
 * Public: No
 */
#include "script_component.hpp"

if (isNil QGVAR(drawHandler) && {GVAR(showPlayerNames) != 0}) then {
    // Decide if it should be done on sqf or on the intercept extension
    if (missionNamespace getVariable ["intercept_invoker_ok", false]) then {
        // Use the extension
        // @todo: figure out how to solve the extension being on @ace vs z\ace, etc
        "intercept" callExtension "load_extension:z\ace\ace_nametags.dll";
        GVAR(drawHandler) = true;
        ACE_LOGINFO("ace_nametags enabled using intercept extension.");
    } else {
        // Go sfq
        GVAR(drawHandler) = addMissionEventHandler ["Draw3D", {_this call FUNC(onDraw3d);}];
        ACE_LOGINFO("ace_nametags enabled using sqf.");
    };
} else {
    if (!isNil QGVAR(drawHandler) && {GVAR(showPlayerNames) == 0}) then {
        if (typeName GVAR(drawHandler) == "BOOL") then {
            "intercept" callExtension "unload_extension:z\ace\ace_nametags.dll";
        } else {
            removeMissionEventHandler ["Draw3D", GVAR(drawHandler)];
        };
        GVAR(drawHandler) = nil;
    };
};
