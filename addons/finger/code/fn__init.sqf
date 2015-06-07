#include "addon.hpp"
#include "main.hpp"

[] spawn
{
	[] call CFUNC(_comm);
};


if (hasInterface) then
{
	[] spawn 
	{
		[] call CFUNC(_mainLoop);
	};
};


