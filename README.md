# TP-Core

Event-driven framework for Minecraft Java data packs (custom items, blocks, settings, player events). Nothing runs on `minecraft:tick`; work starts from advancements and `schedule` and stops when idle.

- **Requires:** Minecraft Java **26.3** (data pack format 121). Self-testing the pack headless needs Java 25.
- **Status:** v2 rewrite. Checked on a headless 26.3 server (`/function tp_core:test/run` → `[tp_core test] PASS`). Behaviour that needs a real player (right-click, placing, settings dialog, sprint/slot events, relog) is **not verified in-game yet**.
- **Install:** put the folder (or zip) in `<world>/datapacks/`, `/reload`.

## How content packs hook in
Append your function ids to these tags (in your own pack, `replace: false`):

| Tag | When |
|-----|------|
| `#tp_core:register` | every load/`/reload`: call `item/register`, `block/register`, `setting/register`, `loop/register` here |
| `#tp_core:event/load` | after registration on every load |
| `#tp_core:event/player/{first_join,join,respawn,changed_dimension}` | player events (as the player) |
| `#tp_core:event/player/<what>_start` and `_end` | `track` edges: `sprint`, `sneak`, `slot0`…`slot8` (end = the state stopped; it re-arms the next start by itself) |
| `#tp_core:event/item/{use,consume,place,equip}` | any custom item event (as the player; id in `storage tp_core:item cur.id`) |
| `#tp_core:event/setting/changed` | a setting changed (`storage tp_core:setting changed {id,value,scope}`) |

## API
Macro functions take their arguments as a compound, e.g. `function tp_core:queue/after {delay:20,fn:"ns:path"}`.

| Area | Functions |
|------|-----------|
| Queue | `queue/after {delay,fn}` (as server), `queue/after_self {delay,fn}` (as the calling player, found by id), `queue/push {delay,fn,as,data}` |
| Loops | `loop/register {name,fn,interval,type}`, `loop/join {loop}` / `loop/leave {loop}` (as the member). `fn` runs as+at each member every `interval` ticks; the pulse stops when no loop has members |
| Items | `item/register {id,on_use,on_consume,on_place,on_equip}`, `item/give {id}` (as the player). An item is a loot table `<ns>:item/<name>` whose `custom_data.tp_core.id` is that same id; see `data/tp_core/loot_table/item/test_wand.json` |
| Blocks | `block/register {id,base,drop,light,pistons,on_place,on_break,on_tick}` (`drop`: item the base drops, `""` = base, `"none"`; `light`: display brightness 0–15; `pistons`: 1 = remove the copy a directly adjacent piston or sticky piston moved): also registers the item. A placed item becomes `base` plus an `item_display`; breaking the base block fires `on_break` and drops the item. `base` must not be in `#tp_core:passable` and should be a block entity that drops itself (e.g. `blast_furnace`, `chest`): pistons cannot move those, and the vanilla drop next to a broken block is removed. Stone-like bases can be pushed or drop something else, which duplicates. |
| Settings | `setting/pack {id,name}` once per content pack, then `setting/register {pack,id,label,default,scope}` (on/off; `scope` `"player"` or `"global"`; see *Settings* below), `setting/get {id}` (0/1, either scope), `setting/set {id,value}` (as the player, player scope), `setting/gset {id,value}` (global scope, no player needed) |
| Equipment | `equipment/save`, `clear`, `restore` (as the player); tag `tp_core.equipment.stored` while a save exists |
| Track | `track/enable {what}`, `track/disable {what}`, `track/rearm {what}` (opt-in sprint/sneak/hotbar-slot start and end events; `rearm` only forces a reset) |
| Utils | `ray/cast {range,step,fn}` (fn stops it with `scoreboard players set #r.stop tp_core.tmp 1`), block tags `#tp_core:{air,passable,liquid,carpets,slabs,stairs,half_block,dig,transparent}`, predicates `tp_core:chance/{5,10,20,50}` (percent) |

## Settings
Every content pack registers itself and its options in a `#tp_core:register` function:
```
function tp_core:setting/pack {id:"my_pack",name:"My Pack"}
function tp_core:setting/register {pack:"my_pack",id:"my_pack:wall_run",label:"Wall running",default:1,scope:"player"}
function tp_core:setting/register {pack:"my_pack",id:"my_pack:hard_mode",label:"Hard mode",default:0,scope:"global"}
```
- **player**: one value per player (stored by `tp_core.id`), changed by that player in the menu or with `/trigger tp_core.setting set N`.
- **global**: one value per world, changed only by operators (the menu button runs a `function` command, which vanilla limits to operators; the trigger cannot touch them, and `setting/gset` can be called from any pack function).
- Menu: pause screen → *Pack settings* → *Open settings* lists every registered pack; each pack has its own page with its toggles. `(operators)` marks global ones. Trigger values: `1` root, `10+k` page of pack k, `100+2*i+v` set player setting i to v.
- Validation: an unknown pack, duplicate id, `default` not 0/1 or `scope` not `player`/`global` is rejected: red chat line, the text is appended to `storage tp_core:setting errors`, nothing registered. `set`/`gset` reject unregistered ids, the wrong scope and values other than 0/1 the same way. Texts (`label`, `name`) must not contain double quotes. Pack ids are plain ids (`my_pack`, not `my_pack:x`); setting ids are `namespace:name`.
- Global values live in `storage tp_core:global settings`, per-player ones in `tp_core:players`, both survive `/reload`; settings are re-registered every load.
- TP-Core registers its own pack with one global setting, **`tp_core:debug`** (Debug mode).

## Resource packs
No resource pack is required. To give an item or block a custom look later, add one `"minecraft:item_model": "<ns>:<model>"` entry to its loot table's `set_components` (armor: `equippable.asset_id`). Block displays show the same item, so they follow.

## Notes
- Item "use" = right-click, detected through `using_item` with a long non-consuming `consumable` (+ `use_effects` so sprinting is not slowed). Hold-right-click fires once per press.
- `track` costs one engine-side predicate per opted-in player until the event fires; nothing in mcfunction.
- The old 1.21 pack (`tp_main`, `tp_armor`, `tp_predicate`, `tp_tags`) is gone; `half_blocks` was a typo for `half_block`.

## Trying it by hand
Debug is the global setting `tp_core:debug`: toggle it in the settings menu (*TP-Core* → *Debug mode*, operators) or use `/function tp_core:debug/on|off`. `debug/on` starts a fresh log: every framework event (player events, item advancements and dispatches, settings, track edges) prints to chat and is recorded; `/function tp_core:debug/dump` prints a click-to-copy button for the whole log; `debug/off` stops it. Test protocol and expected lines: `.claude/docs/manual-tests.md`. `tp_core:test/register` (in `#tp_core:register`) registers `tp_core:item/test_wand` (right-click prints a message) and `tp_core:item/test_block` (stone-based block), so `/function tp_core:item/give {id:"tp_core:item/test_wand"}` works after any `/reload`. Remove that tag entry to ship without them.
