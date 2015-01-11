#include "\x\cba\addons\main\script_macros_common.hpp"

// Default versioning level
#define DEFAULT_VERSIONING_LEVEL 2

// RGB Colors
#define RGB_GREEN 0, 0.5, 0, 1
#define RGB_BLUE 0, 0, 1, 1
#define RGB_ORANGE 0.5, 0.5, 0, 1
#define RGB_RED 1, 0, 0, 1
#define RGB_YELLOW 1, 1, 0, 1
#define RGB_WHITE 1, 1, 1, 1
#define RGB_GRAY 0.5, 0.5, 0.5, 1
#define RGB_BLACK 0, 0, 0, 1
#define RGB_MAROON 0.5, 0, 0, 1
#define RGB_OLIVE 0.5, 0.5, 0, 1
#define RGB_NAVY 0, 0, 0.5, 1
#define RGB_PURPLE 0.5, 0, 0.5, 1
#define RGB_FUCHSIA 1, 0, 1, 1
#define RGB_AQUA 0, 1, 1, 1
#define RGB_TEAL 0, 0.5, 0.5, 1
#define RGB_LIME 0, 1, 0, 1
#define RGB_SILVER 0.75, 0.75, 0.75, 1

#include "script_macros_menudef.hpp"

#define ACE_NOARMORY class Armory { disabled = 1; }
#define ACE_ARMORY class Armory { disabled = 0; }
#define ACE_ACEARMORY class Armory { disabled = 0; author = "A.C.E."; }


// Weapon defaults
// NOTE !!!! - Do not forget to dummy-update the configs that use these defines, or the changes won't activate due to binarization!
#define ACE_DEFAULT_WEAPONS "Throw", "Put"

// Item defaults
// NOTE !!!! - Do not forget to dummy-update the configs that use these defines, or the changes won't activate due to binarization!
#define ACE_ITEMS_TEAMLEADER_B "ItemMap","ItemCompass","ItemWatch","ItemRadio"
#define ACE_ITEMS_SQUADLEADER_B "ItemMap","ItemCompass","ItemWatch","ItemRadio","ACE_DAGR"
#define ACE_ITEMS_SPECIAL "ItemMap","ItemCompass","ItemWatch","ItemRadio"
#define ACE_ITEMS "ItemWatch","ItemRadio"
#define ACE_ITEMS_CIVILIAN "ItemWatch"


#define ACE_DEFAULT_SLOTS "1	 + 	4	 + 12*		256	 + 2*	4096	 + 	2	 + 8*	16  + 12*131072"

#define ACE_NOGRIP handAnim[] = {}
#define ACE_DISTANCE_DEFAULT distanceZoomMin = 300; distanceZoomMax = 300

#include "script_macros_optics.hpp"

#define ACE_NOZEROING discreteDistance[] = {}; \
			discreteDistanceInitIndex = 0; \
			weaponInfoType = "RscWeaponEmpty"
			
#define ACE_NOTURRETZEROING discreteDistance[] = {}; \
			discreteDistanceInitIndex = 0; \
			turretInfoType = "RscWeaponEmpty"

#define ACE_LASER irLaserPos = "laser pos"; \
					irLaserEnd = "laser dir"; \
					irDistance = 300

#define ACE_LASER_DISTANCE_VANILLA irDistance = 300
					
#define ACE_NOLASER	irLaserPos = "laser pos"; \
					irLaserEnd = "laser dir"; \
					irDistance = 0

#define ACE_SUPPRESSED ace_suppressed = 1; \
			fireLightDuration = 0; \
			fireLightIntensity = 0

// TODO: Cleanup in all the configs around
#define ACE_M_MAG(x,y)	class _xx_##x {magazine = ##x; count = ##y;}
#define ACE_M_WEP(x,y)	class _xx_##x {weapon = ##x; count = ##y;}
#define ACE_M_ITEM(x,y) class _xx_##x {name = ##x; count = ##y;}
#define ACE_M_BAG(x,y) class _xx_##x {backpack = ##x; count = ##y;}


