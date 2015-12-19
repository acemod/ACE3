#include "script_component.hpp"

if (!EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [{
        if (GVAR(useAmmoHandling)) then {
            _this call FUNC(mortarInit);
        };
    }, _this];
};
_this call FUNC(mortarInit);
