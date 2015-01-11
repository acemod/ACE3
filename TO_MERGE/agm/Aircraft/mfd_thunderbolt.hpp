
class MFD {
  class HUD_1 {
    topLeft = "HUD_top_left";
    topRight = "HUD_top_right";
    bottomLeft = "HUD_bottom_left";
    borderLeft = 0.12;
    borderRight = 0.12;
    borderTop = 0.05;
    borderBottom = 0.15;
    color[] = {0,1,0,0.1};
    enableParallax = 1;
    class Bones {
      class WeaponAim {
        type = "vector";
        source = "weapon";
        pos0[] = {0.5,0.38};
        pos10[] = {1.166,1.215};
      };

      class Target {
        type = "vector";
        source = "target";
        pos0[] = {0.5,0.38};
        pos10[] = {1.166,1.215};
      };

      class Velocity {
        type = "vector";
        source = "velocity";
        pos0[] = {0.5,0.5};
        pos10[] = {1.215,1.215};
      };

      class VerticalSpeed {
        type = "linear";
        source = "vspeed";
        sourceScale = 1;
        min = -100;
        max = 100;
        minPos[] = {0,0.15};
        maxPos[] = {0,-0.15};
      };

      class center {
        type = "fixed";
        pos[] = {0.5,0.38};
      };

      class RangeBone {
        type = "linear";
        source = "targetDist";
        sourceScale = 1;
        min = 0;
        max = 12000;
        minPos[] = {0.08,0.4};
        maxPos[] = {0.08,0.6};
      };

      class RadarAltitudeBone {
        type = "linear";
        source = "altitudeAGL";
        sourceScale = 1;
        min = 0;
        max = 500;
        minPos[] = {0.71,0.4};
        maxPos[] = {0.71,0.6};
      };

      class VspeedBone {
        type = "linear";
        source = "vspeed";
        sourceScale = 1;
        min = -50;
        max = 50;
        minPos[] = {0.94,0.4};
        maxPos[] = {0.94,0.6};
      };
    };

    class Draw {
      color[] = {0.15,1,0.15};
      alpha = 0.9;
      clipTL[] = {0,0};
      clipBR[] = {1,1};
      condition = "on";
      class WeaponName {
        type = "text";
        source = "weapon";
        sourceScale = 1;
        align = "left";
        scale = 1;
        pos[] = {{"0.15 + 0.1",0.85},1};
        right[] = {{"0.19 + 0.1",0.85},1};
        down[] = {{"0.15 + 0.1",0.89},1};
      };

      class AmmoCount {
        type = "text";
        source = "ammo";
        sourceScale = 1;
        align = "left";
        scale = 1;
        pos[] = {{"0.15 + 0.1",0.89},1};
        right[] = {{"0.19 + 0.1",0.89},1};
        down[] = {{"0.15 + 0.1",0.93},1};
      };

      class GearGroup {
        type = "group";
        condition = "ils";
        class GearText {
          type = "text";
          source = "static";
          text = "GEAR";
          align = "left";
          scale = 1;
          pos[] = {{"0.15 + 0.1","0.53 - 0.40"},1};
          right[] = {{"0.20 + 0.1","0.53 - 0.40"},1};
          down[] = {{"0.15 + 0.1","0.53 - 0.40 + 0.05"},1};
        };

        class radarbanda {
          type = "line";
          width = 4;
          points[] = {
            {"RadarAltitudeBone",{-0.005,0.005},1},
            {"RadarAltitudeBone",{-0.005,0},1},
            {"RadarAltitudeBone",{0,0},1},
            {{0.71,0.6},1},{},
            {{0.71,0.4},1},
            {{0.72,0.4},1},{},
            {{0.71,0.44},1},
            {{0.72,0.44},1},{},
            {{0.71,0.48},1},
            {{0.72,0.48},1},{},
            {{0.71,0.52},1},
            {{0.72,0.52},1},{},
            {{0.71,0.56},1},
            {{0.72,0.56},1},{},
            {{0.71,0.6},1},
            {{0.72,0.6},1}
          };
        };

        class radartext_5 {
          type = "text";
          source = "static";
          text = "5";
          align = "right";
          scale = 1;
          pos[] = {{0.721,"0.385 + 0.00"},1};
          right[] = {{0.751,"0.385 + 0.00"},1};
          down[] = {{0.721,"0.415 + 0.00"},1};
        };

        class radartext_4 {
          type = "text";
          source = "static";
          text = "4";
          align = "right";
          scale = 1;
          pos[] = {{0.721,"0.385 + 0.04"},1};
          right[] = {{0.751,"0.385 + 0.04"},1};
          down[] = {{0.721,"0.415 + 0.04"},1};
        };

        class radartext_3 {
          type = "text";
          source = "static";
          text = "3";
          align = "right";
          scale = 1;
          pos[] = {{0.721,"0.385 + 0.08"},1};
          right[] = {{0.751,"0.385 + 0.08"},1};
          down[] = {{0.721,"0.415 + 0.08"},1};
        };

        class radartext_2 {
          type = "text";
          source = "static";
          text = "2";
          align = "right";
          scale = 1;
          pos[] = {{0.721,"0.385 + 0.120"},1};
          right[] = {{0.751,"0.385 + 0.120"},1};
          down[] = {{0.721,"0.415 + 0.120"},1};
        };

        class radartext_1 {
          type = "text";
          source = "static";
          text = "1";
          align = "right";
          scale = 1;
          pos[] = {{0.721,"0.385 + 0.160"},1};
          right[] = {{0.751,"0.385 + 0.160"},1};
          down[] = {{0.721,"0.415 + 0.160"},1};
        };

        class radartext_0 {
          type = "text";
          source = "static";
          text = "0";
          align = "right";
          scale = 1;
          pos[] = {{0.721,"0.385 + 0.200"},1};
          right[] = {{0.751,"0.385 + 0.200"},1};
          down[] = {{0.721,"0.415 + 0.200"},1};
        };

      /*class Vspeedbanda {
          type = "line";
          width = 4;
          points[] = {
            {"VspeedBone",{0.007,-0.007},1},
            {"VspeedBone",{0,0},1},
            {"VspeedBone",{0.007,0.007},1},{},
            {"VspeedBone",{0,0},1},
            {"VspeedBone",{0.012,0},1},
            {{0.952,0.5},1},{},
            {{0.92,0.4},1},
            {{0.94,0.4},1},{},
            {{0.92,0.42},1},
            {{0.93,0.42},1},{},
            {{0.92,0.44},1},
            {{0.93,0.44},1},{},
            {{0.92,0.46},1},
            {{0.93,0.46},1},{},
            {{0.92,0.48},1},
            {{0.93,0.48},1},{},
            {{0.92,0.5},1},
            {{0.94,0.5},1},{},
            {{0.92,0.52},1},
            {{0.93,0.52},1},{},
            {{0.92,0.54},1},
            {{0.93,0.54},1},{},
            {{0.92,0.56},1},
            {{0.93,0.56},1},{},
            {{0.92,0.58},1},
            {{0.93,0.58},1},{},
            {{0.92,0.6},1},
            {{0.94,0.6},1}
          };
        };*/
      };

      class Vspeedbanda1 {
        type = "line";
        width = 4;
        points[] = {
          {"VspeedBone",{0.007,-0.007},1},
          {"VspeedBone",{0,0},1},
          {"VspeedBone",{0.007,0.007},1},{},
          {"VspeedBone",{0,0},1},
          {"VspeedBone",{0.012,0},1},
          {{0.952,0.5},1},{},
          {{0.92,0.4},1},
          {{0.94,0.4},1},{},
          {{0.92,0.42},1},
          {{0.93,0.42},1},{},
          {{0.92,0.44},1},
          {{0.93,0.44},1},{},
          {{0.92,0.46},1},
          {{0.93,0.46},1},{},
          {{0.92,0.48},1},
          {{0.93,0.48},1},{},
          {{0.92,0.5},1},
          {{0.94,0.5},1},{},
          {{0.92,0.52},1},
          {{0.93,0.52},1},{},
          {{0.92,0.54},1},
          {{0.93,0.54},1},{},
          {{0.92,0.56},1},
          {{0.93,0.56},1},{},
          {{0.92,0.58},1},
          {{0.93,0.58},1},{},
          {{0.92,0.6},1},
          {{0.94,0.6},1}
        };
      };

