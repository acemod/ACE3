#include "script_component.hpp"

#define IDD_DISPLAY3DEN 313

["ace_settingsInitialized",{
    // Only add an InitPost EH if setting is enabled (and apply retroactively)
    if (isServer && {GVAR(autoAddObjects)}) then {
        ["AllVehicles", "InitPost", FUNC(addObjectToCurator), true, [], true] call CBA_fnc_addClassEventHandler;
    };
}] call CBA_fnc_addEventHandler;

// Global skill module PVs values for persistence, just listen for the PV
QGVAR(GlobalSkillAI) addPublicVariableEventHandler FUNC(moduleGlobalSetSkill);

[QGVAR(moveToRespawnPosition), BIS_fnc_moveToRespawnPosition] call CBA_fnc_addEventHandler;
[QGVAR(moduleDefendArea), CBA_fnc_taskDefend] call CBA_fnc_addEventHandler;
[QGVAR(modulePatrolArea), CBA_fnc_taskPatrol] call CBA_fnc_addEventHandler;
[QGVAR(moduleSearchNearby), CBA_fnc_searchNearby] call CBA_fnc_addEventHandler;
[QGVAR(moduleSearchArea), CBA_fnc_taskSearchArea] call CBA_fnc_addEventHandler;
[QGVAR(suppressiveFire), LINKFUNC(moduleSuppressiveFireLocal)] call CBA_fnc_addEventHandler;

// Editable object commands must be ran on server, this events are used in the respective module
if (isServer) then {
    [QGVAR(equipFries), EFUNC(fastroping,equipFRIES)] call CBA_fnc_addEventHandler;

    [QGVAR(addObjects), {
        params ["_objects", ["_curator", objNull]];

        if (!isNull _curator) exitWith {_curator addCuratorEditableObjects [_objects, true]};

        {
            _x addCuratorEditableObjects [_objects, true];
        } forEach allCurators;
    }] call CBA_fnc_addEventHandler;
    [QGVAR(removeObjects), {
        params ["_objects", ["_curator", objNull]];

        if (!isNull _curator) exitWith {_curator removeCuratorEditableObjects [_objects, true]};

        {
            _x removeCuratorEditableObjects [_objects, true];
        } forEach allCurators;
    }] call CBA_fnc_addEventHandler;

    [QGVAR(createZeus), {
        params ["_ownerPlayer"];
        private _owner = ["#adminLogged", getPlayerUID _ownerPlayer] select isMultiplayer;
        private _group = createGroup sideLogic;
        private _zeus = _group createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"];
        missionNamespace setVariable [format [QGVAR(zeus_%1), _owner], _zeus];
        _zeus setVariable ["owner", _owner, true];
        _zeus setVariable ["Addons", 3, true];
        _zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];
        _zeus setCuratorCoef ["Place", 0];
        _zeus setCuratorCoef ["Delete", 0];
        _group deleteGroupWhenEmpty true;
        if (!isMultiplayer && {!isNull findDisplay IDD_DISPLAY3DEN}) then {
            // if loaded from editor (but not after restart), addons are not activated so we do it manually
            private _addons = ('true' configClasses (configFile >> "CfgPatches")) apply {configName _x};
            activateAddons _addons;
            removeAllCuratorAddons _zeus;
            _zeus addCuratorAddons _addons;
        };
        [QGVAR(zeusCreated), _zeus, _ownerPlayer] call CBA_fnc_targetEvent;
    }] call CBA_fnc_addEventHandler;

    addMissionEventHandler ["HandleDisconnect", {
        private _owner = _this select 2;
        private _zeusVarName = format [QGVAR(zeus_%1), _owner];
        private _zeus = missionNamespace getVariable _zeusVarName;
        if (!isNil "_zeus") then {
            if (!isNull _zeus) then {deleteVehicle _zeus};
            missionNamespace setVariable [_zeusVarName, nil];
        };
    }];
};

if (hasInterface) then {
    [QGVAR(zeusCreated), {
        params ["_zeus"];
        GVAR(zeus) = _zeus;
        [localize "str_a3_cfgvehicles_moduletasksetstate_f_arguments_state_values_created_0"] call EFUNC(common,displayTextStructured);
    }] call CBA_fnc_addEventHandler;
};