// Vehicle defines
// ACE_canBeLoad = This vehicle acts as transporter, i.e you can load stuff into it
// ACE_canBeCargo = This vehicle acts as cargo, i.e you can load this item into other vehicles
#define ACE_CARGO_FRONT 	ACE_canBeLoad = false; ACE_canBeCargo = true; ACE_canGear = false; ACE_canLoadFront = true
#define ACE_CARGO_ONLY 		ACE_canBeLoad = false; ACE_canBeCargo = true; ACE_canGear = false; ACE_canLoadFront = false
#define ACE_LOAD_ONLY 		ACE_canBeLoad = true; ACE_canBeCargo = false; ACE_canGear = false; ACE_canLoadFront = false
#define ACE_GEAR_ONLY		ACE_canBeLoad = true; ACE_canBeCargo = false; ACE_canGear = true; ACE_canLoadFront = false
#define ACE_NOCARGOLOAD		ACE_canBeLoad = false; ACE_canBeCargo = false; ACE_canGear = false; ACE_canLoadFront = false

// Increased FOV for tank driver
// Increased Default US Tank driver optic
#define ACE_DRIVEROPTIC_TANK_US driverOpticsModel = "\z\ace\addons\m_veh_optics\driver\optika_tank_driver_west.p3d"
// Increased Default RU Tank driver optic
#define ACE_DRIVEROPTIC_TANK_RU driverOpticsModel = "\z\ace\addons\m_veh_optics\driver\optika_tank_driver_east.p3d"
// Increased Default NON Specified driver optic
#define ACE_DRIVEROPTIC_TANK driverOpticsModel = "\z\ace\addons\m_veh_optics\driver\optika_tank_driver.p3d"
// Increased Default EP1 NON Specified driver optic
// Default black border thing needs finish
#define ACE_DRIVEROPTIC_TANK_EP1 driverOpticsModel = "\z\ace\addons\m_veh_optics\driver\optika_tank_driver.p3d"

#define ACE_BWC ace_bwc = 1

#define ACE_wind	([] call ace_sys_ballistic_fnc_wind)


// SCRIPTING MACROS

// Items
#define inITEMS(x,y) (##x in (y call ACE_fnc_getGear))
#define remITEMS(x,y) ([##x,y] call ACE_fnc_removeItem)
//#define addITEMS(x,y) (y addItem ##x)

// Interaction/ Put anims
#define canANIM(x) (x call ACE_fnc_CanPutDown)
#define playANIM(x) (if (x call ACE_fnc_CanPutDown) then { x call ACE_fnc_PutDown })

// In vehicle or on foot
#define ONFOOT(x) (x == vehicle x)
#define INVEHICLE(x) (x != vehicle x)

// FX
#define COUGH ace_common_fx_fnc_cough
#define BLURRY ace_common_fx_fnc_blurry
#define BLIND ace_common_fx_fnc_blind_view
#define DEAF ace_common_fx_fnc_deaf
#define DIZZY ace_common_fx_fnc_dizzy
#define FLASH ace_common_fx_fnc_flash
#define KICK ace_common_fx_fnc_kick
#define KNOCKOUT ace_common_fx_fnc_knockout
#define RING ace_common_fx_fnc_ring

// Stamina 
#define INC_MASS ace_sys_stamina_fnc_inc_mass

// Does this work, due to BWC_CONFIG(NAME) ?
#undef BWC_CONFIG

#define BWC_CONFIG(NAME) class NAME { \
		units[] = {}; \
		weapons[] = {}; \
		requiredVersion = REQUIRED_VERSION; \
		requiredAddons[] = {}; \
		version = VERSION; \
		ACE_BWC; \
}

#define ACE_FLASHLIGHT class FlashLight { \
			color[] = {0.9, 0.9, 0.7, 0.9}; \
			ambient[] = {0.1, 0.1, 0.1, 1.0}; \
			position = "flash dir"; \
			direction = "flash"; \
			angle = 30; \
			scale[] = {1, 1, 0.5}; \
			brightness = 0.1; \
		}
#define ACE_SMALL_FLASHLIGHT class FlashLight { \
			color[] = {0.9, 0.9, 0.7, 0.9}; \
			ambient[] = {0.1, 0.1, 0.1, 1.0}; \
			position = "flash dir"; \
			direction = "flash"; \
			angle = 20; \
			scale[] = {0.9, 0.9, 0.4}; \
			brightness = 0.09; \
		}

// Addaction defines for colored text
#define ACE_TEXT_ORANGE(Text) ("<t color='#ffa500'>" + ##Text + "</t>")		
#define ACE_TEXT_RED(Text) ("<t color='#FF0000'>" + ##Text + "</t>")
#define ACE_TEXT_GREEN(Text) ("<t color='#00FF00'>" + ##Text + "</t>")
#define ACE_TEXT_YELLOW(Text) ("<t color='#FFFF00'>" + ##Text + "</t>")