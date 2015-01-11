class CfgPatches {
  class AGM_Ragdolls {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {AGM_Core};
    version = "0.95";
    versionStr = "0.95";
    versionAr[] = {0,95,0};
    author[] = {"KoffeinFlummi", "Opticalsnare"};
    authorUrl = "https://github.com/KoffeinFlummi/";
  };
};

/*
 * BASED ON OPTICALSNARE'S WORK
 * He gave permission to use his code here:
 * http://forums.bistudio.com/showthread.php?171771-Flying-bodies-Physics-Mod&p=2603042#post2603042
 */

class PhysXParams {
  epeImpulseDamageCoef = 1320.0;
  impulseForceRagdollCoef = 200;
  impulseTorqueRagdollCoef = 100;
  maxRagdollImpulseForceMagnitude = 500;
  maxRagdollImpulseTorqueMagnitude = 150;
  ragdollHitDmgLimit = "0.01f";
  ragdollHitForceCoef = "20f";
  ragdollHitTime = "0.05f";
  ragdollOnCollideForceCoef = "20.0f";
  ragdollOnCollideMassLimit = "0.0f";
  ragdollOnCollideMaxForce = "25.0f";
  ragdollOnCollideMaxOffset = "2.0f";
  ragdollOnCollideMaxOffsetSpeed = "50.0f";
  ragdollOnCollideSpeedLimit = "2500.0f";
  ragdollOnCollideVehicleImpulseCoef = "0.5f";
  ragdollUnconsciousSleepCoef = "0f";
  ragdollUnderwaterBuoyancyCoef = 9.7;
  ragdollUnderwaterResistanceCoef = 0.005;
  ragdollVehicleCollision = 1;
};

class RagDollDefaultLimit {
  value = 0;
  restitution = 0.9;
  hardness = 0.5;
};

class RagDollDefaultSpring {
  enabled = 0;
  value = 0.5;
  damper = 1;
  targetValue = 0;
};

class RagDollSphericalJoint {
  class TwistLimitLow : RagDollDefaultLimit {};

  class TwistLimitHigh : RagDollDefaultLimit {};

  class SwingLimit : RagDollDefaultLimit {};

  class TwistSpring : RagDollDefaultSpring {
    enabled = 1;
  };

  class SwingSpring : RagDollDefaultSpring {
    enabled = 1;
    damper = 2;
  };

  class JointSpring : RagDollDefaultSpring {
    enabled = 0;
  };
  type = "spherical";
  enableCollision = 0;
  projectionDistance = 0.05;
  projectionMode = "point";
};

class RagDollRevoluteJoint {
  class LimitLow : RagDollDefaultLimit {};

  class LimitHigh : RagDollDefaultLimit {};

  class Spring : RagDollDefaultSpring {
    enabled = 0;
  };
  type = "revolute";
  enableCollision = 0;
  projectionDistance = 0.05;
  projectionMode = "point";
};

class RagDollD6Joint_PX3 {
  type = "D6";
  enableCollision = 0;
  projectionDistance = 0.05;
  projectionMode = "point";
  swingLimitY = "0.0f";
  swingLimitZ = "0.0f";
  swingSpring = "0.0f";
  swingDamping = "0.0f";
  swingRestitution = "0.6f";
  swingContactDistance = "0.05f";
  twistLimitLower = "0.0f";
  twistLimitUpper = "0.0f";
  twistSpring = "0.0f";
  twistDamping = "0.0f";
  twistRestitution = "0.6f";
  twistContactDistance = "0.05f";
  driveSpring = "20.0f";
  driveDamping = "20.0f";
  driveMaxForce = "1000000.0f";
  driveUseAcceleration = 1;
  driveLinearVelocity[] = {0, 0, 0};
  driveAngularVelocity[] = {0, 0, 0};
};

