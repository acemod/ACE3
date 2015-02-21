#include "script_component.hpp"

PARAMS_1(_unit);

visibleMap &&
{alive _unit} &&
{"ItemMap" in (assignedItems _unit)} &&
{isNull (_unit getVariable [QGVAR(sharingMapHost), objNull])};
