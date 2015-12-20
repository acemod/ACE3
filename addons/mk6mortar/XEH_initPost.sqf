#include "script_component.hpp"

params ["_mortar"];
TRACE_1("",_mortar);

if (gunner _mortar != player) exitWith {LOG("Exit")};

if (!EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [{
        if (GVAR(useAmmoHandling)) then {
            _this call FUNC(mortarInit);
        };
    }, _this];
};

_this call FUNC(mortarInit);
