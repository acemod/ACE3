class CfgPatches {
  class AGM_Backblast {
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
  class AGM_Backblast {
    class AGM_Backblast {
      file = "\AGM_Backblast\functions";
      class getDistance;
      class launcherBackblast;
      class tankDangerZone;
    };
  };
};

class Extended_FiredNear_EventHandlers {
  class CAManBase {
    class AGM_FiredNear_LauncherBackblast {
      FiredNear = "if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 3 >> 'AGM_Backblast_Damage') > 0}) then {_this call AGM_Backblast_fnc_launcherBackblast}";
    };
    class AGM_FiredNear_TankDangerZone {
      FiredNear = "if (local (_this select 0) && {getNumber (configfile >> 'CfgWeapons' >> _this select 3 >> 'AGM_DangerZone_Damage') > 0}) then {_this call AGM_Backblast_fnc_tankDangerZone}";
    };
  };
};

class CfgWeapons {

  class LauncherCore;
  class Launcher: LauncherCore {
    AGM_Backblast_Angle = 60;
    AGM_Backblast_Range = 10;
    AGM_Backblast_Damage = 0.7;
  };
  class Launcher_Base_F: Launcher {};

  class launch_Titan_base: Launcher_Base_F {
    AGM_Backblast_Angle = 40;
    AGM_Backblast_Range = 8;
    AGM_Backblast_Damage = 0.5;
  };
  class launch_Titan_short_base: launch_Titan_base {
    AGM_Backblast_Angle = 40;
    AGM_Backblast_Range = 8;
    AGM_Backblast_Damage = 0.5;
  };

  class launch_NLAW_F: Launcher_Base_F {
    AGM_Backblast_Angle = 40;
    AGM_Backblast_Range = 5;
    AGM_Backblast_Damage = 0.6;
  };
  class launch_RPG32_F: Launcher_Base_F {
    AGM_Backblast_Angle = 60;
    AGM_Backblast_Range = 15;
    AGM_Backblast_Damage = 0.7;
  };

  class CannonCore;
  class cannon_120mm: CannonCore {
    AGM_DangerZone_Angle = 90;
    AGM_DangerZone_Range = 50;
    AGM_DangerZone_Damage = 0.85;
  };
  class mortar_155mm_AMOS: CannonCore {
    AGM_DangerZone_Angle = 90;
    AGM_DangerZone_Range = 60;
    AGM_DangerZone_Damage = 1;
  };
};
