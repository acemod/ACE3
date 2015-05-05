#include "script_component.hpp"

format ["<t size='0.8'><img image='%1'/><br/> %2.<br/>%3</t></t>",
<<<<<<< HEAD
     [(rank (_this select 0)),"texture"] call bis_fnc_rankparams,
     [(rank (_this select 0)),"displaynameshort"] call bis_fnc_rankparams,
     (name (_this select 0))
=======
	[(rank (_this select 0)),"texture"] call bis_fnc_rankparams,
	[(rank (_this select 0)),"displaynameshort"] call bis_fnc_rankparams,
	(name (_this select 0))
>>>>>>> 09864348873fcbe50d303996b215ae417211ca79
];