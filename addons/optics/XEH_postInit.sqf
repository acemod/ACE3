// by commy2
#include "script_component.hpp"

if (!hasInterface) exitWith {};

0 = 0 spawn {
    waituntil {!isNull ACE_player};

    // PiP technique by BadBenson
    GVAR(camera) = "camera" camCreate positioncameratoworld [0,0,0];
    GVAR(camera) camSetFov 0.7;
    GVAR(camera) camSetTarget ACE_player;
    GVAR(camera) camCommit 1;

    "ace_optics_rendertarget0" setPiPEffect [2, 1.0, 1.0, 1.0, 0.0, [0.0, 1.0, 0.0, 0.25], [1.0, 0.0, 1.0, 1.0], [0.199, 0.587, 0.114, 0.0]];
    GVAR(camera) cameraEffect ["INTERNAL", "BACK", "ace_optics_rendertarget0"];
};

// save control for fired EH
["infoDisplayChanged", {
    if (!isNull ((_this select 0) displayCtrl 1713001)) then {
        uiNamespace setVariable [QGVAR(RscWeaponInfo2D), _this select 0];
    };
}] call EFUNC(common,addEventHandler);

// camera has to be re-created every time another camera is created. Otherwise r2t is either black or transparent. @todo Add popular custom cameras to the event in ACE_common.
["activeCameraChanged", {
    if !(_this select 1) then {
        deleteVehicle GVAR(camera);

        // PiP technique by BadBenson
        GVAR(camera) = "camera" camCreate positioncameratoworld [0,0,0];
        GVAR(camera) camSetFov 0.7;
        GVAR(camera) camSetTarget ACE_player;
        GVAR(camera) camCommit 1;

        "ace_optics_rendertarget0" setPiPEffect [2, 1.0, 1.0, 1.0, 0.0, [0.0, 1.0, 0.0, 0.25], [1.0, 0.0, 1.0, 1.0], [0.199, 0.587, 0.114, 0.0]];
        GVAR(camera) cameraEffect ["INTERNAL", "BACK", "ace_optics_rendertarget0"];
    };
}] call EFUNC(common,addEventHandler);

DFUNC(updateOptics) = {
    if ((isNull ACE_player) || {!alive ACE_player} || {GVAR(prefferedOpticType) == 0}) exitWith {};

    _currentScope = (primaryWeaponItems ACE_player) select 2;
    if (_currentScope == "") exitWith {};

    _configs = configProperties [configFile >> "CfgWeapons" >> _currentScope, QUOTE(configName _x == QUOTE(QGVAR(switchableTo))), false];
    if ((count _configs) != 1) exitWith {};
    _switchableToArray = getArray (_configs select 0);

    if ((GVAR(prefferedOpticType) - 1) > (count _switchableToArray)) exitWith {};
    _preferedScope = _switchableToArray select (GVAR(prefferedOpticType) - 1);

    if ((_currentScope == _preferedScope) || {_preferedScope == ""}) exitWith {};

    ACE_player removePrimaryWeaponItem _currentScope;
    ACE_player addPrimaryWeaponItem _preferedScope;
};

["playerInventoryChanged", DFUNC(updateOptics)] call EFUNC(common,addEventHandler);
["SettingChanged", {if ((_this select 0) == QGVAR(prefferedOpticType)) then {[] call FUNC(updateOptics)};}] call EFUNC(common,addEventhandler);
