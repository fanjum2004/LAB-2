# Forest Clearing — 2D Godot Scene

A small 2D scene of a sunny forest clearing, built in Godot 4.

A sky-and-ground background sets the setting, with a character standing in
the middle of the clearing. Scattered around them are several trees and
rocks — each built as its own small reusable scene and then placed multiple
times to fill out the forest.

**In the scene:**
- Background sprite (sky + grassy ground)
- Character sprite standing in the clearing
- 4 trees, each an instance of a shared `Tree.tscn` scene
- 3 rocks, each an instance of a shared `Rock.tscn` scene

## Character script

`scripts/character.gd` is attached to the Character node. It has an exported
`speed` variable (editable in the Inspector), uses `if` statements to
decide how the character moves, and reads the keyboard with `Input`.

**Controls:** arrow keys to move.
