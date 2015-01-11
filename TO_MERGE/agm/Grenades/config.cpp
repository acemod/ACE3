class CfgPatches {
  class AGM_Grenades {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"commy2", "KoffeinFlummi"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgFunctions {
  class AGM_Grenades {
    class AGM_Grenades {
      file = "\AGM_Grenades\functions";
      class flashbangEffect;
      class nextMode;
      class throwGrenade;
    };
  };
};

class Extended_PostInit_EventHandlers {
  class AGM_Grenades {
    clientInit = "call compile preprocessFileLineNumbers '\AGM_Grenades\clientInit.sqf'";
  };
};

class Extended_FiredBIS_EventHandlers {
  class CAManBase {
    class AGM_Grenades_ThrowGrenade {
      clientFiredBIS = "if (_this select 0 == AGM_player) then {_this call AGM_Grenades_fnc_throwGrenade;};";
    };
  };
};

class AGM_Core_Default_Keys {
  class switchGrenadeMode {
    displayName = "$STR_AGM_Grenades_SwitchGrenadeMode";
    condition = "[_player] call AGM_Core_fnc_canUseWeapon";
    statement = "call AGM_Grenades_fnc_nextMode";
    key = 9;//34;
    shift = 0;
    control = 0;
    alt = 0;//1;
  };
};

class CfgAmmo {
  class FlareCore;
  class FlareBase: FlareCore {
    intensity = 20000;
    flareSize = 12;
  };
  class F_40mm_White: FlareBase {
    intensity = 40000;
    flareSize = 12;
  };
  class F_20mm_White: FlareBase {
    intensity = 20000;
    flareSize = 12;
  };
  class F_Signal_Green: FlareBase {
    intensity = 20000;
    flareSize = 12;
  };
  class Flare_82mm_AMOS_White: FlareCore {
    intensity = 80000;
    flareSize = 12;
  };

  class F_20mm_Red: F_20mm_White {};
  class F_20mm_Green: F_20mm_White {};
  class F_20mm_Yellow: F_20mm_White {};

  class AGM_F_Hand_White: F_20mm_White {
    grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
    soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
    SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
    SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
    SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
    SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
    timeToLive = 60;
  };
  class AGM_F_Hand_Red: F_20mm_Red {
    grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
    soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
    SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
    SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
    SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
    SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
    timeToLive = 60;
  };
  class AGM_F_Hand_Green: F_20mm_Green {
    grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
    soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
    SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
    SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
    SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
    SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
    timeToLive = 60;
  };
  class AGM_F_Hand_Yellow: F_20mm_Yellow {
    grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
    soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
    SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
    SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
    SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
    SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
    timeToLive = 60;
  };


  class AGM_G_M84: F_20mm_Yellow {
    useFlare = 0;
    flareSize = 0;
    intensity = 0;
    grenadeBurningSound[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    grenadeFireSound[] = {"SmokeShellSoundHit1",0.25,"SmokeShellSoundHit2",0.25,"SmokeShellSoundHit3",0.5};
    soundTrigger[] = {"SmokeShellSoundLoop1",0.5,"SmokeShellSoundLoop2",0.5};
    SmokeShellSoundHit1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_1",1.25893,1,100};
    SmokeShellSoundHit2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_2",1.25893,1,100};
    SmokeShellSoundHit3[] = {"A3\Sounds_F\weapons\smokeshell\smoke_3",1.25893,1,100};
    SmokeShellSoundLoop1[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop1",0.125893,1,70};
    SmokeShellSoundLoop2[] = {"A3\Sounds_F\weapons\smokeshell\smoke_loop2",0.125893,1,70};
    timeToLive = 60;
    fuseDistance = 2.3;
    model = "agm_grenades\agm_m84_thrown.p3d";
  };
};

class CfgMagazines {
  class HandGrenade;
  class AGM_HandFlare_Base: HandGrenade {
    value = 2;
    nameSoundWeapon = "smokeshell";
    nameSound = "smokeshell";
    mass = 4;
    initSpeed = 22;
  };
  class AGM_HandFlare_White: AGM_HandFlare_Base {
    ammo = "AGM_F_Hand_White";
    displayname = "$STR_AGM_Grenades_M127A1_White_Name";
    descriptionshort = "$STR_AGM_Grenades_M127A1_White_Description";
    displayNameShort = "$STR_AGM_Grenades_M127A1_White_NameShort";
    model = "\A3\weapons_f\ammo\flare_white";
    picture = "\A3\Weapons_F\Data\UI\gear_flare_white_ca.paa";
  };
  class AGM_HandFlare_Red: AGM_HandFlare_Base {
    ammo = "AGM_F_Hand_Red";
    displayname = "$STR_AGM_Grenades_M127A1_Red_Name";
    descriptionshort = "$STR_AGM_Grenades_M127A1_Red_Description";
    displayNameShort = "$STR_AGM_Grenades_M127A1_Red_NameShort";
    model = "\A3\weapons_f\ammo\flare_red";
    picture = "\A3\Weapons_F\Data\UI\gear_flare_red_ca.paa";
  };
  class AGM_HandFlare_Green: AGM_HandFlare_Base {
    ammo = "AGM_F_Hand_Green";
    displayname = "$STR_AGM_Grenades_M127A1_Green_Name";
    descriptionshort = "$STR_AGM_Grenades_M127A1_Green_Description";
    displayNameShort = "$STR_AGM_Grenades_M127A1_Green_NameShort";
    model = "\A3\weapons_f\ammo\flare_green";
    picture = "\A3\Weapons_F\Data\UI\gear_flare_green_ca.paa";
  };
  class AGM_HandFlare_Yellow: AGM_HandFlare_Base {
    ammo = "AGM_F_Hand_Yellow";
    displayname = "$STR_AGM_Grenades_M127A1_Yellow_Name";
    descriptionshort = "$STR_AGM_Grenades_M127A1_Yellow_Description";
    displayNameShort = "$STR_AGM_Grenades_M127A1_Yellow_NameShort";
    model = "\A3\weapons_f\ammo\flare_yellow";
    picture = "\A3\Weapons_F\Data\UI\gear_flare_yellow_ca.paa";
  };
  class AGM_M84: HandGrenade {
    ammo = "AGM_G_M84";
    displayname = "$STR_AGM_Grenades_M84_Name";
    descriptionshort = "$STR_AGM_Grenades_M84_Description";
    displayNameShort = "M84";
    model = "agm_grenades\agm_m84.p3d";
    picture = "\agm_grenades\UI\agm_m84_x_ca.paa";
  };

  class 3Rnd_UGL_FlareGreen_F;
  class 6Rnd_GreenSignal_F: 3Rnd_UGL_FlareGreen_F {
    ammo = "F_40mm_Green";
    initSpeed = 120;
  };
  class 6Rnd_RedSignal_F: 6Rnd_GreenSignal_F {
    ammo = "F_40mm_Red";
    initSpeed = 120;
  };
};

class CfgWeapons {
  class GrenadeLauncher;

  class Throw: GrenadeLauncher {
    muzzles[] += {"AGM_HandFlare_WhiteMuzzle", "AGM_HandFlare_RedMuzzle", "AGM_HandFlare_GreenMuzzle", "AGM_HandFlare_YellowMuzzle", "AGM_M84Muzzle"};
    class ThrowMuzzle;
    class AGM_HandFlare_WhiteMuzzle: ThrowMuzzle {
      magazines[] = {"AGM_HandFlare_White"};
    };
    class AGM_HandFlare_RedMuzzle: ThrowMuzzle {
      magazines[] = {"AGM_HandFlare_Red"};
    };
    class AGM_HandFlare_GreenMuzzle: ThrowMuzzle {
      magazines[] = {"AGM_HandFlare_Green"};
    };
    class AGM_HandFlare_YellowMuzzle: ThrowMuzzle {
      magazines[] = {"AGM_HandFlare_Yellow"};
    };
    class AGM_M84Muzzle: ThrowMuzzle {
      magazines[] = {"AGM_M84"};
    };
  };
};

#define MACRO_ADDITEM(ITEM,COUNT) class _xx_##ITEM { \
  name = #ITEM; \
  count = COUNT; \
};

class CfgVehicles {
  class NATO_Box_Base;
  class EAST_Box_Base;
  class IND_Box_Base;
  class Box_NATO_Support_F;

  class Box_NATO_Grenades_F: NATO_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_HandFlare_White,12)
      MACRO_ADDITEM(AGM_HandFlare_Green,12)
      MACRO_ADDITEM(AGM_M84,12)
    };
  };

  class Box_East_Grenades_F: EAST_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_HandFlare_Yellow,12)
      MACRO_ADDITEM(AGM_HandFlare_Red,12)
      MACRO_ADDITEM(AGM_M84,12)
    };
  };

  class Box_IND_Grenades_F: IND_Box_Base {
    class TransportItems {
      MACRO_ADDITEM(AGM_HandFlare_Yellow,12)
      MACRO_ADDITEM(AGM_HandFlare_Green,12)
      MACRO_ADDITEM(AGM_M84,12)
    };
  };

  class AGM_Box_Misc: Box_NATO_Support_F {
    class TransportItems {
      MACRO_ADDITEM(AGM_HandFlare_White,12)
      MACRO_ADDITEM(AGM_HandFlare_Red,12)
      MACRO_ADDITEM(AGM_HandFlare_Green,12)
      MACRO_ADDITEM(AGM_HandFlare_Yellow,12)
      MACRO_ADDITEM(AGM_M84,12)
    };
  };
};
