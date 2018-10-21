---
layout: wiki
title: Weather
description: The Weather module overrides the mission/editor weather setting with a synchronized realistic weather simulation.
group: feature
category: realism
parent: wiki
mod: ace
version:
  major: 3
  minor: 0
  patch: 0
---

## 1. Overview

ACE3 Weather extends the existing weather by temperature, humidity and air pressure according to the geographic location, season and time of day. It also ensures that all players experience the same weather effects.

## 2. Usage

### 2.1 Wind info
- Wind info is toggled on/off using <kbd>SHIFT</kbd> + <kbd>K</kbd>.
- The arrow representing wind info is based on [Beaufort scale](http://en.wikipedia.org/wiki/Beaufort_scale#Modern_scale)

## 3. Dependencies

{% include dependencies_list.md component="weather" %}
