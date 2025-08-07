# Introduction

rPAM1.15 is an updated version of previous PAM releases for Call of Duty 1.5.

> **Supported Game Version:** `Call of Duty Multiplayer v1.5`  
> **rPAM Server Mod Version:** `TBA`  
> **rPAM Maps Version:** `v2.1`

> **Adapted to latest CoDBASE PAM:** `actually not yet`

> **Support this Project `PayPal` `€` `Billing Addr.`:** [PayPal.com/donate](https://www.paypal.com/donate/?hosted_button_id=NB3GC298ZMJG4) 

> **Join CoDBASE Call of Duty 1 Community `vCoD` `Call of Duty Multiplayer v1.5` `Europe`):** [Discord](https://discord.gg/Zh8DP7c)

This projects goal is to further develop features requested by the playerbase while preserving the core gameplay at the highest competitive standard established in recent years.

rPAM was initiated by me in 2015, after CyberGamer's edited PAM failed to fix bugs and instead introduced new ones. This led to the idea of creating a version that preserves the original while correcting its flaws.
In 2024 I joined the Discord of CoDBASE, a dedicated community with players and teams playing still competitive 5v5 Search and Destroy, like back in the days. There the game is still buggy. I hope I can fix that now.

#### Background of PAM

The original Project Ares Mod (PAM) for Call of Duty v1.5, created by Garetjax and finalized with version 1.08, laid the groundwork for competitive play in the game's early days. Widely adopted in leagues such as ESL and ClanBase from the mid-2000s through the early 2010s, PAM enabled teams to compete in structured, rule-based matches without relying on manual setup, in-game commands, or RCON intervention. Thanks to its automation and reliability, it quickly became the standard for high-level competitive play.

## Specific features or improvements

- Fix bugs in the current CoDBASE-PAM, based on my [rPAM v1.11](https://www.moddb.com/mods/call-of-duty-origin-of-honor/features/call-of-duty-rpam-v111) released on [ModDB (2015)](https://www.moddb.com/mods/call-of-duty-origin-of-honor/downloads/call-of-duty-rpam-v111)
- Retain and potentially expand the new features introduced in CoDBASE-PAM (2024)
- Adapt and integrate elements from [kikiii's eyza_pam_port_to_vcod (2025)](https://github.com/tmowojtek/eyza_pam_port_to_vcod/tree/main)
- Adapt and integrate elements from [CoD2 ezya zPAM](https://github.com/eyza-cod2/zpam3)
- Adapt and integrate elements from Anghlz PAM Mod
- Fully integrate custom maps into the mod
- Adapt custom maps to better reflect the game's authenticity and align with the PAM mod
> [go to Available Maps Overview](#available-maps-overview)
- Revise textures, skins, and scripts to ensure fair and balanced competitive gameplay
> [go to Texture Changes Overview](#texture-changes-overview)

## Goals

- Provide server operators and players with a stable, easy-to-manage mod for the game
- Automate competitive gameplay and reduce manual intervention
- Ensure fair, authentic, and balanced gameplay, drawing on experience from the game's competitive prime during the ClanBase era
- Promote teamwork and enhance the player experience with useful features
- Ensure long-term sustainability and active development

> [go to Document Navigation](#document-navigation)
---------------------------------------------------------------------------------------------


# Download

**Supported Game Versions:** ``Call of Duty Multiplayer v1.5``

**rPAM Server Mod Version:** ``TBA``

**rPAM Maps Version:** ``v2.1``

- #### Actual version
	- 202t/0t/tt - <b><a href="about:blank">LINK-TBA1.zip</a></b>
> [go to Changelog Server Mod (latest)](changelog-lastest)

- #### [Version Tree](#version-tree)
	- 202t/0t/tt - <b><a href="about:blank">LINK-TBA1.zip</a></b> (actual)
  - 202t/0t/tt - <b><a href="about:blank">LINK-TBA0.zip</a></b> (previous version)

> [go up again](#download) <|> [go next](#document-navigation)
---------------------------------------------------------------------------------------------


# Document Navigation

1. [About this Project](#introduction)  
2. [Download](#download)  
3. [About rPAM Server Mod](#about-rpam-server-mod)  
   3.1 [Changes](#about-rpam-server-mod)  
4. [About rPAM Maps Overhaul Mod](#about-rpam-maps-overhaul-mod)  
   4.1 [Changes](#changelog-rpam-maps)  
   4.2 [Installation](#mod-installation)  
   4.3 [Cvars](#server-cvar-overview)
   4.4 [Texture Changes](#texture-changes-overview)
5. [TBA](#tba-tba1)
6. [Credits](#credits)
7. [Programs Used](##programs-used)
> [go up again](#document-navigation) <|> [go next](#about-rpam-server-mod)
---------------------------------------------------------------------------------------------


# About rPAM Server Mod

- TBA
- TBA
- TBA
- TBA
- TBA
- TBA
- TBA

> [go up again](#about-rpam-server-mod) <|> [go next](#about-rpam-maps-overhaul-mod)
---------------------------------------------------------------------------------------------


# About rPAM Maps Overhaul Mod

## Goal:

- Adaptations of all maps to rPAM and competitive play
- Revise and enhance ambient sounds, fog, and smoke effects on both classic and custom maps
- Ensure optimal multiplayer performance and server stability
- Improve gameplay across all gametypes, minimize bugs and exploits
- Compatibility with other mods, even without the rPAM Server Mod

> **Supported Game Versions:** `Call of Duty Multiplayer v1.5` & `Call of Duty Multiplayer v1.1 (Not testet yet)`

[DL SPECIFIC LINK TBA]

> [go up again](#about-rpam-maps-overhaul-mod) <|> [go next](#main-changes-maps)
---------------------------------------------------------------------------------------------


## Main Changes Maps

**Relevant to:** ``v2.2``


- Normalized ambient sound effects for a more balanced audio volume `\soundaliases`
- Added rPAM Overhaul Script to change ambient sounds, fog and smoke plumes `\maps\mp`
- Refreshed all levelshots `\levelshots`
- Updated HUD map layouts of `\levelshots\layouts`
  - default (no layout available), `mp_harbor`, `mp_neuville`, `mp_stalingrad`, `mp_tigertown`

- Improved window glass transparency and frame details in `mp_neuville`
- Adjusted metal rail fences in `mp_carentan` for better visibility and clearer lines of sight

- Added `mp_germantown` from Steiner (former german_town)
    - Used ingame as `mp_germantown` with ``/rcon map mp_germantown``

- Added `Cod1 maps patch` from curiousfox 2025
  - Used ingame now as `mp_dawnville_x` with ``/rcon map mp_dawnville_x``
    - Added loading screen and informations in `rpam_msg`
      - Axis spawn wall no longer affects player movement
      - Certain windows blocked to prevent prone-bug abuse
      - Graveyard bush wall is no longer see-through
      - Bombsite tanks remodeled for accurate hitboxes (fix should apply to all tanks in the game)
  - Used ingame now as `mp_railyard_x` with ``/rcon map mp_railyard_x``
    - Added loading screen and information in `rpam_msg`
      - Axis spawn wooden panels are now solid
      - ~~Raised the sky to prevent grenade disappearance~~ Nades do still disappear like before
      - S&D Tiger tanks remodeled to fix gaps (fix should apply to all tanks in the game)
      - Ruins faulty rock patched
      - Ruins stairs now use `+moveup` function when prone
      - Upper Axis ruins roof no longer see-through
        - Credits to Expertiz's earlier fix with the big woodgib
        - `v2` blend in of the added object from curiousfox
        - `v3` added more objects for broken roof and wall textures

- Added aim maps available to play on each side: `mp_aim`, `mp_pgaim`, `mp_blaoaim`, `mp_wawa`

- Added rPAM Overhaul Script for `mp_railyard` 2024/2025 by reissue
  - **`| AUTO OFF |`** The same locations like used in mp_railyard_x are edited by a script which does load insvisible objects and also visible objects with bullet-collision
    - The game does quickly overload by a huge amount of placed objects loaded by the script
    - Added commands to tinker around with different settings of the ["rPAM Overhaul Script for mp_railyard"](#rpam-overhaul-for-mp_railyard)

> [go up again](#main-Changes-maps) <|> [go next](#changelog-rpam-maps-classic)

---------------------------------------------------------------------------------------------


## Changelog rPAM Maps Classic

### v2.2 (Actual Development Process)
- Add more objects from rPAM mp_railyard Overhauls script `mp_railyard_x` `v3`
   - `ruins roof`, filling a missing texture and a pixel-spot with bricks 
   - `ruins roof`, added `woodgib_medium` to the lower roow section, and one to the top
   - added some tree's, sandbags and trucks

- Create a servermod files to adapt for compativility to other mods
- Overhaul .pk3 file name structure
- Creat this readme.md with hope it helps structuring

### v2.1 (Latest)
- Moved object `bigwoodgib` on map `mp_railyard_x` at position `ruins roof` to blend inside the given structure

### v2.0
- Edited `\textures\austria\transparents\metal_masked@ironfence1.dds` – DXT3  
  - Used in `mp_carentan`, for example
  - Applies to all maps in the game
- Edited `\textures\normandy\windows\neuvilleglass.dds` – DXT3
- Edited `\textures\normandy\windows\neuvilleframe.dds` – DXT5, same as the DXT3 image  
  - Used in `mp_neuville` and `mp_bonneville`, for example
  - Adjusted glass transparency (alpha channel)
  - Minor color corrections to the window frame
  - Applies to all maps in the game

### v1.9
- Ambient script completely overhauled `soundaliases.csv`
- Overhauled message center
- Updated `.arena` files compatibility issue
- Added some aim maps to the mod

### v1.8
- Modified `.arena` file to prevent original map duplication
- Normalized ambient audio (`\soundaliases\*.csv`)
- Updating levelshots and levellayoutshots
- Edited HUD map layouts:
  - `mp_harbor`
    - switched A and B to match the actual layout
    - adjusted midboxes to the actual layout
  - `mp_neuville`
  - `mp_stalingrad`
  - `mp_tigertown`
    - slightly enlarged & small corrections
  - `mp_germantown`
    - added callouts and highlighted doorways

### v1.7
- Integrated all elements into working condition
- Already started to add and adapt more custom maps with the same script layout which has evolved

### v1.6
- Added `Cod1 maps patch` from curiousfox (2025)

### 1.5
- Added 1.5 maps and files for 1.1 version of the game
- Added aim maps from the past and refreshed their loading screens
    - HUD map layout default/unknown added (\levelshots\layouts)
    - changed a texture for COD BASE on `wawa3Daim`
- Added `german_town` from Steiner to classic maps overhaul package

### v1.4
- Updated some levelshots
- Esablish a package without the server mod involved

### v1.3
- Experimented with fog effects and created related scripts
- Updated ambient sound mod

### v1.2
- Collected all previously modded files
- Ambient sound mod and experience established from rPAM v1.11

> [go up again](#changelog-rpam-maps) <|> [go next](#changelog-rpam-maps-custom)

---------------------------------------------------------------------------------------------



## Changelog rPAM Maps Custom


**Relevant to Version:** ``v2.3`` onwards




**Relevant Version:** `v2.2`

#### Changes on `mp_germantown` made by Steiner [03-2004]
- known as `german_town` `german_town.pk3`
- HUD map layout edited and overhauled to match the game scheme	`\levelshots\layouts`

#### Changes on `mp_aim` made by Yannic [05-2004]
- known as `mp_aim with basharena` `mp_aim.pk3`
- HUD map layout default/unknown added `\levelshots\layouts`

#### Changes on `mp_blaoaim` by RL.GENERAL Z [08-2004]
- known as `rl_blaoaim` `original filename missing`
- HUD map layout default/unknown added `\levelshots\layouts`
- changed a texture to promote CODBASE

#### Changes on `mp_pgaim` by an unknown author [05-2004]
- known as `pg_aim` `pg_aim.pk3`
- HUD map layout default/unknown added `\levelshots\layouts`
- mp_pgaim_b british is crashing the game

#### Changes on `mp_wawa` by wawa [07-2004]
- known as `wawa_3Daim` `original filename missing`
- HUD map layout default/unknown added `\levelshots\layouts`
- changed a texture to promote CODBASE



> [go up again](#changelog-rpam-maps-custom) <|> [go next](#mod-installation)

---------------------------------------------------------------------------------------------



## Mod Installation

***Server mod folder:*** `\Call of Duty\_rPAMv115``*`

***Client mod folder:*** `\Call of Duty\_rPAMv115`*`

***Mod files inside `\_rPAMv115``*`:***
- `_run_rPAM.cmd`
- `_run_rPAM_debug.cmd`
- `_server_rpam.cfg`
- `description.txt`
- `zzzzz_rPAMv115maps_classics_base.pk3`
- `zzzzz_rPAMv115maps_classics_v17.pk3`
- `zzzzz_rPAMv115maps_curiousfox.pk3`
- `zzzzz_rPAMv115maps_curiousfox_v3.pk3`
- `zzzzz_rPAMv115x_aim_v4`
- `zzzzz_rPAMv115x_allmaps_v22_b1.pk3`

### Install Client:
- Go to `\Call of Duty\_rPAMv115``*` and run `_run_rPAM.cmd` to launch the game directly.
- Alternatively, start the Call of Duty Multiplayer and select `"rPAM Mod by reissue"` from the Mods menu.
- It is recommended to ensure that your `config_mp.cfg` settings are properly configured, as the file will be loaded from your `Main` folder the first time you run the mod.

### Install Server:
- Add `seta fs_game "_rPAMv115*"` to your server config.
- Place the `_rPAMv115*` folder (with all mod files inside) next to the `main` folder in your Call of Duty game directory and also on your download ftp server.

### Recommended:
- Check or copy your `config_mp.cfg` from your `main` folder into the `_rPAMv115*` folder. Normally, it transfers automatically when launching the mod for the first time.
- Players can download most of the required files directly by connecting to the game server by adding the following commands to the server config:
  - `seta sv_allowDownload "1"`
  - `seta sv_wwwBaseURL "http://167.235.243.217/fastdl/cod1"` // Credits: bandiii92
  - `seta sv_wwwDlDisconnected "1"`
  - `seta sv_wwwDownload "1"`


> [go up again](#document-navigation) <|> [go next](#server-cvar-overview)
---------------------------------------------------------------------------------------------


## Available Maps Overview

``Version v2.2``

| Map /rcon      | Creator                          | Gametypes                 | Side |
|----------------|----------------------------------|---------------------------|------|
| mp_brecourt    | Infinity Ward                    | dm, tdm, sd, re, bel, hq  | A    |
| mp_carentan    |                                  | dm, tdm, sd, re, bel, hq  | A    |
| mp_dawnville   |                                  | dm, tdm, sd, re, bel, hq  | A    |
| mp_depot       |                                  | dm, tdm, sd, re, bel, hq  | B    |
| mp_harbor      |                                  | dm, tdm, sd, re, bel, hq  | R    |
| mp_hurtgen     |                                  | dm, tdm, sd, re, bel, hq  | A    |
| mp_pavlov      |                                  | dm, tdm, sd, re, bel, hq  | R    |
| mp_powcamp     |                                  | dm, tdm, re, sd, bel, hq  | R    |
| mp_railyard    |                                  | dm, tdm, sd, re, bel, hq  | R    |
| mp_rocket      |                                  | dm, tdm, sd, re, bel, hq  | B    |
| mp_bocage      |                                  | dm, tdm, sd, re, bel, hq  | A    |
| mp_neuville    |                                  | dm, tdm, sd, re, bel, hq  | A    |
| mp_stalingrad  |                                  | dm, tdm, sd, re, bel, hq  | R    |
| mp_tigertown   |                                  | dm, tdm, sd, re, bel, hq  | A    |

| Map /rcon      | Creator                          | Gametypes                 | Side |
|----------------|----------------------------------|---------------------------|------|
| mp_germantown  | Steiner [03-2004]                | dm, tdm, sd, bel          | A    |
| mp_dawnville_x | IW + curiousfox [03-2025]        | dm, tdm, sd, re, bel, hq  | A    |
| mp_railyard_x  | IW + curiousfox [03-2025]        | dm, tdm, sd, re, bel, hq  | R    |
| mp_aim_a       | Yannic [05-2004]                 | dm, tdm                   | A    |
| mp_aim_b       |                                  | dm, tdm                   | B    |
| mp_aim_r       |                                  | dm, tdm                   | R    |
| mp_blaoaim_a   | RL.GENERAL Z [08-2004]           | dm, tdm                   | A    |
| mp_blaoaim_b   |                                  | dm, tdm                   | B    |
| mp_blaoaim_r   |                                  | dm, tdm                   | R    |
| mp_pgaim_a     | Unknown [04-2005]                | dm, tdm                   | A    |
| mp_pgaim_r     |                                  | dm, tdm                   | R    |
| mp_wawa_a      | wawa [07-2004]                   | dm                        | A    |
| mp_wawa_b      |                                  | dm                        | B    |
| mp_wawa_r      |                                  | dm                        | R    |


> [go up again](#document-navigation) <|> [go next](#server-cvar-overview)
---------------------------------------------------------------------------------------------

## Available Maps Overview Custom
rTODO
``Version v2.3 onwards``

| Map /rcon            | Creator                                              | Gametypes                 | Side |
|----------------------|------------------------------------------------------|---------------------------|------|
| mp_abbey             | FORCE316 [10-2004]                                   | dm, tdm, sd, re, bel, hq  | A    |
| mp_amfreville        | Steppenwolf & THE DUKE [04-2005]                     | dm, tdm, sd, re, hq       | A    |
| mp_bazolles          | Magnus Sandström & Roger Abrahamsson [07-2004]       | dm, tdm, sd, re, bel, hq  | A    |
| mp_beauville         | IxQue [03-2004]                                      | dm, tdm                   | A    |
| mp_bellicourt_day    | Magnus Sandström & Roger Abrahamsson [03-2004]       | dm, tdm, sd, re, bel, hq  | A    |
| mp_bellicourt_night  | Magnus Sandström & Roger Abrahamsson [04-2004]       | dm, tdm, sd, re, bel, hq  | A    |
| mp_bonneville        | [CF] WillyWonka [07-2004] {out of bounds}            | dm, tdm, sd, bel          | A    |
| mp_breakdown         | Unknown [01-2004]                                    | dm, tdm                   | A    |
| mp_brecourt_winter   | OCG=gLiTcH= [08-2004]                                | dm, tdm, sd, re, bel, hq  | A    |
| mp_container         | openf1re [06-2004]                                   | tdm, sd                   | R    |
| mp_dday7             | [AYM] Lt Jules [06-2004]                             | dm, tdm, sd, bel, hq      | A    |
| mp_dufresne          | -HG- Baby Seal Clubber [08-2004]                     | dm, tdm, sd, re, bel, hq  | A    |
| mp_dufresne_winter   | -HG- Baby Seal Clubber [08-2004]                     | dm, tdm, sd, re, bel, hq  | A    |
| mp_eisberg           | Fangio [12-2003]                                     | dm, tdm, sd, bel          | B    |
| mp_frozen            | SIFFER [02-2004]                                     | dm, tdm, re, bel          | A    |
| mp_frozen_b          | SIFFER [02-2004]                                     |                           | B    |
| mp_frozen_r          | SIFFER [02-2004]                                     |                           | R    |
| mp_hanoi             | Expertiz & with DigitalDials [12-2016]               | dm, tdm, sd, re, bel      | A    |
| mp_junobeach         | [126th] Televinken [12-2004]                         | dm, tdm, sd, re, bel, hq  | B    |
| mp_merville_battery  | [HOLY] Moses [07-2004]                               | tdm, sd, hq               | B    |
| mp_nuenen            | [AYM] Lt Jules                                       | dm, tdm, sd, bel, hq      | A    |
| mp_offensive         | Old-Crow & Caskou [02-2004]                          | dm, tdm, sd, re, bel, hq  | A    |
| mp_pegasusday        | Infinity Ward                                        | tdm, bel                  | B    |
| mp_pegasusnight      | Infinity Ward                                        | tdm, bel                  | B    |
| mp_priory            | Philip A. Mecozzi (Filbert) [08-2006]                | dm, tdm, sd, bel, hq      | B    |
| mp_redoktober        | Drecks, Lex & Innocent Bystander [09-2004]           | dm, tdm, sd, bel, hq      | R    |
| mp_sainteny          | Spik3d [07-2007]                                     | dm, tdm, sd, bel, hq      | A    |
| mp_stanjel           | Roger Abrahamsson [04-2006]                          | dm, tdm, sd, re, bel, hq  | R    |
| mp_stcomedumont      | maverick & Lt.J.Snellius [02-2005]                   | dm, tdm, sd, re, bel, hq  | A    |
| mp_subharbor_day     | VegaObscura [03-2004]                                | dm, tdm, sd, bel, hq      | B    |
| mp_subharbor_night   | VegaObscura [03-2004]                                | dm, tdm, sd, bel, hq      | B    |
| mp_trenchville       | S.C. [07-2005]                                       | dm, tdm, sd, bel          | A    |
| mp_univermag         | Drecks & Innocent Bystander [02-2004]                | dm, tdm, sd, bel, hq      | R    |
| mp_valley_day        | VegaObscura [03-2004]                                | dm, tdm, sd, bel          | A    |
| mp_valley_night      | VegaObscura [03-2004]                                | dm, tdm, sd, bel          | A    |
| mp_westwall          | sm0k3r [12-2003]                                     | dm, tdm, sd, re, bel, hq  | B    |

``EXTRA``
| Map /rcon            | Creator                                              | Gametypes                 | Side |
|----------------------|------------------------------------------------------|---------------------------|------|
| mp_project_uboat     | adwamslayer [03-2005]                                | dm, tdm, sd, re, bel, hq   | B    |
| mp_radar             | Fangio [12-2003]                                     | dm, tdm, sd, re, bel       | A    |
| mp_v2                | -=\|TFO\|=- Kilroy [02-2004]                         | dm, tdm, sd, re, bel, hq   | A    |
| mp_venicedock        | Unknown [05-2004]                                    | tdm                        | B    |
| mp_windmills         | VegaObscura [05-2004]                                | dm, tdm, sd, re, bel       | A    |
| mp_hauptbahnhof      | Unknown [05-2004]                                    | dm, tdm                    | A    |
| mp_hauptbahnhof_b    | Unknown [05-2004]                                    |                            | B    |
| mp_hauptbahnhof_r    | Unknown [05-2004]                                    |                            | R    |


## Server Cvar Overview

You can use /rcon within these commands, tab also.

#### Ingame Mod Info Messages
- `rpam_msg` Displays actual settings when a maps starts
  - `1` = on **`|`** by default if not `g_gametype sd`
  - 0 = off
- `rpam_debug` Displays all settings for this mod for debugging
  - `0` = off **`|`** by default if not `g_gametype sd`
  - 1 = on

#### rPAM Ambient Settings
- `rpam_ambient_messagecenter`: Shows ambient info messages
  - `0` = off **`|`** by default since `rpam_msg` is used, older system
  - 1 = on
- `rpam_ambientsounds`: Enable ambient SFX
  - 0 = off
  - `1` = on **`|`** by default if not `g_gametype sd`
- `rpam_ambientfog`: Map-based fog
  - 0 = off (not available)
  - 1 = developer default settings
  - 2 = extended starting distance
  - `3` = extended starting distance and end distance **`|`** by default on each `g_gametype`
  - 4 = testing (if available)
  - 5 = setCullFog testing (if available)
`rpam_ambientsmoke`: Map-based smoke plumes
  - `1` = on **`|`** by default if not `g_gametype sd`
  - 0 = off
 
#### rPAM Improvements
- `rpam_improvements`: Enables No-Prone Script by Roger Abrahamsson for all maps (`mp_stanjel`)
  - `1` = on **`|`** by default
  - 0 = off
- `rpam_overhaul` Enables rPAM Overhaul on `mp_railyard`
  - `0` = off **`|`** completely off by default
  - 1 = on **`|`** activates following commands below

#### rPAM Overhaul for mp_railyard
- `/rcon rpam_overhaul 1` and `/rcon map_restart` via Console enables rPAM Overhaul on *`mp_railyard`*
- `rpam_overhaul_messagecenter`: Show overhaul info `0`/`1`, Replaced by `rpam_msg`
- `railyard_add_decoration1`: Trees/trucks at Russian spawn `0`/`1`
- `railyard_add_decoration2`: Adds extra visuals `0`/`1`
- `railyard_fix_bombspots`: Fix bomb A/B gaps for S&D `0`/`1`
- `railyard_fix_woodstation_ruins`: Collision at Axis ruins `0`/`1`
- `railyard_fix_woodstation_spawn`: Spawn collision Axis `0`/`1`
- `railyard_fix_woodstation_roof`: Southern roof blocked `0`/`1`
- `railyard_fix_ruins_roof`: Controls ruins roof access:
  - `0` = disabled
  - `1` = medium access
  - `2` = half blocked
  - `3` = limited access
  - `4` = full access
  - `5` = fully blocked
- `railyard_fix_ruins_stairs`: Improved stairs at A `0`/`1`
- `railyard_fix_ruins_stone`: Adds collision to small stone (Axis) `0`/`1`
- `railyard_block_southstation_roof`: Block ledge at Axis spawn `0`/`1`
- `railyard_block_updown`: Block ledge up/down by invisible height blocking (testing) `0`/`1`
- `xvar_rpam_overhaul_railyard`: Shows visual debug of all placed objects `0`/`1`
- *Maybe the coordinates could be useful in the future, or the up & down variant*


> [go up again](#document-navigation) <|> [go next](#credits)
---------------------------------------------------------------------------------------------


# Credits

- **Steiner** – Original `german_town` (2004)  
- **curiousfox** – Edited railyard and dawnville (2025)  
- **Expertiz** – Contributed fix for railyard ruins roof (2023)
- **Roger Abrahamsson** - No-Prone Script (2005)
- **Yannic** - Custom map `mp_aim` (2004)
- **RL.GENERAL Z** - Custom map `rl_blaoaim` (2004)
- **wawa** - Custom map `wawa3DAim` (2004)
- **Unknown Creator(s)** - Custom maps `pg_aim` (2005), `TBA`

- **bandiii92** - Hosting game files for players (2024)

- **CoDBase Discord Community** - Play 5v5 comp here: https://discord.gg/Zh8DP7c

- **reissue** - rPAM & Origin of Honor Project


> [go up again](#document-navigation)
---------------------------------------------------------------------------------------------

# Programs Used
WinMerge, VSCode, txt-Editor, WinRar, 7-Zip, Radiant, Photoshop, Gimp, Audacity

> [go up again](#document-navigation)

---------------------------------------------------------------------------------------------

# Notes

If anything is incorrect or unclear, please let me know. Thank you.

Discord: REISSUE (discord: REISSUE, androhka#6116)

## END
