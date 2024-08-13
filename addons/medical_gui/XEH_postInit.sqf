#include "script_component.hpp"

if (!hasInterface) exitWith {};

#include "initKeybinds.inc.sqf"

GVAR(target) = objNull;
GVAR(previousTarget) = objNull;
GVAR(selectedBodyPart) = 0;
GVAR(selectedCategory) = "triage";

GVAR(lastOpenedOn) = -1;
GVAR(pendingReopen) = false;

GVAR(menuPFH) = -1;

GVAR(peekLastOpenedOn) = -1;
GVAR(peekOnHitLastOpenedOn) = -1;

GVAR(selfInteractionActions) = [];
[] call FUNC(addTreatmentActions);
[] call FUNC(collectActions);

[QEGVAR(interact_menu,newControllableObject), {
    params ["_type"]; // string of the object's classname
    if !(_type isKindOf "CAManBase") exitWith {};
    {
        _x set [0, _type];
        _x call EFUNC(interact_menu,addActionToClass);
    } forEach GVAR(selfInteractionActions);
}] call CBA_fnc_addEventHandler;

["ace_treatmentSucceded", {
    if (GVAR(openAfterTreatment) && {GVAR(pendingReopen)}) then {
        GVAR(pendingReopen) = false;
        [FUNC(openMenu), GVAR(target)] call CBA_fnc_execNextFrame;
    };
}] call CBA_fnc_addEventHandler;

// Close patient information display when interaction menu is closed
["ace_interactMenuClosed", {
    QGVAR(RscPatientInfo) cutFadeOut 0.3;
}] call CBA_fnc_addEventHandler;

[QEGVAR(medical,woundReceived), {
    params ["_unit", "_allDamages", ""];
    if !(GVAR(peekMedicalOnHit) && {_unit == ACE_player}) exitWith {};

    private _bodypart = toLowerANSI (_allDamages select 0 select 1);
    private _bodypartIndex = ALL_BODY_PARTS find _bodypart;

    [ACE_player, _bodypartIndex] call FUNC(displayPatientInformation);

    if (CBA_missionTime - GVAR(peekOnHitLastOpenedOn) > GVAR(peekMedicalOnHitDuration)) then {
        [{
            CBA_missionTime - GVAR(peekOnHitLastOpenedOn) > GVAR(peekMedicalOnHitDuration)
        }, {QGVAR(RscPatientInfo) cutFadeOut 0.3}] call CBA_fnc_waitUntilAndExecute;
    };
    GVAR(peekOnHitLastOpenedOn) = CBA_missionTime;
}] call CBA_fnc_addEventHandler;