class CfgRagDollSkeletons {
  class BaseRagdoll {
    primaryWeaponBone = "";
    secondaryWeaponBone = "";
    networkBonePrimary = "";
    networkBoneSecondary = "";
    weaponSleepLinearVelocity = 20;
    weaponSleepAngularVelocity = 20;
    weaponDropMinTime = 1.0;
    weaponDropMaxTime = 100.0;
    weaponDistanceLimit = "10f";
    weaponDistanceLimitTime = "5.0f";
    sleepLinearVelocity = 0.05;
    sleepAngularVelocity = 0.05;
    simulateMinTime = 30;
    simulateMaxTime = 100.0;
    simulateDistanceLimit = "0.05f";
    simulateDistanceLimitTime = "5.0f";
    recoveryBlendTime = "0.5f";
    recoveryCosLimit = "0.3f";
    recoveryDistLimit = "0.7f";
    animBlendTime = "0.0f";
  };

  class Soldier : BaseRagdoll {
    primaryWeaponBone = "weapon";
    secondaryWeaponBone = "launcher";
    networkBonePrimary = "chest";
    networkBoneSecondary = "pelvis";
    draggingMask = "dragging";
    hitMask = "hit";
    hitMaskUnderwater = "hitUnderwater";

    class WeaponLinkBones {
      class LinkBone1 {
        bone = "leftHand";
        canBeDropped = 1;
        prefference = "1.0f";
      };

      class LinkBone2 {
        bone = "rightHand";
        canBeDropped = 1;
        prefference = "2.0f";
      };

      class LinkBone3 {
        bone = "chest";
        canBeDropped = 1;
        prefference = "1.0f";
      };
    };

    class Masks {
      class DraggingMask {
        name = "dragging";
        mask[] = {{"pelvis", 0, 1}, {"chest", 0, 1}, {"head", "0.6f", 0}, {"leftArm", 1, 0}, {"leftForeArm", 1, 0}, {"leftHand", 1, 0}, {"rightArm", 1, 0}, {"rightForeArm", 1, 0}, {"rightHand", 1, 0}, {"leftUpLeg", 1, 0}, {"leftLeg", 1, 0}, {"leftFoot", 1, 0}, {"rightUpLeg", 1, 0}, {"rightLeg", 1, 0}, {"rightFoot", 1, 0}, {"weapon", 0, 1}, {"launcher", 0, 1}};
      };

      class HitMask {
        name = "hit";
        mask[] = {{"pelvis", 1, 0}, {"chest", 1, 0}, {"head", 1, 0}, {"leftArm", 1, 0}, {"leftForeArm", 1, 0}, {"leftHand", 1, 0}, {"rightArm", 1, 0}, {"rightForeArm", 1, 0}, {"rightHand", 1, 0}, {"leftUpLeg", 1, 0}, {"leftLeg", 1, 0}, {"leftFoot", 1, 1}, {"rightUpLeg", 1, 0}, {"rightLeg", 1, 0}, {"rightFoot", 1, 1}, {"weapon", 1, 0}, {"launcher", 1, 0}};
      };

      class HitMaskUnderwater {
        name = "hitUnderwater";
        mask[] = {{"pelvis", 1, 1}, {"chest", 1, 1}, {"head", 1, 0}, {"leftArm", 1, 0}, {"leftForeArm", 1, 0}, {"leftHand", 1, 0}, {"rightArm", 1, 0}, {"rightForeArm", 1, 0}, {"rightHand", 1, 0}, {"leftUpLeg", 1, 0}, {"leftLeg", 1, 0}, {"leftFoot", 1, 0}, {"rightUpLeg", 1, 0}, {"rightLeg", 1, 0}, {"rightFoot", 1, 0}, {"weapon", 1, 0}, {"launcher", 1, 0}};
      };
    };

    class BaseRagdollBone {
      material = "Ragdoll";
      childrenUseStartTrans = 1;
    };

    class Bones {
      class Pelvis : BaseRagdollBone {
        name = "pelvis";
        type = "capsule";
        startBone = "pelvis";
        endBone = "spine2";
        mass = 15;
        radius = 0.12;
        networkType = "root";
      };

      class Chest : BaseRagdollBone {
        name = "chest";
        type = "capsule";
        startBone = "spine1";
        endBone = "neck";
        radius = 0.16;
        mass = 15;
      };

