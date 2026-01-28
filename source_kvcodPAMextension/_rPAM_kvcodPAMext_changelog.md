# ***kvcodPAMextension***

Version is for: kvcodPAM 2_14 nolib
By kikiii & Maggot, ezya-cod2
Changes by reissue_   

# **Fixes and Changes v214**
  - Kikiii fixed script runtime error when player disconnects during fill_box execution in _streamer_hud.gsc
  - Reissue added code from zPAM 404 for future improvements, deactivated for now
    - scr_hitbox_hand_fix & scr_hitbox_torso_fix is now working
    - proper prints added

# **Fixes and Changes v212/v213**
  - Kikiii applied new changes in scoreboard:
    - *maps/mp/gametypes/_menu_scoreboard.gsc
    - *maps/mp/gametypes/_player_stat.gsc
    - *maps/mp/gametypes/_quickmessages.gsc
    - *maps/mp/gametypes/sd.gsc - adapted to rPAM, no further changes

# **Fixes and Changes v21/v20**
  - applied v211 of kvcodpam
  - minor fixes and print exploration at sd:: and _utility::

# **Fixes and Changes v19**
  
  - attempt to fix first ready-up lagging (it should lag during match start countdown only)
  - new scoreboard is showing minimal info for players during match. Full info is shown in final scoreboard.

# **Fixes and Changes v18**

  - All old required versions are present with attached version number at the end of filename.
  - Changelog vcodPAM 2_7 to 2_9 by kikiii:
    - fixed a case when aimrun prevention function disabled weapon while shooting
    - enabled aimrun protection for pistol weapons
    - disabled original CoD timeouts (matchtimeout/matchtimein)
    - fixed incorrect sten ui cvar in british weapons
    - fixed case when weapons were enabled in timeout

# **maps\mp**

## maps\mp\gametypes\_pam.gsc

  - rkmVersion: Displays the actual version v18

## maps\mp\_warnings.gsc

  - elimnated toujane warning

# **Added debugString.menu**

  - added debugString.menu from cod2-ezya-pam, appears that cheat mode requires it
    https://github.com/eyza-cod2/zpam3/blob/master/source/ui_mp/scriptmenus/debugString.menu
    
## maps\mp\_callbacksetup.gsc
## maps\mp\_events.gsc

  - I ran into errors when loading map the second time on menu start server
  - syntax correction /# to /* and #/ to */

## maps\mp\_utility.gsc     

  - rFIX_bombexplosiong: fix of a logprint which occurs error after bomb explodes

# **maps\mp\gametypes**

## maps\mp\gametypes\_cvar_forces.gsc    

  - Used zPAM eyza-cod2 version as reference 400test3           
    - added #include command deactivated
    - deactivated *pbForcedCvarsLoaded* completely, as cod2 isn't it using anymore and
    it is not working like punkbuster does (v11, COMP starts)
    - *sets Server cvar*: rpam_competitive = 1 

  - rCLIENTSETUP: here the given cvars will apply on round-start or map restart     
    - *sets Client cvar*:    
    snaps = 40; rate = 25000; cl_maxpackets = 100;    
    cl_avidemo = 0; cl_forceavidemo = 0; cl_freelook = 1;    
    r_lodbias = 0; r_lodCurveError = 250; r_lodscale = 0;    
    cg_errordecay = 100; cg_viewsize = 100;      
    cg_crosshairAlpha = 1; cg_crosshairAlphaMin = 0.7; cg_drawCompass = 1;    
    cg_hudStanceHintPrints = 0; cg_weaponCycleDelay = 0;    
    r_drawSun = 0; r_fastsky = 0; *r_fog = 1* *(for rPAM Maps Overhaul)*   
    - *sets Server cvar*:    
    rate = 25000; sv_maxRate25000 = 25000; sv_pure = 1         

## maps\mp\gametypes\_force_download.gsc    

  - Used zPAM eyza-cod2 version as reference 400test3    
  - rSVDL: Sets server cvar sv_allowDownload to 1    
  - rSVDLdis: Deactivated sv_wwwDlDisconnected 0 due to http download, thy Prawy    
  - rNOTDOWNLOADEDmenu: Error display need to get black with text    
  - rSETALLOWDOWNLOAD: *Sets Client cvar* cl_allowdownload = 1 & cl_wwwDownload = 1    
  - rFIXdownloaderSPAWN: If not working properly, player will spawn in empty space with   
    weired optics    
      - added some more logprint's ``to investigate further``  

## maps\mp\gametypes\_matchinfo.gsc  

  - rFIX_HLSW-CVAR-PLAYER-ERROR : Executing this code when joining a server causes an error (Global server cvars visible via HLSW/FPSChallenge).
  - v23 old: player UpdatePlayerCvars();
  - v24 new code ``to investigate further``  
  - v210 kikiii added a line for determinate team names, side, score

## maps\mp\gametypes\_rpam_monitor.gsc

  - v28 changes noted ``to investigate further``  

## maps\mp\gametypes\_weapons.gsc    

  - v24 changes marked
  - rPISTOLAMMO-log: added log info
  - v25 is identical to 210

## maps\mp\gametypes\sd.gsc    

  - v24 changes marked
  - v27 kikiii added weap hide while plant 
  - v29 change added in stratTime_g_speed() and changed the logprint
  - v29 is identical to 210

# **maps\mp\gametypes\global**

### maps\mp\gametypes\global\cvars.gsc   

  - rREGISTER: Added new rPAMmaps overhaul cvars for ambient
  - v29 changes applied for correct tomeout management by kikiii

### maps\mp\gametypes\global\pam.gsc   

  - rFSGAMECHECK: disabled
  - rREFERENCEpk3: disabled cod2stuff *todo*
  - rFOLDER: changed the folder to the actual used one
  - rEPLACEHOLDER: some better help information when an error occurs by the mod files

# **ui_mp\scriptmenus**

### ui_mp\scriptmenus\weapon_british.menu

  - v29 correction to add mp_sten back to menu

# **weapons**

  - applied nad fixes from rPAM v1.11 & mp44 reload anim added by kikiii

# **To investigate further:**   

  - Add all BombRadius or leave the script
  - ...
  - ...

