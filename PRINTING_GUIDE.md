# 3D Printing & Assembly Guide (Individual Single-Part Files)

Every component is now **separated into its own dedicated, numbered file**. 

Each file prints a **single object** (or matched pair) centered right in the middle of your print bed at **$Z = 0.00\text{ mm}$**. No crowded plates, no risk of a failure on one part ruining others, and **ZERO supports required** on any part!

---

## 🖨️ Step-by-Step Print Queue

| Step | File | What It Prints | Recommended Color | Slicer Infill | Est. Print Time |
| :---: | :--- | :--- | :--- | :---: | :---: |
| **01** | [`01_gondola_cabin.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/01_gondola_cabin.scad) | Alpine Cabin Body | Festive Red / Alpine Green | 15–20% | ~35–45 min |
| **02** | [`02_cabin_roof.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/02_cabin_roof.scad) | Cabin Roof with Clevis | White / Snow / Dark Red | 15–20% | ~20–30 min |
| **03** | [`03_hanger_arm.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/03_hanger_arm.scad) | Flat C-Hanger Arm | Silver / Black / White | 100% | ~12–18 min |
| **04** | [`04_trolley_carriage.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/04_trolley_carriage.scad) | Inverted U-Chassis | Black / Dark Gray | 30% | ~20–25 min |
| **05** | [`05_trolley_wheels_pair.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/05_trolley_wheels_pair.scad) | Pair of Grooved Rollers | Gold / Yellow / Bronze | 100% | ~15–20 min |
| **06** | [`06_tower_head_station_a.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/06_tower_head_station_a.scad) | Drive Tower Head A | Forest Green / Black | 30% | ~30–40 min |
| **07** | [`07_tower_head_station_b.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/07_tower_head_station_b.scad) | Tension Tower Head B | Forest Green / Black | 30% | ~30–40 min |
| **08** | [`08_tower_sheaves_pair.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/08_tower_sheaves_pair.scad) | Pair of 54mm Sheaves | Gold / Silver | 30% | ~30–40 min |
| **09** | [`09_tower_base.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/09_tower_base.scad) | 110mm Baseplate *(Print 2x)* | Dark Slate / White | 20% | ~35–45 min each |
| **10** | [`10_tower_mast.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/10_tower_mast.scad) | Alpine Tower Mast Column *(Print 2x)* | Dark Green / Silver / White | 25% | ~60–75 min each |

---

## 🛠️ Assembly Instructions

### 1. Vehicle Assembly (Steps 01 – 05)
1. **Trolley Rollers:** Drop two M3 locknuts into the captive hex pockets of the **Trolley Carriage** (`04`). Place the **2 Wheels** (`05`) into the channel and insert M3 $\times$ 16mm screws. Tighten until snug; check that wheels spin freely.
2. **Cabin Body & Roof:** Snap the **Roof** (`02`) onto the **Cabin Body** (`01`). The front alignment key ensures it only snaps on in the forward orientation.
3. **Attach Hanger Arm:** Drop an M3 nut into the captive pocket on the roof clevis. Slide the lower tab of the **C-Hanger Arm** (`03`) into the slot and push an M3 $\times$ 16mm screw through.
4. **Hang on Carriage:** Drop an M3 nut into the lower clevis of the **Trolley Carriage** (`04`). Slide the top eyelet of the **Hanger Arm** (`03`) into the fork and secure with an M3 $\times$ 16mm screw.

### 2. Towers & Rigging (Steps 06 – 10)
1. **Tower Masts:** You can 3D print the authentic Alpine masts using **[`10_tower_mast.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/10_tower_mast.scad)** (fits directly in the FLSUN T1 at 228mm height with stiffening ribs and internal wire channels), or use standard 20mm (3/4") wooden dowels / PVC pipes.
2. **Mount Heads & Bases:** Push the bottom tenon of each mast into a **Tower Base** (`09`), and push **Station A** (`06`) and **Station B** (`07`) onto the top tenons. Insert M4 screws into the cross-pin holes to lock firmly against cable pull.
3. **Mount Sheaves:** Bolt one 54mm **Sheave Wheel** (`08`) onto each tower head using M5 $\times$ 25mm bolts and locknuts.
4. **Rigging:** String 1.0–1.5mm monofilament or nylon-coated wire across the sheaves and thread through the gondola trolley.
5. **Tensioning:** Tighten the tensioning bolt on Station B until line sag disappears, and glide your gondola across!

---

## 🔩 Complete Fastener Checklist

| Location | Fastener | Nut | Purpose |
| :--- | :--- | :--- | :--- |
| **Trolley Wheels** | 2x M3 $\times$ 16mm | 2x M3 Locknut (Captive) | Roller axles |
| **Trolley &rarr; Hanger** | 1x M3 $\times$ 16mm | 1x M3 Locknut (Captive) | Top hanger pivot |
| **Roof &rarr; Hanger** | 1x M3 $\times$ 16mm | 1x M3 Locknut (Captive) | Bottom hanger lock |
| **Tower Sheaves** | 2x M5 $\times$ 25mm | 2x M5 Locknut | Sheave wheel axles |
| **Station B Tensioner** | 1x M4 $\times$ 35mm | (Threads directly) | Cable tension adjuster |

---

## 👁️ Visual 3D Preview
Open [`models/full_system_preview.scad`](file:///Volumes/Samsung%20990%201TB/Hari/gandola/models/full_system_preview.scad) in OpenSCAD and press **`F5`** anytime to view the complete setup assembled.