      class Head : BaseRagdollBone {
        name = "head";
        type = "sphere";
        startBone = "head";
        mass = 8;
        radius = 0.16;
      };

      class LeftArm : BaseRagdollBone {
        name = "leftArm";
        type = "capsule";
        startBone = "leftArm";
        endBone = "leftForeArm";
        mass = 8;
      };

      class LeftForeArm : BaseRagdollBone {
        name = "leftForeArm";
        type = "capsule";
        startBone = "leftForeArm";
        endBone = "leftHand";
        mass = 6;
      };

      class LeftHand : BaseRagdollBone {
        name = "leftHand";
        type = "sphere";
        startBone = "leftHand";
        mass = 6;
        radius = 0.08;
        childrenUseStartTrans = 0;
        networkType = "leftHand";
      };

      class RightArm : BaseRagdollBone {
        name = "rightArm";
        type = "capsule";
        startBone = "rightArm";
        endBone = "rightForeArm";
        mass = 8;
      };

      class RightForeArm : BaseRagdollBone {
        name = "rightForeArm";
        type = "capsule";
        startBone = "rightForeArm";
        endBone = "rightHand";
        mass = 6;
      };

      class RightHand : BaseRagdollBone {
        name = "rightHand";
        type = "sphere";
        startBone = "rightHand";
        mass = 6;
        radius = 0.08;
        childrenUseStartTrans = 0;
        networkType = "rightHand";
      };

      class LeftUpLeg : BaseRagdollBone {
        name = "leftUpLeg";
        type = "capsule";
        startBone = "leftUpLeg";
        endBone = "leftLeg";
        mass = 15;
      };

      class LeftLeg : BaseRagdollBone {
        name = "leftLeg";
        type = "capsule";
        startBone = "leftLeg";
        endBone = "leftFoot";
        mass = 10;
      };

      class LeftFoot : BaseRagdollBone {
        name = "leftFoot";
        type = "box";
        startBone = "leftFoot";
        size[] = {0.15, 0.035, 0.07};
        mass = 8;
        networkType = "leftFoot";
      };

      class RightUpLeg : BaseRagdollBone {
        name = "rightUpLeg";
        type = "capsule";
        startBone = "rightUpLeg";
        endBone = "rightLeg";
        mass = 15;
      };

      class RightLeg : BaseRagdollBone {
        name = "rightLeg";
        type = "capsule";
        startBone = "rightLeg";
        endBone = "rightFoot";
        mass = 10;
      };

      class RightFoot : BaseRagdollBone {
        name = "rightFoot";
        type = "box";
        startBone = "rightFoot";
        size[] = {0.15, 0.035, 0.07};
        mass = 8;
        networkType = "rightFoot";
      };

      class Weapon : BaseRagdollBone {
        name = "weapon";
        type = "weapon";
        startBone = "weapon";
        endPosRelToStart[] = {0.0, 1.0, 0.0};
        mass = 3;
      };

      class Launcher : BaseRagdollBone {
        name = "launcher";
        type = "weapon";
        startBone = "launcher";
        endPosRelToStart[] = {1.0, 0.0, 0.0};
        mass = 3;
      };
    };

    class JointsPX2 {
      class Pelvis_Chest_PX2 : RagDollSphericalJoint {
        name = "pelvis_chest";
        bone1 = "pelvis";
        bone2 = "chest";
        axis[] = {0, 1, 0.3};

        class SwingLimit : SwingLimit {
          value = 25;
        };

        class TwistLimitLow : TwistLimitLow {
          value = -15;
        };

        class TwistLimitHigh : TwistLimitHigh {
          value = 25;
        };
      };

      class Chest_Head_PX2 : RagDollSphericalJoint {
        name = "chest_head";
        bone1 = "chest";
        bone2 = "head";

        class SwingLimit : SwingLimit {
          value = 20;
        };

        class TwistLimitLow : TwistLimitLow {
          value = -15;
        };

        class TwistLimitHigh : TwistLimitHigh {
          value = 15;
        };
      };

