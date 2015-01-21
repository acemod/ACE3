#include "script_component.hpp"

[] spawn {
	sleep 1;
	[] call FUNC(addFromConfig);

};