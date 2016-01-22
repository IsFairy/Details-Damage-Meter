-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--> global name declaration

		_ = nil
		_detalhes = LibStub("AceAddon-3.0"):NewAddon("_detalhes", "AceTimer-3.0", "AceComm-3.0", "AceSerializer-3.0", "NickTag-1.0")
		_detalhes.build_counter = 2221 --it's 2221 for release
		_detalhes.userversion = "v4.2.3"
		_detalhes.realversion = 79 --core version
		_detalhes.version = _detalhes.userversion .. " (core " .. _detalhes.realversion .. ")"
		Details = _detalhes

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--> initialization stuff

do 

	local _detalhes = _G._detalhes
	
	_detalhes.resize_debug = {}
	
	local Loc = LibStub ("AceLocale-3.0"):GetLocale ( "Details" )

--[[
|cFFFFFF00v4.2.3 (|cFFFFCC00Jan 22, 2016|r|cFFFFFF00)|r:\n\n
|cFFFFFF00-|r Added two new custom displays: Damage Done on targets marked with skull and Damage Done on targets marked with any other mark.\n\n
|cFFFFFF00-|r Bookmark now supports Plugins.\n\n
|cFFFFFF00-|r Fixed a gap when setting the bars to 'bottom to top' grow direction.\n\n
|cFFFFFF00-|r Added a Scale options to Encounter Details plugin window.\n\n
--]]

