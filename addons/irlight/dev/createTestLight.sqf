#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Creates a scripted test light to test weapon lights without reloading.
 *
 * Arguments:
 * 0: Flashlight class name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * "ACE_SPIR" call compile preprocessFileLineNumbers "\z\ace\addons\irlight\dev\createTestLight.sqf"
 *
 * Public: No
 */

params ["_className"];

private _cfg = configFile >> "CfgWeapons" >> _className >> "ItemInfo" >> "Flashlight";

deleteVehicle lgt;
lgt = "#lightreflector" createVehicleLocal [0, 0, 0];
lgt attachTo [player, [0.0396804,0.237947,0.104276], "proxy:\a3\characters_f\proxies\weapon.001", true];
lgt setLightIntensity getNumber (_cfg >> "intensity");
lgt setLightColor (getArray (_cfg >> "color") select [0, 3]);
lgt setLightAmbient (getArray (_cfg >> "ambient") select [0, 3]);
lgt setLightConePars [
    getNumber (_cfg >> "outerAngle"),
    getNumber (_cfg >> "innerAngle"),
    getNumber (_cfg >> "coneFadeCoef")
];

attenuation = [
    getNumber (_cfg >> "Attenuation" >> "start"),
    getNumber (_cfg >> "Attenuation" >> "constant"),
    getNumber (_cfg >> "Attenuation" >> "linear"),
    getNumber (_cfg >> "Attenuation" >> "quadratic"),
    getNumber (_cfg >> "Attenuation" >> "hardLimitStart"),
    getNumber (_cfg >> "Attenuation" >> "hardLimitEnd")
];
lgt setLightAttenuation attenuation;
