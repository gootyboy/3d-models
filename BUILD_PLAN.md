# Christmas Cable Car / Gondola System: 2-Phase Build Plan

A modular holiday gondola system designed in two distinct phases:
* **Phase 1**: Static / Manual Mechanical Assembly (3D printing the towers, gondola, trolley, and rigging the cable with pre-engineered motor mounts).
* **Phase 2**: Motorization & Automation (adding motor, controller, sensors, and firmware for automated back-and-forth travel).

---

## Phase 1: Static & Mechanical Foundation (Zero Electronics)

The goal of Phase 1 is to get a working, stable cable car suspended between two towers that can be positioned or manually glided across the line, while including all mounting provisions for future motorization.

```
[Tower A (Drive Ready)]                                          [Tower B (Tension Station)]
+-----------------------+                                        +-----------------------+
| - Pre-drilled motor   |==== Track Cable (Fixed Carrier) =====>>| - Bearing Idler Sheave|
|   mount (NEMA17 / DC) |                 \                      | - Screw / Spring      |
| - Bearing Sheave Axle |                  \---> [Gondola &      |   Tensioner           |
| - Weighted Base       |                         Trolley]       | - Weighted Base       |
+-----------------------+                                        +-----------------------+
```

### 1.1 Components to 3D Print (Phase 1)
1. **Gondola Cabin & Hanger**:
   * Alpine / Christmas style cabin (windows, holiday trim).
   * Detachable roof (easy access for interior decorating, miniature passengers, or mini battery tea light).
   * Rigid vertical hanger arm connecting cabin to trolley.
2. **Trolley Carriage (100% 3D-Printed, No Bearings)**:
   * Rides on top of the track cable.
   * Houses 2 grooved roller wheels 3D-printed with smooth integrated bushings.
   * Spins freely on standard M3/M4 screws or 3D-printed snap pins (lubricated with a drop of wax, mineral oil, or dry PTFE).
   * Built-in tie-off point / clamp slot ready to grip the future Phase 2 drive line.
3. **Tower A (Drive-Ready Station)**:
   * Upper head designed with standard NEMA 17 (31mm bolt spacing) or 25mm DC motor faceplate bolt pattern.
   * Phase 1 configuration: Holds a 3D-printed sheave wheel spinning on an M3/M4 axle screw.
4. **Tower B (Tensioning Station)**:
   * Upper head equipped with a slide-track or screw-tensioned 3D-printed sheave wheel.
   * Keeps track line taut to eliminate gondola sag.
5. **Tower Structures & Bases**:
   * Modular lattice truss sections, or 3D-printed sockets fitted to standard wooden dowels (1/2" or 3/4" / 12-19mm) for rigid, customizable tower height.
   * Wide, weighted baseplate (can be held down with decorative weights, bookends, or C-clamps).

### 1.2 Phase 1 Bill of Materials (Minimal Hardware)
* **Cables**: 1.0–1.5 mm nylon-coated wire rope or 50–80 lb monofilament fishing line.
* **Axles & Fasteners**: Standard M3 or M4 machine screws with locknuts (or 3D-printed pins).
* **Bearings**: **None required!** All wheels and pulleys are 100% 3D printed.
* **Filament**: PLA or PETG (festive colors: red, green, white, or silver).

### 1.3 Phase 1 Milestones
- [ ] Finalize target span distance and tower height.
- [ ] Select or model the 3D components (Tower heads, trolley carriage, cabin).
- [ ] 3D print Phase 1 parts.
- [ ] Assemble towers and test cable tensioning.
- [ ] Hang gondola on the line, verify smooth roll, balance, and visual appeal.

---

## Phase 2: Motorization & Automation (Back-and-Forth Shuttle)

Once the physical system looks great and rolls smoothly, Phase 2 brings it to life with zero structural redesign.

```
[Tower A]                                                        [Tower B]
+-----------------------+                                        +-----------------------+
| [NEMA17 / DC Motor]   |==== Haul Cable Loop (Braided Line) ===>>| [Idler Sheave]        |
| [TMC2209 Driver]      |----------------------------------------|                       |
| [ESP32 / Arduino]     |==== Track Cable (Fixed Carrier) =====>>|                       |
| [Limit Switch A]      |                  \                     | [Limit Switch B]      |
+-----------------------+                   \---> [Trolley Clamp]|+-----------------------+
```

### 2.1 Added Hardware & Electronics
1. **Actuator**: NEMA 17 stepper motor (drop-in mount onto Tower A head) or 12V 30–60 RPM DC gearmotor.
2. **Motor Driver**: TMC2208/2209 (whisper-quiet stepping) or DRV8833/L298N for DC.
3. **Controller**: ESP32 (adds Wi-Fi / smart home automation) or Arduino Nano.
4. **Drive Line**: Braided fishing line (Dyneema 80–100 lb) looped around drive sheave and idler sheave, clamped to the trolley carriage.
5. **Endstops / Sensors**: Microswitches or Hall-effect magnetic sensors on Tower A and Tower B.
6. **Power Supply**: 12V 2A DC adapter + 5V buck converter.

### 2.2 Phase 2 Automation Logic
* Smooth acceleration ramp out of Tower A.
* Constant cruising speed (approx. 10–15 cm/s).
* Deceleration ramp and soft stop at Tower B.
* Configurable dwell time (e.g., 5–15 second pause at the station).
* Reverse direction back to Tower A.
