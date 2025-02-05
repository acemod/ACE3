class CfgVehicles {
    class Thing_EP1;
    class Land_Bench_EP1: Thing_EP1 {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 90;
        EXGVAR(sitting,sitPosition)[] = {{0, 0.45, -0.7}, {0, -0.45, -0.7}};
        EXGVAR(sitting,interactPosition)[] = {{0, 0.45, 0.3}, {0, -0.45, 0.3}};
        EGVAR(interaction,replaceTerrainObject) = 1;
    };

    class CUP_basin_a;
    class CUP_hospital_bench: CUP_basin_a {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 180;
        EXGVAR(sitting,sitPosition)[] = {{0.35, 0, 0}, {-0.35, 0, 0}};
        EXGVAR(sitting,interactPosition)[] = {{0.35, 0, 0.45}, {-0.35, 0, 0.45}};
        EGVAR(interaction,replaceTerrainObject) = 1;
    };
    class CUP_ch_mod_h: CUP_basin_a {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 180;
        EXGVAR(sitting,sitPosition)[] = {0, 0, 0};
        EXGVAR(sitting,interactPosition)[] = {0, 0, 0.4};
        EGVAR(interaction,replaceTerrainObject) = 1;
    };
    class CUP_kitchen_chair_a: CUP_basin_a {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 180;
        EXGVAR(sitting,sitPosition)[] = {0, 0, 0};
        EXGVAR(sitting,interactPosition)[] = {0, 0, 0.45};
        EGVAR(interaction,replaceTerrainObject) = 1;
    };
    class CUP_lobby_chair: CUP_basin_a {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 180;
        EXGVAR(sitting,sitPosition)[] = {0, 0, 0};
        EXGVAR(sitting,interactPosition)[] = {0, 0, 0.45};
        EGVAR(interaction,replaceTerrainObject) = 1;
    };
    class CUP_office_chair: CUP_basin_a {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 180;
        EXGVAR(sitting,sitPosition)[] = {0, 0, -0.4};
        EXGVAR(sitting,interactPosition)[] = {0, 0, 0};
        EGVAR(interaction,replaceTerrainObject) = 1;
    };
    class CUP_ch_office_B: CUP_basin_a {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 180;
        EXGVAR(sitting,sitPosition)[] = {0, 0, 0};
        EXGVAR(sitting,interactPosition)[] = {0, 0, 0.45};
        EGVAR(interaction,replaceTerrainObject) = 1;
    };

    class Thing;
    class Land_Barrel_water: Thing {
        EXGVAR(field_rations,waterSupply) = 160;
        EXGVAR(field_rations,offset)[] = {0, 0, 0.25};
    };
    class FoldChair: Thing {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 180;
        EXGVAR(sitting,sitPosition)[] = {0, -0.1, -0.45};
        EXGVAR(sitting,interactPosition)[] = {0, 0, 0.3};

        EGVAR(interaction,replaceTerrainObject) = 1;
        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 180;
    };
    class WoodChair: FoldChair {
        EXGVAR(sitting,sitPosition)[] = {0, 0, 0};
        EXGVAR(sitting,interactPosition)[] = {0, 0, 0.45};
    };
    class Park_bench1: WoodChair {
        EXGVAR(sitting,sitPosition)[] = {{0.45, 0, -0.3}, {-0.45, 0, -0.3}};
        EXGVAR(sitting,interactPosition)[] = {{0.45, 0, 0.2}, {-0.45, 0, 0.2}};
    };

    class Base_CUP_Furniture;
    class CUP_armchair: Base_CUP_Furniture {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 180;
        EXGVAR(sitting,sitPosition)[] = {0, 0, 0};
        EXGVAR(sitting,interactPosition)[] = {0, 0, 0.45};
        EGVAR(interaction,replaceTerrainObject) = 1;
    };

    class Small_Items_EP1;
    class Land_Chair_EP1: Small_Items_EP1 {
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 90;
        EXGVAR(sitting,sitPosition)[] = {0, 0, -0.5};
        EXGVAR(sitting,interactPosition)[] = {0, 0, 0.3};

        EGVAR(interaction,replaceTerrainObject) = 1;
        EGVAR(dragging,canCarry) = 1;
        EGVAR(dragging,carryPosition)[] = {0, 0.75, 0.5};
        EGVAR(dragging,carryDirection) = 270;
    };

    class House;
    class Land_pumpa: House {
        EXGVAR(field_rations,waterSupply) = -10;
        EXGVAR(field_rations,offset)[] = {0.3, 0, 0.68};
    };

    class House_EP1;
    class Land_stand_waterl_EP1: House_EP1 {
        EXGVAR(field_rations,waterSupply) = 250;
        EXGVAR(field_rations,offset)[] = {0, -0.33, 0.4};

        EGVAR(interaction,replaceTerrainObject) = 1;
        EXGVAR(sitting,canSit) = 1;
        EXGVAR(sitting,sitDirection) = 180;
        EXGVAR(sitting,sitPosition)[] = {{-0.4, -0.8, -0.9}, {0.4, -0.8, -0.9}};
        EXGVAR(sitting,interactPosition)[] = {{-0.4, -0.75, 0.3}, {0.4, -0.75, 0.3}};
    };
};
