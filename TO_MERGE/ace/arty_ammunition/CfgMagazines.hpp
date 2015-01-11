class CfgMagazines {
	class CA_Magazine;
	class VehicleMagazine;
	class ace_arty_howitzer_default : CA_Magazine {
		nameSound = "heat";
		ammo = "ace_arty_howitzer_base";
		initSpeed = 0;
		scope = 2;
		count = 1;
	};
	class ace_arty_howitzer_mag : VehicleMagazine {
		nameSound = "heat";
		scope = 2;
		count = 1;
	};
	#include "60mm\CfgMagazines.hpp"
	#include "81mm\CfgMagazines.hpp"
	#include "82mm\CfgMagazines.hpp"
	#include "105mm\CfgMagazines.hpp"
	#include "120mm\CfgMagazines.hpp"
};
