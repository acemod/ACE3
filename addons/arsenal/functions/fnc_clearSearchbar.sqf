#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control", "_rightButton"];

if (_rightButton != 1) exitWith  {};

_control ctrlSetText '';