      class StallGroup {
        type = "group";
        condition = "stall";
        color[] = {1,0,0};
        blinkingPattern[] = {0.2,0.2};
        blinkingStartsOn = 1;
        class StallText {
          type = "text";
          source = "static";
          text = "STALL";
          align = "center";
          scale = 1;
          pos[] = {{0.5,"0.53 - 0.25"},1};
          right[] = {{0.55,"0.53 - 0.25"},1};
          down[] = {{0.5,"0.53 - 0.21"},1};
        };
      };

      class FLAPSGroup {
        type = "group";
        condition = "flaps";
        class FLAPSText {
          type = "text";
          source = "static";
          text = "FLAPS";
          align = "left";
          scale = 1;
          pos[] = {{"0.15 + 0.1","0.53 - 0.35"},1};
          right[] = {{"0.20 + 0.1","0.53 - 0.35"},1};
          down[] = {{"0.15 + 0.1","0.53 - 0.35 + 0.05"},1};
        };
      };

      class CollisionLightsGroup {
        type = "group";
        condition = "collisionlights";
        class CollisionLightsText {
          type = "text";
          source = "static";
          text = "A-COL";
          align = "left";
          scale = 1;
          pos[] = {{"0.15 + 0.1","0.53 - 0.25"},1};
          right[] = {{"0.20 + 0.1","0.53 - 0.25"},1};
          down[] = {{"0.15 + 0.1","0.53 - 0.25 + 0.05"},1};
        };
      };

      class LightsGroup {
        type = "group";
        condition = "lights";
        class LightsText {
          type = "text";
          source = "static";
          text = "LLS";
          align = "left";
          scale = 1;
          pos[] = {{"0.15 + 0.1","0.53 - 0.30"},1};
          right[] = {{"0.20 + 0.1","0.53 - 0.30"},1};
          down[] = {{"0.15 + 0.1","0.53 - 0.30 + 0.05"},1};
        };
      };

      class SpeedNumber {
        type = "text";
        align = "left";
        scale = 1;
        source = "speed";
        sourceScale = 3.6;
        pos[] = {{"0.15 + 0.1",0.47},1};
        right[] = {{"0.21 + 0.1",0.47},1};
        down[] = {{"0.15 + 0.1",0.53},1};
      };

    /*class GroundSpeedNumber {
        type = "text";
        align = "left";
        scale = 1;
        source = "sqrt((speed*speed)-(vspeed*vspeed))";
        sourceScale = 3.6;
        pos[] = {{"0.15 + 0.1",0.37},1};
        right[] = {{"0.21 + 0.1",0.37},1};
        down[] = {{"0.15 + 0.1",0.43},1};
      };*/

      class MachNumber {
        type = "text";
        align = "left";
        scale = 1;
        source = "speed";
        sourceScale = 0.0288;
        pos[] = {{"0.12 + 0.1",0.53},1};
        right[] = {{"0.17 + 0.1",0.53},1};
        down[] = {{"0.12 + 0.1",0.58},1};
      };

      class MachText {
        type = "text";
        source = "static";
        text = "0.";
        align = "left";
        scale = 1;
        pos[] = {{"0.09 + 0.1",0.53},1};
        right[] = {{"0.14 + 0.1",0.53},1};
        down[] = {{"0.09 + 0.1",0.58},1};
      };

      class MachTextM {
        type = "text";
        source = "static";
        text = "M";
        align = "left";
        scale = 1;
        pos[] = {{"0.1501 + 0.1",0.53},1};
        right[] = {{"0.2001 + 0.1",0.53},1};
        down[] = {{"0.1501 + 0.1",0.58},1};
      };

      class HeadingNumber: SpeedNumber {
        source = "heading";
        sourceScale = 1;
        align = "right";
        pos[] = {{"0.85 - 0.1",0.15},1};
        right[] = {{"0.90 - 0.1",0.15},1};
        down[] = {{"0.85 - 0.1",0.2},1};
      };

      class AltNumber: SpeedNumber {
        align = "right";
        source = "altitudeASL";
        sourceScale = 1;
        pos[] = {{"0.85 - 0.1",0.47},1};
        right[] = {{"0.91 - 0.1",0.47},1};
        down[] = {{"0.85 - 0.1",0.53},1};
      };

      class PitcherNumber: SpeedNumber {
        type = "text";
        source = "horizonDive";
        sourceScale = 57.2958;
        align = "right";
        scale = 1;
        pos[] = {{"0.85 - 0.1",0.54},1};
        right[] = {{"0.90 - 0.1",0.54},1};
        down[] = {{"0.85 - 0.1",0.59},1};
      };

      class AGLText {
        type = "text";
        source = "static";
        text = "AGL/";
        align = "right";
        scale = 1;
        pos[] = {{"0.85 - 0.1",0.76},1};
        right[] = {{"0.89000002 - 0.1",0.76},1};
        down[] = {{"0.85 - 0.1",0.8},1};
      };

      class AGLNumber {
        type = "text";
        source = "altitudeAGL";
        sourceScale = 1;
        align = "right";
        scale = 1;
        pos[] = {{"0.85 - 0.1",0.8},1};
        right[] = {{"0.89 - 0.1",0.8},1};
        down[] = {{"0.85 - 0.1",0.84},1};
      };

      class ClimbText {
        type = "text";
        source = "static";
        text = "CLIMB/";
        align = "right";
        scale = 1;
        pos[] = {{"0.85 - 0.1",0.85001},1};
        right[] = {{"0.89 - 0.1",0.85001},1};
        down[] = {{"0.85 - 0.1",0.89001},1};
      };

      class ClimbNumber {
        type = "text";
        source = "vspeed";
        sourceScale = 1;
        align = "right";
        scale = 1;
        pos[] = {{"0.85 - 0.1",0.89001},1};
        right[] = {{"0.89 - 0.1",0.89001},1};
        down[] = {{"0.85 - 0.1",0.93001},1};
      };

      class RangeText {
        type = "text";
        source = "static";
        text = "RNG/";
        align = "left";
        scale = 1;
        pos[] = {{"0.15 + 0.1",0.76},1};
        right[] = {{"0.19 + 0.1",0.76},1};
        down[] = {{"0.15 + 0.1",0.8},1};
      };

      class RangeNumber {
        type = "text";
        source = "targetDist";
        sourceScale = 1;
        align = "left";
        scale = 1;
        pos[] = {{"0.15 + 0.1",0.8},1};
        right[] = {{"0.19 + 0.1",0.8},1};
        down[] = {{"0.15 + 0.1",0.84},1};
      };

      class ATRangeScale {
        condition = "ATmissile";
        type = "group";
        class RangeBand {
          type = "line";
          width = 3;
          points[] = {
            {"RangeBone",{0,0},1},
            {"RangeBone",{-0.01,-0.01},1},
            {"RangeBone",{-0.01,0.01},1},
            {"RangeBone",{0,0},1}
          };
        };

        class ATMissileRange {
          type = "line";
          width = 3;
          points[] = {
            {{0.08,0.4},1},
            {{0.1,0.4},1},{},
            {{0.08,0.467},1},
            {{0.1,0.467},1},{},
            {{0.08,0.567},1},
            {{0.1,0.567},1},{},
            {{0.08,0.6},1},
            {{0.1,0.6},1},{},
            {{0.08,0.467},1},
            {{0.08,0.567},1},{}
          };
        };
      };

      class HeadingArrow {
        type = "line";
        width = 4;
        points[] = {
          {{0.5,0.95},1},
          {{0.515,0.965},1},
          {{0.485,0.965},1},
          {{0.5,0.95},1}
        };
      };

      class HeadingScale {
        type = "scale";
        horizontal = 1;
        source = "heading";
        sourceScale = 0.1;
        width = 5;
        top = 0.35;
        center = 0.5;
        bottom = 0.65;
        lineXleft = "0.06 + 0.89";
        lineYright = "0.05 + 0.89";
        lineXleftMajor = "0.06 + 0.89";
        lineYrightMajor = "0.04 + 0.89";
        majorLineEach = 2;
        numberEach = 2;
        step = "1 / 2";
        stepSize = "(0.65 - 0.35) / 5";
        align = "center";
        scale = 1;
        pos[] = {0.35,"0.0 + 0.89"};
        right[] = {0.38,"0.0 + 0.89"};
        down[] = {0.35,"0.03 + 0.89"};
      };
    };
  };

