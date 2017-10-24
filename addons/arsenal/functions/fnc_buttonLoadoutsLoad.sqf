#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control"];

systemChat str [_display, _control];

if !(ctrlEnabled _control) exitWith {};

