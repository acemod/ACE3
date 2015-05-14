
class ItemCore;
class VestItem;

class Vest_Camo_Base: ItemCore {
    class ItemInfo: VestItem {
        /*containerClass = "Supply0";
        mass = 0;
        armor = 0;
        passThrough = 1;*/
    };
};
class Vest_NoCamo_Base: ItemCore {
    class ItemInfo: VestItem {
        /*containerClass = "Supply0";
        mass = 0;
        armor = 0;
        passThrough = 1;*/
    };
};

// belts
class V_Rangemaster_belt: Vest_NoCamo_Base {
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply40";
        mass = 10;
        armor = 0;
        passThrough = 1;*/
    };
};

// bandolliers
class V_BandollierB_khk: Vest_Camo_Base {
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply80";
        mass = 15;
        armor = 0;*/
        passThrough = 0.85; //1;
    };
};
/*class V_BandollierB_cbr: V_BandollierB_khk {
    class ItemInfo: ItemInfo {};
};
class V_BandollierB_rgr: V_BandollierB_khk {
    class ItemInfo: ItemInfo {};
};
class V_BandollierB_blk: V_BandollierB_khk {
    class ItemInfo: ItemInfo {};
};
class V_BandollierB_oli: V_BandollierB_khk {
    class ItemInfo: ItemInfo {};
};*/

// plate carriers
class V_PlateCarrier1_rgr: Vest_NoCamo_Base {   // lite
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply140";
        mass = 80;*/
        armor = 8; //20;
        passThrough = 0.75; //0.5;
    };
};
class V_PlateCarrier2_rgr: V_PlateCarrier1_rgr {  // heavy
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply140";
        mass = 100;*/
        armor = 12; //30;
        passThrough = 0.75; //0.5;
    };
};
class V_PlateCarrier3_rgr: Vest_NoCamo_Base {   // heavy (us)
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply140";
        mass = 100;*/
        armor = 12; //30;
        passThrough = 0.75; //0.5;
    };
};
class V_PlateCarrierGL_rgr: Vest_NoCamo_Base {   // lite (gl)
    class ItemInfo: ItemInfo {
        containerClass = "Supply160"; //"Supply140";
        /*mass = 100;*/
        armor = 8; //100;
        passThrough = 0.75; //0.7;
    };
};
class V_PlateCarrier1_blk: Vest_Camo_Base {     // heavy (black)
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply140";*/
        mass = 100; //80;
        armor = 12; //20;
        passThrough = 0.75; //0.5;
    };
};
class V_PlateCarrierSpec_rgr: Vest_NoCamo_Base {  // lite (special)
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply100";
        mass = 120;*/
        armor = 16; //40;
        passThrough = 0.75; //0.1;
    };
};

// chestrigs
/*class V_Chestrig_khk: Vest_Camo_Base {
    class ItemInfo: ItemInfo {
        containerClass = "Supply140";
        mass = 20;
        armor = 0;
        passThrough = 1;
    };
};
class V_Chestrig_rgr: V_Chestrig_khk {};
class V_Chestrig_blk: V_Chestrig_khk {};
class V_Chestrig_oli: Vest_Camo_Base {
    class ItemInfo: ItemInfo {
        containerClass = "Supply140";
        mass = 20;
        armor = 0;
        passThrough = 1;
    };
};*/

// tactical vests
class V_TacVest_khk: Vest_Camo_Base {
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply100";
        mass = 40;*/
        armor = 8; //20;
        /*passThrough = 1;*/
    };
};
class V_TacVest_brn: V_TacVest_khk {};
class V_TacVest_oli: V_TacVest_khk {};
class V_TacVest_blk: V_TacVest_khk {};
class V_TacVest_camo: Vest_Camo_Base {
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply100";
        mass = 40;*/
        armor = 8; //20;
        /*passThrough = 1;*/
    };
};
class V_TacVest_blk_POLICE: Vest_Camo_Base {
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply100";*/
        mass = 40; //60;
        armor = 8; //100;
        passThrough = 1; //0.7;
    };
};
class V_TacVestIR_blk: Vest_NoCamo_Base { // raven vest
    class ItemInfo: VestItem {
        /*containerClass = "Supply100";
        mass = 50;*/
        armor = 8; //20;
        passThrough = 0.85; //0.5;
    };
};
class V_TacVestCamo_khk: Vest_Camo_Base {
    class ItemInfo: VestItem {
        /*containerClass = "Supply100";
        mass = 40;*/
        armor = 8; //20;
        /*passThrough = 1;*/
    };
};