  class HUD_2 {
    topLeft = "HUD_top_left";
    topRight = "HUD_top_right";
    bottomLeft = "HUD_bottom_left";
    borderLeft = 0.12;
    borderRight = 0.12;
    borderTop = 0.05;
    borderBottom = 0.15;
    color[] = {0,1,0,0.1};
    enableParallax = 1;
    class Bones {
      class ForwardVec1 {
        type = "vector";
        source = "forward";
        pos0[] = {0,0};
        pos10[] = {0,0};
      };

      class ForwardVec {
        type = "vector";
        source = "forward";
        pos0[] = {0,0};
        pos10[] = {0,0};
      };

      class RadarContact {
        type = "fixed";
        pos[] = {0,0};
      };

      class HorizonBankRot {
        type = "rotational";
        source = "horizonBank";
        center[] = {0.5,0.32};
        min = 3.1416;
        max = -3.1416;
        minAngle = -180;
        maxAngle = 180;
        aspectRatio = 1;
      };

      class VspeedBone {
        type = "linear";
        source = "vspeed";
        sourceScale = 1;
        min = -10;
        max = 10;
        minPos[] = {0.2,0.35};
        maxPos[] = {0.2,0.65};
      };

      class ILS_H {
        type = "ils";
        pos0[] = {0.5,0.32};
        pos3[] = {0.7,0.32};
      };

      class ILS_W: ILS_H {
        pos3[] = {0.5,0.53};
      };

      class WeaponAimGUN {
        type = "vector";
        source = "weapon";
        pos0[] = {0.5,0.32};
        pos10[] = {" 0.5 + 0.253 "," 0.32 + 0.253 "};
      };

      class WeaponAimROCKET {
        type = "vector";
        source = "weapon";
        pos0[] = {0.5,0.39};
        pos10[] = {" 0.5 + 0.253 "," 0.390 + 0.253 "};
      };

      class RadarAltitudeBone {
        type = "linear";
        source = "altitudeAGL";
        sourceScale = 0.1;
        min = 0;
        max = 200;
        minPos[] = {0.5,0.1};
        maxPos[] = {0.5,0.85};
      };

      class TargetSelected {
        type = "vector";
        source = "target";
        pos0[] = {0.5,0.32};
        pos10[] = {1.382,1.145};
      };

      class Velocity {
        type = "vector";
        source = "velocity";
        pos0[] = {0.5,0.32};
        pos10[] = {0.8,0.62};
      };

      class center {
        type = "fixed";
        pos[] = {0.5,0.38};
      };

      class Level0 {
        type = "horizon";
        pos0[] = {0.5,0.32};
        pos10[] = {1.5,1.32};
        angle = 0;
      };

      class LevelP5: Level0 {
        angle = 5;
      };

      class LevelM5: Level0 {
        angle = -5;
      };

      class LevelP10: Level0 {
        angle = 10;
      };

      class LevelM10: Level0 {
        angle = -10;
      };

      class LevelP15: Level0 {
        angle = 15;
      };

      class LevelM15: Level0 {
        angle = -15;
      };

      class LevelP20: Level0 {
        angle = 20;
      };

      class LevelM20: Level0 {
        angle = -20;
      };

      class LevelP25: Level0 {
        angle = 25;
      };

      class LevelM25: Level0 {
        angle = -25;
      };

      class LevelP30: Level0 {
        angle = 30;
      };

      class LevelM30: Level0 {
        angle = -30;
      };

      class LevelP35: Level0 {
        angle = 35;
      };

      class LevelM35: Level0 {
        angle = -35;
      };

      class LevelP40: Level0 {
        angle = 40;
      };

      class LevelM40: Level0 {
        angle = -40;
      };

      class LevelP45: Level0 {
        angle = 45;
      };

      class LevelM45: Level0 {
        angle = -45;
      };

      class LevelP50: Level0 {
        angle = 50;
      };

      class LevelM50: Level0 {
        angle = -50;
      };
    };

    class Draw {
      color[] = {0.15,1,0.15};
      alpha = 0.9;
      clipTL[] = {0,0};
      clipBR[] = {1,1};
      condition = "on";
      class Horizont {
        clipTL[] = {0.1,0.1};
        clipBR[] = {0.9,0.9};
        class Dimmed {
          class Level0 {
            type = "line";
            points[] = {
              {"Level0",{-0.2,0},1},
              {"Level0",{-0.05,0},1},{},
              {"Level0",{0.05,0},1},
              {"Level0",{0.2,0},1}
            };
          };

        /*class VALM_1_0 {
            type = "text";
            source = "static";
            text = 0;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"Level0",{-0.23,-0.025},1};
            right[] = {"Level0",{-0.13,-0.025},1};
            down[] = {"Level0",{-0.23,0.025},1};
          };

          class VALM_2_0: VALM_1_0 {
            align = "right";
            pos[] = {"Level0",{0.22,-0.025},1};
            right[] = {"Level0",{0.32,-0.025},1};
            down[] = {"Level0",{0.22,0.025},1};
          };*/

          class LevelM5: Level0 {
            type = "line";
            points[] = {
              {"LevelM5",{-0.2,-0.03},1},
              {"LevelM5",{-0.2,0},1},
              {"LevelM5",{-0.15,0},1},{},
              {"LevelM5",{-0.1,0},1},
              {"LevelM5",{-0.05,0},1},{},
              {"LevelM5",{0.05,0},1},
              {"LevelM5",{0.1,0},1},{},
              {"LevelM5",{0.15,0},1},
              {"LevelM5",{0.2,0},1},
              {"LevelM5",{0.2,-0.03},1}
            };
          };

          class VALM_1_5 {
            type = "text";
            source = "static";
            text = -5;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM5",{-0.23,-0.085},1};
            right[] = {"LevelM5",{-0.13,-0.085},1};
            down[] = {"LevelM5",{-0.23,-0.035},1};
          };

          class VALM_2_5: VALM_1_5 {
            align = "right";
            pos[] = {"LevelM5",{0.22,-0.085},1};
            right[] = {"LevelM5",{0.32,-0.085},1};
            down[] = {"LevelM5",{0.22,-0.035},1};
          };

          class LevelP5: Level0 {
            type = "line";
            points[] = {
              {"LevelP5",{-0.2,0.03},1},
              {"LevelP5",{-0.2,0},1},
              {"LevelP5",{-0.05,0},1},{},
              {"LevelP5",{0.05,0},1},
              {"LevelP5",{0.2,0},1},
              {"LevelP5",{0.2,0.03},1}
            };
          };

          class VALP_1_5 {
            type = "text";
            source = "static";
            text = "5";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP5",{-0.23,0.035},1};
            right[] = {"LevelP5",{-0.13,0.035},1};
            down[] = {"LevelP5",{-0.23,0.085},1};
          };

          class VALP_2_5: VALP_1_5 {
            align = "right";
            pos[] = {"LevelP5",{0.22,0.035},1};
            right[] = {"LevelP5",{0.32,0.035},1};
            down[] = {"LevelP5",{0.22,0.085},1};
          };

          class LevelM10: Level0 {
            type = "line";
            points[] = {
              {"LevelM10",{-0.2,-0.03},1},
              {"LevelM10",{-0.2,0},1},
              {"LevelM10",{-0.15,0},1},{},
              {"LevelM10",{-0.1,0},1},
              {"LevelM10",{-0.05,0},1},{},
              {"LevelM10",{0.05,0},1},
              {"LevelM10",{0.1,0},1},{},
              {"LevelM10",{0.15,0},1},
              {"LevelM10",{0.2,0},1},
              {"LevelM10",{0.2,-0.03},1}
            };
          };

          class VALM_1_10 {
            type = "text";
            source = "static";
            text = -10;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM10",{-0.23,-0.085},1};
            right[] = {"LevelM10",{-0.13,-0.085},1};
            down[] = {"LevelM10",{-0.23,-0.035},1};
          };

          class VALM_2_10: VALM_1_10 {
            align = "right";
            pos[] = {"LevelM10",{0.22,-0.085},1};
            right[] = {"LevelM10",{0.32,-0.085},1};
            down[] = {"LevelM10",{0.22,-0.035},1};
          };