      class Chest_LeftArm_PX2 : RagDollSphericalJoint {
        name = "chest_leftArm";
        bone1 = "chest";
        bone2 = "leftArm";
        axis[] = {-1, 0.0, 0.5};
        enableCollision = 1;

        class SwingLimit : SwingLimit {
          value = 60;
        };

        class TwistLimitLow : TwistLimitLow {
          value = -20;
        };

        class TwistLimitHigh : TwistLimitHigh {
          value = 20;
        };
      };

      class LeftArm_LeftForeArm_PX2 : RagDollRevoluteJoint {
        name = "leftArm_leftForeArm";
        bone1 = "leftArm";
        bone2 = "leftForeArm";
        axis[] = {1, -1, 0.2};

        class LimitLow : LimitLow {
          value = -2;
        };

        class LimitHigh : LimitHigh {
          value = 60;
        };
      };

      class LeftForeArm_LeftHand_PX2 : RagDollSphericalJoint {
        name = "leftForeArm_leftHand";
        bone1 = "leftForeArm";
        bone2 = "leftHand";

        class SwingLimit : SwingLimit {
          value = 20;
        };

        class TwistLimitLow : TwistLimitLow {
          value = -5;
        };

        class TwistLimitHigh : TwistLimitHigh {
          value = 5;
        };
      };

      class Chest_RightArm_PX2 : RagDollSphericalJoint {
        name = "chest_rightArm";
        bone1 = "chest";
        bone2 = "rightArm";
        axis[] = {1, 0.0, 0.5};
        enableCollision = 1;

        class SwingLimit : SwingLimit {
          value = 60;
        };

        class TwistLimitLow : TwistLimitLow {
          value = -20;
        };

        class TwistLimitHigh : TwistLimitHigh {
          value = 20;
        };
      };

      class RightArm_RightForeArm_PX2 : RagDollRevoluteJoint {
        name = "rightArm_rightForeArm";
        bone1 = "rightArm";
        bone2 = "rightForeArm";
        axis[] = {1, 1, -0.2};

        class LimitLow : LimitLow {
          value = -2;
        };

        class LimitHigh : LimitHigh {
          value = 60;
        };
      };

      class RightForeArm_RightHand_PX2 : RagDollSphericalJoint {
        name = "rightForeArm_rightHand";
        bone1 = "rightForeArm";
        bone2 = "rightHand";

        class SwingLimit : SwingLimit {
          value = 20;
        };

        class TwistLimitLow : TwistLimitLow {
          value = -5;
        };

        class TwistLimitHigh : TwistLimitHigh {
          value = 5;
        };
      };

      class Pelvis_LeftUpLeg_PX2 : RagDollSphericalJoint {
        name = "pelvis_leftUpLeg";
        bone1 = "pelvis";
        bone2 = "leftUpLeg";
        axis[] = {-1.5, -1.1, 2};
        enableCollision = 1;

        class SwingLimit : SwingLimit {
          value = 45;
        };

        class TwistLimitLow : TwistLimitLow {
          value = -10;
        };

        class TwistLimitHigh : TwistLimitHigh {
          value = 20;
        };
      };

      class LeftUpLeg_LeftLeg_PX2 : RagDollRevoluteJoint {
        name = "leftUpLeg_leftLeg";
        bone1 = "leftUpLeg";
        bone2 = "leftLeg";
        axis[] = {-1, 0, 0};

        class LimitLow : LimitLow {
          value = -5;
        };

        class LimitHigh : LimitHigh {
          value = 110;
        };
      };

      class LeftLeg_LeftFoot_PX2 : RagDollRevoluteJoint {
        name = "leftLeg_leftFoot";
        bone1 = "leftLeg";
        bone2 = "leftFoot";
        axis[] = {-1, 0, 0};

        class LimitLow : LimitLow {
          value = -15;
        };

        class LimitHigh : LimitHigh {
          value = 45;
        };
      };

      class Pelvis_RightUpLeg_PX2 : RagDollSphericalJoint {
        name = "pelvis_rightUpLeg";
        bone1 = "pelvis";
        bone2 = "rightUpLeg";
        axis[] = {1.5, -1.1, 2};
        enableCollision = 1;

