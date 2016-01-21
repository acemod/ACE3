// by esteldunedain
#include "script_component.hpp"

if (!isServer) exitWith {};

["createTag", DFUNC(createTag)] call EFUNC(common,addEventHandler);