          class LevelP10: Level0 {
            type = "line";
            points[] = {
              {"LevelP10",{-0.2,0.03},1},
              {"LevelP10",{-0.2,0},1},
              {"LevelP10",{-0.05,0},1},{},
              {"LevelP10",{0.05,0},1},
              {"LevelP10",{0.2,0},1},
              {"LevelP10",{0.2,0.03},1}
            };
          };

          class VALP_1_10 {
            type = "text";
            source = "static";
            text = "10";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP10",{-0.23,0.035},1};
            right[] = {"LevelP10",{-0.13,0.035},1};
            down[] = {"LevelP10",{-0.23,0.085},1};
          };

          class VALP_2_10: VALP_1_10 {
            align = "right";
            pos[] = {"LevelP10",{0.22,0.035},1};
            right[] = {"LevelP10",{0.32,0.035},1};
            down[] = {"LevelP10",{0.22,0.085},1};
          };

          class LevelM15: Level0 {
            type = "line";
            points[] = {
              {"LevelM15",{-0.2,-0.03},1},
              {"LevelM15",{-0.2,0},1},
              {"LevelM15",{-0.15,0},1},{},
              {"LevelM15",{-0.1,0},1},
              {"LevelM15",{-0.05,0},1},{},
              {"LevelM15",{0.05,0},1},
              {"LevelM15",{0.1,0},1},{},
              {"LevelM15",{0.15,0},1},
              {"LevelM15",{0.2,0},1},
              {"LevelM15",{0.2,-0.03},1}
            };
          };

          class VALM_1_15 {
            type = "text";
            source = "static";
            text = -15;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM15",{-0.23,-0.085},1};
            right[] = {"LevelM15",{-0.13,-0.085},1};
            down[] = {"LevelM15",{-0.23,-0.035},1};
          };

          class VALM_2_15: VALM_1_15 {
            align = "right";
            pos[] = {"LevelM15",{0.22,-0.085},1};
            right[] = {"LevelM15",{0.32,-0.085},1};
            down[] = {"LevelM15",{0.22,-0.035},1};
          };

          class LevelP15: Level0 {
            type = "line";
            points[] = {
              {"LevelP15",{-0.2,0.03},1},
              {"LevelP15",{-0.2,0},1},
              {"LevelP15",{-0.05,0},1},{},
              {"LevelP15",{0.05,0},1},
              {"LevelP15",{0.2,0},1},
              {"LevelP15",{0.2,0.03},1}
            };
          };

          class VALP_1_15 {
            type = "text";
            source = "static";
            text = "15";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP15",{-0.23,0.035},1};
            right[] = {"LevelP15",{-0.13,0.035},1};
            down[] = {"LevelP15",{-0.23,0.085},1};
          };

          class VALP_2_15: VALP_1_15 {
            align = "right";
            pos[] = {"LevelP15",{0.22,0.035},1};
            right[] = {"LevelP15",{0.32,0.035},1};
            down[] = {"LevelP15",{0.22,0.085},1};
          };

          class LevelM20: Level0 {
            type = "line";
            points[] = {
              {"LevelM20",{-0.2,-0.03},1},
              {"LevelM20",{-0.2,0},1},
              {"LevelM20",{-0.15,0},1},{},
              {"LevelM20",{-0.1,0},1},
              {"LevelM20",{-0.05,0},1},{},
              {"LevelM20",{0.05,0},1},
              {"LevelM20",{0.1,0},1},{},
              {"LevelM20",{0.15,0},1},
              {"LevelM20",{0.2,0},1},
              {"LevelM20",{0.2,-0.03},1}
            };
          };

          class VALM_1_20 {
            type = "text";
            source = "static";
            text = -20;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM20",{-0.23,-0.085},1};
            right[] = {"LevelM20",{-0.13,-0.085},1};
            down[] = {"LevelM20",{-0.23,-0.035},1};
          };

          class VALM_2_20: VALM_1_20 {
            align = "right";
            pos[] = {"LevelM20",{0.22,-0.085},1};
            right[] = {"LevelM20",{0.32,-0.085},1};
            down[] = {"LevelM20",{0.22,-0.035},1};
          };

          class LevelP20: Level0 {
            type = "line";
            points[] = {
              {"LevelP20",{-0.2,0.03},1},
              {"LevelP20",{-0.2,0},1},
              {"LevelP20",{-0.05,0},1},{},
              {"LevelP20",{0.05,0},1},
              {"LevelP20",{0.2,0},1},
              {"LevelP20",{0.2,0.03},1}
            };
          };

          class VALP_1_20 {
            type = "text";
            source = "static";
            text = "20";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP20",{-0.23,0.035},1};
            right[] = {"LevelP20",{-0.13,0.035},1};
            down[] = {"LevelP20",{-0.23,0.085},1};
          };

          class VALP_2_20: VALP_1_20 {
            align = "right";
            pos[] = {"LevelP20",{0.22,0.035},1};
            right[] = {"LevelP20",{0.32,0.035},1};
            down[] = {"LevelP20",{0.22,0.085},1};
          };

          class LevelM25: Level0 {
            type = "line";
            points[] = {
              {"LevelM25",{-0.2,-0.03},1},
              {"LevelM25",{-0.2,0},1},
              {"LevelM25",{-0.15,0},1},{},
              {"LevelM25",{-0.1,0},1},
              {"LevelM25",{-0.05,0},1},{},
              {"LevelM25",{0.05,0},1},
              {"LevelM25",{0.1,0},1},{},
              {"LevelM25",{0.15,0},1},
              {"LevelM25",{0.2,0},1},
              {"LevelM25",{0.2,-0.03},1}
            };
          };

          class VALM_1_25 {
            type = "text";
            source = "static";
            text = -25;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM25",{-0.23,-0.085},1};
            right[] = {"LevelM25",{-0.13,-0.085},1};
            down[] = {"LevelM25",{-0.23,-0.035},1};
          };

          class VALM_2_25: VALM_1_25 {
            align = "right";
            pos[] = {"LevelM25",{0.22,-0.085},1};
            right[] = {"LevelM25",{0.32,-0.085},1};
            down[] = {"LevelM25",{0.22,-0.035},1};
          };

          class LevelP25: Level0 {
            type = "line";
            points[] = {
              {"LevelP25",{-0.2,0.03},1},
              {"LevelP25",{-0.2,0},1},
              {"LevelP25",{-0.05,0},1},{},
              {"LevelP25",{0.05,0},1},
              {"LevelP25",{0.2,0},1},
              {"LevelP25",{0.2,0.03},1}
            };
          };

          class VALP_1_25 {
            type = "text";
            source = "static";
            text = "25";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP25",{-0.23,0.035},1};
            right[] = {"LevelP25",{-0.13,0.035},1};
            down[] = {"LevelP25",{-0.23,0.085},1};
          };

          class VALP_2_25: VALP_1_25 {
            align = "right";
            pos[] = {"LevelP25",{0.22,0.035},1};
            right[] = {"LevelP25",{0.32,0.035},1};
            down[] = {"LevelP25",{0.22,0.085},1};
          };

          class LevelM30: Level0 {
            type = "line";
            points[] = {
              {"LevelM30",{-0.2,-0.03},1},
              {"LevelM30",{-0.2,0},1},
              {"LevelM30",{-0.15,0},1},{},
              {"LevelM30",{-0.1,0},1},
              {"LevelM30",{-0.05,0},1},{},
              {"LevelM30",{0.05,0},1},
              {"LevelM30",{0.1,0},1},{},
              {"LevelM30",{0.15,0},1},
              {"LevelM30",{0.2,0},1},
              {"LevelM30",{0.2,-0.03},1}
            };
          };

          class VALM_1_30 {
            type = "text";
            source = "static";
            text = -30;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM30",{-0.23,-0.085},1};
            right[] = {"LevelM30",{-0.13,-0.085},1};
            down[] = {"LevelM30",{-0.23,-0.035},1};
          };

          class VALM_2_30: VALM_1_30 {
            align = "right";
            pos[] = {"LevelM30",{0.22,-0.085},1};
            right[] = {"LevelM30",{0.32,-0.085},1};
            down[] = {"LevelM30",{0.22,-0.035},1};
          };