        class SwingLimit : SwingLimit {
          value = 45;
        };

        class TwistLimitLow : TwistLimitLow {
          value = -10;
        };

        class TwistLimitHigh : TwistLimitHigh {
          value = 20;
        };
      };

      class RightUpLeg_RightLeg_PX2 : RagDollRevoluteJoint {
        name = "rightUpLeg_rightLeg";
        bone1 = "rightUpLeg";
        bone2 = "rightLeg";
        axis[] = {-1, 0, 0};

        class LimitLow : LimitLow {
          value = -5;
        };

        class LimitHigh : LimitHigh {
          value = 110;
        };
      };

      class RightLeg_RightFoot_PX2 : RagDollRevoluteJoint {
        name = "rightLeg_rightFoot";
        bone1 = "rightLeg";
        bone2 = "rightFoot";
        axis[] = {-1, 0, 0};

        class LimitLow : LimitLow {
          value = -15;
        };

        class LimitHigh : LimitHigh {
          value = 45;
        };
      };
    };

    class JointsPX3 {
      class Pelvis_Chest_PX3 : RagDollD6Joint_PX3 {
        name = "pelvis_chest";
        bone1 = "pelvis";
        bone2 = "chest";
        axis[] = {0, 1, 0.3};
        enableCollision = 0;
        swingLimitY = 30;
        swingLimitZ = 30;
        twistLimitLower = -25;
        twistLimitUpper = 25;
        driveSpring = 30;
        driveDamping = 30;
        driveSpringWater = 5;
        driveDampingWater = 5;
      };

      class Chest_Head_PX3 : RagDollD6Joint_PX3 {
        name = "chest_head";
        bone1 = "chest";
        bone2 = "head";
        swingLimitY = 45;
        swingLimitZ = 45;
        twistLimitLower = -40;
        twistLimitUpper = 40;
        driveSpring = 15.0;
        driveDamping = 30;
        driveSpringWater = 1.5;
        driveDampingWater = 3.0;
        twistSpring = 15.0;
        twistDamping = 30.0;
      };

      class Chest_LeftArm_PX3 : RagDollD6Joint_PX3 {
        name = "chest_leftArm";
        bone1 = "chest";
        bone2 = "leftArm";
        enableCollision = 1;
        swingLimitY = 85;
        swingLimitZ = 85;
        twistLimitLower = -60;
        twistLimitUpper = 60;
        driveSpring = 30;
        driveDamping = 30;
        driveSpringWater = 3;
        driveDampingWater = 3;
      };

      class LeftArm_LeftForeArm_PX3 : RagDollD6Joint_PX3 {
        name = "leftArm_leftForeArm";
        bone1 = "leftArm";
        bone2 = "leftForeArm";
        axis[] = {-1, 1, -0.2};
        swingLimitY = 10;
        swingLimitZ = 10;
        twistLimitLower = -5;
        twistLimitUpper = 150;
        driveSpring = 10;
        driveDamping = 10;
        driveSpringWater = 1;
        driveDampingWater = 1;
      };

      class LeftForeArm_LeftHand_PX3 : RagDollD6Joint_PX3 {
        name = "leftForeArm_leftHand";
        bone1 = "leftForeArm";
        bone2 = "leftHand";
        swingLimitY = 10;
        swingLimitZ = 10;
        twistLimitLower = -20;
        twistLimitUpper = 20;
        driveSpring = 10;
        driveDamping = 10;
        driveSpringWater = 1;
        driveDampingWater = 1;
      };

      class Chest_RightArm_PX3 : RagDollD6Joint_PX3 {
        name = "chest_rightArm";
        bone1 = "chest";
        bone2 = "rightArm";
        enableCollision = 1;
        swingLimitY = 85;
        swingLimitZ = 85;
        twistLimitLower = -60;
        twistLimitUpper = 60;
        driveSpring = 30;
        driveDamping = 30;
        driveSpringWater = 3;
        driveDampingWater = 3;
      };