// harnesses
class V_HarnessO_brn: Vest_NoCamo_Base {
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply160";
        mass = 30;
        armor = 0;*/
        passThrough = 0.85; //0.5;
    };
};
class V_HarnessOGL_brn: Vest_NoCamo_Base {  // gl
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply120";
        mass = 20;
        armor = 0;*/
        passThrough = 0.85; //0.5;
    };
};
class V_HarnessO_gry: V_HarnessO_brn {
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply160";
        mass = 30;
        armor = 0;*/
        passThrough = 0.85; //0.5;
    };
};
class V_HarnessOGL_gry: V_HarnessO_gry {  // gl
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply120";
        mass = 20;
        armor = 0;*/
        passThrough = 0.85; //0.5;
    };
};
class V_HarnessOSpec_brn: V_HarnessO_brn {
    class ItemInfo: VestItem {
        /*containerClass = "Supply160";
        mass = 30;
        armor = 0;*/
        passThrough = 0.85; //0.5;
    };
};
class V_HarnessOSpec_gry: V_HarnessO_gry {
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply160";
        mass = 30;
        armor = 0;*/
        passThrough = 0.85; //0.5;
    };
};

// indep plate carriers
class V_PlateCarrierIA1_dgtl: Vest_NoCamo_Base {  // lite
    class ItemInfo: VestItem {
        /*containerClass = "Supply120";
        mass = 60;*/
        armor = 8; //20;
        passThrough = 0.75; //0.5;
    };
};
class V_PlateCarrierIA2_dgtl: V_PlateCarrierIA1_dgtl {  // heavy
    class ItemInfo: VestItem {
        /*containerClass = "Supply120";
        mass = 80;*/
        armor = 12; //30;
        passThrough = 0.75; //0.5;
    };
};
class V_PlateCarrierIAGL_dgtl: V_PlateCarrierIA2_dgtl { // heavy (gl)
    class ItemInfo: VestItem {
        containerClass = "Supply140"; //"Supply120";
        mass = 100; //80;
        armor = 12; //100;
        passThrough = 0.75; //0.7;
    };
};

// rebreather
/*class V_RebreatherB: Vest_Camo_Base {
    class ItemInfo: ItemInfo {
        containerClass = "Supply0";
        mass = 80;
        armor = 20;
        passThrough = 1;
    };
};
class V_RebreatherIR: V_RebreatherB {};
class V_RebreatherIA: V_RebreatherB {};*/

// more plate carriers
class V_PlateCarrier_Kerry: V_PlateCarrier1_rgr {   // lighter
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply140";
        mass = 80;*/
        armor = 8; //30;
        passThrough = 0.75; //0.5;
    };
};
class V_PlateCarrierL_CTRG: V_PlateCarrier1_rgr {   // lite
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply140";
        mass = 80;*/
        armor = 8; //20;
        passThrough = 0.75; //0.5;
    };
};
class V_PlateCarrierH_CTRG: V_PlateCarrier2_rgr {   // heavy
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply140";
        mass = 100;*/
        armor = 12; //30;
        passThrough = 0.75; //0.5;
    };
};

// another tactical vest
class V_I_G_resistanceLeader_F: V_TacVest_camo {
    class ItemInfo: ItemInfo {};
};

// press vest
class V_Press_F: Vest_Camo_Base {
    class ItemInfo: ItemInfo {
        /*containerClass = "Supply40";
        mass = 20;*/
        armor = 8; //0;  ?
        /*passThrough = 1;*/
    };
};

// marksman dlc
/*class V_PlateCarrierGL_blk: V_PlateCarrierGL_rgr {};
class V_PlateCarrierGL_mtp: V_PlateCarrierGL_rgr {};
class V_PlateCarrierSpec_blk: V_PlateCarrierSpec_rgr {};
class V_PlateCarrierSpec_mtp: V_PlateCarrierSpec_rgr {};
class V_PlateCarrierIAGL_oli: V_PlateCarrierIAGL_dgtl {};*/