          class LevelP30: Level0 {
            type = "line";
            points[] = {
              {"LevelP30",{-0.2,0.03},1},
              {"LevelP30",{-0.2,0},1},
              {"LevelP30",{-0.05,0},1},{},
              {"LevelP30",{0.05,0},1},
              {"LevelP30",{0.2,0},1},
              {"LevelP30",{0.2,0.03},1}
            };
          };

          class VALP_1_30 {
            type = "text";
            source = "static";
            text = "30";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP30",{-0.23,0.035},1};
            right[] = {"LevelP30",{-0.13,0.035},1};
            down[] = {"LevelP30",{-0.23,0.085},1};
          };

          class VALP_2_30: VALP_1_30 {
            align = "right";
            pos[] = {"LevelP30",{0.22,0.035},1};
            right[] = {"LevelP30",{0.32,0.035},1};
            down[] = {"LevelP30",{0.22,0.085},1};
          };

          class LevelM35: Level0 {
            type = "line";
            points[] = {
              {"LevelM35",{-0.2,-0.03},1},
              {"LevelM35",{-0.2,0},1},
              {"LevelM35",{-0.15,0},1},{},
              {"LevelM35",{-0.1,0},1},
              {"LevelM35",{-0.05,0},1},{},
              {"LevelM35",{0.05,0},1},
              {"LevelM35",{0.1,0},1},{},
              {"LevelM35",{0.15,0},1},
              {"LevelM35",{0.2,0},1},
              {"LevelM35",{0.2,-0.03},1}
            };
          };

          class VALM_1_35 {
            type = "text";
            source = "static";
            text = -35;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM35",{-0.23,-0.085},1};
            right[] = {"LevelM35",{-0.13,-0.085},1};
            down[] = {"LevelM35",{-0.23,-0.035},1};
          };

          class VALM_2_35: VALM_1_35 {
            align = "right";
            pos[] = {"LevelM35",{0.22,-0.085},1};
            right[] = {"LevelM35",{0.32,-0.085},1};
            down[] = {"LevelM35",{0.22,-0.035},1};
          };

          class LevelP35: Level0 {
            type = "line";
            points[] = {
              {"LevelP35",{-0.2,0.03},1},
              {"LevelP35",{-0.2,0},1},
              {"LevelP35",{-0.05,0},1},{},
              {"LevelP35",{0.05,0},1},
              {"LevelP35",{0.2,0},1},
              {"LevelP35",{0.2,0.03},1}
            };
          };

          class VALP_1_35 {
            type = "text";
            source = "static";
            text = "35";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP35",{-0.23,0.035},1};
            right[] = {"LevelP35",{-0.13,0.035},1};
            down[] = {"LevelP35",{-0.23,0.085},1};
          };

          class VALP_2_35: VALP_1_35 {
            align = "right";
            pos[] = {"LevelP35",{0.22,0.035},1};
            right[] = {"LevelP35",{0.32,0.035},1};
            down[] = {"LevelP35",{0.22,0.085},1};
          };

          class LevelM40: Level0 {
            type = "line";
            points[] = {
              {"LevelM40",{-0.2,-0.03},1},
              {"LevelM40",{-0.2,0},1},
              {"LevelM40",{-0.15,0},1},{},
              {"LevelM40",{-0.1,0},1},
              {"LevelM40",{-0.05,0},1},{},
              {"LevelM40",{0.05,0},1},
              {"LevelM40",{0.1,0},1},{},
              {"LevelM40",{0.15,0},1},
              {"LevelM40",{0.2,0},1},
              {"LevelM40",{0.2,-0.03},1}
            };
          };

          class VALM_1_40 {
            type = "text";
            source = "static";
            text = -40;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM40",{-0.23,-0.085},1};
            right[] = {"LevelM40",{-0.13,-0.085},1};
            down[] = {"LevelM40",{-0.23,-0.035},1};
          };

          class VALM_2_40: VALM_1_40 {
            align = "right";
            pos[] = {"LevelM40",{0.22,-0.085},1};
            right[] = {"LevelM40",{0.32,-0.085},1};
            down[] = {"LevelM40",{0.22,-0.035},1};
          };

          class LevelP40: Level0 {
            type = "line";
            points[] = {
              {"LevelP40",{-0.2,0.03},1},
              {"LevelP40",{-0.2,0},1},
              {"LevelP40",{-0.05,0},1},{},
              {"LevelP40",{0.05,0},1},
              {"LevelP40",{0.2,0},1},
              {"LevelP40",{0.2,0.03},1}
            };
          };

          class VALP_1_40 {
            type = "text";
            source = "static";
            text = "40";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP40",{-0.23,0.035},1};
            right[] = {"LevelP40",{-0.13,0.035},1};
            down[] = {"LevelP40",{-0.23,0.085},1};
          };

          class VALP_2_40: VALP_1_40 {
            align = "right";
            pos[] = {"LevelP40",{0.22,0.035},1};
            right[] = {"LevelP40",{0.32,0.035},1};
            down[] = {"LevelP40",{0.22,0.085},1};
          };

          class LevelM45: Level0 {
            type = "line";
            points[] = {
              {"LevelM45",{-0.2,-0.03},1},
              {"LevelM45",{-0.2,0},1},
              {"LevelM45",{-0.15,0},1},{},
              {"LevelM45",{-0.1,0},1},
              {"LevelM45",{-0.05,0},1},{},
              {"LevelM45",{0.05,0},1},
              {"LevelM45",{0.1,0},1},{},
              {"LevelM45",{0.15,0},1},
              {"LevelM45",{0.2,0},1},
              {"LevelM45",{0.2,-0.03},1}
            };
          };

          class VALM_1_45 {
            type = "text";
            source = "static";
            text = -45;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM45",{-0.23,-0.085},1};
            right[] = {"LevelM45",{-0.13,-0.085},1};
            down[] = {"LevelM45",{-0.23,-0.035},1};
          };

          class VALM_2_45: VALM_1_45 {
            align = "right";
            pos[] = {"LevelM45",{0.22,-0.085},1};
            right[] = {"LevelM45",{0.32,-0.085},1};
            down[] = {"LevelM45",{0.22,-0.035},1};
          };

          class LevelP45: Level0 {
            type = "line";
            points[] = {
              {"LevelP45",{-0.2,0.03},1},
              {"LevelP45",{-0.2,0},1},
              {"LevelP45",{-0.05,0},1},{},
              {"LevelP45",{0.05,0},1},
              {"LevelP45",{0.2,0},1},
              {"LevelP45",{0.2,0.03},1}
            };
          };

          class VALP_1_45 {
            type = "text";
            source = "static";
            text = "45";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP45",{-0.23,0.035},1};
            right[] = {"LevelP45",{-0.13,0.035},1};
            down[] = {"LevelP45",{-0.23,0.085},1};
          };

          class VALP_2_45: VALP_1_45 {
            align = "right";
            pos[] = {"LevelP45",{0.22,0.035},1};
            right[] = {"LevelP45",{0.32,0.035},1};
            down[] = {"LevelP45",{0.22,0.085},1};
          };

          class LevelM50: Level0 {
            type = "line";
            points[] = {
              {"LevelM50",{-0.2,-0.03},1},
              {"LevelM50",{-0.2,0},1},
              {"LevelM50",{-0.15,0},1},{},
              {"LevelM50",{-0.1,0},1},
              {"LevelM50",{-0.05,0},1},{},
              {"LevelM50",{0.05,0},1},
              {"LevelM50",{0.1,0},1},{},
              {"LevelM50",{0.15,0},1},
              {"LevelM50",{0.2,0},1},
              {"LevelM50",{0.2,-0.03},1}
            };
          };

          class VALM_1_50 {
            type = "text";
            source = "static";
            text = -50;
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelM50",{-0.23,-0.085},1};
            right[] = {"LevelM50",{-0.13,-0.085},1};
            down[] = {"LevelM50",{-0.23,-0.035},1};
          };

          class VALM_2_50: VALM_1_50 {
            align = "right";
            pos[] = {"LevelM50",{0.22,-0.085},1};
            right[] = {"LevelM50",{0.32,-0.085},1};
            down[] = {"LevelM50",{0.22,-0.035},1};
          };

