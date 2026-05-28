class CfgVehicles {
    // https://truck-encyclopedia.com/ww2/uk/bedford-mw.php
    class SPE_Truck_base;
    class SPEX_Bedford_MWD_base: SPE_Truck_base {
        EGVAR(refuel,fuelCapacity) = 91;
    };
    class SPEX_Bedford_MWD_ammo_base: SPEX_Bedford_MWD_base {
        EGVAR(rearm,defaultSupply) = 600; // Half of SPE_OpelBlitz_Ammo, estimating by size
    };
    class SPEX_Bedford_MWD_fuel_base: SPEX_Bedford_MWD_base {
        EGVAR(refuel,fuelCargo) = 910; // Used water carrier capacity
    };
    class SPEX_Bedford_MWD_repair_base: SPEX_Bedford_MWD_base {
        EGVAR(repair,canRepair) = 1;
    };

    // https://www.military-references.com/wp-content/uploads/books/apc/britain/humber-scout-car/Armored_Car_Humber_IV_Service_Instruction_Book_1943.pdf
    class SPE_ArmoredCar_base;
    class SPEX_Humber_LRC_base: SPE_ArmoredCar_base {
        EGVAR(refuel,fuelCapacity) = 136;
    };
    class SPEX_Humber_MkII_base: SPE_ArmoredCar_base {
        EGVAR(refuel,fuelCapacity) = 136;
    };
    class SPEX_Humber_MkIV_base: SPE_ArmoredCar_base {
        EGVAR(refuel,fuelCapacity) = 136;
    };

    // http://www.wwiiequipment.com/index.php?option=com_content&id=57:cromwell-cruiser-tank-a27m
    class SPE_Tank_base;
    class SPEX_Cromwell_Base: SPE_Tank_base {
        EGVAR(refuel,fuelCapacity) = 527;
    };

    // Backpacks
    class B_SPE_AssaultPack_Base;
    class B_SPEX_CW_Sack_P37_N103_gas_assault_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N103_gas_assault_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N103_DDay_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N103_DDay_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N103_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N103_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N103_Rope_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N103_Rope_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N61_gas_assault_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N61_gas_assault_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N61_DDay_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N61_DDay_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N61_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N61_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N61_Rope_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N61_Rope_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N97_gas_assault_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N97_gas_assault_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N97_DDay_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N97_DDay_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N97_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N97_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };

    class B_SPEX_CW_Sack_P37_N97_Rope_shovel: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
    class B_SPEX_CW_Sack_P37_N97_Rope_shovel_roll: B_SPE_AssaultPack_Base {
        EGVAR(trenches,entrenchingTool) = 1;
    };
};
