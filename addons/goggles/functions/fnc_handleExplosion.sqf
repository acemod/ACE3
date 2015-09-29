#include "script_component.hpp"
    private "_effects";
    if (alive ace_player) then {
        call FUNC(applyDirtEffect);
        if (GETBROKEN) exitWith {};
        if (((_this select 1) call FUNC(GetExplosionIndex)) < getNumber(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_Resistance")) exitWith {};
        if !([ace_player] call FUNC(isGogglesVisible)) exitWith {["GlassesCracked",[ace_player]] call EFUNC(common,localEvent);};
        _effects = GETGLASSES(ace_player);
        _effects set [BROKEN, true];
        SETGLASSES(ace_player,_effects);
        if (getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_OverlayCracked") != "" && {cameraOn == ace_player}) then {
            if (call FUNC(ExternalCamera)) exitWith {};
            if (isNull(GLASSDISPLAY)) then {
                150 cutRsc["RscACE_Goggles", "PLAIN",1, false];
            };
            (GLASSDISPLAY displayCtrl 10650) ctrlSetText getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_OverlayCracked");
        };
        ["GlassesCracked",[ace_player]] call EFUNC(common,localEvent);
    };