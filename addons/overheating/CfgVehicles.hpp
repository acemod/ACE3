class CfgVehicles {
    class Man;

    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ACE_UnJam {
                    displayName = CSTRING(UnjamWeapon);
                    condition = QUOTE( [_player] call FUNC(canUnjam) );
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE( [ARR_2(_player, currentMuzzle _player)] call FUNC(clearJam); );
                    showDisabled = 0;
                    priority = 4;
                    icon = QUOTE(PATHTOF(UI\unjam_ca.paa));
                };
                class ACE_SwapBarrel {
                    displayName = CSTRING(SwapBarrel);
                    condition = QUOTE( 'ACE_SpareBarrel' in items _player && {getNumber (configFile >> 'CfgWeapons' >> currentWeapon _player >> 'ACE_Overheating_allowSwapBarrel') == 1} );
                    statement = QUOTE( [ARR_2(_player, currentWeapon _player)] call FUNC(swapBarrel); );
                    showDisabled = 0;
                    priority = 3;
                    icon = QUOTE(PATHTOF(UI\spare_barrel_ca.paa));
                };
                class ACE_CheckTemperature {
                    displayName = CSTRING(CheckTemperatureShort);
                    condition = "switch (currentWeapon _player) do {case (''): {false}; case (primaryWeapon _player); case (secondaryWeapon _player); case (handgunWeapon _player): {true}; default {false}}";
                    exceptions[] = {"isNotInside", "isNotSitting"};
                    statement = QUOTE( [ARR_2(_player, currentWeapon _player)] call FUNC(CheckTemperature); );
                    showDisabled = 0;
                    priority = 2.9;
                    icon = QUOTE(PATHTOF(UI\temp_ca.paa));
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
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,2);
        };
    };

    class B_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,2);
        };
    };

    class Box_East_Support_F: EAST_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,2);
        };
    };

    class O_supplyCrate_F: B_supplyCrate_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,2);
        };
    };

    class Box_IND_Support_F: IND_Box_Base {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,2);
        };
    };

    class Box_FIA_Support_F: FIA_Box_Base_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,2);
        };
    };

    class I_supplyCrate_F: B_supplyCrate_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,2);
        };
    };

    class IG_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,2);
        };
    };

    class C_supplyCrate_F: ReammoBox_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,2);
        };
    };

    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            MACRO_ADDITEM(ACE_SpareBarrel,6);
        };
    };
};
