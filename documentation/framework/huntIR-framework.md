---
layout: wiki
title: HuntIR Framework
description: Explains how to add HuntIR support to your weapons.
group: framework
order: 5
parent: wiki
---

## 1. Config Values

```c++
class CfgWeapons {
  class MyRifle {
      class MyGL: UGL_F {
          magazines[] = {
              // All default UGL magazines
              "MyFirstMag",
              "MySecondMag",
              "MyLastMag",
              // HUntIR magazine
              "ACE_HuntIR_M203"
          };
      };  
  };
};
```