--

	Loc ["STRING_VERSION_LOG"] = "|cFFFFFF00v4.2.3 (|cFFFFCC00Jan 22, 2016|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Added two new custom displays: Damage Done on targets marked with skull and Damage Done on targets marked with any other mark.\n\n|cFFFFFF00-|r Bookmark now also supports Plugins.\n\n|cFFFFFF00-|r Added a Scale options to Encounter Details plugin window.\n\n|cFFFFFF00-|r Fixed a gap when setting the bars to 'bottom to top' grow direction.\n\n|cFFFFFF00v4.1.6 (|cFFFFCC00Jan 14, 2016|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Fixed the size of the right margin on tooltips.\n\n|cFFFFFF00v4.1.5 (|cFFFFCC00Jan 10, 2016|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Fix for the weakauras creator for DBM and BidWigs Timers.\n\n|cFFFFFF00-|r Fix for an issue with dungeon bosses where sometimes Details! throw some error messages.\n\n|cFFFFFF00-|r Attempt to fix a 'class undefined' bug.\n\n|cFFFFFF00v4.1.4 (|cFFFFCC00Jan 03, 2016|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Fixed an issue with the segment plugin for the statusbar.\n\n|cFFFFFF00v4.1.3 (|cFFFFCC00Jan 01, 2016|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Small visual improvement on tooltips.\n\n|cFFFFFF00-|r Fixed an issue when closing solo plugins with the red X button.\n\n|cFFFFFF00v4.1.2 (|cFFFFCC00Dec 31, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Fix for item level tracker.\n\n|cFFFFFF00v4.1.1 (|cFFFFCC00Dec 23, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Using LibItemUpgradeInfo library to retrive the item level of upgraded items.\n\n|cFFFFFF00v4.1.0 (|cFFFFCC00Dec 18, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Added new skin preset: 'New Gray'.\n\n|cFFFFFF00-|r Added a Dark skin for the Options Panel.\n\n|cFFFFFF00-|r Fixed an issue with the Plugin DPS Tuning when reseting data on Details!.\n\n|cFFFFFF00-|r Removed realm names from player at the Comparison Panel.\n\n|cFFFFFF00v4.0.8 (|cFFFFCC00Dec 13, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Framework and functions update for the next version of the Advanced Death Logs plugin.\n\n|cFFFFFF00v4.0.7 (|cFFFFCC00Dec 07, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Fixed some corner border for elvui skins.\n\n|cFFFFFF00-|r /run Details.death_tooltip_width = 500 makes the deathlog tooltip be 500 width.\n\n|cFFFFFF00v4.0.6e (|cFFFFCC00Nov 23, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Fixed an issue where sometimes some actors are duplicated at the end of an encounter.\n\n|cFFFFFF00-|r Fixed bookmark for segments (shift+right click).\n\n|cFFFFFF00-|r Fixed an issue with Chat Tab Embed when embeding only one window.\n\n|cFFFFFF00v4.0.6c (|cFFFFCC00Nov 04, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Added an option for numeral system: Western/East Asian.\n\n|cFFFFFF00v4.0.5c (|cFFFFCC00Oct 24, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Added an option to disable the all-displays window (right click on title bar).\n\n|cFFFFFF00-|r Added an option to suppress segment changes after killing a boss encounter (experimental).\n\n|cFFFFFF00-|r Fixed pet battles auto hide.\n\n|cFFFFFF00-|r Fixed an issue with bar animations starting from the middle of the bar.\n\n|cFFFFFF00-|r Fixed buffs and spell cast start on weakauras creator tool.\n\n|cFFFFFF00v4.0.3a (|cFFFFCC00Set 29, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Fix for an error on Damage Taken By Spell display.\n\n|cFFFFFF00v4.0.3 (|cFFFFCC00Set 27, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Some improvements on Plugin's icon at the title bar.\n\n|cFFFFFF00v4.0.2 (|cFFFFCC00Set 26, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Added 'ShielTronic Shield' on HealthPotion & Stone display.\n\n|cFFFFFF00-|r Improvements done on Vanguard Plugin.\n\n|cFFFFFF00-|r Fixed an alignment issue which was happening with few tooltips.\n\n|cFFFFFF00-|r Fixed a problem where sometimes the addon crashes while doing a /reload during raid.\n\n|cFFFFFF00-|r Fixed the creation of auras for weakauras from the Forge (/details forge).\n\n|cFFFFFF00v4.0.1 (|cFFFFCC00Set 21, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Added an options to use a customized skin file.\n\n|cFFFFFF00-|r Added an options to use a customized bar texture file.\n\n|cFFFFFF00-|r A Package with photoshop files with examples and the skin file for Minimalistic skin are available at WoW Interface.\n\n|cFFFFFF00-|r Added 'API Custom Displays.txt' on Details! folder, this file explain how to create scripts for custom displays.\n\n|cFFFFFF00v4.0h (|cFFFFCC00Set 19, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Created new plugin 'Target Caller' for RBGs, it's available at Curse.com.\n\n|cFFFFFF00-|r Fixed death display color when not using colored by the player class.\n\n|cFFFFFF00-|r Fixed a rare bug where the window for Encounter Details Plugin won't open when clicking on its icon.\n\n|cFFFFFF00-|r Added officer channel to 'Announce Death' feature.\n\n|cFFFFFF00v4.0f (|cFFFFCC00Set 16, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Fix for the title bar encounter timer.\n\n|cFFFFFF00v4.0e (|cFFFFCC00Set 14, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Added a custom display for Crowd Control Received.\n\n|cFFFFFF00-|r Weak Aura Creator Tool, now has full support for BigWigs and Dbm time bars.\n\n|cFFFFFF00-|r Auras for interrupt and dispelling has been added on the Weak Aura Creator Tool.\n\n|cFFFFFF00-|r Details! Forge now has support for DBM and BigWigs time bars.\n\n|cFFFFFF00-|r Solo Plugins now has a close button on their panels.\n\n|cFFFFFF00-|r Fixed damage/healing score message after a boss kill.\n\n|cFFFFFF00-|r Now, an alert to open the history panel is shown after killing a boss.\n\n|cFFFFFF00-|r Added a 'all-displays' menu when right clicking title bar.\n\n|cFFFFFF00-|r Removed few texture from bookmarks panel, now it has a more clean appearance.\n\n|cFFFFFF00-|r Updated Details! Framework.\n\n|cFFFFFF00-|r Added option in order to change the bar orientation.\n\n|cFFFFFF00-|r Added an option to make the menus on title bar work with clicks instead of hovering over them.\n\n|cFFFFFF00-|r Healing for battleground enemies is now placed on healing done instead of enemy healing done.\n\n|cFFFFFF00-|r Improvements on our support for Arena battles.\n\n|cFFFFFF00-|r Fixed some issues on the Player Detail Window.\n\n|cFFFFFF00-|r Fixed encounter time on title bar text.\n\n|cFFFFFF00-|r Fixed death display tooltip, wasn't respecting the font and size set on options panel.\n\n|cFFFFFF00v3.18.5 (|cFFFFCC00Aug 19, 2015|r|cFFFFFF00)|r:\n\n|cFFFFFF00-|r Improvements on Weakauras creation from Encounter Details plugin.\n\n|cFFFFFF00-|r Improvements on 'Auto Switch to Current' feature. Details! windows are now more responsible about auto changing a segment while the player, for instance, has the report window opened.\n\n|cFFFFFF00-|r Added slash command '/de wipe'. It ends the raid encounter segment and stop capturing data.\nIf you are the raid leader, all other users of Details! will also stop.\nWorks great for players not make damage padding after a wipe call.\n\n|cFFFFFF00-|r Added the  overheal made by pets on tooltip and player details window.\n\n|cFFFFFF00-|r Added an option to disable stretch button and bar highlight.\n\n|cFFFFFF00-|r Disabling nicknames now also disable avatars.\n\n|cFFFFFF00-|r Added 'spinal healing injector' on custom display 'Health Potion & Stone' used.\n\n|cFFFFFF00-|r Fixed title text width when auto-hide menu buttons is enabled.\n\n|cFFFFFF00-|r Fixed item level of timewarped items."

	Loc ["STRING_DETAILS1"] = "|cffffaeaeDetails!:|r "

	--> startup
		_detalhes.initializing = true
		_detalhes.enabled = true
		_detalhes.__index = _detalhes
		_detalhes._tempo = time()
		_detalhes.debug = false
		_detalhes.opened_windows = 0
		_detalhes.last_combat_time = 0
		
	--> containers
		--> armazenas as fun��es do parser - All parse functions 
			_detalhes.parser = {}
			_detalhes.parser_functions = {}
			_detalhes.parser_frame = CreateFrame ("Frame")
			_detalhes.pvp_parser_frame = CreateFrame ("Frame")
			_detalhes.parser_frame:Hide()
		--> armazena os escudos - Shields information for absorbs
			_detalhes.escudos = {}
		--> armazena as fun��es dos frames - Frames functions
			_detalhes.gump = _G ["DetailsFramework"]
			function _detalhes:GetFramework()
				return self.gump
			end
			GameCooltip = GameCooltip2
		--> anima��es dos icones
			_detalhes.icon_animations = {
				load = {
					in_use = {},
					available = {},
				},
			}
		--> armazena as fun��es para inicializa��o dos dados - Metatable functions
			_detalhes.refresh = {}
		--> armazena as fun��es para limpar e guardas os dados - Metatable functions
			_detalhes.clear = {}
		--> armazena a config do painel de fast switch
			_detalhes.switch = {}
		--> armazena os estilos salvos
			_detalhes.savedStyles = {}
		--> armazena quais atributos possue janela de atributos - contain attributes and sub attributos wich have a detailed window (left click on a row)
			_detalhes.row_singleclick_overwrite = {} 
		--> report
			_detalhes.ReportOptions = {}
		--> armazena os buffs registrados - store buffs ids and functions
			_detalhes.Buffs = {} --> initialize buff table
		-->  cache de grupo
			_detalhes.cache_damage_group = {}
			_detalhes.cache_healing_group = {}
			_detalhes.cache_npc_ids = {}
		--> cache de specs
			_detalhes.cached_specs = {}
			_detalhes.cached_talents = {}
		--> ignored pets
			_detalhes.pets_ignored = {}
			_detalhes.pets_no_owner = {}
			_detalhes.pets_players = {}
		--> armazena as skins dispon�veis para as janelas
			_detalhes.skins = {}
		--> armazena os hooks das fun��es do parser
			_detalhes.hooks = {}
		--> informa��es sobre a luta do boss atual
			_detalhes.encounter_end_table = {}
			_detalhes.encounter_table = {}
			_detalhes.encounter_counter = {}
			_detalhes.encounter_dungeons = {}
		--> informa��es sobre a arena atual
			_detalhes.arena_table = {}
			_detalhes.arena_info = {
				[562] = {file = "LoadScreenBladesEdgeArena", coords = {0, 1, 0.29296875, 0.9375}}, -- Circle of Blood Arena
				[617] = {file = "LoadScreenDalaranSewersArena", coords = {0, 1, 0.29296875, 0.857421875}}, --Dalaran Arena
				[559] = {file = "LoadScreenNagrandArenaBattlegrounds", coords = {0, 1, 0.341796875, 1}}, --Ring of Trials
				[980] = {file = "LoadScreenTolvirArena", coords = {0, 1, 0.29296875, 0.857421875}}, --Tol'Viron Arena
				[572] = {file = "LoadScreenRuinsofLordaeronBattlegrounds", coords = {0, 1, 0.341796875, 1}}, --Ruins of Lordaeron
				[1134] = {file = "LoadingScreen_Shadowpan_bg", coords = {0, 1, 0.29296875, 0.857421875}}, -- Tiger's Peak
				--"LoadScreenOrgrimmarArena", --Ring of Valor 
			}
			function _detalhes:GetArenaInfo (mapid)
				local t = _detalhes.arena_info [mapid]
				if (t) then
					return t.file, t.coords
				end
			end
			_detalhes.battleground_info = {
				[489] = {file = "LoadScreenWarsongGulch", coords = {0, 1, 121/512, 484/512}}, --warsong gulch
				[727] = {file = "LoadScreenSilvershardMines", coords = {0, 1, 251/1024, 840/1024}}, --silvershard mines
				[529] = {file = "LoadscreenArathiBasin", coords = {0, 1, 126/512, 430/512}}, --arathi basin
				[566] = {file = "LoadScreenNetherBattlegrounds", coords = {0, 1, 142/512, 466/512}}, --eye of the storm
				[30] = {file = "LoadScreenPvpBattleground", coords = {0, 1, 127/512, 500/512}}, --alterac valley
				[761] = {file = "LoadScreenGilneasBG2", coords = {0, 1, 281/1024, 878/1024}}, --the battle for gilneas
				[726] = {file = "LoadScreenTwinPeaksBG", coords = {0, 1, 294/1024, 876/1024}}, --twin peaks
				[998] = {file = "LoadScreenValleyofPower", coords = {0, 1, 257/1024, 839/1024}}, --temple of kotmogu
				[1105] = {file = "LoadScreen_GoldRush", coords = {0, 1, 264/1024, 840/1024}}, --deepwind gorge
				[607] = {file = "LoadScreenNorthrendBG", coords = {0, 1, 302/1024, 879/1024}}, --strand of the ancients
				[628] = {file = "LOADSCREENISLEOFCONQUEST", coords = {0, 1, 297/1024, 878/1024}}, --isle of conquest
				--[] = {file = "", coords = {0, 1, 0, 0}}, --
			}
			function _detalhes:GetBattlegroundInfo (mapid)
				local t = _detalhes.battleground_info [mapid]
				if (t) then
					return t.file, t.coords
				end
			end
		--> armazena instancias inativas
			_detalhes.unused_instances = {}
			_detalhes.default_skin_to_use = "Minimalistic"
			_detalhes.instance_title_text_timer = {}
		--> player detail skin
			_detalhes.playerdetailwindow_skins = {}
		
		--> tooltip
			_detalhes.tooltip_backdrop = {
				bgFile = [[Interface\DialogFrame\UI-DialogBox-Background-Dark]], 
				edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], 
				tile = true,
				edgeSize = 16, 
				tileSize = 16, 
				insets = {left = 3, right = 3, top = 4, bottom = 4}
			}
			_detalhes.tooltip_border_color = {1, 1, 1, 1}
			_detalhes.tooltip_spell_icon = {file = [[Interface\CHARACTERFRAME\UI-StateIcon]], coords = {36/64, 58/64, 7/64, 26/64}}
			--_detalhes.tooltip_target_icon = {file = [[Interface\CHARACTERFRAME\UI-StateIcon]], coords = {36/64, 58/64, 7/64, 26/64}}
		
		--> icons
			_detalhes.attribute_icons = [[Interface\AddOns\Details\images\atributos_icones]]
			function _detalhes:GetAttributeIcon (attribute)
				return _detalhes.attribute_icons, 0.125 * (attribute - 1), 0.125 * attribute, 0, 1
			end
	--> Plugins
	
		_detalhes.PluginsGlobalNames = {}
		_detalhes.PluginsLocalizedNames = {}
		
		--> raid -------------------------------------------------------------------
			--> general function for raid mode plugins
				_detalhes.RaidTables = {} 
			--> menu for raid modes
				_detalhes.RaidTables.Menu = {} 
			--> plugin objects for raid mode
				_detalhes.RaidTables.Plugins = {} 
			--> name to plugin object
				_detalhes.RaidTables.NameTable = {} 
			--> using by
				_detalhes.RaidTables.InstancesInUse = {} 
				_detalhes.RaidTables.PluginsInUse = {} 

		--> solo -------------------------------------------------------------------
			--> general functions for solo mode plugins
				_detalhes.SoloTables = {} 
			--> maintain plugin menu
				_detalhes.SoloTables.Menu = {} 
			--> plugins objects for solo mode
				_detalhes.SoloTables.Plugins = {} 
			--> name to plugin object
				_detalhes.SoloTables.NameTable = {} 
		
		--> toolbar -------------------------------------------------------------------
			--> plugins container
				_detalhes.ToolBar = {}
			--> current showing icons
				_detalhes.ToolBar.Shown = {}
				_detalhes.ToolBar.AllButtons = {}
			--> plugin objects
				_detalhes.ToolBar.Plugins = {}
			--> name to plugin object
				_detalhes.ToolBar.NameTable = {}
				_detalhes.ToolBar.Menu = {}
		
		--> statusbar -------------------------------------------------------------------
			--> plugins container
				_detalhes.StatusBar = {}
			--> maintain plugin menu
				_detalhes.StatusBar.Menu = {} 
			--> plugins object
				_detalhes.StatusBar.Plugins = {} 
			--> name to plugin object
				_detalhes.StatusBar.NameTable = {} 

	--> constants
		_detalhes._detalhes_props = {
			DATA_TYPE_START = 1,	--> Something on start
			DATA_TYPE_END = 2,	--> Something on end

			MODO_ALONE = 1,	--> Solo
			MODO_GROUP = 2,	--> Group
			MODO_ALL = 3,		--> Everything
			MODO_RAID = 4,	--> Raid
		}
		_detalhes.modos = {
			alone = 1, --> Solo
			group = 2,	--> Group
			all = 3,	--> Everything
			raid = 4	--> Raid
		}

		_detalhes.divisores = {
			abre = "(",	--> open
			fecha = ")",	--> close
			colocacao = ". " --> dot
		}
		
		_detalhes.role_texcoord = {
			DAMAGER = "72:130:69:127",
			HEALER = "72:130:2:60",
			TANK = "5:63:69:127",
			NONE = "139:196:69:127",
		}
		
		_detalhes.player_class = {
			["HUNTER"] = true,
			["WARRIOR"] = true,
			["PALADIN"] = true,
			["SHAMAN"] = true,
			["MAGE"] = true,
			["ROGUE"] = true,
			["PRIEST"] = true,
			["WARLOCK"] = true,
			["DRUID"] = true,
			["MONK"] = true,
			["DEATHKNIGHT"] = true,
		}
		
		local Loc = LibStub ("AceLocale-3.0"):GetLocale ("Details")
		
		_detalhes.segmentos = {
			label = Loc ["STRING_SEGMENT"]..": ", 
			overall = Loc ["STRING_TOTAL"], 
			overall_standard = Loc ["STRING_OVERALL"],
			current = Loc ["STRING_CURRENT"], 
			current_standard = Loc ["STRING_CURRENTFIGHT"],
			past = Loc ["STRING_FIGHTNUMBER"] 
		}
		
		_detalhes._detalhes_props["modo_nome"] = {
				[_detalhes._detalhes_props["MODO_ALONE"]] = Loc ["STRING_MODE_SELF"], 
				[_detalhes._detalhes_props["MODO_GROUP"]] = Loc ["STRING_MODE_GROUP"], 
				[_detalhes._detalhes_props["MODO_ALL"]] = Loc ["STRING_MODE_ALL"],
				[_detalhes._detalhes_props["MODO_RAID"]] = Loc ["STRING_MODE_RAID"]
		}
		
		--[[global]] DETAILS_MODE_SOLO = 1
		--[[global]] DETAILS_MODE_RAID = 4
		--[[global]] DETAILS_MODE_GROUP = 2
		--[[global]] DETAILS_MODE_ALL = 3

		_detalhes.icones = {
			--> report window
			report = { 
					up = "Interface\\FriendsFrame\\UI-Toast-FriendOnlineIcon",
					down = "Interface\\ItemAnimations\\MINIMAP\\TRACKING\\Profession",
					disabled = "Interface\\ItemAnimations\\MINIMAP\\TRACKING\\Profession",
					highlight = nil
				}
		}
	
		_detalhes.missTypes = {"ABSORB", "BLOCK", "DEFLECT", "DODGE", "EVADE", "IMMUNE", "MISS", "PARRY", "REFLECT", "RESIST"} --> do not localize-me

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--> frames
	
	local _CreateFrame = CreateFrame --api locals
	local _UIParent = UIParent --api locals
	
	--> Info Window
		_detalhes.janela_info = _CreateFrame ("Frame", "DetailsPlayerDetailsWindow", _UIParent)

	--> Event Frame
		_detalhes.listener = _CreateFrame ("Frame", nil, _UIParent)
		_detalhes.listener:RegisterEvent ("ADDON_LOADED")
		_detalhes.listener:SetFrameStrata ("LOW")
		_detalhes.listener:SetFrameLevel (9)
		_detalhes.listener.FrameTime = 0
	
		_detalhes.overlay_frame = _CreateFrame ("Frame", nil, _UIParent)
		_detalhes.overlay_frame:SetFrameStrata ("TOOLTIP")
	
	--> Pet Owner Finder
		_CreateFrame ("GameTooltip", "DetailsPetOwnerFinder", nil, "GameTooltipTemplate")
		
		
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--> functions
	
	_detalhes.empty_function = function() end
	_detalhes.empty_table = {}
	
	--> register textures and fonts for shared media
		local SharedMedia = LibStub:GetLibrary ("LibSharedMedia-3.0")
		--default bars
		SharedMedia:Register ("statusbar", "Details D'ictum", [[Interface\AddOns\Details\images\bar4]])
		SharedMedia:Register ("statusbar", "Details Vidro", [[Interface\AddOns\Details\images\bar4_vidro]])
		SharedMedia:Register ("statusbar", "Details D'ictum (reverse)", [[Interface\AddOns\Details\images\bar4_reverse]])
		--flat bars
		SharedMedia:Register ("statusbar", "Details Serenity", [[Interface\AddOns\Details\images\bar_serenity]])
		SharedMedia:Register ("statusbar", "BantoBar", [[Interface\AddOns\Details\images\BantoBar]])
		SharedMedia:Register ("statusbar", "Skyline", [[Interface\AddOns\Details\images\bar_skyline]])
		SharedMedia:Register ("statusbar", "WorldState Score", [[Interface\WorldStateFrame\WORLDSTATEFINALSCORE-HIGHLIGHT]])
		SharedMedia:Register ("statusbar", "DGround", [[Interface\AddOns\Details\images\bar_background]])
		
		--window bg and bar border
		SharedMedia:Register ("background", "Details Ground", [[Interface\AddOns\Details\images\background]])
		SharedMedia:Register ("border", "Details BarBorder 1", [[Interface\AddOns\Details\images\border_1]])
		SharedMedia:Register ("border", "Details BarBorder 2", [[Interface\AddOns\Details\images\border_2]])
		SharedMedia:Register ("border", "Details BarBorder 3", [[Interface\AddOns\Details\images\border_3]])
		SharedMedia:Register ("border", "1 Pixel", [[Interface\Buttons\WHITE8X8]])
		--misc fonts
		SharedMedia:Register ("font", "Oswald", [[Interface\Addons\Details\fonts\Oswald-Regular.otf]])
		SharedMedia:Register ("font", "Nueva Std Cond", [[Interface\Addons\Details\fonts\NuevaStd-Cond.otf]])
		SharedMedia:Register ("font", "Accidental Presidency", [[Interface\Addons\Details\fonts\Accidental Presidency.ttf]])
		SharedMedia:Register ("font", "TrashHand", [[Interface\Addons\Details\fonts\TrashHand.TTF]])
		SharedMedia:Register ("font", "Harry P", [[Interface\Addons\Details\fonts\HARRYP__.TTF]])
		SharedMedia:Register ("font", "FORCED SQUARE", [[Interface\Addons\Details\fonts\FORCED SQUARE.ttf]])
		
		SharedMedia:Register ("sound", "d_gun1", [[Interface\Addons\Details\sounds\sound_gun2.ogg]])
		SharedMedia:Register ("sound", "d_gun2", [[Interface\Addons\Details\sounds\sound_gun3.ogg]])
		SharedMedia:Register ("sound", "d_jedi1", [[Interface\Addons\Details\sounds\sound_jedi1.ogg]])
		SharedMedia:Register ("sound", "d_whip1", [[Interface\Addons\Details\sounds\sound_whip1.ogg]])
	
	--> global 'vardump' for dump table contents over chat panel
		function vardump (t)
			if (type (t) ~= "table") then
				return
			end
			for a,b in pairs (t) do 
				print (a,b)
			end
		end
		
	--> global 'table_deepcopy' copies a full table	
		function table_deepcopy (orig)
			local orig_type = type(orig)
			local copy
			if orig_type == 'table' then
				copy = {}
				for orig_key, orig_value in next, orig, nil do
					copy [table_deepcopy (orig_key)] = table_deepcopy (orig_value)
				end
			else
				copy = orig
			end
			return copy
		end
	
	--> delay messages
		function _detalhes:DelayMsg (msg)
			_detalhes.delaymsgs = _detalhes.delaymsgs or {}
			_detalhes.delaymsgs [#_detalhes.delaymsgs+1] = msg
		end
		function _detalhes:ShowDelayMsg()
			if (_detalhes.delaymsgs and #_detalhes.delaymsgs > 0) then
				for _, msg in ipairs (_detalhes.delaymsgs) do 
					print (msg)
				end
			end
			_detalhes.delaymsgs = {}
		end
	
	--> print messages
		function _detalhes:Msg (_string, arg1, arg2, arg3, arg4)
			if (self.__name) then
				--> yes, we have a name!
				print ("|cffffaeae" .. self.__name .. "|r |cffcc7c7c(plugin)|r: " .. (_string or ""), arg1 or "", arg2 or "", arg3 or "", arg4 or "")
			else
				print (Loc ["STRING_DETAILS1"] .. (_string or ""), arg1 or "", arg2 or "", arg3 or "", arg4 or "")
			end
		end
		
	--> welcome
		function _detalhes:WelcomeMsgLogon()
		
			_detalhes:Msg ("you can always reset the addon running the command |cFFFFFF00'/details reinstall'|r if it does fail to load after being updated.")
			
			function _detalhes:wipe_combat_after_failed_load()
				_detalhes.tabela_historico = _detalhes.historico:NovoHistorico()
				_detalhes.tabela_overall = _detalhes.combate:NovaTabela()
				_detalhes.tabela_vigente = _detalhes.combate:NovaTabela (_, _detalhes.tabela_overall)
				_detalhes.tabela_pets = _detalhes.container_pets:NovoContainer()
				_detalhes:UpdateContainerCombatentes()
				
				_detalhes_database.tabela_overall = nil
				_detalhes_database.tabela_historico = nil
				
				_detalhes:Msg ("seems failed to load, please type /reload to try again.")
			end
			_detalhes:ScheduleTimer ("wipe_combat_after_failed_load", 5)
			
		end
		_detalhes.failed_to_load = _detalhes:ScheduleTimer ("WelcomeMsgLogon", 20)
	
	--> key binds
		--> header
			_G ["BINDING_HEADER_Details"] = "Details!"
			_G ["BINDING_HEADER_DETAILS_KEYBIND_SEGMENTCONTROL"] = Loc ["STRING_KEYBIND_SEGMENTCONTROL"]
			_G ["BINDING_HEADER_DETAILS_KEYBIND_SCROLLING"] = Loc ["STRING_KEYBIND_SCROLLING"]
			_G ["BINDING_HEADER_DETAILS_KEYBIND_WINDOW_CONTROL"] = Loc ["STRING_KEYBIND_WINDOW_CONTROL"]
			_G ["BINDING_HEADER_DETAILS_KEYBIND_BOOKMARK"] = Loc ["STRING_KEYBIND_BOOKMARK"]
			_G ["BINDING_HEADER_DETAILS_KEYBIND_REPORT"] = Loc ["STRING_KEYBIND_WINDOW_REPORT_HEADER"]

		--> keys
		
			_G ["BINDING_NAME_DETAILS_TOGGLE_ALL"] = Loc ["STRING_KEYBIND_TOGGLE_WINDOWS"]
			
			_G ["BINDING_NAME_DETAILS_RESET_SEGMENTS"] = Loc ["STRING_KEYBIND_RESET_SEGMENTS"]
			_G ["BINDING_NAME_DETAILS_SCROLL_UP"] = Loc ["STRING_KEYBIND_SCROLL_UP"]
			_G ["BINDING_NAME_DETAILS_SCROLL_DOWN"] = Loc ["STRING_KEYBIND_SCROLL_DOWN"]
	
			_G ["BINDING_NAME_DETAILS_REPORT_WINDOW1"] = format (Loc ["STRING_KEYBIND_WINDOW_REPORT"], 1)
			_G ["BINDING_NAME_DETAILS_REPORT_WINDOW2"] = format (Loc ["STRING_KEYBIND_WINDOW_REPORT"], 2)
	
			_G ["BINDING_NAME_DETAILS_TOOGGLE_WINDOW1"] = format (Loc ["STRING_KEYBIND_TOGGLE_WINDOW"], 1)
			_G ["BINDING_NAME_DETAILS_TOOGGLE_WINDOW2"] = format (Loc ["STRING_KEYBIND_TOGGLE_WINDOW"], 2)
			_G ["BINDING_NAME_DETAILS_TOOGGLE_WINDOW3"] = format (Loc ["STRING_KEYBIND_TOGGLE_WINDOW"], 3)
			_G ["BINDING_NAME_DETAILS_TOOGGLE_WINDOW4"] = format (Loc ["STRING_KEYBIND_TOGGLE_WINDOW"], 4)
			_G ["BINDING_NAME_DETAILS_TOOGGLE_WINDOW5"] = format (Loc ["STRING_KEYBIND_TOGGLE_WINDOW"], 5)
			
			_G ["BINDING_NAME_DETAILS_BOOKMARK1"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 1)
			_G ["BINDING_NAME_DETAILS_BOOKMARK2"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 2)
			_G ["BINDING_NAME_DETAILS_BOOKMARK3"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 3)
			_G ["BINDING_NAME_DETAILS_BOOKMARK4"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 4)
			_G ["BINDING_NAME_DETAILS_BOOKMARK5"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 5)
			_G ["BINDING_NAME_DETAILS_BOOKMARK6"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 6)
			_G ["BINDING_NAME_DETAILS_BOOKMARK7"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 7)
			_G ["BINDING_NAME_DETAILS_BOOKMARK8"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 8)
			_G ["BINDING_NAME_DETAILS_BOOKMARK9"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 9)
			_G ["BINDING_NAME_DETAILS_BOOKMARK10"] = format (Loc ["STRING_KEYBIND_BOOKMARK_NUMBER"], 10)
			
end
