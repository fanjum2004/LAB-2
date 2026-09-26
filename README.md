# Forest Clearing — 2D Godot Project

A small 2D scene built in Godot 4: a sunny forest clearing with a background,
a character, and a handful of trees and rocks scattered around as reusable
scene instances.

![Godot](https://img.shields.io/badge/Godot-4.x-478cbf?logo=godot-engine&logoColor=white)

## What's in the scene

- **Sky & ground background** — one large `Sprite2D` (`assets/sky_ground.png`)
- **Character** — a second, different `Sprite2D` (`assets/character.png`) standing in the clearing
- **A forest** made of two small reusable sub-scenes, each instanced multiple times:
  - `scenes/Tree.tscn` → instanced 4 times (`Tree1`–`Tree4`)
  - `scenes/Rock.tscn` → instanced 3 times (`Rock1`–`Rock3`)

  Each instance has its own position (and a slightly different scale on a
  few of them), but they all come from the same two source scenes — edit
  `Tree.tscn` once and every tree in `Main.tscn` updates.

All artwork is placeholder art generated for this project (simple shapes),
so there are no licensing concerns with the images.

## Project structure

```
ForestScene/
├── project.godot          # Godot project file (run/main_scene = Main.tscn)
├── icon.svg               # project icon
├── scenes/
│   ├── Main.tscn           # the main scene
│   ├── Tree.tscn           # reusable tree sub-scene
│   └── Rock.tscn           # reusable rock sub-scene
└── assets/
    ├── sky_ground.png      # background sprite
    ├── character.png       # character sprite
    ├── tree.png            # texture used by Tree.tscn
    └── rock.png            # texture used by Rock.tscn
```

## How to open & run it

1. Install [Godot 4.x](https://godotengine.org/download) (this was built against 4.3, but any 4.x version should open it fine).
2. Open Godot, click **Import**, and select the `project.godot` file in this folder.
3. Once the project opens, press **F5** (or the ▶ Play button) — it will run `scenes/Main.tscn` automatically since it's set as the main scene in Project Settings.

## Assignment checklist

- [x] A main scene (`scenes/Main.tscn`)
- [x] 2 different sprites (background + character, two different image files)
- [x] Nested scenes — 7 total instances of two reusable sub-scenes (4 trees + 3 rocks)
- [x] Pushed to GitHub

## Notes / things worth understanding (starter notes — personalize with your own!)

This section is meant to be *your* reflection, so treat the points below as a
starting draft to edit, not a final answer — swap in whatever actually
tripped you up or surprised you while you were poking around the project.

- **Scenes vs. nodes.** A *node* is a single item in the tree (a sprite, a
  timer, etc). A *scene* is just a saved node tree that you can reuse — that's
  what makes `Tree.tscn` "a tree" and also makes it droppable into another
  scene as one unit.
- **Why instancing is powerful.** `Tree1`–`Tree4` are all instances of the
  *same* `Tree.tscn` file. Each one can be repositioned/rescaled
  independently, but if you open `Tree.tscn` and change the trunk color or
  add a shadow, every tree in `Main.tscn` picks up the change automatically.
- **Sprite2D is centered by default**, so a node's `position` is its visual
  center, not its top-left corner — that mattered when lining the trees and
  rocks up so they look "planted" on the ground band instead of floating.
- **Questions to dig into next:**
  - How would you give the trees/rocks `CollisionShape2D`s so the character
    can't walk through them?
  - How would `z_index` or Y-sorting change the draw order if the character
    needed to walk *behind* a tree instead of always in front of it?
  - What's the cleanest way to scatter many more instances (say, 30 trees)
    without placing each one by hand — a script that instances `Tree.tscn`
    in a loop at randomized positions?