          class LevelP50: Level0 {
            type = "line";
            points[] = {
              {"LevelP50",{-0.2,0.03},1},
              {"LevelP50",{-0.2,0},1},
              {"LevelP50",{-0.05,0},1},{},
              {"LevelP50",{0.05,0},1},
              {"LevelP50",{0.2,0},1},
              {"LevelP50",{0.2,0.03},1}
            };
          };

          class VALP_1_50 {
            type = "text";
            source = "static";
            text = "50";
            align = "left";
            scale = 1;
            sourceScale = 57.2958;
            pos[] = {"LevelP50",{-0.23,0.035},1};
            right[] = {"LevelP50",{-0.13,0.035},1};
            down[] = {"LevelP50",{-0.23,0.085},1};
          };

          class VALP_2_50: VALP_1_50 {
            align = "right";
            pos[] = {"LevelP50",{0.22,0.035},1};
            right[] = {"LevelP50",{0.32,0.035},1};
            down[] = {"LevelP50",{0.22,0.085},1};
          };
        };
      };

      class PlaneMovementCrosshair {
        clipTL[] = {0,1};
        clipBR[] = {1,0};
        type = "line";
        width = 6;
        points[] = {
          {"ForwardVec1",1,"Velocity",1,{"0 *2 /3","-0.02 *2 /3"},1},             
          {"ForwardVec1",1,"Velocity",1,{"0.0099999998 *2 /3","-0.01732 *2 /3"},1},             
          {"ForwardVec1",1,"Velocity",1,{"0.01732 *2 /3","-0.0099999998 *2 /3"},1},   
          {"ForwardVec1",1,"Velocity",1,{"0.02 *2 /3","0 *2 /3"},1},              
          {"ForwardVec1",1,"Velocity",1,{"0.01732 *2 /3","0.0099999998 *2 /3"},1},
          {"ForwardVec1",1,"Velocity",1,{"0.0099999998 *2 /3","0.01732 *2 /3"},1},              
          {"ForwardVec1",1,"Velocity",1,{"0 *2 /3","0.02 *2 /3"},1},              
          {"ForwardVec1",1,"Velocity",1,{"-0.0099999998 *2 /3","0.01732 *2 /3"},1},         
          {"ForwardVec1",1,"Velocity",1,{"-0.01732 *2 /3","0.0099999998 *2 /3"},1},             
          {"ForwardVec1",1,"Velocity",1,{"-0.02 *2 /3","0 *2 /3"},1},           
          {"ForwardVec1",1,"Velocity",1,{"-0.01732 *2 /3","-0.0099999998 *2 /3"},1},              
          {"ForwardVec1",1,"Velocity",1,{"-0.0099999998 *2 /3","-0.01732 *2 /3"},1},              
          {"ForwardVec1",1,"Velocity",1,{"0 *2 /3","-0.02 *2 /3"},1},{},
          {"ForwardVec1",1,"Velocity",1,{0.035,0},1},             
          {"ForwardVec1",1,"Velocity",1,{"0.02 *2 /3",0},1},{},
          {"ForwardVec1",1,"Velocity",1,{-0.035,0},1},              
          {"ForwardVec1",1,"Velocity",1,{"-0.02 *2 /3",0},1},{},             
          {"ForwardVec1",1,"Velocity",1,{0,"-0.039999999 *2 /3"},1},
          {"ForwardVec1",1,"Velocity",1,{0,"-0.02 *2 /3"},1}
        };
      };

      class RadarTargets {
        type = "radar";
        pos0[] = {0.5,0.32};
        pos10[] = {1.382,1.145};
        width = 2.5;
        points[] = {
          {"ForwardVec",1,"RadarContact",{-0.02,-0.02},1},
          {"ForwardVec",1,"RadarContact",{0.02,-0.02},1},
          {"ForwardVec",1,"RadarContact",{0.02,0.02},1},
          {"ForwardVec",1,"RadarContact",{-0.02,0.02},1},
          {"ForwardVec",1,"RadarContact",{-0.02,-0.02},1}
        };
      };

