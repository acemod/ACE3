class CfgVehicles {
    class Man;

    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(UnJam) {
                    displayName = CSTRING(UnjamWeapon);
                    condition = QUOTE( GVAR(enabled) && {[_player] call FUNC(canUnjam)} );
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    statement = QUOTE( [ARR_2(_player, currentMuzzle _player)] call FUNC(clearJam); );
                    showDisabled = 0;
                    icon = QPATHTOEF(common,UI\repack_ca.paa);
                };
                class GVAR(SwapBarrel) {
                    displayName = CSTRING(SwapBarrel);
                    condition = QUOTE( [ARR_2(_player, currentWeapon _player)] call FUNC(canSwapBarrel) );
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    statement = QUOTE( [ARR_3(_player, _player, currentWeapon _player)] call FUNC(swapBarrel); );
                    showDisabled = 0;
                    icon = QPATHTOF(UI\spare_barrel_ca.paa);
                };
                class GVAR(CheckTemperature) {
                    displayName = CSTRING(CheckTemperatureShort);
                    condition = QUOTE( GVAR(enabled) && {switch (currentWeapon _player) do {case (''): {false}; case (primaryWeapon _player); case (handgunWeapon _player): {true}; default {false}}} );
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    statement = QUOTE( [ARR_3(_player, _player, currentWeapon _player)] call FUNC(checkTemperature); );
                    showDisabled = 0;
                    icon = QPATHTOF(UI\temp_ca.paa);
                };
                class GVAR(CheckTemperatureSpareBarrels) {
                    displayName = CSTRING(CheckTemperatureSpareBarrelsShort);
                    condition = QUOTE((_player) call FUNC(canCheckSpareBarrelsTemperatures) );
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    statement = QUOTE( [_player] call FUNC(checkSpareBarrelsTemperatures); );
                    showDisabled = 0;
                    icon = QUOTE(PATHTOF(UI\temp_ca.paa));
                };
                class GVAR(CoolWeaponWithItem) {
                    displayName = CSTRING(CoolWeaponWithItem);
                    condition = QUOTE(GVAR(enabled) && {isClass(configfile >> 'CfgPatches' >> 'acex_field_rations')});
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    statement = "true";
                    showDisabled = 0;
                    insertChildren = QUOTE(_player call FUNC(getConsumableChildren));
                    icon = QPATHTOF(UI\pour_water_ca.paa);
                };
            };
        };

        class ACE_Actions {
            class ACE_Weapon {
                class GVAR(SwapBarrel) {
                    displayName = CSTRING(SwapBarrel);
                    condition = QUOTE( [ARR_2(_player, currentWeapon _target)] call FUNC(canSwapBarrel) );
                    statement = QUOTE([ARR_3(_player, _target, currentWeapon _target)] call FUNC(swapBarrelAssistant););
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    icon = QUOTE(PATHTOF(UI\spare_barrel_ca.paa));
                };
                class GVAR(CheckTemperature) {
                    displayName = CSTRING(CheckTemperatureShort);
                    condition = QUOTE( GVAR(enabled) && {switch (currentWeapon _target) do {case ('ACE_FakePrimaryWeapon'); case (''): {false}; case (primaryWeapon _target); case (handgunWeapon _target): {true}; default {false}}} );
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    statement = QUOTE( [ARR_3(_player, _target, currentWeapon _target)] call FUNC(checkTemperature); );
                    icon = QUOTE(PATHTOF(UI\temp_ca.paa));
                };
                class GVAR(CoolWeaponWithItem) {
                    displayName = CSTRING(CoolWeaponWithItem);
                    condition = QUOTE(GVAR(enabled) && {isClass(configfile >> 'CfgPatches' >> 'acex_field_rations')});
                    exceptions[] = {"isNotInside", "isNotSwimming", "isNotSitting"};
                    statement = "true";
                    showDisabled = 0;
                    insertChildren = QUOTE(_player call FUNC(getConsumableChildren));
                    icon = QPATHTOF(UI\pour_water_ca.paa);
                };
            };
        };
    };

    class ReammoBox_F;
    class NATO_Box_Base;
    class EAST_Box_Base;
    class IND_Box_Base;
    class FIA_Box_Base_F;

    class Box_NATO_Support_F: NATO_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,2);
        };
    };

    class B_supplyCrate_F: ReammoBox_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,2);
        };
    };

    class Box_East_Support_F: EAST_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,2);
        };
    };

    class O_supplyCrate_F: B_supplyCrate_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,2);
        };
    };

    class Box_IND_Support_F: IND_Box_Base {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,2);
        };
    };

    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,2);
        };
    };

    class I_supplyCrate_F: B_supplyCrate_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,2);
        };
    };

    class IG_supplyCrate_F: ReammoBox_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,2);
        };
    };

    class C_supplyCrate_F: ReammoBox_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,2);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_SpareBarrel,6);
        };
    };
};
