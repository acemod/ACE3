
#include "script_component.hpp"

PARAMS_2(_caller,_target);

(_target getVariable ["ACE_isUnconscious", false]) ||
{_target getVariable [QEGVAR(captives,isHandcuffed), false]} ||
{_target getVariable [QEGVAR(captives,isSurrendering), false]}
