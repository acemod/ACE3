// by CAA-Picard
#include "\z\ace\addons\common\script_component.hpp"

if (isServer) then {
  diag_log _this;
} else {
  [_this, QUOTE(FUNC(serverLog)), 1] call FUNC(execRemoteFnc);
};
