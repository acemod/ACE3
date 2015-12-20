#include "script_component.hpp"

params ["_mortar","_crewPosition","_unit","_turretPath"];
TRACE_4("",_mortar,_crewPosition,_unit,_turretPath);

if (_unit != player) exitWith {LOG("Exit")};

if (!EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [{
        if (GVAR(useAmmoHandling)) then {
            _this call FUNC(mortarInit);
        };
    }, _mortar];
};

_mortar call FUNC(mortarInit);