      class AA_target {
        condition = "AAmissile";
        class Target {
          type = "line";
          points[] = {
            /*{"TargetSelected",{ 0,"-0.08 + 0.2"},1},
            {"TargetSelected",{0.05,"-0.0696 + 0.2"},1},
            {"TargetSelected",{0.087,"-0.50*0.10/(1.5/1.2) + 0.2"},1},
            {"TargetSelected",{0.1,"0 + 0.2"},1},
            {"TargetSelected",{0.087,"0.04 + 0.2"},1},
            {"TargetSelected",{0.05,"+0.87*0.10/(1.5/1.2) + 0.2"},1},
            {"TargetSelected",{0,"0.08 + 0.2"},1},
            {"TargetSelected",{-0.05,"0.0696 + 0.2"},1},
            {"TargetSelected",{-0.087,"+0.50*0.10/(1.5/1.2) + 0.2"},1},
            {"TargetSelected",{-0.1,"0 + 0.2"},1},
            {"TargetSelected",{-0.087,"-0.04 + 0.2"},1},
            {"TargetSelected",{-0.05,"-0.87*0.10/(1.5/1.2) + 0.2"},1},
            {"TargetSelected",{0,"-0.08 + 0.2"},1}*/
            {"ForwardVec",1,"TargetSelected",1,{0,-0.02},1},
            {"ForwardVec",1,"TargetSelected",1,{0.0099999998,-0.01732},1},
            {"ForwardVec",1,"TargetSelected",1,{0.01732,-0.0099999998},1},
            {"ForwardVec",1,"TargetSelected",1,{0.02,0},1},
            {"ForwardVec",1,"TargetSelected",1,{0.01732,0.0099999998},1},
            {"ForwardVec",1,"TargetSelected",1,{0.0099999998,0.01732},1},
            {"ForwardVec",1,"TargetSelected",1,{0,0.02},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.0099999998,0.01732},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.01732,0.0099999998},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.02,0},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.01732,-0.0099999998},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.0099999998,-0.01732},1},
            {"ForwardVec",1,"TargetSelected",1,{0,-0.02},1}
          };
        };
      };

      class AG_target {
        condition = "ATmissile";
        class Target {
          type = "line";
          points[] = {
            /*{"TargetSelected",{0,"-0.08"},1},
            {"TargetSelected",{0.05,"-0.0696"},1},
            {"TargetSelected",{0.087,"-0.50*0.10/(1.5/1.2)"},1},
            {"TargetSelected",{0.1,"0"},1},
            {"TargetSelected",{0.087,"0.04"},1},
            {"TargetSelected",{0.05,"+0.87*0.10/(1.5/1.2)"},1},
            {"TargetSelected",{0,"0.08"},1},
            {"TargetSelected",{-0.05,"0.0696"},1},
            {"TargetSelected",{-0.087,"+0.50*0.10/(1.5/1.2)"},1},
            {"TargetSelected",{-0.1,"0"},1},
            {"TargetSelected",{-0.087,"-0.04"},1},
            {"TargetSelected",{-0.05,"-0.87*0.10/(1.5/1.2)"},1},
            {"TargetSelected",{0,"-0.08"},1},*/
            {"ForwardVec",1,"TargetSelected",1,{0,-0.02},1},
            {"ForwardVec",1,"TargetSelected",1,{0.0099999998,-0.01732},1},
            {"ForwardVec",1,"TargetSelected",1,{0.01732,-0.0099999998},1},
            {"ForwardVec",1,"TargetSelected",1,{0.02,0},1},
            {"ForwardVec",1,"TargetSelected",1,{0.01732,0.0099999998},1},
            {"ForwardVec",1,"TargetSelected",1,{0.0099999998,0.01732},1},
            {"ForwardVec",1,"TargetSelected",1,{0,0.02},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.0099999998,0.01732},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.01732,0.0099999998},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.02,0},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.01732,-0.0099999998},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.0099999998,-0.01732},1},
            {"ForwardVec",1,"TargetSelected",1,{0,-0.02},1},{},
            {"ForwardVec",1,"TargetSelected",1,{0,-0.02},1},
            {"ForwardVec",1,"TargetSelected",1,{0,-0.01},1},{},
            {"ForwardVec",1,"TargetSelected",1,{0,0.02},1},
            {"ForwardVec",1,"TargetSelected",1,{0,0.01},1},{},
            {"ForwardVec",1,"TargetSelected",1,{0.02,0},1},
            {"ForwardVec",1,"TargetSelected",1,{0.01,0},1},{},
            {"ForwardVec",1,"TargetSelected",1,{-0.02,0},1},
            {"ForwardVec",1,"TargetSelected",1,{-0.01,0},1}
          };
        };
      };

      class GUN_target {
        condition = "mgun";
        class Target {
          type = "line";
          width = 4;
          points[] = {
            //////////////////////////////////////////////// UP
            /*{"ForwardVec",1,"target",{ 0,-0.060},1},
            {"ForwardVec",1,"target",{ 0,-0.055},1},{},
            {"ForwardVec",1,"target",{ 0,-0.050},1},
            {"ForwardVec",1,"target",{ 0,-0.045},1},{},
            {"ForwardVec",1,"target",{ 0,-0.040},1},
            {"ForwardVec",1,"target",{ 0,-0.035},1},{},*/
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.030},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.025},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.020},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.015},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.010},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.005},1},{},
            //////////////////////////////////////////////// center
            {"ForwardVec",1,"TargetSelected",1,{ 0,0},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0},1},{},
            /////////////////////////////////////////////// DOWN
            /*{"ForwardVec",1,"target",{ 0,0.060},1},
            {"ForwardVec",1,"target",{ 0,0.055},1},{},
            {"ForwardVec",1,"target",{ 0,0.050},1},
            {"ForwardVec",1,"target",{ 0,0.045},1},{},
            {"ForwardVec",1,"target",{ 0,0.040},1},
            {"ForwardVec",1,"target",{ 0,0.035},1},{},*/
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.030},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.025},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.020},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.015},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.010},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.005},1},{},
            /////////////////////////////////////////////// LEFT
            /*{"ForwardVec",1,"target",{ -0.060, 0},1},
            {"ForwardVec",1,"target",{ -0.055, 0},1},{},
            {"ForwardVec",1,"target",{ -0.050, 0},1},
            {"ForwardVec",1,"target",{ -0.045, 0},1},{},
            {"ForwardVec",1,"target",{ -0.040, 0},1},
            {"ForwardVec",1,"target",{ -0.035, 0},1},{},*/
            {"ForwardVec",1,"TargetSelected",1,{ -0.030, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ -0.025, 0},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ -0.020, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ -0.015, 0},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ -0.010, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ -0.005, 0},1},{},
            /////////////////////////////////////////////// RIGHT
            /*{"ForwardVec",1,"target",{ 0.060, 0},1},
            {"ForwardVec",1,"target",{ 0.055, 0},1},{},
            {"ForwardVec",1,"target",{ 0.050, 0},1},
            {"ForwardVec",1,"target",{ 0.045, 0},1},{},
            {"ForwardVec",1,"target",{ 0.040, 0},1},
            {"ForwardVec",1,"target",{ 0.035, 0},1},{},*/
            {"ForwardVec",1,"TargetSelected",1,{ 0.030, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0.025, 0},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0.020, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0.015, 0},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0.010, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0.005, 0},1},{}
          };
        };
      };

      class Rocket_target {
        condition = "rocket";
        class Target {
          type = "line";
          width = 4;
          points[] = {
            //////////////////////////////////////////////// UP
            /*{"ForwardVec",1,"target",{ 0,-0.060},1},
            {"ForwardVec",1,"target",{ 0,-0.055},1},{},
            {"ForwardVec",1,"target",{ 0,-0.050},1},
            {"ForwardVec",1,"target",{ 0,-0.045},1},{},
            {"ForwardVec",1,"target",{ 0,-0.040},1},
            {"ForwardVec",1,"target",{ 0,-0.035},1},{},*/
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.030},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.025},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.020},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.015},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.010},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,-0.005},1},{},
            //////////////////////////////////////////////// center
            {"ForwardVec",1,"TargetSelected",1,{ 0,0},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0},1},{},
            /////////////////////////////////////////////// DOWN
            /*{"ForwardVec",1,"target",{ 0,0.060},1},
            {"ForwardVec",1,"target",{ 0,0.055},1},{},
            {"ForwardVec",1,"target",{ 0,0.050},1},
            {"ForwardVec",1,"target",{ 0,0.045},1},{},
            {"ForwardVec",1,"target",{ 0,0.040},1},
            {"ForwardVec",1,"target",{ 0,0.035},1},{},*/
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.030},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.025},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.020},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.015},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.010},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0,0.005},1},{},
            /////////////////////////////////////////////// LEFT
            /*{"ForwardVec",1,"target",{ -0.060, 0},1},
            {"ForwardVec",1,"target",{ -0.055, 0},1},{},
            {"ForwardVec",1,"target",{ -0.050, 0},1},
            {"ForwardVec",1,"target",{ -0.045, 0},1},{},
            {"ForwardVec",1,"target",{ -0.040, 0},1},
            {"ForwardVec",1,"target",{ -0.035, 0},1},{},*/
            {"ForwardVec",1,"TargetSelected",1,{ -0.030, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ -0.025, 0},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ -0.020, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ -0.015, 0},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ -0.010, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ -0.005, 0},1},{},
            /////////////////////////////////////////////// RIGHT
            /*{"ForwardVec",1,"target",{ 0.060, 0},1},
            {"ForwardVec",1,"target",{ 0.055, 0},1},{},
            {"ForwardVec",1,"target",{ 0.050, 0},1},
            {"ForwardVec",1,"target",{ 0.045, 0},1},{},
            {"ForwardVec",1,"target",{ 0.040, 0},1},
            {"ForwardVec",1,"target",{ 0.035, 0},1},{},*/
            {"ForwardVec",1,"TargetSelected",1,{ 0.030, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0.025, 0},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0.020, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0.015, 0},1},{},
            {"ForwardVec",1,"TargetSelected",1,{ 0.010, 0},1},
            {"ForwardVec",1,"TargetSelected",1,{ 0.005, 0},1},{}
          };
        };
      };

      class GunCross {
        type = "group";
        condition = "mgun";
        class CCIP_circle {
          type = "line";
          width = 5;
          points[] = {
            {"ForwardVec",1,"WeaponAimGUN",1,{"-1.2000 * 0.06","-0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-1.0000 * 0.06","-0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.9877 * 0.06","-0.1736 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.9397 * 0.06","-0.3420 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.8660 * 0.06","-0.5000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.7660 * 0.06","-0.6428 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.6428 * 0.06","-0.7660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.5000 * 0.06","-0.8660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.3420 * 0.06","-0.9397 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.1736 * 0.06","-0.9877 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.0000 * 0.06","-1.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.1736 * 0.06","-0.9877 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.3420 * 0.06","-0.9397 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.5000 * 0.06","-0.8660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.6428 * 0.06","-0.7660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.7660 * 0.06","-0.6428 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.8660 * 0.06","-0.5000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.9397 * 0.06","-0.3420 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.9877 * 0.06","-0.1736 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"1.0000 * 0.06","-0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"1.2000 * 0.06","-0.0000 * 0.06"},1},{},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-1.2000 * 0.06","0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-1.0000 * 0.06","0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.9877 * 0.06","0.1736 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.9397 * 0.06","0.3420 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.8660 * 0.06","0.5000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.7660 * 0.06","0.6428 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.6428 * 0.06","0.7660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.5000 * 0.06","0.8660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.3420 * 0.06","0.9397 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.1736 * 0.06","0.9877 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.0000 * 0.06","1.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.1736 * 0.06","0.9877 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.3420 * 0.06","0.9397 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.5000 * 0.06","0.8660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.6428 * 0.06","0.7660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.7660 * 0.06","0.6428 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.8660 * 0.06","0.5000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.9397 * 0.06","0.3420 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"0.9877 * 0.06","0.1736 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"1.0000 * 0.06","0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"1.2000 * 0.06","0.0000 * 0.06"},1},{},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.0000 * 0.06","-1.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.0000 * 0.06","-1.2000 * 0.06"},1},{},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.0000 * 0.06","1.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{"-0.0000 * 0.06","1.2000 * 0.06"},1},{},
            {"ForwardVec",1,"WeaponAimGUN",1,{ 0.005,0},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{ -0.005,0},1},{},
            {"ForwardVec",1,"WeaponAimGUN",1,{ 0,0.005},1},
            {"ForwardVec",1,"WeaponAimGUN",1,{ 0,-0.005},1}
          };
        };
      };

      class RocketCross {
        type = "group";
        condition = "rocket";
        class CCIP_circle {
          type = "line";
          width = 5;
          points[] = {
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-1.2000 * 0.06","-0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-1.0000 * 0.06","-0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.9877 * 0.06","-0.1736 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.9397 * 0.06","-0.3420 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.8660 * 0.06","-0.5000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.7660 * 0.06","-0.6428 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.6428 * 0.06","-0.7660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.5000 * 0.06","-0.8660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.3420 * 0.06","-0.9397 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.1736 * 0.06","-0.9877 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.0000 * 0.06","-1.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.1736 * 0.06","-0.9877 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.3420 * 0.06","-0.9397 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.5000 * 0.06","-0.8660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.6428 * 0.06","-0.7660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.7660 * 0.06","-0.6428 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.8660 * 0.06","-0.5000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.9397 * 0.06","-0.3420 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.9877 * 0.06","-0.1736 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"1.0000 * 0.06","-0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"1.2000 * 0.06","-0.0000 * 0.06"},1},{},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-1.2000 * 0.06","0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-1.0000 * 0.06","0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.9877 * 0.06","0.1736 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.9397 * 0.06","0.3420 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.8660 * 0.06","0.5000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.7660 * 0.06","0.6428 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.6428 * 0.06","0.7660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.5000 * 0.06","0.8660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.3420 * 0.06","0.9397 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.1736 * 0.06","0.9877 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.0000 * 0.06","1.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.1736 * 0.06","0.9877 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.3420 * 0.06","0.9397 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.5000 * 0.06","0.8660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.6428 * 0.06","0.7660 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.7660 * 0.06","0.6428 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.8660 * 0.06","0.5000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.9397 * 0.06","0.3420 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"0.9877 * 0.06","0.1736 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"1.0000 * 0.06","0.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"1.2000 * 0.06","0.0000 * 0.06"},1},{},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.0000 * 0.06","-1.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.0000 * 0.06","-1.2000 * 0.06"},1},{},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.0000 * 0.06","1.0000 * 0.06"},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{"-0.0000 * 0.06","1.2000 * 0.06"},1},{},
            {"ForwardVec",1,"WeaponAimROCKET",1,{ 0.005,0},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{ -0.005,0},1},{},
            {"ForwardVec",1,"WeaponAimROCKET",1,{ 0,0.005},1},
            {"ForwardVec",1,"WeaponAimROCKET",1,{ 0,-0.005},1}
          };
        };
      };

      class AC_Centerline {
        type = "group";
        condition = "on";
        class RockCross {
          type = "line";
          width = 4;
          points[] = {
            {"ForwardVec",1,{" -0.006 + 0.5","0 + 0.32"},1},
            {"ForwardVec",1,{" 0.006 + 0.5","0 + 0.32"},1},{},
            {"ForwardVec",1,{" -0.0 + 0.5","0.006 + 0.32"},1},
            {"ForwardVec",1,{" 0.0 + 0.5","-0.006 + 0.32"},1}
          };
        };
      };

      class ATMissileTOFGroup {
        condition = "ATmissile";
        type = "group";
        class TOFtext {
          type = "text";
          align = "right";
          source = "static";
          text = "TOF=";
          scale = 1;
          pos[] = {{0.15,0.62},1};
          right[] = {{0.19,0.62},1};
          down[] = {{0.15,0.66},1};
        };

        class TOFnumber {
          type = "text";
          source = "targetDist";
          sourcescale = 0.0025;
          align = "right";
          scale = 1;
          pos[] = {{0.23,0.62},1};
          right[] = {{0.27,0.62},1};
          down[] = {{0.23,0.66},1};
        };
      };

      class BombTOFGroup {
        condition = "Bomb";
        type = "group";
        class Crosshairs {
          type = "line";
          width = 7;
          points[] = {
            {{"0 + 0.5","-0.02 + 0.5"},1},
            {{"0.0099999998 + 0.5","-0.01732 + 0.5"},1},
            {{"0.01732 + 0.5","-0.0099999998 + 0.5"},1},
            {{"0.02 + 0.5","0 + 0.5"},1},
            {{"0.01732 + 0.5","0.0099999998 + 0.5"},1},
            {{"0.0099999998 + 0.5","0.01732 + 0.5"},1},
            {{"0 + 0.5","0.02 + 0.5"},1},
            {{"-0.0099999998 + 0.5","0.01732 + 0.5"},1},
            {{"-0.01732 + 0.5","0.0099999998 + 0.5"},1},
            {{"-0.02 + 0.5","0 + 0.5"},1},
            {{"-0.01732 + 0.5","-0.0099999998 + 0.5"},1},
            {{"-0.0099999998 + 0.5","-0.01732 + 0.5"},1},
            {{"0 + 0.5","-0.02 + 0.5"},1},{},
            {{" -0.005 + 0.5","0 + 0.5"},1},
            {{" 0.005 + 0.5","0 + 0.5"},1},{},
            {{" -0.00 + 0.5","-0.005 + 0.5"},1},
            {{" 0.00 + 0.5","0.005 + 0.5"},1}
          };
        };

      /*class Target_Line_LGB {
          type = "line";
          width = 5;
          points[] = {
            {"TargetSelected",{0,0},1},
            {"Velocity",{0,0},1}
          };
        };*/

        class Target_SPI_LGB {
          type = "line";
          width = 3;
          points[] = {
            {"TargetSelected",{0,0},1},
            {"TargetSelected",{0,-0.05},1}
          };
        };

        class TOFtext {
          type = "text";
          align = "right";
          source = "static";
          text = "TOF=";
          scale = 1;
          pos[] = {{0.15,0.62},1};
          right[] = {{0.19,0.62},1};
          down[] = {{0.15,0.66},1};
        };

        class TOFnumber {
          type = "text";
          source = "altitudeASL";
          sourcescale = 0.013;
          align = "right";
          scale = 1;
          pos[] = {{0.23,0.62},1};
          right[] = {{0.27,0.62},1};
          down[] = {{0.23,0.66},1};
        };

      };

      class ILS_Bars {
        condition = "ils";
        class Glideslope {
          clipTL[] = {0,0};
          clipBR[] = {1,1};
          class ILS {
            type = "line";
            width = 2.5;
            points[] = {
              {"ForwardVec",1,"ILS_W",1,{-0.2,0},1},
              {"ForwardVec",1,"ILS_W",1,{0.2,0},1},{},
              {"ForwardVec",1,"ILS_W",1,{0,0.02},1},
              {"ForwardVec",1,"ILS_W",1,{0,-0.02},1},{},
              {"ForwardVec",1,"ILS_W",1,{0.1,0.02},1},
              {"ForwardVec",1,"ILS_W",1,{0.1,-0.02},1},{},
              {"ForwardVec",1,"ILS_W",1,{0.2,0.02},1},
              {"ForwardVec",1,"ILS_W",1,{0.2,-0.02},1},{},
              {"ForwardVec",1,"ILS_W",1,{-0.1,0.02},1},
              {"ForwardVec",1,"ILS_W",1,{-0.1,-0.02},1},{},
              {"ForwardVec",1,"ILS_W",1,{-0.2,0.02},1},
              {"ForwardVec",1,"ILS_W",1,{-0.2,-0.02},1},{},
              {"ForwardVec",1,"ILS_H",1,{0,-0.2},1},
              {"ForwardVec",1,"ILS_H",1,{0,0.2},1},{},
              {"ForwardVec",1,"ILS_H",1,{0.02,0},1},
              {"ForwardVec",1,"ILS_H",1,{-0.02,0},1},{},
              {"ForwardVec",1,"ILS_H",1,{0.02,0.1},1},
              {"ForwardVec",1,"ILS_H",1,{-0.02,0.1},1},{},
              {"ForwardVec",1,"ILS_H",1,{0.02,0.2},1},
              {"ForwardVec",1,"ILS_H",1,{-0.02,0.2},1},{},
              {"ForwardVec",1,"ILS_H",1,{0.02,-0.1},1},
              {"ForwardVec",1,"ILS_H",1,{-0.02,-0.1},1},{},
              {"ForwardVec",1,"ILS_H",1,{0.02,-0.2},1},
              {"ForwardVec",1,"ILS_H",1,{-0.02,-0.2},1},{}
            };
          };
        };
      };
    };
  };
};
