ace_trenches
=================

Adds item 'ACE_entrenchingtool'
Adds 2 trenches; Envelope - Small & Envelop - Big

### Whitelist surfaces for digging
Single surfaces can be whitelisted by adding `ACE_canDig = 1` into `CfgSurfaces`.
Example:
```cpp
class CfgSurfaces {
    class myAwesomeSurface {
        ACE_canDig = 1;
    };
};
```