      class RightArm_RightForeArm_PX3 : RagDollD6Joint_PX3 {
        name = "rightArm_rightForeArm";
        bone1 = "rightArm";
        bone2 = "rightForeArm";
        axis[] = {-1, -1, 0.2};
        swingLimitY = 10;
        swingLimitZ = 10;
        twistLimitLower = -5;
        twistLimitUpper = 150;
        driveSpring = 10;
        driveDamping = 10;
        driveSpringWater = 1;
        driveDampingWater = 1;
      };

      class RightForeArm_RightHand_PX3 : RagDollD6Joint_PX3 {
        name = "rightForeArm_rightHand";
        bone1 = "rightForeArm";
        bone2 = "rightHand";
        swingLimitY = 10;
        swingLimitZ = 10;
        twistLimitLower = -20;
        twistLimitUpper = 20;
        driveSpring = 10;
        driveDamping = 10;
        driveSpringWater = 1;
        driveDampingWater = 1;
      };

      class Pelvis_LeftUpLeg_PX3 : RagDollD6Joint_PX3 {
        name = "pelvis_leftUpLeg";
        bone1 = "pelvis";
        bone2 = "leftUpLeg";
        enableCollision = 1;
        swingLimitY = 35;
        swingLimitZ = 35;
        twistLimitLower = -10;
        twistLimitUpper = 60;
        driveSpring = 30;
        driveDamping = 30;
        driveSpringWater = 3;
        driveDampingWater = 3;
        twistDamping = 30.0;
      };

      class LeftUpLeg_LeftLeg_PX3 : RagDollD6Joint_PX3 {
        name = "leftUpLeg_leftLeg";
        bone1 = "leftUpLeg";
        bone2 = "leftLeg";
        axis[] = {1, 0, 0};
        swingLimitY = 10;
        swingLimitZ = 10;
        twistLimitLower = -5;
        twistLimitUpper = 120;
        driveSpring = 20;
        driveDamping = 20;
        driveSpringWater = 2;
        driveDampingWater = 2;
      };

      class LeftLeg_LeftFoot_PX3 : RagDollD6Joint_PX3 {
        name = "leftLeg_leftFoot";
        bone1 = "leftLeg";
        bone2 = "leftFoot";
        axis[] = {1, 0, 0};
        swingLimitY = 10;
        swingLimitZ = 10;
        twistLimitLower = -15;
        twistLimitUpper = 45;
        driveSpring = 20;
        driveDamping = 20;
        driveSpringWater = 2;
        driveDampingWater = 2;
      };

      class Pelvis_RightUpLeg_PX3 : RagDollD6Joint_PX3 {
        name = "pelvis_rightUpLeg";
        bone1 = "pelvis";
        bone2 = "rightUpLeg";
        enableCollision = 1;
        swingLimitY = 35;
        swingLimitZ = 35;
        twistLimitLower = -10;
        twistLimitUpper = 60;
        driveSpring = 30;
        driveDamping = 30;
        driveSpringWater = 3;
        driveDampingWater = 3;
        twistDamping = 30.0;
      };

      class RightUpLeg_RightLeg_PX3 : RagDollD6Joint_PX3 {
        name = "rightUpLeg_rightLeg";
        bone1 = "rightUpLeg";
        bone2 = "rightLeg";
        axis[] = {1, 0, 0};
        swingLimitY = 10;
        swingLimitZ = 10;
        twistLimitLower = -5;
        twistLimitUpper = 120;
        driveSpring = 20;
        driveDamping = 20;
        driveSpringWater = 2;
        driveDampingWater = 2;
      };

      class RightLeg_RightFoot_PX3 : RagDollD6Joint_PX3 {
        name = "rightLeg_rightFoot";
        bone1 = "rightLeg";
        bone2 = "rightFoot";
        axis[] = {1, 0, 0};
        swingLimitY = 10;
        swingLimitZ = 10;
        twistLimitLower = -15;
        twistLimitUpper = 45;
        driveSpring = 20;
        driveDamping = 20;
        driveSpringWater = 2;
        driveDampingWater = 2;
      };
    };
  };
};
