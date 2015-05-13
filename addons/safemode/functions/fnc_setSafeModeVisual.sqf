// by commy2
#include "script_component.hpp"

EXPLODE_1_PVT(_this,_show);

disableSerialization;

private ["_control"];
_control = (uiNamespace getVariable ["ACE_dlgSoldier", displayNull]) displayCtrl 187;

if (isNull _control) exitWith {};

if (_show) then {
    private "_config";
    _config = configFile >> "RscInGameUI" >> "RscUnitInfoSoldier" >> "WeaponInfoControlsGroupLeft" >> "controls" >> "CA_ModeTexture";
    _control ctrlSetPosition [getNumber (_config >> "x"), getNumber (_config >> "y"), getNumber (_config >> "w"), getNumber (_config >> "h")];
    _control ctrlCommit 0;
} else {
    _control ctrlSetPosition [0, 0, 0, 0];
    _control ctrlCommit 0;
};
