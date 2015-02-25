#define COMPONENT sys_cargo_box
#define MAINCOMPONENT sys_cargo
#define SUBCOMPONENT box
#define ADDONS sys_cargo_box

#ifdef MAINCOMPONENT
	#ifdef SUBCOMPONENT
		#define PATHTO_SYS(var1,var2,var3) \MAINPREFIX\##var1\SUBPREFIX\MAINCOMPONENT\SUBCOMPONENT\##var3.sqf
		#define PATHTOF_SYS(var1,var2,var3) \MAINPREFIX\##var1\SUBPREFIX\MAINCOMPONENT\SUBCOMPONENT\##var3
		#define PATHTOF2_SYS(var1,var2,var3) MAINPREFIX\##var1\SUBPREFIX\MAINCOMPONENT\SUBCOMPONENT\##var3
	#endif
#endif 
#include "\z\ace\addons\main\script_mod.hpp"
#include "\z\ace\addons\main\script_macros.hpp"
