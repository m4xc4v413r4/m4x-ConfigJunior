local button = CreateFrame("Button", "m4xConfigButton", UIParent)
local texture = button:CreateTexture(nil, "BACKGROUND")

local name, _ = UnitName("player")
local realm = GetRealmName()

local addonList = {
	"AdiBags", --[["AdvancedInterfaceOptions", "Auctionator",]]
	"AutoRoll",	"BagSync", "Bazooka", "BigWigs", "Broker_MicroMenu",
	"Broker_WorldQuests", --[["ConfirmSP",]] "CurrencyTracking",
	"Details", "Dominos", "Een", "!KalielsTracker", "Kui_Nameplates",
	"Leatrix_Plus",	--[["m4x-Region",]] "Masque", "MoveAnything",
	"NameplateSCT",	"Postal", "Prat-3.0", "Scrap", "SexyMap",
	"ShadowedUnitFrames", "Skinner", "Toaster", "TokenPrice",
	"WorldQuestAssistant"
}

button:SetFrameStrata("DIALOG")
button:SetPoint("CENTER")
button:SetWidth(490)
button:SetHeight(110)
button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
button:RegisterEvent("ADDON_LOADED")

texture:SetPoint("CENTER")
texture:SetWidth(512)
texture:SetHeight(256)
texture:SetTexture("Interface\\AddOns\\m4x-ConfigJunior\\junior.tga")

SLASH_NUTTIESUI1 = "/nui"
SlashCmdList["NUTTIESUI"] = function()
	if not m4xHideButton then
		button:Hide()
		m4xHideButton = true
	elseif m4xHideButton then
		button:Show()
		m4xHideButton = nil
	end
end

button:SetScript("OnEvent", function(self, event, addon)
	if not m4xHideButton and addon == "m4x-ConfigJunior" then
		button:Show()
	elseif m4xHideButton and addon == "m4x-ConfigJunior" then
		button:Hide()
	end
end)

button:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP")
	GameTooltip:SetText("Nutties UI")
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine(string.format("Create configuration for %s-%s", name, realm))
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("Instructions:")
	GameTooltip:AddLine("1. Left-Click to Create Junior's Settings")
	GameTooltip:AddLine("2. Right-Click to Reload and Apply those Settings")
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("Note: Type '/nui' to hide/show this button at any time")
	GameTooltip:Show()
end)

button:SetScript("OnLeave", function(self)
	GameTooltip:Hide()
end)

local function CreateConfig(opt)
	-------------------- AdiBags --------------------
	if opt == "AdiBags" then
		if AdiBagsDB.profiles.Junior then
			AdiBagsDB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			AdiBagsDB = {
				["namespaces"] = {
					["ItemLevel"] = {
					},
					["FilterOverride"] = {
						["profiles"] = {
							["Junior"] = {
								["version"] = 3,
								["overrides"] = {
									[146907] = "Consumable#Sentinax",
									[146911] = "Consumable#Sentinax",
									[147349] = "Champion Equipment#Champion Equipment",
									[140192] = "Miscellaneous#Travel",
									[146923] = "Consumable#Sentinax",
									[128353] = "Miscellaneous#Travel",
									[146908] = "Consumable#Sentinax",
									[146912] = "Consumable#Sentinax",
									[147350] = "Champion Equipment#Champion Equipment",
									[6948] = "Miscellaneous#Travel",
									[146905] = "Consumable#Sentinax",
									[146909] = "Consumable#Sentinax",
									[146913] = "Consumable#Sentinax",
									[147355] = "Consumable#Sentinax",
									[110560] = "Miscellaneous#Travel",
									[146906] = "Consumable#Sentinax",
									[146910] = "Consumable#Sentinax",
									[147348] = "Champion Equipment#Champion Equipment",
									[139420] = "Champion Equipment#Champion Equipment",
									[146914] = "Consumable#Sentinax",
									[146903] = "Consumable#Sentinax",
									[146915] = "Consumable#Sentinax",
								},
							},
						},
					},
					["ItemCategory"] = {
						["profiles"] = {
							["Junior"] = {
								["splitBySubclass"] = {
									["Tradeskill"] = false,
									["Gem"] = false,
									["Consumable"] = false,
									["Glyph"] = false,
									["Miscellaneous"] = false,
								},
							},
						},
					},
					["NewItem"] = {
						["profiles"] = {
							["Junior"] = {
								["highlight"] = "blizzard",
							},
						},
					},
					["AdiBags_TooltipInfo"] = {
					},
					["Legion"] = {
						["profiles"] = {
							["Junior"] = {
								["enableTransmog"] = true,
							},
						},
					},
					["MoneyFrame"] = {
					},
					["DataSource"] = {
					},
					["ItemSets"] = {
						["char"] = {
						},
					},
					["CurrencyFrame"] = {
						["profiles"] = {
							["Junior"] = {
								["shown"] = {
									["Mark of the World Tree"] = false,
									["Brawler's Gold"] = false,
									["Bloody Coin"] = false,
									["Nethershard"] = false,
									["Valor"] = false,
									["Seal of Inevitable Fate"] = false,
									["Order Resources"] = false,
									["Echoes of Battle"] = false,
									["Tol Barad Commendation"] = false,
									["Mote of Darkness"] = false,
									["Sightless Eye"] = false,
									["Timeless Coin"] = false,
									["Essence of Corrupted Deathwing"] = false,
									["Lingering Soul Fragment"] = false,
									["Ironpaw Token"] = false,
									["Seal of Broken Fate"] = false,
									["Lesser Charm of Good Fortune"] = false,
									["Curious Coin"] = false,
									["Artifact Fragment"] = false,
									["Timewarped Badge"] = false,
									["Dalaran Jewelcrafter's Token"] = false,
									["Ancient Mana"] = false,
									["Epicurean's Award"] = false,
									["Timeworn Artifact"] = false,
									["Elder Charm of Good Fortune"] = false,
									["Oil"] = false,
									["Warforged Seal"] = false,
									["Apexis Crystal"] = false,
									["Darkmoon Prize Ticket"] = false,
									["Seal of Tempered Fate"] = false,
									["Mogu Rune of Fate"] = false,
									["Garrison Resources"] = false,
									["Champion's Seal"] = false,
									["Legionfall War Supplies"] = false,
								},
							},
						},
					},
					["Junk"] = {
					},
					["Equipment"] = {
					},
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["scale"] = 1,
						["skin"] = {
							["ReagentBankColor"] = {
								nil, -- [1]
								0, -- [2]
								nil, -- [3]
								0.925704218447208, -- [4]
							},
							["BackpackColor"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								0.913216106593609, -- [4]
							},
							["BankColor"] = {
								[3] = 0,
							},
							["border"] = "None",
						},
						["positions"] = {
							["anchor"] = {
								["xOffset"] = -13.578369140625,
								["yOffset"] = 152.927810668945,
							},
							["Bank"] = {
								["xOffset"] = 18.6966953277588,
								["yOffset"] = -17.0167236328125,
							},
							["Backpack"] = {
								["xOffset"] = -1.29931640625,
								["yOffset"] = 128.904312133789,
							},
						},
						["compactLayout"] = true,
						["columnWidth"] = {
							["Bank"] = 8,
							["Backpack"] = 8,
						},
						["qualityOpacity"] = 0.75,
						["positionMode"] = "manual",
					},
				},
			}

			AdiBagsDB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- Advanced Interface --------------------
	if opt == "AdvancedInterfaceOptions" then
		AdvancedInterfaceOptionsSaved = {
			["AccountVars"] = {
				["countdownForCooldowns"] = "0",
				["findYourselfMode"] = "-1",
				["doNotFlashLowHealthWarning"] = "1",
				["splashScreenNormal"] = "10",
				["autoLootDefault"] = "1",
				["SpellQueueWindow"] = "400",
				["showToastConversation"] = "0",
				["floatingCombatTextCombatDamage"] = "0",
				["nameplatePersonalShowWithTarget"] = "1",
				["nameplateShowSelf"] = "0",
				["mapFade"] = "1",
				["nameplateMinScale"] = "1",
				["showArenaEnemyFrames"] = "0",
				["chatStyle"] = "im",
				["showToastFriendRequest"] = "0",
				["nameplatePersonalShowAlways"] = "1",
				["nameplatePersonalShowInCombat"] = "0",
				["profanityFilter"] = "0",
				["lootUnderMouse"] = "0",
				["chatBubbles"] = "0",
				["showTutorials"] = "0",
				["interactOnLeftClick"] = "0",
				["autoDismountFlying"] = "1",
				["showToastOnline"] = "0",
				["showToastOffline"] = "0",
				["showToastWindow"] = "0",
				["enableTwitter"] = "1",
				["ShowNamePlateLoseAggroFlash"] = "0",
				["cameraSmoothStyle"] = "0",
				["deselectOnClick"] = "1",
				["hideAdventureJournalAlerts"] = "1",
			},
			["EnforceSettings"] = true,
		}
	end
	-------------------- Auctionator --------------------
	if opt == "Auctionator" then
		AUCTIONATOR_SAVEDVARS = {
			["_50000"] = 1,
			["_2000"] = 1,
			["_10000"] = 1,
			["_5000000"] = 1,
			["_1000000"] = 1,
			["_200000"] = 1,
			["LOG_DE_DATA_X"] = true,
			["STARTING_DISCOUNT"] = 0,
			["_500"] = 1,
		}
		AUCTIONATOR_DEF_DURATION = "M"
		AUCTIONATOR_DEFTAB = 1
		AUCTIONATOR_SCAN_MINLEVEL = 2
		AUCTIONATOR_DB_MAXHIST_DAYS = 2
	end
	-------------------- AutoRoll --------------------
	if opt == "AutoRoll" then
		AutoRollDB.autoConfirmAll = true
		AutoRollDB.autoRollAll = true
	end
	-------------------- BagSync --------------------
	if opt == "BagSync" then
		BagSyncOpt = {
			["enableCrossRealmsItems"] = true,
			["tooltipOnlySearch"] = false,
			["enableMailbox"] = true,
			["enableFaction"] = true,
			["enableGuild"] = true,
			["dbversion"] = "10.9",
			["enableTooltipItemID"] = false,
			["enableUnitClass"] = false,
			["enableMinimap"] = false,
			["enableAuction"] = true,
			["showGuildNames"] = false,
			["enableTooltips"] = true,
			["enableLoginVersionInfo"] = false,
			["enableRealmShortName"] = false,
			["showTotal"] = true,
			["colors"] = {
				["total"] = {
					["b"] = 0.376470588235294,
					["g"] = 0.643137254901961,
					["r"] = 0.956862745098039,
				},
				["guild"] = {
					["b"] = 0.752941176470588,
					["g"] = 0.72156862745098,
					["r"] = 0.396078431372549,
				},
				["cross"] = {
					["b"] = 0.0392156862745098,
					["g"] = 0.490196078431373,
					["r"] = 1,
				},
				["itemid"] = {
					["b"] = 0.525490196078431,
					["g"] = 0.827450980392157,
					["r"] = 0.32156862745098,
				},
				["first"] = {
					["b"] = 0,
					["g"] = 1,
					["r"] = 0.501960784313726,
				},
				["bnet"] = {
					["b"] = 1,
					["g"] = 0.533333333333333,
					["r"] = 0.207843137254902,
				},
				["second"] = {
					["b"] = 1,
					["g"] = 1,
					["r"] = 1,
				},
			},
			["enableRealmAstrickName"] = false,
			["enableBNetAccountItems"] = false,
			["enableTooltipGreenCheck"] = true,
			["enableTooltipSeperator"] = true,
			["enableRealmIDTags"] = true,
		}
	end
	-------------------- Bazooka --------------------
	if opt == "Bazooka" then
		if BazookaDB.profiles.Junior then
			BazookaDB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			BazookaDB = {
				["namespaces"] = {
					["LibDualSpec-1.0"] = {
					},
				},
				["global"] = {
					["enableOpacityWorkaround"] = true,
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["numBars"] = 3,
						["locked"] = true,
						["plugins"] = {
							["launcher"] = {
								["RaidAchievement"] = {
									["pos"] = 6,
								},
								["PitBull4"] = {
									["area"] = "right",
									["pos"] = 1,
									["bar"] = 3,
								},
								["MinimapButtonFrame"] = {
									["enabled"] = false,
									["pos"] = 5,
								},
								["HotLoot"] = {
									["pos"] = 6,
								},
								["Rematch"] = {
									["area"] = "right",
									["pos"] = 6,
									["bar"] = 3,
								},
								["ChatAlerts"] = {
									["enabled"] = false,
									["pos"] = 7,
								},
								["Bazooka"] = {
									["enabled"] = false,
								},
								["Toaster"] = {
									["enabled"] = false,
									["pos"] = 7,
								},
								["Prat"] = {
									["enabled"] = false,
									["pos"] = 6,
								},
								["TradeSkillMasterMinimapIcon"] = {
									["enabled"] = false,
									["pos"] = 1,
								},
								["BeanCounter"] = {
									["pos"] = 1,
								},
								["Skinner"] = {
									["pos"] = 5,
								},
								["SavedInstances"] = {
									["area"] = "right",
									["pos"] = 5,
									["bar"] = 3,
								},
								["Auc-Util-SearchUI"] = {
									["pos"] = 4,
								},
								["Raven"] = {
									["pos"] = 6,
								},
								["Informant"] = {
									["pos"] = 7,
								},
								["BigWigs"] = {
									["pos"] = 9,
								},
								["TradeSkillMaster"] = {
									["enabled"] = false,
									["pos"] = 4,
								},
								["AddonCpuUsage"] = {
									["pos"] = 10,
								},
								["Enchantrix"] = {
									["pos"] = 2,
								},
								["GatherMate2"] = {
									["pos"] = 8,
								},
								["Dominos"] = {
									["area"] = "right",
									["pos"] = 3,
									["bar"] = 3,
								},
								["Auc-Util-AutoMagic"] = {
									["pos"] = 6,
								},
								["LootAppraiser"] = {
									["pos"] = 7,
								},
								["AutoRoll"] = {
									["area"] = "right",
									["pos"] = 4,
									["bar"] = 3,
								},
								["AtlasLoot"] = {
									["pos"] = 6,
								},
								["AucAdvanced"] = {
									["pos"] = 8,
								},
								["BagnonLauncher"] = {
									["pos"] = 6,
								},
								["Masque"] = {
									["enabled"] = false,
								},
							},
							["data source"] = {
								["Calendar"] = {
									["showIcon"] = false,
									["area"] = "left",
									["enabled"] = false,
									["pos"] = 1,
								},
								["Bags"] = {
									["enabled"] = false,
									["pos"] = 21,
								},
								["Currency"] = {
									["pos"] = 10,
								},
								["iCPU"] = {
									["stripColors"] = false,
									["showIcon"] = false,
									["pos"] = 20,
									["bar"] = 2,
								},
								["Artifact"] = {
									["showValue"] = false,
									["showIcon"] = false,
									["area"] = "cleft",
									["alignment"] = "LEFT",
									["pos"] = 1,
									["stripColors"] = false,
									["showSuffix"] = true,
								},
								["Memory usage"] = {
									["enabled"] = false,
									["pos"] = 13,
									["bar"] = 2,
								},
								["LookingForGroup_Icon"] = {
									["pos"] = 22,
								},
								["Reputation"] = {
									["enabled"] = false,
									["pos"] = 13,
									["bar"] = 2,
								},
								["GC-Farms"] = {
									["pos"] = 12,
								},
								["GarrisonMissionManager"] = {
									["enabled"] = false,
									["pos"] = 22,
								},
								["Bad Pet"] = {
									["enabled"] = false,
									["pos"] = 1,
								},
								["BagSyncLDB"] = {
									["showText"] = false,
									["pos"] = 7,
									["bar"] = 3,
								},
								["RepCalc"] = {
									["pos"] = 12,
								},
								["Nameplates"] = {
									["enabled"] = false,
									["pos"] = 16,
								},
								["Dugi"] = {
									["pos"] = 22,
								},
								["Quests"] = {
									["enabled"] = false,
									["pos"] = 27,
								},
								["Latency"] = {
									["area"] = "left",
									["pos"] = 33,
									["bar"] = 2,
								},
								["WoWToken"] = {
									["area"] = "left",
									["pos"] = 20,
									["bar"] = 3,
								},
								["SorhaQuestLog"] = {
									["enabled"] = false,
									["pos"] = 1,
								},
								["iMoney"] = {
									["area"] = "left",
									["enabled"] = false,
									["pos"] = 25,
									["bar"] = 2,
								},
								["WorldQuests"] = {
									["showText"] = false,
									["bar"] = 3,
									["pos"] = 2,
								},
								["Speed"] = {
									["enabled"] = false,
									["pos"] = 31,
									["bar"] = 2,
								},
								["Traffic"] = {
									["enabled"] = false,
									["pos"] = 29,
									["bar"] = 2,
								},
								["gmEquipSet"] = {
									["pos"] = 22,
								},
								["O Item Level"] = {
									["area"] = "center",
									["pos"] = 1,
									["bar"] = 2,
								},
								["FPS"] = {
									["area"] = "left",
									["pos"] = 34,
									["bar"] = 2,
								},
								["GPS"] = {
									["enabled"] = false,
									["pos"] = 34,
									["bar"] = 2,
								},
								["LDB_WhisperPop"] = {
									["pos"] = 23,
								},
								["Memory"] = {
									["manualTooltip"] = false,
									["enabled"] = false,
									["pos"] = 1,
									["bar"] = 2,
								},
								["Broker_GarrisonMission"] = {
									["enabled"] = false,
									["pos"] = 22,
								},
								["iSocial"] = {
									["enabled"] = false,
									["pos"] = 20,
								},
								["GC-Cache"] = {
									["pos"] = 11,
								},
								["TokenPrice"] = {
									["area"] = "left",
									["pos"] = 29,
									["bar"] = 3,
								},
								["Broker_GarrisonOrderhall"] = {
									["stripColors"] = false,
									["showIcon"] = false,
									["enabled"] = false,
									["showValue"] = false,
									["pos"] = 22,
								},
								["Broker_Cash"] = {
									["showIcon"] = false,
									["area"] = "left",
									["pos"] = 20,
									["bar"] = 2,
								},
								["Broker_GarrisonBuilding"] = {
									["enabled"] = false,
									["pos"] = 21,
								},
								["Achievements"] = {
									["enabled"] = false,
									["pos"] = 9,
									["bar"] = 2,
								},
								["Durability"] = {
									["enabled"] = false,
									["pos"] = 3,
								},
								["Stuff"] = {
									["enabled"] = false,
									["showText"] = false,
									["pos"] = 35,
								},
								["Gold"] = {
									["useLabelAsTitle"] = false,
									["area"] = "left",
									["alignment"] = "LEFT",
									["pos"] = 28,
									["bar"] = 2,
								},
								["m4xilvlBroker"] = {
									["useLabelAsTitle"] = false,
									["showValue"] = false,
									["showLabel"] = true,
									["showIcon"] = false,
									["disableTooltip"] = true,
									["area"] = "center",
									["pos"] = 1,
									["bar"] = 2,
								},
								["WeakAuras"] = {
									["area"] = "left",
									["showText"] = false,
									["pos"] = 22,
								},
								["Surprise"] = {
									["enabled"] = false,
									["pos"] = 12,
									["bar"] = 2,
								},
								["AdiBags"] = {
									["enabled"] = false,
									["pos"] = 22,
								},
								["Broker Currency"] = {
									["pos"] = 11,
								},
								["Follower"] = {
									["enabled"] = false,
									["pos"] = 40,
								},
								["XP"] = {
									["enabled"] = false,
									["pos"] = 43,
									["bar"] = 2,
								},
								["Friends"] = {
									["enabled"] = false,
									["pos"] = 30,
								},
								["Details"] = {
									["area"] = "center",
									["enabled"] = false,
									["pos"] = 4,
								},
								["iGuild"] = {
									["pos"] = 22,
									["bar"] = 4,
								},
								["Tanaan Jungle Dailies"] = {
									["enabled"] = false,
									["pos"] = 8,
								},
								["Quest Log"] = {
									["pos"] = 17,
								},
								["Equipment"] = {
									["enabled"] = false,
									["pos"] = 44,
									["bar"] = 2,
								},
								["LookingForGroup_CR"] = {
									["area"] = "left",
									["pos"] = 22,
								},
								["Archaeology"] = {
									["enabled"] = false,
									["pos"] = 14,
								},
								["IDs"] = {
									["enabled"] = false,
									["pos"] = 15,
								},
								["Class Hall"] = {
									["enabled"] = false,
									["pos"] = 28,
									["bar"] = 4,
								},
								["Broker_Wallet"] = {
									["pos"] = 1,
								},
								["Tracking"] = {
									["enabled"] = false,
									["pos"] = 18,
									["bar"] = 4,
								},
								["ClassSpecs"] = {
									["enabled"] = false,
									["pos"] = 23,
								},
								["GC-Missions"] = {
									["pos"] = 18,
								},
								["Skada"] = {
									["enabled"] = false,
									["pos"] = 1,
								},
								["Frenemy"] = {
									["enabled"] = false,
									["pos"] = 26,
								},
								["BugSack"] = {
									["area"] = "left",
									["pos"] = 4,
								},
								["CurrencyTracking"] = {
									["showIcon"] = false,
									["showValue"] = false,
									["stripColors"] = false,
									["pos"] = 21,
								},
								["Ships"] = {
									["enabled"] = false,
									["pos"] = 22,
									["bar"] = 2,
								},
								["BrokerMemory"] = {
									["enabled"] = false,
									["pos"] = 18,
									["bar"] = 2,
								},
								["Missions"] = {
									["enabled"] = false,
									["pos"] = 37,
									["bar"] = 2,
								},
								["Framerate"] = {
									["enabled"] = false,
									["pos"] = 11,
									["bar"] = 2,
								},
								["GuildLog"] = {
									["enabled"] = false,
									["pos"] = 25,
									["bar"] = 2,
								},
								["Clock"] = {
									["enabled"] = false,
									["pos"] = 27,
								},
								["iMail"] = {
									["pos"] = 21,
									["bar"] = 3,
								},
								["ChatChannels"] = {
									["enabled"] = false,
									["pos"] = 39,
								},
								["iFriends"] = {
									["pos"] = 19,
									["bar"] = 4,
								},
								["Artifact Power"] = {
									["enabled"] = false,
									["pos"] = 2,
									["bar"] = 4,
								},
								["Guild"] = {
									["pos"] = 5,
								},
								["Game Menu"] = {
									["enabled"] = false,
									["pos"] = 24,
									["bar"] = 2,
								},
								["Volume"] = {
									["enabled"] = false,
									["pos"] = 11,
								},
								["LootedItemValue"] = {
									["enabled"] = false,
									["pos"] = 22,
								},
								["IncentiveProgram"] = {
									["area"] = "left",
									["pos"] = 7,
								},
								["m4xArtifactBroker"] = {
									["useLabelAsTitle"] = false,
									["stripColors"] = false,
									["showLabel"] = true,
									["showIcon"] = false,
									["area"] = "center",
									["showSuffix"] = false,
									["showValue"] = false,
									["pos"] = 1,
								},
								["Artifact weapon"] = {
									["area"] = "left",
									["enabled"] = false,
								},
								["Garrison"] = {
									["enabled"] = false,
									["pos"] = 32,
									["bar"] = 2,
								},
								["System"] = {
									["pos"] = 1,
									["bar"] = 4,
								},
								["Mail"] = {
									["pos"] = 26,
									["bar"] = 3,
								},
								["Broker_GotMail"] = {
									["enabled"] = false,
									["pos"] = 24,
								},
								["Increasing rate"] = {
									["enabled"] = false,
									["pos"] = 18,
								},
								["DetailsStreamer"] = {
									["enabled"] = false,
									["pos"] = 6,
									["bar"] = 3,
								},
								["Professions"] = {
									["enabled"] = false,
									["pos"] = 41,
								},
								["GC-WorkOrders"] = {
									["pos"] = 36,
								},
								["Broker_MicroMenu"] = {
									["area"] = "left",
									["pos"] = 3,
								},
								["CurrencyTracker"] = {
									["pos"] = 1,
								},
							},
						},
						["bars"] = {
							{
								["bgInset"] = 4,
								["y"] = -0.412169694900513,
								["relPoint"] = "BOTTOMLEFT",
								["frameWidth"] = 553,
								["pos"] = 0,
								["x"] = -0.0838771387934685,
								["point"] = "BOTTOMLEFT",
								["frameHeight"] = 20.0000038146973,
								["attach"] = "none",
								["fontSize"] = 16,
							}, -- [1]
							{
								["bgInset"] = 4,
								["y"] = -0.411565035581589,
								["relPoint"] = "BOTTOMRIGHT",
								["frameWidth"] = 553,
								["pos"] = 0,
								["x"] = 0.084247887134552,
								["point"] = "BOTTOMRIGHT",
								["labelColor"] = {
									["a"] = 1,
								},
								["frameHeight"] = 20.0000038146973,
								["attach"] = "none",
								["fontSize"] = 16,
							}, -- [2]
							{
								["fadeAlpha"] = 0,
								["bgInset"] = 4,
								["y"] = 0.142159909009933,
								["x"] = 0.00967439822852612,
								["frameWidth"] = 366,
								["pos"] = 0,
								["relPoint"] = "TOPRIGHT",
								["point"] = "TOPRIGHT",
								["frameHeight"] = 20.0000038146973,
								["fontSize"] = 16,
							}, -- [3]
						},
					},
				},
			}

			BazookaDB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- BigWigs --------------------
	if opt == "BigWigs" then
		LoadAddOn("BigWigs_Options")

		if BigWigs3DB.namespaces.BigWigs_Plugins_Bars.profiles.Junior then
			BigWigs3DB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			BigWigs3DB = {
				["namespaces"] = {
					["BigWigs_Plugins_Victory"] = {
						["profiles"] = {
							["Junior"] = {
								["bigwigsMsg"] = true,
								["soundName"] = "None",
								["blizzMsg"] = false,
							},
						},
					},
					["BigWigs_Plugins_Bars"] = {
						["profiles"] = {
							["Junior"] = {
								["BigWigsEmphasizeAnchor_y"] = 397.186147596578,
								["BigWigsAnchor_width"] = 164.183151245117,
								["BigWigsAnchor_y"] = 397.872183187148,
								["BigWigsEmphasizeAnchor_x"] = 203.676120374466,
								["emphasizeGrowup"] = true,
								["BigWigsAnchor_x"] = 1048.3773225117,
								["BigWigsEmphasizeAnchor_width"] = 165.944000244141,
								["emphasizeScale"] = 1,
								["font"] = "Friz Quadrata TT",
							},
						},
					},
					["BigWigs_Plugins_Messages"] = {
						["profiles"] = {
							["Junior"] = {
								["BWEmphasizeCountdownMessageAnchor_y"] = 624.472347172163,
								["BWEmphasizeMessageAnchor_x"] = 618.154457739624,
								["BWEmphasizeCountdownMessageAnchor_x"] = 668.138607941939,
								["BWMessageAnchor_y"] = 537.437906506213,
								["BWEmphasizeMessageAnchor_y"] = 703.800116372953,
								["BWMessageAnchor_x"] = 618.865602020742,
								["font"] = "Friz Quadrata TT",
								["fontSize"] = 20,
							},
						},
					},
					["BigWigs_Plugins_Proximity"] = {
						["profiles"] = {
							["Junior"] = {
								["posx"] = 1047.09482828062,
								["fontSize"] = 20,
								["height"] = 120.000068664551,
								["posy"] = 294.849911054604,
								["font"] = "Friz Quadrata TT",
								["width"] = 139.99983215332,
							},
						},
					},
					["BigWigs_Plugins_InfoBox"] = {
						["profiles"] = {
							["Junior"] = {
								["posx"] = 1199.32432326166,
								["posy"] = 358.886572538184,
							},
						},
					},
					["BigWigs_Plugins_Alt Power"] = {
						["profiles"] = {
							["Junior"] = {
								["posx"] = 1174.6015091773,
								["fontSize"] = 13.0000009536743,
								["fontOutline"] = "",
								["font"] = "Friz Quadrata TT",
								["posy"] = 268.026428423256,
							},
						},
					},
				},
				["global"] = {
					["watchedMovies"] = {
					},
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["flash"] = false,
					},
				},
			}
			BigWigs3IconDB = {
				["hide"] = true,
			}

			BigWigs3DB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- Broker_MicroMenu --------------------
	if opt == "Broker_MicroMenu" then
		if Broker_MicroMenuDB.profiles.Junior then
			Broker_MicroMenuDB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			Broker_MicroMenuDB = {
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["showWorldLatency"] = false,
						["showFPS"] = false,
					},
				},
			}

			Broker_MicroMenuDB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- Broker_WorldQuests --------------------
	if opt == "Broker_WorldQuests" then
		BWQcfg.enableClickToOpenMap = true
	end
	-------------------- ConfirmSP --------------------
	if opt == "ConfirmSP" then
		if ConfirmSP.profiles.Junior then
			ConfirmSP.profileKeys[name .. " - " .. realm] = "Junior"
		else
			ConfirmSP = {
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["version"] = "01-42 2017-03-29",
						["verbose"] = false,
						["popups"] = {
							["ORDER_HALL_TALENT_RESEARCH"] = true,
							["DELETE_QUEST_ITEM"] = true,
							["CONFIRM_PURCHASE_NONREFUNDABLE_ITEM"] = true,
							["CONFIRM_MAIL_ITEM_UNREFUNDABLE"] = true,
							["SPELL_CONFIRMATION_PROMPT"] = true,
							["CONFIRM_FOLLOWER_EQUIPMENT"] = true,
							["EQUIP_BIND_TRADEABLE"] = true,
							["REPLACE_ENCHANT"] = true,
							["TRANSMOG_APPLY_WARNING"] = true,
							["CONFIRM_RELIC_REPLACE"] = true,
							["DELETE_GOOD_ITEM"] = true,
							["RESURRECT_NO_TIMER"] = true,
							["DELETE_ITEM"] = true,
							["CONFIM_BEFORE_USE"] = true,
							["CONFIRM_BINDER"] = true,
							["SEND_MONEY"] = true,
							["BUYEMALL_CONFIRM"] = true,
							["CONFIRM_HIGH_COST_ITEM"] = true,
							["RECOVER_CORPSE"] = true,
						},
					},
				},
			}

			ConfirmSP.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- CurrencyTracking --------------------
	if opt == "CurrencyTracking" then
		if CurrencyTrackingDB.profiles.Junior then
			CurrencyTrackingDB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			CurrencyTrackingDB.profiles.Junior = {}
			CurrencyTrackingDB.profiles.Junior.show_currency = false
			CurrencyTrackingDB.profiles.Junior.show_money = false

			CurrencyTrackingDB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- Details --------------------
	if opt == "Details" then
		_detalhes_global = {
			["death_recap"] = {
				["enabled"] = true,
				["show_segments"] = false,
				["show_life_percent"] = false,
				["relevance_time"] = 7,
			},
			["tutorial"] = {
				["bookmark_tutorial"] = false,
				["main_help_button"] = 67,
				["alert_frames"] = {
					false, -- [1]
					false, -- [2]
					false, -- [3]
					false, -- [4]
					false, -- [5]
					false, -- [6]
				},
				["MEMORY_USAGE_ALERT1"] = true,
				["unlock_button"] = 0,
				["logons"] = 67,
				["OPTIONS_PANEL_OPENED"] = true,
				["ATTRIBUTE_SELECT_TUTORIAL1"] = true,
				["ctrl_click_close_tutorial"] = false,
				["version_announce"] = 0,
				["STREAMER_PLUGIN_FIRSTRUN"] = true,
			},
			["global_plugin_database"] = {
				["DETAILS_PLUGIN_ENCOUNTER_DETAILS"] = {
					["encounter_timers_bw"] = {
					},
					["encounter_timers_dbm"] = {
					},
				},
			},
			["realm_sync"] = true,
			["report_pos"] = {
				1, -- [1]
				1, -- [2]
			},
			["details_auras"] = {
			},
			["got_first_run"] = true,
			["savedTimeCaptures"] = {
			},
			["always_use_profile_name"] = "Junior",
			["savedStyles"] = {
			},
			["always_use_profile_exception"] = {
			},
			["latest_report_table"] = {
			},
			["__profiles"] = {
				["Junior"] = {
					["capture_real"] = {
						["heal"] = true,
						["spellcast"] = true,
						["miscdata"] = true,
						["aura"] = true,
						["energy"] = true,
						["damage"] = true,
					},
					["row_fade_in"] = {
						"in", -- [1]
						0.2, -- [2]
					},
					["player_details_window"] = {
						["scale"] = 1,
						["bar_texture"] = "Skyline",
						["skin"] = "ElvUI",
					},
					["numerical_system"] = 1,
					["use_row_animations"] = false,
					["report_heal_links"] = false,
					["remove_realm_from_name"] = true,
					["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
					["report_to_who"] = "",
					["overall_flag"] = 13,
					["profile_save_pos"] = true,
					["tooltip"] = {
						["header_statusbar"] = {
							0.3, -- [1]
							0.3, -- [2]
							0.3, -- [3]
							0.8, -- [4]
							false, -- [5]
							false, -- [6]
							"WorldState Score", -- [7]
						},
						["fontcolor_right"] = {
							1, -- [1]
							0.7, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["tooltip_max_targets"] = 2,
						["icon_size"] = {
							["W"] = 13,
							["H"] = 13,
						},
						["tooltip_max_pets"] = 2,
						["anchor_relative"] = "top",
						["abbreviation"] = 2,
						["anchored_to"] = 1,
						["show_amount"] = false,
						["header_text_color"] = {
							1, -- [1]
							0.9176, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["fontsize"] = 12,
						["background"] = {
							0.196, -- [1]
							0.196, -- [2]
							0.196, -- [3]
							0.8697, -- [4]
						},
						["submenu_wallpaper"] = true,
						["fontsize_title"] = 10,
						["icon_border_texcoord"] = {
							["B"] = 0.921875,
							["L"] = 0.078125,
							["T"] = 0.078125,
							["R"] = 0.921875,
						},
						["commands"] = {
						},
						["tooltip_max_abilities"] = 5,
						["fontface"] = "Friz Quadrata TT",
						["border_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["border_texture"] = "Details BarBorder 3",
						["anchor_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
						["maximize_method"] = 1,
						["border_size"] = 14,
						["fontshadow"] = false,
						["anchor_screen_pos"] = {
							507.7, -- [1]
							-350.5, -- [2]
						},
						["anchor_point"] = "bottom",
						["menus_bg_coords"] = {
							0.309777336120606, -- [1]
							0.924000015258789, -- [2]
							0.213000011444092, -- [3]
							0.279000015258789, -- [4]
						},
						["fontcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["menus_bg_color"] = {
							0.8, -- [1]
							0.8, -- [2]
							0.8, -- [3]
							0.2, -- [4]
						},
					},
					["ps_abbreviation"] = 3,
					["world_combat_is_trash"] = false,
					["update_speed"] = 0.300000011920929,
					["track_item_level"] = true,
					["windows_fade_in"] = {
						"in", -- [1]
						0.2, -- [2]
					},
					["instances_menu_click_to_open"] = false,
					["overall_clear_newchallenge"] = true,
					["time_type"] = 2,
					["instances_disable_bar_highlight"] = false,
					["trash_concatenate"] = false,
					["disable_stretch_from_toolbar"] = false,
					["disable_lock_ungroup_buttons"] = false,
					["memory_ram"] = 64,
					["disable_window_groups"] = false,
					["instances_suppress_trash"] = 0,
					["font_faces"] = {
						["menus"] = "Friz Quadrata TT",
					},
					["segments_amount"] = 12,
					["report_lines"] = 5,
					["skin"] = "WoW Interface",
					["override_spellids"] = true,
					["use_battleground_server_parser"] = true,
					["default_bg_alpha"] = 0.5,
					["clear_ungrouped"] = true,
					["chat_tab_embed"] = {
						["enabled"] = false,
						["tab_name"] = "",
						["single_window"] = false,
					},
					["minimum_combat_time"] = 5,
					["animate_scroll"] = false,
					["cloud_capture"] = true,
					["damage_taken_everything"] = false,
					["scroll_speed"] = 2,
					["new_window_size"] = {
						["height"] = 130,
						["width"] = 320,
					},
					["memory_threshold"] = 3,
					["deadlog_events"] = 32,
					["class_specs_coords"] = {
						[62] = {
							0.251953125, -- [1]
							0.375, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[63] = {
							0.375, -- [1]
							0.5, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[250] = {
							0, -- [1]
							0.125, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[251] = {
							0.125, -- [1]
							0.25, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[252] = {
							0.25, -- [1]
							0.375, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[253] = {
							0.875, -- [1]
							1, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[254] = {
							0, -- [1]
							0.125, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[255] = {
							0.125, -- [1]
							0.25, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[66] = {
							0.125, -- [1]
							0.25, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[257] = {
							0.5, -- [1]
							0.625, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[258] = {
							0.6328125, -- [1]
							0.75, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[259] = {
							0.75, -- [1]
							0.875, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[260] = {
							0.875, -- [1]
							1, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[577] = {
							0.25, -- [1]
							0.375, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[262] = {
							0.125, -- [1]
							0.25, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[581] = {
							0.375, -- [1]
							0.5, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[264] = {
							0.375, -- [1]
							0.5, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[265] = {
							0.5, -- [1]
							0.625, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[266] = {
							0.625, -- [1]
							0.75, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[267] = {
							0.75, -- [1]
							0.875, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[268] = {
							0.625, -- [1]
							0.75, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[269] = {
							0.875, -- [1]
							1, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[270] = {
							0.75, -- [1]
							0.875, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[70] = {
							0.251953125, -- [1]
							0.375, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[102] = {
							0.375, -- [1]
							0.5, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[71] = {
							0.875, -- [1]
							1, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[103] = {
							0.5, -- [1]
							0.625, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[72] = {
							0, -- [1]
							0.125, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[104] = {
							0.625, -- [1]
							0.75, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[73] = {
							0.125, -- [1]
							0.25, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[64] = {
							0.5, -- [1]
							0.625, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[105] = {
							0.75, -- [1]
							0.875, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[65] = {
							0, -- [1]
							0.125, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[256] = {
							0.375, -- [1]
							0.5, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[261] = {
							0, -- [1]
							0.125, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[263] = {
							0.25, -- [1]
							0.375, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
					},
					["close_shields"] = false,
					["class_coords"] = {
						["HUNTER"] = {
							0, -- [1]
							0.25, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["WARRIOR"] = {
							0, -- [1]
							0.25, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["SHAMAN"] = {
							0.25, -- [1]
							0.49609375, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["MAGE"] = {
							0.25, -- [1]
							0.49609375, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["PET"] = {
							0.25, -- [1]
							0.49609375, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["DRUID"] = {
							0.7421875, -- [1]
							0.98828125, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["MONK"] = {
							0.5, -- [1]
							0.73828125, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["DEATHKNIGHT"] = {
							0.25, -- [1]
							0.5, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["MONSTER"] = {
							0, -- [1]
							0.25, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["UNKNOW"] = {
							0.5, -- [1]
							0.75, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["PRIEST"] = {
							0.49609375, -- [1]
							0.7421875, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["ROGUE"] = {
							0.49609375, -- [1]
							0.7421875, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["Alliance"] = {
							0.49609375, -- [1]
							0.7421875, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["ENEMY"] = {
							0, -- [1]
							0.25, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["DEMONHUNTER"] = {
							0.73828126, -- [1]
							1, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["Horde"] = {
							0.7421875, -- [1]
							0.98828125, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["PALADIN"] = {
							0, -- [1]
							0.25, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["UNGROUPPLAYER"] = {
							0.5, -- [1]
							0.75, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["WARLOCK"] = {
							0.7421875, -- [1]
							0.98828125, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
					},
					["overall_clear_logout"] = false,
					["disable_alldisplays_window"] = false,
					["pvp_as_group"] = false,
					["force_activity_time_pvp"] = true,
					["windows_fade_out"] = {
						"out", -- [1]
						0.2, -- [2]
					},
					["death_tooltip_width"] = 300,
					["clear_graphic"] = true,
					["total_abbreviation"] = 2,
					["segments_auto_erase"] = 3,
					["options_group_edit"] = true,
					["segments_amount_to_save"] = 5,
					["minimap"] = {
						["onclick_what_todo"] = 1,
						["radius"] = 160,
						["text_type"] = 1,
						["minimapPos"] = 220,
						["text_format"] = 3,
						["hide"] = false,
					},
					["instances_amount"] = 5,
					["max_window_size"] = {
						["height"] = 450,
						["width"] = 480,
					},
					["trash_auto_remove"] = true,
					["only_pvp_frags"] = false,
					["disable_stretch_button"] = false,
					["time_type_original"] = 2,
					["default_bg_color"] = 0.0941,
					["numerical_system_symbols"] = "auto",
					["segments_panic_mode"] = false,
					["window_clamp"] = {
						-8, -- [1]
						0, -- [2]
						21, -- [3]
						-14, -- [4]
					},
					["standard_skin"] = false,
					["row_fade_out"] = {
						"out", -- [1]
						0.2, -- [2]
					},
					["use_scroll"] = false,
					["hotcorner_topleft"] = {
						["hide"] = false,
					},
					["class_colors"] = {
						["HUNTER"] = {
							0.67, -- [1]
							0.83, -- [2]
							0.45, -- [3]
						},
						["WARRIOR"] = {
							0.78, -- [1]
							0.61, -- [2]
							0.43, -- [3]
						},
						["SHAMAN"] = {
							0, -- [1]
							0.44, -- [2]
							0.87, -- [3]
						},
						["MAGE"] = {
							0.41, -- [1]
							0.8, -- [2]
							0.94, -- [3]
						},
						["ARENA_YELLOW"] = {
							0.9, -- [1]
							0.9, -- [2]
							0, -- [3]
						},
						["UNGROUPPLAYER"] = {
							0.4, -- [1]
							0.4, -- [2]
							0.4, -- [3]
						},
						["DRUID"] = {
							1, -- [1]
							0.49, -- [2]
							0.04, -- [3]
						},
						["MONK"] = {
							0, -- [1]
							1, -- [2]
							0.59, -- [3]
						},
						["DEATHKNIGHT"] = {
							0.77, -- [1]
							0.12, -- [2]
							0.23, -- [3]
						},
						["WARLOCK"] = {
							0.58, -- [1]
							0.51, -- [2]
							0.79, -- [3]
						},
						["UNKNOW"] = {
							0.2, -- [1]
							0.2, -- [2]
							0.2, -- [3]
						},
						["PRIEST"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["ROGUE"] = {
							1, -- [1]
							0.96, -- [2]
							0.41, -- [3]
						},
						["ARENA_GREEN"] = {
							0.1, -- [1]
							0.85, -- [2]
							0.1, -- [3]
						},
						["ENEMY"] = {
							0.94117, -- [1]
							0, -- [2]
							0.0196, -- [3]
							1, -- [4]
						},
						["DEMONHUNTER"] = {
							0.64, -- [1]
							0.19, -- [2]
							0.79, -- [3]
						},
						["version"] = 1,
						["NEUTRAL"] = {
							1, -- [1]
							1, -- [2]
							0, -- [3]
						},
						["PALADIN"] = {
							0.96, -- [1]
							0.55, -- [2]
							0.73, -- [3]
						},
						["PET"] = {
							0.3, -- [1]
							0.4, -- [2]
							0.5, -- [3]
						},
					},
					["report_schema"] = 1,
					["overall_clear_newboss"] = true,
					["font_sizes"] = {
						["menus"] = 10,
					},
					["disable_reset_button"] = false,
					["data_broker_text"] = "",
					["instances_no_libwindow"] = false,
					["instances_segments_locked"] = false,
					["deadlog_limit"] = 16,
					["instances"] = {
						{
							["__pos"] = {
								["normal"] = {
									["y"] = -484.545074462891,
									["x"] = 843.373596191406,
									["w"] = 278.044097900391,
									["h"] = 96.2302017211914,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["show_statusbar"] = false,
							["menu_icons_size"] = 1,
							["color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.900000005960465, -- [4]
							},
							["menu_anchor"] = {
								13, -- [1]
								2, -- [2]
								["side"] = 2,
							},
							["__snapV"] = false,
							["__snapH"] = true,
							["bg_r"] = 0,
							["switch_healer_in_combat"] = false,
							["skin"] = "Minimalistic",
							["hide_out_of_combat"] = false,
							["__was_opened"] = true,
							["following"] = {
								["enabled"] = false,
								["bar_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
								["text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["color_buttons"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["switch_healer"] = false,
							["skin_custom"] = "",
							["total_bar"] = {
								["enabled"] = false,
								["only_in_group"] = true,
								["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
								["color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["hide_in_combat_type"] = 1,
							["menu_anchor_down"] = {
								16, -- [1]
								-3, -- [2]
							},
							["micro_displays_locked"] = true,
							["tooltip"] = {
								["n_abilities"] = 3,
								["n_enemies"] = 3,
							},
							["StatusBarSaved"] = {
								["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
								["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
								["options"] = {
									["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
										["textYMod"] = 1,
										["textXMod"] = 0,
										["textFace"] = "Accidental Presidency",
										["textAlign"] = 0,
										["textStyle"] = 2,
										["textSize"] = 10,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
										["segmentType"] = 2,
										["textXMod"] = 0,
										["textFace"] = "Accidental Presidency",
										["textAlign"] = 0,
										["textStyle"] = 2,
										["textSize"] = 10,
										["textYMod"] = 1,
									},
									["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
										["textXMod"] = 6,
										["textFace"] = "Accidental Presidency",
										["textAlign"] = 0,
										["textStyle"] = 2,
										["timeType"] = 1,
										["textSize"] = 10,
										["textYMod"] = 1,
									},
								},
								["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
							},
							["switch_damager"] = false,
							["switch_all_roles_in_combat"] = false,
							["instance_button_anchor"] = {
								-27, -- [1]
								1, -- [2]
							},
							["version"] = 3,
							["row_info"] = {
								["textR_outline"] = false,
								["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
								["textL_outline"] = false,
								["textR_outline_small"] = true,
								["textL_outline_small"] = true,
								["percent_type"] = 1,
								["fixed_text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
								["space"] = {
									["right"] = 0,
									["left"] = 0,
									["between"] = 0,
								},
								["texture_background_class_color"] = false,
								["textL_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
								["textL_custom_text"] = "{data1}. {data3}{data2}",
								["font_size"] = 18,
								["texture_custom_file"] = "Interface\\",
								["texture_file"] = "Interface\\AddOns\\Details\\images\\BantoBar",
								["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small_alpha",
								["height"] = 22,
								["texture_background_file"] = "Interface\\AddOns\\Details\\images\\bar4_reverse",
								["textR_bracket"] = "(",
								["texture_custom"] = "",
								["models"] = {
									["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
									["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
									["upper_alpha"] = 0.5,
									["lower_enabled"] = false,
									["lower_alpha"] = 0.1,
									["upper_enabled"] = false,
								},
								["fixed_texture_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
								},
								["textL_show_number"] = false,
								["fixed_texture_background_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									0.150228589773178, -- [4]
								},
								["textR_enable_custom_text"] = false,
								["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
								["texture"] = "BantoBar",
								["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
								["start_after_icon"] = false,
								["textR_class_colors"] = false,
								["textL_class_colors"] = false,
								["textR_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["texture_background"] = "Details D'ictum (reverse)",
								["alpha"] = 1,
								["no_icon"] = false,
								["textL_enable_custom_text"] = false,
								["backdrop"] = {
									["enabled"] = false,
									["size"] = 12,
									["color"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["texture"] = "Details BarBorder 2",
								},
								["font_face"] = "Accidental Presidency",
								["texture_class_colors"] = true,
								["textR_show_data"] = {
									true, -- [1]
									true, -- [2]
									true, -- [3]
								},
								["fast_ps_update"] = true,
								["textR_separator"] = ",",
								["use_spec_icons"] = true,
							},
							["__locked"] = true,
							["menu_alpha"] = {
								["enabled"] = false,
								["onenter"] = 1,
								["iconstoo"] = true,
								["ignorebars"] = false,
								["onleave"] = 1,
							},
							["row_show_animation"] = {
								["anim"] = "Fade",
								["options"] = {
								},
							},
							["show_sidebars"] = false,
							["switch_damager_in_combat"] = false,
							["strata"] = "LOW",
							["grab_on_top"] = false,
							["__snap"] = {
								2, -- [1]
							},
							["ignore_mass_showhide"] = false,
							["hide_in_combat_alpha"] = 0,
							["plugins_grow_direction"] = 1,
							["menu_icons"] = {
								true, -- [1]
								true, -- [2]
								true, -- [3]
								true, -- [4]
								true, -- [5]
								false, -- [6]
								["space"] = -2,
								["shadow"] = true,
							},
							["desaturated_menu"] = false,
							["auto_hide_menu"] = {
								["left"] = false,
								["right"] = false,
							},
							["bars_grow_direction"] = 1,
							["window_scale"] = 1,
							["bg_alpha"] = 0.550000011920929,
							["statusbar_info"] = {
								["alpha"] = 0.900000005960465,
								["overlay"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
								},
							},
							["libwindow"] = {
								["y"] = 19.9372997283936,
								["x"] = 0,
								["point"] = "BOTTOMRIGHT",
							},
							["hide_icon"] = true,
							["switch_tank_in_combat"] = false,
							["backdrop_texture"] = "Details Ground",
							["auto_current"] = true,
							["toolbar_side"] = 1,
							["bg_g"] = 0,
							["bg_b"] = 0,
							["hide_in_combat"] = false,
							["posicao"] = {
								["normal"] = {
									["y"] = -484.545074462891,
									["x"] = 843.373596191406,
									["w"] = 278.044097900391,
									["h"] = 96.2302017211914,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["switch_tank"] = false,
							["switch_all_roles_after_wipe"] = false,
							["wallpaper"] = {
								["enabled"] = false,
								["texcoord"] = {
									0, -- [1]
									1, -- [2]
									0, -- [3]
									0.7, -- [4]
								},
								["overlay"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["anchor"] = "all",
								["height"] = 114.042518615723,
								["alpha"] = 0.5,
								["width"] = 283.000183105469,
							},
							["stretch_button_side"] = 1,
							["micro_displays_side"] = 2,
							["bars_sort_direction"] = 1,
							["attribute_text"] = {
								["enabled"] = true,
								["shadow"] = false,
								["side"] = 1,
								["text_size"] = 13,
								["custom_text"] = "{name}",
								["text_face"] = "Accidental Presidency",
								["anchor"] = {
									-18, -- [1]
									3, -- [2]
								},
								["text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["enable_custom_text"] = false,
								["show_timer"] = {
									true, -- [1]
									true, -- [2]
									true, -- [3]
								},
							},
							["bars_inverted"] = false,
						}, -- [1]
						{
							["__pos"] = {
								["normal"] = {
									["y"] = -484.545074462891,
									["x"] = 566.864440917969,
									["w"] = 274.974090576172,
									["h"] = 96.2302017211914,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["show_statusbar"] = false,
							["menu_icons_size"] = 1.00176930427551,
							["color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.900000005960465, -- [4]
							},
							["menu_anchor"] = {
								13, -- [1]
								2, -- [2]
								["side"] = 2,
							},
							["__snapV"] = false,
							["__snapH"] = true,
							["bg_r"] = 0,
							["switch_healer_in_combat"] = false,
							["hide_in_combat_type"] = 1,
							["hide_out_of_combat"] = false,
							["__was_opened"] = true,
							["following"] = {
								["bar_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
								["enabled"] = false,
								["text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["color_buttons"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["switch_healer"] = false,
							["bars_sort_direction"] = 1,
							["total_bar"] = {
								["enabled"] = false,
								["only_in_group"] = true,
								["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
								["color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["switch_tank"] = false,
							["menu_anchor_down"] = {
								16, -- [1]
								-3, -- [2]
							},
							["micro_displays_locked"] = true,
							["tooltip"] = {
								["n_abilities"] = 3,
								["n_enemies"] = 3,
							},
							["StatusBarSaved"] = {
								["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
								["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
								["options"] = {
									["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
										["textYMod"] = 1,
										["textXMod"] = 0,
										["textFace"] = "Accidental Presidency",
										["textAlign"] = 0,
										["textStyle"] = 2,
										["textSize"] = 10,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
										["segmentType"] = 2,
										["textXMod"] = 0,
										["textFace"] = "Accidental Presidency",
										["textAlign"] = 0,
										["textStyle"] = 2,
										["textSize"] = 10,
										["textYMod"] = 1,
									},
									["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
										["textXMod"] = 6,
										["textFace"] = "Accidental Presidency",
										["textAlign"] = 0,
										["textStyle"] = 2,
										["timeType"] = 1,
										["textSize"] = 10,
										["textYMod"] = 1,
									},
								},
								["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
							},
							["show_sidebars"] = false,
							["switch_all_roles_in_combat"] = false,
							["instance_button_anchor"] = {
								-27, -- [1]
								1, -- [2]
							},
							["version"] = 3,
							["row_info"] = {
								["textR_outline"] = false,
								["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
								["textL_outline"] = false,
								["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
								["textR_show_data"] = {
									true, -- [1]
									true, -- [2]
									true, -- [3]
								},
								["textL_enable_custom_text"] = false,
								["fixed_text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
								["space"] = {
									["right"] = 0,
									["left"] = 0,
									["between"] = 0,
								},
								["texture_background_class_color"] = false,
								["start_after_icon"] = false,
								["font_face_file"] = "Interface\\Addons\\Details\\fonts\\Accidental Presidency.ttf",
								["textL_custom_text"] = "{data1}. {data3}{data2}",
								["models"] = {
									["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
									["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
									["upper_alpha"] = 0.5,
									["lower_enabled"] = false,
									["lower_alpha"] = 0.1,
									["upper_enabled"] = false,
								},
								["texture_custom_file"] = "Interface\\",
								["texture_file"] = "Interface\\AddOns\\Details\\images\\BantoBar",
								["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small_alpha",
								["textR_bracket"] = "(",
								["font_size"] = 18,
								["use_spec_icons"] = true,
								["textR_enable_custom_text"] = false,
								["backdrop"] = {
									["enabled"] = false,
									["texture"] = "Details BarBorder 2",
									["color"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["size"] = 12,
								},
								["fixed_texture_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
								},
								["textL_show_number"] = false,
								["fixed_texture_background_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									0.150228589773178, -- [4]
								},
								["percent_type"] = 1,
								["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
								["texture"] = "BantoBar",
								["textR_outline_small"] = true,
								["textL_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["textL_outline_small"] = true,
								["texture_background"] = "Details D'ictum (reverse)",
								["alpha"] = 1,
								["textR_class_colors"] = false,
								["textR_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["no_icon"] = false,
								["textL_class_colors"] = false,
								["texture_custom"] = "",
								["font_face"] = "Accidental Presidency",
								["texture_class_colors"] = true,
								["texture_background_file"] = "Interface\\AddOns\\Details\\images\\bar4_reverse",
								["fast_ps_update"] = false,
								["textR_separator"] = ",",
								["height"] = 22,
							},
							["__locked"] = true,
							["menu_alpha"] = {
								["enabled"] = false,
								["onleave"] = 1,
								["ignorebars"] = false,
								["iconstoo"] = true,
								["onenter"] = 1,
							},
							["row_show_animation"] = {
								["anim"] = "Fade",
								["options"] = {
								},
							},
							["micro_displays_side"] = 2,
							["bg_b"] = 0,
							["strata"] = "LOW",
							["grab_on_top"] = false,
							["__snap"] = {
								[3] = 1,
							},
							["ignore_mass_showhide"] = false,
							["hide_in_combat_alpha"] = 0,
							["plugins_grow_direction"] = 1,
							["menu_icons"] = {
								true, -- [1]
								true, -- [2]
								true, -- [3]
								true, -- [4]
								true, -- [5]
								false, -- [6]
								["space"] = -2,
								["shadow"] = true,
							},
							["desaturated_menu"] = false,
							["auto_hide_menu"] = {
								["left"] = false,
								["right"] = false,
							},
							["bars_grow_direction"] = 1,
							["window_scale"] = 1,
							["statusbar_info"] = {
								["alpha"] = 0.900000005960465,
								["overlay"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
								},
							},
							["libwindow"] = {
								["y"] = 19.9372997283936,
								["x"] = -278.044067382813,
								["point"] = "BOTTOMRIGHT",
							},
							["bg_alpha"] = 0.550000011920929,
							["hide_icon"] = true,
							["switch_tank_in_combat"] = false,
							["backdrop_texture"] = "Details Ground",
							["auto_current"] = true,
							["toolbar_side"] = 1,
							["bg_g"] = 0,
							["skin"] = "Minimalistic",
							["hide_in_combat"] = false,
							["posicao"] = {
								["normal"] = {
									["y"] = -484.545074462891,
									["x"] = 566.864440917969,
									["w"] = 274.974090576172,
									["h"] = 96.2302017211914,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["switch_all_roles_after_wipe"] = false,
							["switch_damager"] = false,
							["wallpaper"] = {
								["overlay"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["texcoord"] = {
									0, -- [1]
									1, -- [2]
									0, -- [3]
									0.7, -- [4]
								},
								["enabled"] = false,
								["anchor"] = "all",
								["height"] = 114.042518615723,
								["alpha"] = 0.5,
								["width"] = 283.000183105469,
							},
							["stretch_button_side"] = 1,
							["switch_damager_in_combat"] = false,
							["skin_custom"] = "",
							["attribute_text"] = {
								["show_timer"] = {
									true, -- [1]
									true, -- [2]
									true, -- [3]
								},
								["shadow"] = false,
								["side"] = 1,
								["text_size"] = 13,
								["custom_text"] = "{name}",
								["text_face"] = "Accidental Presidency",
								["anchor"] = {
									-18, -- [1]
									3, -- [2]
								},
								["enabled"] = true,
								["enable_custom_text"] = false,
								["text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									1, -- [4]
								},
							},
							["bars_inverted"] = false,
						}, -- [2]
					},
				},
			},
			["always_use_profile"] = true,
			["latest_news_saw"] = "",
			["exit_log"] = {
				"1 - Closing Janela Info.", -- [1]
				"2 - Clearing user place from instances.", -- [2]
				"4 - Reversing switches.", -- [3]
				"6 - Saving Config.", -- [4]
				"7 - Saving Profiles.", -- [5]
				"8 - Saving nicktag cache.", -- [6]
			},
			["lastUpdateWarning"] = 1497594203,
			["report_where"] = "SAY",
		}

		_detalhes_database.announce_interrupts.enabled = true
	end
	-------------------- Dominos --------------------
	if opt == "Dominos" then
		if DominosDB.profiles.Junior then
			DominosDB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			DominosDB = {
				["namespaces"] = {
					["ProgressBars"] = {
						["global"] = {
							["version"] = 1,
						},
					},
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["frames"] = {
							{
								["showInPetBattleUI"] = false,
								["point"] = "BOTTOM",
								["scale"] = 1.25,
								["showInOverrideUI"] = false,
								["y"] = 15,
								["showstates"] = "",
								["clickThrough"] = false,
								["spacing"] = 0,
								["pages"] = {
									["DEATHKNIGHT"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
									["WARRIOR"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
									["ROGUE"] = {
										["page2"] = 1,
										["shadowdance"] = 6,
										["page5"] = 4,
										["page4"] = 3,
										["stealth"] = 6,
										["page3"] = 2,
										["page6"] = 5,
									},
									["MAGE"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
									["PRIEST"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
									["PALADIN"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
									["WARLOCK"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
									["DEMONHUNTER"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
									["HUNTER"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
									["DRUID"] = {
										["bear"] = 8,
										["tree"] = 7,
										["page2"] = 1,
										["cat"] = 6,
										["page5"] = 4,
										["page4"] = 3,
										["moonkin"] = 9,
										["page3"] = 2,
										["page6"] = 5,
									},
									["MONK"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
									["SHAMAN"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
								},
								["numButtons"] = 12,
							}, -- [1]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["padH"] = 2,
								["spacing"] = 4,
								["anchor"] = "4BC",
								["numButtons"] = 12,
								["pages"] = {
									["DEATHKNIGHT"] = {
									},
									["WARRIOR"] = {
									},
									["ROGUE"] = {
									},
									["MAGE"] = {
									},
									["PRIEST"] = {
									},
									["PALADIN"] = {
									},
									["WARLOCK"] = {
									},
									["DEMONHUNTER"] = {
									},
									["HUNTER"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["SHAMAN"] = {
									},
								},
								["y"] = -216,
							}, -- [2]
							{
								["showInPetBattleUI"] = false,
								["point"] = "BOTTOMRIGHT",
								["scale"] = 1,
								["showInOverrideUI"] = false,
								["padW"] = 2,
								["x"] = -57,
								["spacing"] = 0,
								["padH"] = 2,
								["numButtons"] = 12,
								["pages"] = {
									["DEATHKNIGHT"] = {
									},
									["WARRIOR"] = {
										["page2"] = 2,
									},
									["ROGUE"] = {
									},
									["MAGE"] = {
									},
									["PRIEST"] = {
									},
									["PALADIN"] = {
									},
									["WARLOCK"] = {
									},
									["DEMONHUNTER"] = {
									},
									["HUNTER"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["SHAMAN"] = {
									},
								},
								["y"] = 170,
							}, -- [3]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["padH"] = 2,
								["spacing"] = 4,
								["anchor"] = "7BC",
								["pages"] = {
									["DEATHKNIGHT"] = {
									},
									["WARRIOR"] = {
									},
									["ROGUE"] = {
									},
									["MAGE"] = {
									},
									["PRIEST"] = {
									},
									["PALADIN"] = {
									},
									["WARLOCK"] = {
									},
									["DEMONHUNTER"] = {
									},
									["HUNTER"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["SHAMAN"] = {
									},
								},
								["numButtons"] = 12,
								["y"] = -176,
							}, -- [4]
							{
								["showInPetBattleUI"] = false,
								["point"] = "BOTTOMRIGHT",
								["scale"] = 1,
								["showInOverrideUI"] = false,
								["padW"] = 2,
								["x"] = -57,
								["spacing"] = 0,
								["padH"] = 2,
								["y"] = 134,
								["pages"] = {
									["DEATHKNIGHT"] = {
									},
									["WARRIOR"] = {
									},
									["ROGUE"] = {
									},
									["MAGE"] = {
									},
									["PRIEST"] = {
									},
									["PALADIN"] = {
									},
									["WARLOCK"] = {
									},
									["DEMONHUNTER"] = {
									},
									["HUNTER"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["SHAMAN"] = {
									},
								},
								["numButtons"] = 12,
							}, -- [5]
							{
								["showInPetBattleUI"] = false,
								["point"] = "BOTTOM",
								["scale"] = 1.25,
								["showInOverrideUI"] = false,
								["y"] = 51,
								["showstates"] = "",
								["spacing"] = 0,
								["numButtons"] = 12,
								["pages"] = {
									["DEATHKNIGHT"] = {
									},
									["WARRIOR"] = {
									},
									["ROGUE"] = {
									},
									["MAGE"] = {
									},
									["PRIEST"] = {
									},
									["PALADIN"] = {
									},
									["WARLOCK"] = {
									},
									["DEMONHUNTER"] = {
									},
									["HUNTER"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["SHAMAN"] = {
									},
								},
							}, -- [6]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["padH"] = 2,
								["spacing"] = 4,
								["anchor"] = "8BC",
								["pages"] = {
									["DEATHKNIGHT"] = {
									},
									["WARRIOR"] = {
									},
									["ROGUE"] = {
									},
									["MAGE"] = {
									},
									["PRIEST"] = {
									},
									["PALADIN"] = {
									},
									["WARLOCK"] = {
									},
									["DEMONHUNTER"] = {
									},
									["HUNTER"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["SHAMAN"] = {
									},
								},
								["numButtons"] = 12,
								["y"] = -136,
							}, -- [7]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["padH"] = 2,
								["spacing"] = 4,
								["anchor"] = "9BC",
								["pages"] = {
									["DEATHKNIGHT"] = {
									},
									["WARRIOR"] = {
									},
									["ROGUE"] = {
									},
									["MAGE"] = {
									},
									["PRIEST"] = {
									},
									["PALADIN"] = {
									},
									["WARLOCK"] = {
									},
									["DEMONHUNTER"] = {
									},
									["HUNTER"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["SHAMAN"] = {
									},
								},
								["numButtons"] = 12,
								["y"] = -96,
							}, -- [8]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["padH"] = 2,
								["spacing"] = 4,
								["anchor"] = "10BC",
								["pages"] = {
									["DEATHKNIGHT"] = {
									},
									["WARRIOR"] = {
									},
									["ROGUE"] = {
									},
									["MAGE"] = {
									},
									["PRIEST"] = {
									},
									["PALADIN"] = {
									},
									["WARLOCK"] = {
									},
									["DEMONHUNTER"] = {
									},
									["HUNTER"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["SHAMAN"] = {
									},
								},
								["numButtons"] = 12,
								["y"] = -56,
							}, -- [9]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["y"] = -16,
								["padH"] = 2,
								["spacing"] = 4,
								["anchor"] = "artifactBL",
								["numButtons"] = 12,
								["pages"] = {
									["DEATHKNIGHT"] = {
									},
									["WARRIOR"] = {
									},
									["ROGUE"] = {
									},
									["MAGE"] = {
									},
									["PRIEST"] = {
									},
									["PALADIN"] = {
									},
									["WARLOCK"] = {
									},
									["DEMONHUNTER"] = {
									},
									["HUNTER"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["SHAMAN"] = {
									},
								},
								["padW"] = 2,
							}, -- [10]
							["artifact"] = {
								["point"] = "TOPLEFT",
								["scale"] = 1,
								["lockMode"] = true,
								["padW"] = 2,
								["spacing"] = 1,
								["mode"] = "artifact",
								["numButtons"] = 20,
								["texture"] = "blizzard",
								["showInPetBattleUI"] = false,
								["columns"] = 20,
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["width"] = 1024,
								["font"] = "Friz Quadrata TT",
								["height"] = 12,
								["display"] = {
									["value"] = true,
									["bonus"] = true,
									["max"] = true,
									["label"] = true,
								},
								["alwaysShowText"] = true,
								["padH"] = 2,
							},
							["exp"] = {
								["compressValues"] = false,
								["point"] = "BOTTOM",
								["scale"] = 1,
								["lockMode"] = false,
								["padW"] = 2,
								["fadeAlpha"] = 0,
								["spacing"] = 1,
								["mode"] = "reputation",
								["numButtons"] = 20,
								["texture"] = "blizzard",
								["showInPetBattleUI"] = false,
								["columns"] = 20,
								["showInOverrideUI"] = false,
								["width"] = 863,
								["font"] = "Friz Quadrata TT",
								["height"] = 15,
								["display"] = {
									["remaining"] = true,
									["label"] = true,
									["value"] = true,
									["max"] = true,
									["percent"] = true,
									["bonus"] = true,
								},
								["alwaysShowText"] = true,
								["padH"] = 2,
							},
							["extra"] = {
								["showInPetBattleUI"] = false,
								["showInOverrideUI"] = false,
								["y"] = -260,
							},
							["bags"] = {
								["showInPetBattleUI"] = false,
								["y"] = -89,
								["point"] = "LEFT",
								["spacing"] = 2,
								["anchor"] = "castBL",
								["showInOverrideUI"] = false,
								["alpha"] = 0.9,
								["hidden"] = true,
							},
							["pet"] = {
								["y"] = 109,
								["point"] = "BOTTOM",
								["spacing"] = 6,
								["showInOverrideUI"] = false,
								["showInPetBattleUI"] = false,
							},
							["cast"] = {
								["showInPetBattleUI"] = false,
								["point"] = "LEFT",
								["hidden"] = true,
								["scale"] = 1,
								["showInOverrideUI"] = false,
								["w"] = 240,
								["padW"] = 1,
								["y"] = -58,
								["h"] = 32,
								["font"] = "Friz Quadrata TT",
								["anchor"] = "encounterBL",
								["display"] = {
									["border"] = true,
									["time"] = true,
									["icon"] = false,
								},
								["padH"] = 1,
								["latencyPadding"] = 0,
								["texture"] = "blizzard",
							},
							["menu"] = {
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["scale"] = 1,
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["y"] = -256,
								["fadeAlpha"] = 0,
								["spacing"] = 0,
								["anchor"] = "2BL",
							},
							["class"] = {
								["showInPetBattleUI"] = false,
								["x"] = -217,
								["point"] = "BOTTOM",
								["spacing"] = 2,
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["y"] = 149,
							},
							["alerts"] = {
								["showInPetBattleUI"] = true,
								["point"] = "LEFT",
								["showInOverrideUI"] = true,
								["alpha"] = 0.9,
								["y"] = 200,
								["spacing"] = 2,
								["anchor"] = "menuBL",
								["hidden"] = true,
								["columns"] = 1,
							},
							["vehicle"] = {
								["y"] = -210,
								["x"] = -165,
								["point"] = "TOPRIGHT",
								["showInOverrideUI"] = false,
								["showInPetBattleUI"] = false,
							},
							["roll"] = {
								["showInPetBattleUI"] = true,
								["y"] = 81,
								["point"] = "LEFT",
								["spacing"] = 2,
								["anchor"] = "alertsBC",
								["showInOverrideUI"] = true,
								["hidden"] = true,
								["columns"] = 1,
							},
							["encounter"] = {
								["showInPetBattleUI"] = true,
								["point"] = "LEFT",
								["anchor"] = "rollBL",
								["showInOverrideUI"] = true,
								["hidden"] = true,
								["y"] = -10,
							},
						},
						["showgrid"] = true,
						["possessBar"] = 10,
					},
				},
			}
			DominosVersion = "7.2.2"

			DominosDB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- Een --------------------
	if opt == "Een" then
		Een_ChannelColours = {
			["CHANNEL6"] = {
				"CHANNEL6", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["CHANNEL"] = {
				"CHANNEL", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["PARTY"] = {
				"PARTY", -- [1]
				0.666666686534882, -- [2]
				0.666666686534882, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["CHANNEL_LIST"] = {
				"CHANNEL_LIST", -- [1]
				0.752941250801086, -- [2]
				0.501960813999176, -- [3]
				0.501960813999176, -- [4]
				true, -- [5]
			},
			["SYSTEM"] = {
				"SYSTEM", -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["RAID_BOSS_EMOTE"] = {
				"RAID_BOSS_EMOTE", -- [1]
				1, -- [2]
				0.866666734218597, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["CHANNEL7"] = {
				"CHANNEL7", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["SKILL"] = {
				"SKILL", -- [1]
				0.333333343267441, -- [2]
				0.333333343267441, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["CHANNEL1"] = {
				"CHANNEL1", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["CHANNEL3"] = {
				"CHANNEL3", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["BATTLENET"] = {
				"BATTLENET", -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
				false, -- [5]
			},
			["PET_BATTLE_INFO"] = {
				"PET_BATTLE_INFO", -- [1]
				0.882353007793427, -- [2]
				0.870588302612305, -- [3]
				0.364705890417099, -- [4]
				true, -- [5]
			},
			["LOOT"] = {
				"LOOT", -- [1]
				0, -- [2]
				0.666666686534882, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["IGNORED"] = {
				"IGNORED", -- [1]
				1, -- [2]
				0, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["BN_WHISPER_PLAYER_OFFLINE"] = {
				"BN_WHISPER_PLAYER_OFFLINE", -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["OFFICER"] = {
				"OFFICER", -- [1]
				0.250980406999588, -- [2]
				0.752941250801086, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["YELL"] = {
				"YELL", -- [1]
				1, -- [2]
				0.250980406999588, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["BN_INLINE_TOAST_BROADCAST_INFORM"] = {
				"BN_INLINE_TOAST_BROADCAST_INFORM", -- [1]
				0.509803950786591, -- [2]
				0.772549092769623, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["COMBAT_MISC_INFO"] = {
				"COMBAT_MISC_INFO", -- [1]
				0.501960813999176, -- [2]
				0.501960813999176, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["SAY"] = {
				"SAY", -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["DND"] = {
				"DND", -- [1]
				1, -- [2]
				0.501960813999176, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["GUILD_ACHIEVEMENT"] = {
				"GUILD_ACHIEVEMENT", -- [1]
				0.250980406999588, -- [2]
				1, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["MONSTER_PARTY"] = {
				"MONSTER_PARTY", -- [1]
				0.666666686534882, -- [2]
				0.666666686534882, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["BN_INLINE_TOAST_ALERT"] = {
				"BN_INLINE_TOAST_ALERT", -- [1]
				0.509803950786591, -- [2]
				0.772549092769623, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["CHANNEL4"] = {
				"CHANNEL4", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["WHISPER_FOREIGN"] = {
				"WHISPER_FOREIGN", -- [1]
				1, -- [2]
				0.501960813999176, -- [3]
				1, -- [4]
				false, -- [5]
			},
			["RAID_WARNING"] = {
				"RAID_WARNING", -- [1]
				1, -- [2]
				0.282352954149246, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["BG_SYSTEM_HORDE"] = {
				"BG_SYSTEM_HORDE", -- [1]
				1, -- [2]
				0, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["MONSTER_WHISPER"] = {
				"MONSTER_WHISPER", -- [1]
				1, -- [2]
				0.709803938865662, -- [3]
				0.921568691730499, -- [4]
				true, -- [5]
			},
			["CHANNEL_JOIN"] = {
				"CHANNEL_JOIN", -- [1]
				0.752941250801086, -- [2]
				0.501960813999176, -- [3]
				0.501960813999176, -- [4]
				true, -- [5]
			},
			["WHISPER_INFORM"] = {
				"WHISPER_INFORM", -- [1]
				1, -- [2]
				0.501960813999176, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["QUEST_BOSS_EMOTE"] = {
				"QUEST_BOSS_EMOTE", -- [1]
				1, -- [2]
				0.501960813999176, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["COMBAT_HONOR_GAIN"] = {
				"COMBAT_HONOR_GAIN", -- [1]
				0.878431439399719, -- [2]
				0.792156934738159, -- [3]
				0.0392156876623631, -- [4]
				true, -- [5]
			},
			["CHANNEL5"] = {
				"CHANNEL5", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["TRADESKILLS"] = {
				"TRADESKILLS", -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["BG_SYSTEM_NEUTRAL"] = {
				"BG_SYSTEM_NEUTRAL", -- [1]
				1, -- [2]
				0.470588266849518, -- [3]
				0.0392156876623631, -- [4]
				true, -- [5]
			},
			["FILTERED"] = {
				"FILTERED", -- [1]
				1, -- [2]
				0, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["TEXT_EMOTE"] = {
				"TEXT_EMOTE", -- [1]
				1, -- [2]
				0.501960813999176, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["WHISPER"] = {
				"WHISPER", -- [1]
				1, -- [2]
				0.501960813999176, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["GUILD_ITEM_LOOTED"] = {
				"GUILD_ITEM_LOOTED", -- [1]
				0.250980406999588, -- [2]
				1, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["GUILD"] = {
				"GUILD", -- [1]
				0.250980406999588, -- [2]
				1, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["OPENING"] = {
				"OPENING", -- [1]
				0.501960813999176, -- [2]
				0.501960813999176, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["COMBAT_FACTION_CHANGE"] = {
				"COMBAT_FACTION_CHANGE", -- [1]
				0.501960813999176, -- [2]
				0.501960813999176, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["MONSTER_EMOTE"] = {
				"MONSTER_EMOTE", -- [1]
				1, -- [2]
				0.501960813999176, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["CHANNEL_LEAVE"] = {
				"CHANNEL_LEAVE", -- [1]
				0.752941250801086, -- [2]
				0.501960813999176, -- [3]
				0.501960813999176, -- [4]
				true, -- [5]
			},
			["PET_INFO"] = {
				"PET_INFO", -- [1]
				0.501960813999176, -- [2]
				0.501960813999176, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["CHANNEL10"] = {
				"CHANNEL10", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["ACHIEVEMENT"] = {
				"ACHIEVEMENT", -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["BN_WHISPER_INFORM"] = {
				"BN_WHISPER_INFORM", -- [1]
				0, -- [2]
				1, -- [3]
				0.964705944061279, -- [4]
				true, -- [5]
			},
			["EMOTE"] = {
				"EMOTE", -- [1]
				1, -- [2]
				0.501960813999176, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["COMBAT_XP_GAIN"] = {
				"COMBAT_XP_GAIN", -- [1]
				0.435294151306152, -- [2]
				0.435294151306152, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["CHANNEL2"] = {
				"CHANNEL2", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["BG_SYSTEM_ALLIANCE"] = {
				"BG_SYSTEM_ALLIANCE", -- [1]
				0, -- [2]
				0.682352960109711, -- [3]
				0.937254965305328, -- [4]
				true, -- [5]
			},
			["RESTRICTED"] = {
				"RESTRICTED", -- [1]
				1, -- [2]
				0, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["PARTY_LEADER"] = {
				"PARTY_LEADER", -- [1]
				0.462745130062103, -- [2]
				0.784313797950745, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["CHANNEL8"] = {
				"CHANNEL8", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["CHANNEL_NOTICE"] = {
				"CHANNEL_NOTICE", -- [1]
				0.752941250801086, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["RAID_BOSS_WHISPER"] = {
				"RAID_BOSS_WHISPER", -- [1]
				1, -- [2]
				0.866666734218597, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["AFK"] = {
				"AFK", -- [1]
				1, -- [2]
				0.501960813999176, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["INSTANCE_CHAT_LEADER"] = {
				"INSTANCE_CHAT_LEADER", -- [1]
				1, -- [2]
				0.282352954149246, -- [3]
				0.0352941192686558, -- [4]
				true, -- [5]
			},
			["TARGETICONS"] = {
				"TARGETICONS", -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["INSTANCE_CHAT"] = {
				"INSTANCE_CHAT", -- [1]
				1, -- [2]
				0.498039245605469, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["BN_WHISPER"] = {
				"BN_WHISPER", -- [1]
				0, -- [2]
				1, -- [3]
				0.964705944061279, -- [4]
				true, -- [5]
			},
			["ARENA_POINTS"] = {
				"ARENA_POINTS", -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
				false, -- [5]
			},
			["MONEY"] = {
				"MONEY", -- [1]
				1, -- [2]
				1, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["RAID_LEADER"] = {
				"RAID_LEADER", -- [1]
				1, -- [2]
				0.282352954149246, -- [3]
				0.0352941192686558, -- [4]
				true, -- [5]
			},
			["BN_INLINE_TOAST_CONVERSATION"] = {
				"BN_INLINE_TOAST_CONVERSATION", -- [1]
				0.509803950786591, -- [2]
				0.772549092769623, -- [3]
				1, -- [4]
				false, -- [5]
			},
			["MONSTER_SAY"] = {
				"MONSTER_SAY", -- [1]
				1, -- [2]
				1, -- [3]
				0.623529434204102, -- [4]
				true, -- [5]
			},
			["BN_INLINE_TOAST_BROADCAST"] = {
				"BN_INLINE_TOAST_BROADCAST", -- [1]
				0.509803950786591, -- [2]
				0.772549092769623, -- [3]
				1, -- [4]
				true, -- [5]
			},
			["RAID"] = {
				"RAID", -- [1]
				1, -- [2]
				0.498039245605469, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["CHANNEL_NOTICE_USER"] = {
				"CHANNEL_NOTICE_USER", -- [1]
				0.752941250801086, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
			["PET_BATTLE_COMBAT_LOG"] = {
				"PET_BATTLE_COMBAT_LOG", -- [1]
				0.90588241815567, -- [2]
				0.870588302612305, -- [3]
				0.670588254928589, -- [4]
				true, -- [5]
			},
			["MONSTER_YELL"] = {
				"MONSTER_YELL", -- [1]
				1, -- [2]
				0.250980406999588, -- [3]
				0.250980406999588, -- [4]
				true, -- [5]
			},
			["CURRENCY"] = {
				"CURRENCY", -- [1]
				0, -- [2]
				0.666666686534882, -- [3]
				0, -- [4]
				true, -- [5]
			},
			["CHANNEL9"] = {
				"CHANNEL9", -- [1]
				1, -- [2]
				0.752941250801086, -- [3]
				0.752941250801086, -- [4]
				true, -- [5]
			},
		}
		Een_ChatFrame = {
			{
				548.116516113281, -- [1]
				192.116500854492, -- [2]
				"BOTTOMLEFT", -- [3]
				"BOTTOMLEFT", -- [4]
				2.04600882530212, -- [5]
				26.607873916626, -- [6]
				"General", -- [7]
				17, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.788235366344452, -- [12]
				false, -- [13]
				true, -- [14]
				1, -- [15]
				false, -- [16]
				{
					"SYSTEM", -- [1]
					"SYSTEM_NOMENU", -- [2]
					"SAY", -- [3]
					"EMOTE", -- [4]
					"YELL", -- [5]
					"WHISPER", -- [6]
					"PARTY", -- [7]
					"PARTY_LEADER", -- [8]
					"RAID", -- [9]
					"RAID_LEADER", -- [10]
					"RAID_WARNING", -- [11]
					"MONSTER_SAY", -- [12]
					"MONSTER_YELL", -- [13]
					"MONSTER_EMOTE", -- [14]
					"MONSTER_WHISPER", -- [15]
					"MONSTER_BOSS_EMOTE", -- [16]
					"MONSTER_BOSS_WHISPER", -- [17]
					"ERRORS", -- [18]
					"AFK", -- [19]
					"DND", -- [20]
					"IGNORED", -- [21]
					"BG_HORDE", -- [22]
					"BG_ALLIANCE", -- [23]
					"BG_NEUTRAL", -- [24]
					"CHANNEL", -- [25]
					"ACHIEVEMENT", -- [26]
					"BN_WHISPER_INFORM", -- [27]
					"BN_CONVERSATION", -- [28]
					"BN_WHISPER_PLAYER_OFFLINE", -- [29]
					"PET_BATTLE_INFO", -- [30]
					"INSTANCE_CHAT", -- [31]
					"INSTANCE_CHAT_LEADER", -- [32]
					"GUILD_ITEM_LOOTED", -- [33]
				}, -- [17]
				{
					"General", -- [1]
					1, -- [2]
					"Trade", -- [3]
					2, -- [4]
					"LocalDefense", -- [5]
					22, -- [6]
					"1", -- [7]
					0, -- [8]
					"2", -- [9]
					0, -- [10]
					"22", -- [11]
					0, -- [12]
					"0", -- [13]
					0, -- [14]
				}, -- [18]
				"UIParent", -- [19]
			}, -- [1]
			{
				548.116516113281, -- [1]
				168.116516113281, -- [2]
				"TOPLEFT", -- [3]
				"TOPLEFT", -- [4]
				0, -- [5]
				-24, -- [6]
				"Combat Log", -- [7]
				16, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.788235366344452, -- [12]
				false, -- [13]
				true, -- [14]
				2, -- [15]
				false, -- [16]
				{
					"OPENING", -- [1]
					"TRADESKILLS", -- [2]
					"PET_INFO", -- [3]
					"COMBAT_XP_GAIN", -- [4]
					"COMBAT_HONOR_GAIN", -- [5]
					"COMBAT_MISC_INFO", -- [6]
				}, -- [17]
				{
				}, -- [18]
				"UIParent", -- [19]
			}, -- [2]
			{
				548.116516113281, -- [1]
				192.116500854492, -- [2]
				"TOPLEFT", -- [3]
				"TOPLEFT", -- [4]
				0, -- [5]
				0, -- [6]
				"Loot", -- [7]
				16, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.788235366344452, -- [12]
				false, -- [13]
				true, -- [14]
				3, -- [15]
				false, -- [16]
				{
					"COMBAT_FACTION_CHANGE", -- [1]
					"SKILL", -- [2]
					"LOOT", -- [3]
					"MONEY", -- [4]
					"CURRENCY", -- [5]
					"COMBAT_XP_GAIN", -- [6]
					"COMBAT_HONOR_GAIN", -- [7]
				}, -- [17]
				{
				}, -- [18]
				"UIParent", -- [19]
			}, -- [3]
			{
				548.116516113281, -- [1]
				192.116500854492, -- [2]
				"TOPLEFT", -- [3]
				"TOPLEFT", -- [4]
				0, -- [5]
				0, -- [6]
				"B-Tag", -- [7]
				16, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.788235366344452, -- [12]
				true, -- [13]
				true, -- [14]
				4, -- [15]
				false, -- [16]
				{
					"BN_WHISPER", -- [1]
				}, -- [17]
				{
				}, -- [18]
				"UIParent", -- [19]
			}, -- [4]
			{
				548.116516113281, -- [1]
				192.116500854492, -- [2]
				"TOPLEFT", -- [3]
				"TOPLEFT", -- [4]
				0, -- [5]
				0, -- [6]
				"Guild", -- [7]
				16, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.788235366344452, -- [12]
				false, -- [13]
				true, -- [14]
				5, -- [15]
				false, -- [16]
				{
					"GUILD", -- [1]
					"OFFICER", -- [2]
					"GUILD_ACHIEVEMENT", -- [3]
				}, -- [17]
				{
				}, -- [18]
				"UIParent", -- [19]
			}, -- [5]
			{
				429.999969482422, -- [1]
				120, -- [2]
				"BOTTOMLEFT", -- [3]
				"BOTTOMLEFT", -- [4]
				8.18728446960449, -- [5]
				32.7469253540039, -- [6]
				"test", -- [7]
				12, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.247058838605881, -- [12]
				false, -- [13]
				true, -- [14]
				[18] = {
				},
				[16] = false,
				[17] = {
				},
				[19] = "UIParent",
			}, -- [6]
			{
				429.999969482422, -- [1]
				120, -- [2]
				"BOTTOMLEFT", -- [3]
				"BOTTOMLEFT", -- [4]
				8.18728446960449, -- [5]
				32.7469253540039, -- [6]
				"", -- [7]
				12, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.156862750649452, -- [12]
				false, -- [13]
				true, -- [14]
				[18] = {
				},
				[16] = false,
				[17] = {
				},
				[19] = "UIParent",
			}, -- [7]
			{
				429.999969482422, -- [1]
				120, -- [2]
				"BOTTOMLEFT", -- [3]
				"BOTTOMLEFT", -- [4]
				8.18728446960449, -- [5]
				32.7469253540039, -- [6]
				"", -- [7]
				12, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.156862750649452, -- [12]
				false, -- [13]
				true, -- [14]
				[18] = {
				},
				[16] = false,
				[17] = {
				},
				[19] = "UIParent",
			}, -- [8]
			{
				429.999969482422, -- [1]
				120, -- [2]
				"BOTTOMLEFT", -- [3]
				"BOTTOMLEFT", -- [4]
				8.18728446960449, -- [5]
				32.7469253540039, -- [6]
				"", -- [7]
				12, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.156862750649452, -- [12]
				false, -- [13]
				true, -- [14]
				[18] = {
				},
				[16] = false,
				[17] = {
				},
				[19] = "UIParent",
			}, -- [9]
			{
				429.999969482422, -- [1]
				120, -- [2]
				"BOTTOMLEFT", -- [3]
				"BOTTOMLEFT", -- [4]
				8.18728446960449, -- [5]
				32.7469253540039, -- [6]
				"", -- [7]
				12, -- [8]
				0, -- [9]
				0, -- [10]
				0, -- [11]
				0.156862750649452, -- [12]
				false, -- [13]
				true, -- [14]
				[18] = {
				},
				[16] = false,
				[17] = {
				},
				[19] = "UIParent",
			}, -- [10]
		}
		Een_AutoLoad = true
		Een_Msg = true
		Een_Quiet = true
	end
	-------------------- KalielsTracker --------------------
	if opt == "!KalielsTracker" then
		if KalielsTrackerDB.profiles.Junior then
			KalielsTrackerDB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			KalielsTrackerDB = {
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["xOffset"] = 0,
						["yOffset"] = -271,
						["qiActiveButton"] = false,
						["bgrColor"] = {
							["a"] = 0.773486658930779,
						},
						["version"] = "2.1.5",
						["tooltipShowID"] = false,
						["modulesOrder"] = {
							[3] = "WORLD_QUEST_TRACKER_MODULE",
							[5] = "QUEST_TRACKER_MODULE",
						},
						["textWordWrap"] = true,
						["helpTutorial"] = 10,
						["collapseInInstance"] = true,
					},
				},
			}

			KalielsTrackerDB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- KuiNamePlates --------------------
	if opt == "Kui_Nameplates" then
		KuiNameplatesCoreSaved = {
			["profiles"] = {
				["Junior"] = {
					["tankmode_force_enable"] = true,
					["target_arrows"] = true,
				},
			},
		}

		KuiNameplatesCoreCharacterSaved = {
			["profile"] = "Junior",
		}
	end
	-------------------- LeatrixPlus --------------------
	if opt == "Leatrix_Plus" then
		SlashCmdList["Leatrix_Plus"]("nosave")

		LeaPlusDB = {
			["HotkeyMenu"] = 1,
			["ViewPortBottom"] = 0,
			["BuffFrameX"] = -209,
			["BuffFrameY"] = -32.5,
			["ManageBuffFrame"] = "On",
			["AutoTurnInDailys"] = "On",
			["NoEncounterAlerts"] = "On",
			["MusicContinent"] = "Various",
			["ClassColPlayer"] = "On",
			["ShowMinimapIcon"] = "Off",
			["ViewPortTop"] = 0,
			["InvKey"] = "inv",
			["NoGryphons"] = "Off",
			["FrmEnabled"] = "Off",
			["PlusPanelAlphaCheck"] = "Off",
			["MinimapMouseZoom"] = "Off",
			["LeaStartPage"] = 7,
			["AutoQuestWeekly"] = "On",
			["MainPanelR"] = "CENTER",
			["ShowRevealBox"] = "Off",
			["InviteFromWhisper"] = "On",
			["MinimapScale"] = 1,
			["AutoEnPets"] = "On",
			["ShowActiveSpec"] = "On",
			["SpellIDonTip"] = "On",
			["AutoQuestDaily"] = "On",
			["AccountBlockTrades"] = "On",
			["AhBuyoutOnly"] = "Off",
			["AutoRepairOwnFunds"] = "On",
			["TipHideInCombat"] = "Off",
			["UseArrowKeysInChat"] = "Off",
			["ShowDressTab"] = "On",
			["AcceptPartyFriends"] = "On",
			["HideSpellDuration"] = "On",
			["AccountAutoLoot"] = "On",
			["NoCooldownDuration"] = "On",
			["NoTradeRequests"] = "On",
			["AutoAcceptQuests"] = "On",
			["NoChatFade"] = "Off",
			["AutoRelAshran"] = "Off",
			["StaticCoordsEn"] = "Off",
			["NoRestedEmotes"] = "Off",
			["NoPartyInvites"] = "Off",
			["NoLootAlerts"] = "On",
			["PlusShowTips"] = "On",
			["TipBackSimple"] = "Off",
			["HideZoneText"] = "Off",
			["ManageZoomLevel"] = "On",
			["MergeTrackBtn"] = "Off",
			["PlusPanelScaleCheck"] = "Off",
			["AccountBlockChatInvs"] = "On",
			["AHDuration"] = 3,
			["UseEasyChatResizing"] = "Off",
			["NoAlerts"] = "On",
			["MusicKeyMenu"] = 1,
			["LeaPlusQuestFontSize"] = 18,
			["TipShowTarget"] = "On",
			["CharAddonList"] = "Off",
			["StaticCoordsScale"] = 1.1,
			["NoPetDuels"] = "On",
			["MusicZone"] = "World of Warcraft",
			["NoDuelRequests"] = "On",
			["StaticCoords"] = "Off",
			["AhExtras"] = "Off",
			["CoordsR"] = "TOPRIGHT",
			["NoMissionAlerts"] = "On",
			["QuestFontChange"] = "Off",
			["NoRaidRestrictions"] = "Off",
			["CooldownsOnPlayer"] = "Off",
			["TipOffsetX"] = -4.99108982086182,
			["AccountLootAtMouse"] = "On",
			["NoPetAutomation"] = "On",
			["BuffFrameScale"] = 1,
			["HideCleanupBtns"] = "Off",
			["ManageTradeGuild"] = "Off",
			["NoGuildInvites"] = "On",
			["NoAutoResInCombat"] = "Off",
			["BuffFrameA"] = "TOPRIGHT",
			["AutoRepairGuildFunds"] = "Off",
			["AutoSkipGossip"] = "On",
			["MainPanelX"] = 0,
			["AutoRelTolBarad"] = "On",
			["NoClassBar"] = "Off",
			["AccountAutoSelfCast"] = "On",
			["AutoReleasePvP"] = "On",
			["MaxCameraZoom"] = "On",
			["LeaPlusScaleValue"] = 1,
			["NoAchieveAlerts"] = "On",
			["NoMapEmote"] = "Off",
			["MusicPanelA"] = "CENTER",
			["RoleSave"] = "On",
			["ShowVanityInFrame"] = "Off",
			["HideBodyguard"] = "Off",
			["ShowLFDRoles"] = "On",
			["NoShaders"] = "Off",
			["Frames"] = {
				["GhostFrame"] = {
					["Scale"] = 1,
				},
				["MirrorTimer1"] = {
					["Scale"] = 1,
				},
				["WorldStateAlwaysUpFrame"] = {
					["Scale"] = 1,
				},
				["TargetFrame"] = {
					["Scale"] = 1,
				},
				["PlayerFrame"] = {
					["Scale"] = 1,
				},
			},
			["AutoEnMinor"] = "On",
			["StaticCoordsLock"] = "Off",
			["BlockBnetReq"] = "On",
			["ShowSpellIcons"] = "Off",
			["AutoRelBGs"] = "On",
			["AcceptPremades"] = "On",
			["ShowSpellTips"] = "On",
			["AccountLossOfControl"] = "On",
			["ActionFocusOn"] = "Off",
			["SelectCompletedQuests"] = "On",
			["ActionCamOn"] = "Off",
			["ViewPortAlpha"] = 0,
			["NoProfessionAlerts"] = "On",
			["ColorLocalChannels"] = "On",
			["CombatPlates"] = "Off",
			["ManageBnetReq"] = "Off",
			["SpellOnPlayer"] = "Off",
			["CoordsX"] = -40.9997787475586,
			["AutoEnTotems"] = "On",
			["SelectAvailableQuests"] = "On",
			["UnclampChat"] = "Off",
			["NoCommandBar"] = "On",
			["PlusPanelScale"] = 1,
			["AutoRepairSummary"] = "On",
			["FadeMap"] = "Off",
			["HideMinimapZone"] = "Off",
			["ClassColFrames"] = "Off",
			["ShowMapMod"] = "On",
			["NoStickyChat"] = "Off",
			["NoSoundRested"] = "On",
			["LeaPlusMailFontSize"] = 22,
			["NoConfirmLoot"] = "On",
			["LockoutSharing"] = "Off",
			["HideLevelUpDisplay"] = "Off",
			["NoFriendRequests"] = "Off",
			["HideCraftedNames"] = "Off",
			["MusicPanelY"] = 0,
			["ShowVolumeInFrame"] = "Off",
			["HideErrorFrameText"] = "On",
			["DurabilityStatus"] = "Off",
			["NoChatButtons"] = "Off",
			["AutomateGossip"] = "On",
			["TipShowRank"] = "Off",
			["ViewPortRight"] = 0,
			["NoSocialButton"] = "Off",
			["HideSubzoneText"] = "Off",
			["PlusPanelAlpha"] = 0,
			["RevealWorldMap"] = "On",
			["MoveChatEditBoxToTop"] = "Off",
			["PlayerChainMenu"] = 2,
			["AutoAcceptRes"] = "On",
			["AutoGossipMenu"] = 3,
			["ViewPortResize"] = "Off",
			["ShowVolume"] = "Off",
			["ViewPortEnable"] = "Off",
			["ShowImportantErrors"] = "On",
			["SkipCinematics"] = "Off",
			["ViewPortLeft"] = 0,
			["ViewportResize"] = "Off",
			["HideMinimapTime"] = "Off",
			["SellJunkListing"] = "Off",
			["AutoAcceptSummon"] = "Off",
			["ShowPetSaveBtn"] = "Off",
			["AutoTurnInQuests"] = "On",
			["ShowQuestUpdates"] = "On",
			["CoordsA"] = "TOPRIGHT",
			["NoCombatLogTab"] = "Off",
			["ClassColTarget"] = "On",
			["ShowCooldowns"] = "Off",
			["MaxChatHstory"] = "Off",
			["MailFontChange"] = "Off",
			["MinimapIconPos"] = -19.3443330500883,
			["MinimapMod"] = "Off",
			["MainPanelA"] = "CENTER",
			["NoCharControls"] = "Off",
			["AutoConfirmRole"] = "On",
			["AutoRelWintergrasp"] = "On",
			["ColorGlobalChannels"] = "On",
			["BuffFrameR"] = "TOPRIGHT",
			["TipModEnable"] = "On",
			["AhGoldOnly"] = "On",
			["ShowPlayerChain"] = "Off",
			["EnableHotkey"] = "On",
			["SellJunkSummary"] = "Off",
			["UnivGroupColor"] = "Off",
			["AutoSellJunk"] = "On",
			["AccountDispCharAch"] = "On",
			["StaticCoordsTop"] = "Off",
			["AccountWideOptions"] = "Off",
			["AutoEnName"] = "Off",
			["NoGarrisonAlerts"] = "On",
			["HideTalkingFrame"] = "Off",
			["TipOffsetY"] = 198.112609863281,
			["AutomateQuests"] = "Off",
			["AutoAcceptDailys"] = "On",
			["WorldMapCoords"] = "On",
			["ResThankYouEmote"] = "On",
			["MusicPanelR"] = "CENTER",
			["NoBagAutomation"] = "Off",
			["LeaPlusTipSize"] = 1.15,
			["AutoSelectQuests"] = "On",
			["HideBossBanner"] = "Off",
			["ShowStartTag"] = "Off",
			["ActionHeadMove"] = "Off",
			["ManageRestedEmotes"] = "Off",
			["StaticCoordsBack"] = "Off",
			["AutoEnClassCol"] = "Off",
			["MainPanelY"] = 0,
			["ShowRaidToggle"] = "Off",
			["ShowCooldownID"] = "On",
			["NoHitIndicators"] = "Off",
			["Manageclasscolors"] = "Off",
			["LeaPlusAlphaValue"] = 1,
			["ShowVanityButtons"] = "On",
			["AccountBlockGuildInvs"] = "On",
			["CoordsY"] = -199.200012207031,
			["FasterLooting"] = "On",
			["CooldownTips"] = "On",
			["ActionCamEnable"] = "Off",
			["AutoEnGuardians"] = "On",
			["MusicPanelX"] = 0,
		}
	end
	-------------------- m4x-Region --------------------
	if opt == "m4x-Region" then
		m4xRegionDB = {
			["point"] = "TOPRIGHT",
			["region"] = "US",
			["yOfs"] = -57.3998222351074,
			["xOfs"] = -161.289581298828,
			["relativePoint"] = "TOPRIGHT",
		}
	end
	-------------------- Masque --------------------
	if opt == "Masque" then
		if MasqueDB.profiles.Junior then
			MasqueDB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			MasqueDB = {
				["namespaces"] = {
					["LibDualSpec-1.0"] = {
					},
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["Groups"] = {
							["Blizzard Buffs_Debuffs"] = {
								["Colors"] = {
									["Highlight"] = {
										1, -- [1]
										0, -- [2]
										0.101960784313725, -- [3]
										1, -- [4]
									},
									["Pushed"] = {
										1, -- [1]
										0.988235294117647, -- [2]
										0.858823529411765, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										0.709803921568628, -- [1]
										0.00392156862745098, -- [2]
										0.0823529411764706, -- [3]
										0, -- [4]
									},
									["Backdrop"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0.713421076536179, -- [4]
									},
								},
								["Inherit"] = false,
								["Backdrop"] = true,
								["SkinID"] = "Elegance: Dark",
							},
							["Blizzard Buffs"] = {
								["Colors"] = {
									["Highlight"] = {
										1, -- [1]
										0, -- [2]
										0.101960784313725, -- [3]
										1, -- [4]
									},
									["Pushed"] = {
										1, -- [1]
										0.988235294117647, -- [2]
										0.858823529411765, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										0.709803921568628, -- [1]
										0.00392156862745098, -- [2]
										0.0823529411764706, -- [3]
										0, -- [4]
									},
									["Backdrop"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0.713421076536179, -- [4]
									},
								},
								["Inherit"] = false,
								["Backdrop"] = true,
								["SkinID"] = "Elegance: Dark",
							},
							["WeakAuras"] = {
								["Colors"] = {
									["Highlight"] = {
										1, -- [1]
										0, -- [2]
										0.101960784313725, -- [3]
										1, -- [4]
									},
									["Pushed"] = {
										1, -- [1]
										0.988235294117647, -- [2]
										0.858823529411765, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										0.709803921568628, -- [1]
										0.00392156862745098, -- [2]
										0.0823529411764706, -- [3]
										0, -- [4]
									},
									["Backdrop"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0.713421076536179, -- [4]
									},
								},
								["SkinID"] = "Elegance: Dark",
								["Backdrop"] = true,
							},
							["Kaliel's Tracker_Quest Item Button"] = {
								["Colors"] = {
									["Backdrop"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Normal"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
								},
								["Backdrop"] = true,
							},
							["Masque"] = {
								["Colors"] = {
									["Highlight"] = {
										1, -- [1]
										0, -- [2]
										0.101960784313725, -- [3]
										1, -- [4]
									},
									["Pushed"] = {
										1, -- [1]
										0.988235294117647, -- [2]
										0.858823529411765, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										0.709803921568628, -- [1]
										0.00392156862745098, -- [2]
										0.0823529411764706, -- [3]
										0, -- [4]
									},
									["Backdrop"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0.713421076536179, -- [4]
									},
								},
								["SkinID"] = "Elegance: Dark",
								["Backdrop"] = true,
							},
							["Kaliel's Tracker_Active Button"] = {
								["Colors"] = {
									["Backdrop"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Normal"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
								},
								["Backdrop"] = true,
							},
							["Kaliel's Tracker"] = {
								["Colors"] = {
									["Backdrop"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Normal"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
								},
								["Backdrop"] = true,
							},
							["Dominos"] = {
								["Colors"] = {
									["Highlight"] = {
										1, -- [1]
										0, -- [2]
										0.101960784313725, -- [3]
										1, -- [4]
									},
									["Pushed"] = {
										1, -- [1]
										0.988235294117647, -- [2]
										0.858823529411765, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										0.709803921568628, -- [1]
										0.00392156862745098, -- [2]
										0.0823529411764706, -- [3]
										0, -- [4]
									},
									["Backdrop"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0.713421076536179, -- [4]
									},
								},
								["Inherit"] = false,
								["Backdrop"] = true,
								["SkinID"] = "Elegance: Dark",
							},
							["Blizzard Buffs_Buffs"] = {
								["Colors"] = {
									["Highlight"] = {
										1, -- [1]
										0, -- [2]
										0.101960784313725, -- [3]
										1, -- [4]
									},
									["Pushed"] = {
										1, -- [1]
										0.988235294117647, -- [2]
										0.858823529411765, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										0.709803921568628, -- [1]
										0.00392156862745098, -- [2]
										0.0823529411764706, -- [3]
										0, -- [4]
									},
									["Backdrop"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0.713421076536179, -- [4]
									},
								},
								["Inherit"] = false,
								["Backdrop"] = true,
								["SkinID"] = "Elegance: Dark",
							},
							["Blizzard Buffs_TempEnchant"] = {
								["Colors"] = {
									["Highlight"] = {
										1, -- [1]
										0, -- [2]
										0.101960784313725, -- [3]
										1, -- [4]
									},
									["Pushed"] = {
										1, -- [1]
										0.988235294117647, -- [2]
										0.858823529411765, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										0.709803921568628, -- [1]
										0.00392156862745098, -- [2]
										0.0823529411764706, -- [3]
										0, -- [4]
									},
									["Backdrop"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0.713421076536179, -- [4]
									},
								},
								["Inherit"] = false,
								["Backdrop"] = true,
								["SkinID"] = "Elegance: Dark",
							},
						},
					},
				},
			}

			MasqueDB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- MoveAnything --------------------
	if opt == "MoveAnything" then
		if MADB.profiles.Junior then
			MADB["characters"][realm .. " " .. name] = {["profile"] = "Junior"}
		else
			MADB = {
				["noMMMW"] = false,
				["characters"] = {
				},
				["alwaysShowNudger"] = false,
				["tooltips"] = true,
				["profiles"] = {
					["Junior"] = {
						["name"] = "Junior",
						["frames"] = {
							["VehicleSeatIndicator"] = {
								["orgPos"] = {
									"TOPRIGHT", -- [1]
									"MinimapCluster", -- [2]
									"BOTTOMRIGHT", -- [3]
									40, -- [4]
									15, -- [5]
								},
								["name"] = "VehicleSeatIndicator",
								["pos"] = {
									"TOPRIGHT", -- [1]
									"MinimapCluster", -- [2]
									"BOTTOMRIGHT", -- [3]
									-192.499755859375, -- [4]
									32.3560791015625, -- [5]
								},
							},
							["ReadyCheckFrame"] = {
								["orgPos"] = {
									"CENTER", -- [1]
									"UIParent", -- [2]
									"CENTER", -- [3]
									0, -- [4]
									-10, -- [5]
								},
								["name"] = "ReadyCheckFrame",
								["pos"] = {
									"CENTER", -- [1]
									"UIParent", -- [2]
									"CENTER", -- [3]
									0, -- [4]
									1.99989318847656, -- [5]
								},
							},
							["BonusRollFrame"] = {
								["orgPos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									"TOP", -- [3]
									0, -- [4]
									-135, -- [5]
								},
								["name"] = "BonusRollFrame",
								["pos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									"TOP", -- [3]
									8.94412231445313, -- [4]
									-733.452758789063, -- [5]
								},
							},
							["ZoneAbilityFrame"] = {
								["orgPos"] = {
									"BOTTOM", -- [1]
									"UIParent", -- [2]
									"BOTTOM", -- [3]
									0, -- [4]
									229.000015258789, -- [5]
								},
								["name"] = "ZoneAbilityFrame",
								["pos"] = {
									"BOTTOM", -- [1]
									"UIParent", -- [2]
									"BOTTOM", -- [3]
									1.0234375, -- [4]
									267.885681152344, -- [5]
								},
							},
							["BonusRollMoneyWonFrame"] = {
								["orgPos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									"TOP", -- [3]
									0, -- [4]
									-135, -- [5]
								},
								["name"] = "BonusRollMoneyWonFrame",
								["pos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									"TOP", -- [3]
									7.84066772460938, -- [4]
									-732.313232421875, -- [5]
								},
							},
							["BagsMover"] = {
								["orgPos"] = {
									"BOTTOMRIGHT", -- [1]
									"UIParent", -- [2]
									"BOTTOMRIGHT", -- [3]
									0, -- [4]
									84, -- [5]
								},
								["name"] = "BagsMover",
								["scale"] = 1.16373215970857,
								["orgScale"] = 1,
								["pos"] = {
									"BOTTOMRIGHT", -- [1]
									"UIParent", -- [2]
									"BOTTOMRIGHT", -- [3]
									-16.7077796004109, -- [4]
									128.459259033203, -- [5]
								},
							},
							["WorldStateCaptureBar1"] = {
								["name"] = "WorldStateCaptureBar1",
								["pos"] = {
									"TOPRIGHT", -- [1]
									"MinimapCluster", -- [2]
									"BOTTOMRIGHT", -- [3]
									-21.3663330078125, -- [4]
									-83.912841796875, -- [5]
								},
							},
							["OverrideActionBarExpBar"] = {
								["orgPos"] = {
									"TOP", -- [1]
									"OverrideActionBarBG", -- [2]
									"TOP", -- [3]
									0, -- [4]
									27, -- [5]
								},
								["name"] = "OverrideActionBarExpBar",
								["pos"] = {
									"TOP", -- [1]
									"OverrideActionBarBG", -- [2]
									"TOP", -- [3]
									-6.1035156250e-005, -- [4]
									27.0000076293945, -- [5]
								},
							},
							["DurabilityFrame"] = {
								["orgPos"] = {
									"TOPRIGHT", -- [1]
									"MinimapCluster", -- [2]
									"BOTTOMRIGHT", -- [3]
									-93, -- [4]
									0, -- [5]
								},
								["name"] = "DurabilityFrame",
								["pos"] = {
									"TOPRIGHT", -- [1]
									"UIParent", -- [2]
									"TOPRIGHT", -- [3]
									-216.361450195313, -- [4]
									-191.400207519531, -- [5]
								},
							},
							["MAOptions"] = {
								["orgPos"] = {
									"RIGHT", -- [1]
									"UIParent", -- [2]
									"RIGHT", -- [3]
									-348, -- [4]
									-44.0000038146973, -- [5]
								},
								["name"] = "MAOptions",
								["pos"] = {
									"CENTER", -- [1]
									"UIParent", -- [2]
									"CENTER", -- [3]
									385.795166015625, -- [4]
									-44.0032424926758, -- [5]
								},
							},
							["OverrideActionBar"] = {
								["orgPos"] = {
									"BOTTOM", -- [1]
									"UIParent", -- [2]
									"BOTTOM", -- [3]
									0, -- [4]
									0, -- [5]
								},
								["name"] = "OverrideActionBar",
								["pos"] = {
									"BOTTOM", -- [1]
									"UIParent", -- [2]
									"BOTTOM", -- [3]
									4.577636718750e-005, -- [4]
									0, -- [5]
								},
							},
							["TalkingHeadFrame"] = {
								["orgPos"] = {
									"BOTTOM", -- [1]
									"UIParent", -- [2]
									"BOTTOM", -- [3]
									0, -- [4]
									96, -- [5]
								},
								["name"] = "TalkingHeadFrame",
								["scale"] = 0.538603657268611,
								["orgScale"] = 1,
								["pos"] = {
									"BOTTOM", -- [1]
									"UIParent", -- [2]
									"BOTTOM", -- [3]
									-0.948010769042166, -- [4]
									1768.29272460938, -- [5]
								},
							},
							["TimerTrackerTimer1"] = {
								["name"] = "TimerTrackerTimer1",
								["pos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									"TOP", -- [3]
									2.04681396484375, -- [4]
									-99.7401123046875, -- [5]
								},
							},
							["TooltipMover"] = {
								["orgPos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									0, -- [3]
									0, -- [4]
								},
								["name"] = "TooltipMover",
								["scale"] = 1.30699971516927,
								["orgScale"] = 1,
								["pos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									"TOP", -- [3]
									653.738966012691, -- [4]
									-579.514847882329, -- [5]
								},
							},
							["BagItemTooltipMover"] = {
								["orgPos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									0, -- [3]
									0, -- [4]
								},
								["name"] = "BagItemTooltipMover",
								["pos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									"TOP", -- [3]
									400.121765136719, -- [4]
									-96.19287109375, -- [5]
								},
							},
							["BonusRollLootWonFrame"] = {
								["orgPos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									"TOP", -- [3]
									0, -- [4]
									-135, -- [5]
								},
								["name"] = "BonusRollLootWonFrame",
								["pos"] = {
									"TOP", -- [1]
									"UIParent", -- [2]
									"TOP", -- [3]
									5.99090576171875, -- [4]
									-725.733062744141, -- [5]
								},
							},
							["AuctionProgressFrame"] = {
								["name"] = "AuctionProgressFrame",
								["pos"] = {
									"BOTTOM", -- [1]
									"UIParent", -- [2]
									"BOTTOM", -- [3]
									-6.1035156250e-005, -- [4]
									245.122467041016, -- [5]
								},
							},
							["SpellActivationOverlayFrame"] = {
								["orgPos"] = {
									"CENTER", -- [1]
									"UIParent", -- [2]
									"CENTER", -- [3]
									0, -- [4]
									0, -- [5]
								},
								["name"] = "SpellActivationOverlayFrame",
								["pos"] = {
									"CENTER", -- [1]
									"UIParent", -- [2]
									"CENTER", -- [3]
									0.000152587890625, -- [4]
									162.335632324219, -- [5]
								},
							},
							["MainMenuBarVehicleLeaveButton"] = {
								["orgPos"] = {
									"TOPLEFT", -- [1]
									nil, -- [2]
									"TOPLEFT", -- [3]
									0, -- [4]
									0, -- [5]
								},
								["name"] = "MainMenuBarVehicleLeaveButton",
								["pos"] = {
									"TOPLEFT", -- [1]
									"UIParent", -- [2]
									"TOPLEFT", -- [3]
									1766.4482421875, -- [4]
									-208.836303710938, -- [5]
								},
							},
							["HelpFrame"] = {
								["UIPanelWindows"] = {
									["whileDead"] = 1,
									["pushable"] = 0,
									["area"] = "center",
								},
								["orgPos"] = {
									"CENTER", -- [1]
									"UIParent", -- [2]
									"CENTER", -- [3]
									0, -- [4]
									0, -- [5]
								},
								["name"] = "HelpFrame",
								["pos"] = {
									"BOTTOMLEFT", -- [1]
									"UIParent", -- [2]
									"BOTTOMLEFT", -- [3]
									495.395660400391, -- [4]
									290.597534179688, -- [5]
								},
							},
						},
					},
				},
				["closeGUIOnEscape"] = false,
				["playSound"] = false,
				["noBags"] = false,
				["frameListRows"] = 18,
			}

			MADB["characters"][realm .. " " .. name] = {["profile"] = "Junior"}
		end
	end
	-------------------- NameplateSCT --------------------
	if opt == "NameplateSCT" then
		NameplateSCTDB.global.animations.crit = "fountain"
		NameplateSCTDB.global.font = "Bazooka"
	end
	-------------------- Postal --------------------
	if opt == "Postal" then
		if Postal3DB.profiles.Junior then
			Postal3DB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			Postal3DB.profiles.Junior = {}
			Postal3DB.profiles.Junior.ChatOutput = 3

			Postal3DB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- Prat --------------------
	if opt == "Prat-3.0" then
		if Prat3DB.profiles.Junior then
			Prat3DB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			Prat3DB = {
				["namespaces"] = {
					["Prat_TellTarget"] = {
						["profiles"] = {
							["Default"] = {
								["on"] = false,
							},
						},
					},
					["Prat_AltNames"] = {
						["profiles"] = {
							["Junior"] = {
								["pncol"] = false,
							},
						},
					},
					["Prat_PlayerNames"] = {
						["profiles"] = {
							["Junior"] = {
								["level"] = false,
								["brackets"] = "None",
							},
						},
					},
					["Prat_Frames"] = {
						["profiles"] = {
							["Junior"] = {
								["initialized"] = true,
								["maxchatheightdefault"] = 400,
								["rememberframepositions"] = true,
								["maxchatwidthdefault"] = 608.000061035156,
								["minchatwidthdefault"] = 296,
								["framemetrics"] = {
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00104133655025647,
										["yOffset"] = 0.0240752730468688,
										["height"] = 192.116500854492,
										["width"] = 548.116516113281,
									}, -- [1]
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00260383773944245,
										["width"] = 547.093139648438,
										["height"] = 168.116516113281,
										["yOffset"] = 0.023149462634683,
									}, -- [2]
									{
										["point"] = "BOTTOMLEFT",
										["height"] = 192.116500854492,
										["width"] = 547.093139648438,
										["xOffset"] = 0.00260383773944245,
										["yOffset"] = 0.023149462634683,
									}, -- [3]
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00416699983179569,
										["yOffset"] = 0.0296299997717142,
									}, -- [4]
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00416699983179569,
										["yOffset"] = 0.0296299997717142,
									}, -- [5]
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00416699983179569,
										["yOffset"] = 0.0296299997717142,
									}, -- [6]
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00416699983179569,
										["yOffset"] = 0.0296299997717142,
									}, -- [7]
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00416699983179569,
										["yOffset"] = 0.0296299997717142,
									}, -- [8]
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00416699983179569,
										["yOffset"] = 0.0296299997717142,
									}, -- [9]
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00416699983179569,
										["yOffset"] = 0.0296299997717142,
									}, -- [10]
								},
							},
						},
					},
					["Prat_ChannelColorMemory"] = {
						["profiles"] = {
							["Junior"] = {
								["colors"] = {
									["localdefense"] = {
										["b"] = 0.752941250801086,
										["g"] = 0.752941250801086,
										["r"] = 1,
									},
									["general"] = {
										["b"] = 0.752941250801086,
										["g"] = 0.752941250801086,
										["r"] = 1,
									},
									["lookingforgroup"] = {
										["r"] = 1,
										["g"] = 0.752941250801086,
										["b"] = 0.752941250801086,
									},
									["trade"] = {
										["r"] = 1,
										["g"] = 0.752941250801086,
										["b"] = 0.752941250801086,
									},
								},
							},
						},
					},
					["Prat_Editbox"] = {
						["profiles"] = {
							["Junior"] = {
								["attach"] = "TOP",
								["borderColor"] = {
									["r"] = 0,
									["g"] = 0,
									["b"] = 0,
								},
								["border"] = "None",
							},
						},
					},
					["Prat_Fading"] = {
					},
					["Prat_Font"] = {
						["profiles"] = {
							["Junior"] = {
								["size"] = {
									["ChatFrame5"] = 16,
									["ChatFrame4"] = 16,
									["ChatFrame3"] = 16,
									["ChatFrame2"] = 16,
									["ChatFrame1"] = 17,
								},
							},
						},
					},
					["Prat_KeyBindings"] = {
						["profiles"] = {
							["Junior"] = {
								["on"] = false,
							},
						},
					},
					["Prat_ChatTabs"] = {
						["profiles"] = {
							["Junior"] = {
								["activealpha"] = 1,
								["notactivealpha"] = 1,
								["displaymode"] = {
									["ChatFrame5"] = true,
									["ChatFrame4"] = true,
									["ChatFrame3"] = true,
									["ChatFrame2"] = true,
									["ChatFrame1"] = true,
								},
								["on"] = true,
								["disableflash"] = true,
							},
						},
					},
					["Prat_Scroll"] = {
					},
					["Prat_Bubbles"] = {
						["profiles"] = {
							["Default"] = {
								["fontsize"] = 18,
								["on"] = false,
							},
						},
					},
					["Prat_Paragraph"] = {
					},
					["Prat_UrlCopy"] = {
						["profiles"] = {
							["Junior"] = {
								["bracket"] = false,
								["color"] = {
									["g"] = 0.698039215686275,
									["r"] = 0.686274509803922,
								},
							},
						},
					},
					["Prat_Alias"] = {
					},
					["Prat_OriginalButtons"] = {
					},
					["Prat_Sounds"] = {
						["profiles"] = {
							["Junior"] = {
								["incoming"] = {
									["PARTY"] = "None",
									["RAID"] = "None",
									["GUILD"] = "Chime",
									["WHISPER"] = "None",
									["BN_WHISPER"] = "Xylo",
									["OFFICER"] = "None",
									["GROUP_LEAD"] = "None",
								},
								["on"] = true,
							},
						},
					},
					["Prat_Timestamps"] = {
						["profiles"] = {
							["Junior"] = {
								["timestampcolor"] = {
									["b"] = 0.192156862745098,
									["g"] = 0.631372549019608,
									["r"] = 0.219607843137255,
								},
								["formatpre"] = "",
								["formatcode"] = "%I:%M",
								["formatpost"] = "",
							},
						},
					},
					["Prat_ChannelSticky"] = {
						["profiles"] = {
							["Junior"] = {
								["bn_conversation"] = false,
								["smartgroup"] = false,
							},
						},
					},
					["Prat_History"] = {
						["profiles"] = {
							["Junior"] = {
								["chatlinesframes"] = {
									["ChatFrame5"] = true,
									["ChatFrame4"] = true,
									["ChatFrame3"] = true,
									["ChatFrame1"] = true,
								},
								["chatlines"] = 5000,
								["scrollbacklen"] = 500,
								["delaygmotd"] = false,
							},
						},
					},
					["Prat_PopupMessage"] = {
						["profiles"] = {
							["Default"] = {
								["show"] = {
									["ChatFrame5"] = true,
									["ChatFrame4"] = true,
									["ChatFrame1"] = false,
								},
							},
						},
					},
					["Prat_CopyChat"] = {
						["profiles"] = {
							["Default"] = {
								["on"] = false,
							},
						},
					},
					["Prat_ChatLog"] = {
						["profiles"] = {
							["Default"] = {
								["on"] = true,
							},
						},
					},
					["Prat_Search"] = {
						["profiles"] = {
							["Default"] = {
								["on"] = false,
							},
						},
					},
					["Prat_Buttons"] = {
						["profiles"] = {
							["Junior"] = {
								["showBnet"] = false,
								["showButtons"] = false,
								["showMenu"] = false,
								["showminimize"] = false,
							},
						},
					},
					["Prat_ServerNames"] = {
						["profiles"] = {
							["Junior"] = {
								["autoabbreviate"] = false,
								["randomclr"] = false,
							},
						},
					},
					["Prat_ChannelNames"] = {
						["profiles"] = {
							["Junior"] = {
								["shortnames"] = {
									["guild"] = "{G}",
									["bnwhisper"] = "[{W To}",
									["instanceleader"] = "{IL}",
									["party"] = "{P}",
									["whisper"] = "{W To}",
									["raid"] = "{R}",
									["raidleader"] = "{RL}",
									["raidwarning"] = "{RW}",
									["instance"] = "{I}",
									["partyleader"] = "{PL}",
									["channel3"] = "{3}",
									["yell"] = "{Y}",
									["channel2"] = "{2}",
									["bnwhisperincome"] = "{W From}",
									["say"] = "{S}",
									["partyguide"] = "{DG}",
									["whisperincome"] = "{W From}",
									["channel1"] = "{1}",
									["officer"] = "{O}",
								},
							},
						},
					},
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["modules"] = {
							["TellTarget"] = 1,
							["ChatLog"] = 1,
							["ChatTabs"] = 3,
							["Search"] = 1,
							["PopupMessage"] = 1,
							["AltNames"] = 1,
							["Paragraph"] = 1,
							["KeyBindings"] = 1,
							["Bubbles"] = 1,
							["OriginalButtons"] = 1,
							["Alias"] = 1,
							["CopyChat"] = 1,
						},
					},
				},
			}

			Prat3DB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- Scrap --------------------
	if opt == "Scrap" then
		Scrap_Safe = false
		Scrap_Learn = true
	end
	-------------------- SexyMap --------------------
	if opt == "SexyMap" then
		if SexyMap2DB.global then
			SexyMap2DB[name .. "-" .. realm] = "global"
		else
			SexyMap2DB = {
				["presets"] = {
				},
				["global"] = {
					["ping"] = {
						["showPing"] = true,
						["showAt"] = "map",
					},
					["coordinates"] = {
						["enabled"] = false,
						["x"] = 2.1602783203125,
						["fontColor"] = {
						},
						["borderColor"] = {
						},
						["locked"] = false,
						["backgroundColor"] = {
						},
						["y"] = 82.3403930664063,
					},
					["core"] = {
						["clamp"] = false,
						["point"] = "TOPRIGHT",
						["relpoint"] = "TOPRIGHT",
						["autoZoom"] = 5,
						["northTag"] = true,
						["y"] = -37.599666595459,
						["x"] = -4.87561750411987,
						["lock"] = true,
						["scale"] = 1.42,
						["shape"] = "SPELLS\\T_VFX_BORDER",
						["rightClickToConfig"] = true,
					},
					["buttons"] = {
						["lockDragging"] = false,
						["radius"] = -15,
						["TEMP2"] = true,
						["allowDragging"] = true,
						["visibilitySettings"] = {
							["LibDBIcon10_AutoRoll"] = "never",
							["LibDBIcon10_PitBull4"] = "never",
							["LibDBIcon10_Skinner"] = "never",
							["LibDBIcon10_SavedInstances"] = "never",
							["MiniMapInstanceDifficulty"] = "hover",
							["MinimapZoneTextButton"] = "always",
							["MinimapZoomIn"] = "never",
							["MiniMapWorldMapButton"] = "never",
							["LibDBIcon10_Dominos"] = "never",
							["TimeManagerClockButton"] = "always",
							["MinimapZoomOut"] = "never",
							["LibDBIcon10_Details"] = "never",
							["DBMMinimapButton"] = "never",
							["LibDBIcon10_DetailsStreamer"] = "never",
							["GarrisonLandingPageMinimapButton"] = "hover",
							["QueueStatusMinimapButton"] = "always",
							["GuildInstanceDifficulty"] = "hover",
							["MiniMapMailFrame"] = "never",
						},
						["dragPositions"] = {
							["MiniMapInstanceDifficulty"] = -36.5403889413214,
							["MiniMapMailFrame"] = -46.897539427866,
							["QueueStatusMinimapButton"] = -47.0276909695658,
							["MiniMapTracking"] = 19.3185809503897,
							["GuildInstanceDifficulty"] = -31.5445051689238,
							["GarrisonLandingPageMinimapButton"] = -1.38618688026477,
						},
						["TEMP"] = true,
						["controlVisibility"] = true,
					},
					["clock"] = {
						["bgColor"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["fontColor"] = {
						},
						["borderColor"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["xOffset"] = 0,
						["yOffset"] = 15,
					},
					["borders"] = {
						["applyPreset"] = false,
						["borders"] = {
						},
						["backdrop"] = {
							["show"] = true,
							["textureColor"] = {
								["a"] = 0.650000005960465,
								["b"] = 0.0823529411764706,
								["g"] = 0.0823529411764706,
								["r"] = 0.0823529411764706,
							},
							["settings"] = {
								["edgeSize"] = 28,
								["edgeFile"] = "Interface\\LFGFrame\\LFGBorder.blp",
								["tile"] = false,
								["bgFile"] = "World\\EXPANSION02\\DOODADS\\Ulduar\\UL_SpinningRoomRings_Ring07.blp",
								["insets"] = {
									["top"] = 14,
									["right"] = 14,
									["left"] = 14,
									["bottom"] = 14,
								},
							},
							["borderColor"] = {
								["a"] = 0,
								["b"] = 0.207843137254902,
								["g"] = 0.215686274509804,
								["r"] = 0.290196078431373,
							},
							["scale"] = 1.25,
						},
						["hideBlizzard"] = true,
					},
					["zonetext"] = {
						["bgColor"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["fontColor"] = {
						},
						["borderColor"] = {
							["a"] = 1,
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
						["xOffset"] = 0,
						["width"] = 142,
						["fontsize"] = 7,
						["yOffset"] = 0,
					},
					["movers"] = {
						["enabled"] = false,
						["framePositions"] = {
							["ObjectiveTrackerFrame"] = {
								["y"] = 825.96875,
								["x"] = 1725.93139648438,
							},
							["DurabilityFrame"] = {
								["y"] = 931.371887207031,
								["x"] = 1666.40649414063,
							},
							["VehicleSeatIndicator"] = {
								["y"] = 983.5615234375,
								["x"] = 1596.73046875,
							},
						},
						["lock"] = true,
					},
				},
			}

			SexyMap2DB[name .. "-" .. realm] = "global"
		end
	end
	-------------------- ShadowedUnitFrames --------------------
	if opt == "ShadowedUnitFrames" then
		if ShadowedUFDB.profiles.Junior then
			ShadowedUFDB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			ShadowedUFDB = {
				["namespaces"] = {
					["LibDualSpec-1.0"] = {
					},
				},
				["global"] = {
					["infoID"] = 3,
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["powerColors"] = {
							["PAIN"] = {
								["r"] = 1,
								["g"] = 0,
								["b"] = 0,
							},
							["SHADOWORBS"] = {
								["r"] = 0.58,
								["g"] = 0.51,
								["b"] = 0.79,
							},
							["LIGHTWELL"] = {
								["b"] = 0.8,
								["g"] = 0.8,
								["r"] = 0.8,
							},
							["BANKEDHOLYPOWER"] = {
								["r"] = 0.96,
								["g"] = 0.61,
								["b"] = 0.84,
							},
							["INSANITY"] = {
								["r"] = 0.4,
								["g"] = 0,
								["b"] = 0.8,
							},
							["STAGGER_RED"] = {
								["r"] = 1,
								["g"] = 0.42,
								["b"] = 0.42,
							},
							["COMBOPOINTS"] = {
								["r"] = 1,
								["g"] = 0.8,
								["b"] = 0,
							},
							["RUNES"] = {
								["r"] = 0.5,
								["g"] = 0.5,
								["b"] = 0.5,
							},
							["RUNEOFPOWER"] = {
								["r"] = 0.35,
								["g"] = 0.45,
								["b"] = 0.6,
							},
							["CHI"] = {
								["r"] = 0.71,
								["g"] = 1,
								["b"] = 0.92,
							},
							["FURY"] = {
								["r"] = 0.788,
								["g"] = 0.259,
								["b"] = 0.992,
							},
							["SOULSHARDS"] = {
								["r"] = 0.58,
								["g"] = 0.51,
								["b"] = 0.79,
							},
							["RUNIC_POWER"] = {
								["b"] = 0.6,
								["g"] = 0.45,
								["r"] = 0.35,
							},
							["STAGGER_YELLOW"] = {
								["r"] = 1,
								["g"] = 0.98,
								["b"] = 0.72,
							},
							["RAGE"] = {
								["r"] = 0.9,
								["g"] = 0.2,
								["b"] = 0.3,
							},
							["FUEL"] = {
								["r"] = 0.85,
								["g"] = 0.47,
								["b"] = 0.36,
							},
							["ALTERNATE"] = {
								["r"] = 0.815,
								["g"] = 0.941,
								["b"] = 1,
							},
							["FOCUS"] = {
								["r"] = 1,
								["g"] = 0.5,
								["b"] = 0.25,
							},
							["DEMONICFURY"] = {
								["r"] = 0.58,
								["g"] = 0.51,
								["b"] = 0.79,
							},
							["FULLBURNINGEMBER"] = {
								["r"] = 0.88,
								["g"] = 0.09,
								["b"] = 0.062,
							},
							["ARCANECHARGES"] = {
								["r"] = 0.1,
								["g"] = 0.1,
								["b"] = 0.98,
							},
							["ENERGY"] = {
								["r"] = 1,
								["g"] = 0.85,
								["b"] = 0.1,
							},
							["MANA"] = {
								["r"] = 0.3,
								["g"] = 0.5,
								["b"] = 0.85,
							},
							["AURAPOINTS"] = {
								["r"] = 1,
								["g"] = 0.8,
								["b"] = 0,
							},
							["MAELSTROM"] = {
								["r"] = 0,
								["g"] = 0.5,
								["b"] = 1,
							},
							["MUSHROOMS"] = {
								["r"] = 0.2,
								["g"] = 0.9,
								["b"] = 0.2,
							},
							["ECLIPSE_MOON"] = {
								["r"] = 0.3,
								["g"] = 0.52,
								["b"] = 0.9,
							},
							["AMMOSLOT"] = {
								["r"] = 0.85,
								["g"] = 0.6,
								["b"] = 0.55,
							},
							["LUNAR_POWER"] = {
								["r"] = 0.3,
								["g"] = 0.52,
								["b"] = 0.9,
							},
							["STAGGER_GREEN"] = {
								["r"] = 0.52,
								["g"] = 1,
								["b"] = 0.52,
							},
							["STATUE"] = {
								["r"] = 0.35,
								["g"] = 0.45,
								["b"] = 0.6,
							},
							["POWER_TYPE_FEL_ENERGY"] = {
								["r"] = 0.878,
								["g"] = 0.98,
								["b"] = 0,
							},
							["HOLYPOWER"] = {
								["r"] = 0.95,
								["g"] = 0.9,
								["b"] = 0.6,
							},
							["BURNINGEMBERS"] = {
								["r"] = 0.58,
								["g"] = 0.51,
								["b"] = 0.79,
							},
							["ECLIPSE_SUN"] = {
								["r"] = 1,
								["g"] = 1,
								["b"] = 0,
							},
						},
						["advanced"] = true,
						["healthColors"] = {
							["neutral"] = {
								["r"] = 0.93,
								["g"] = 0.93,
								["b"] = 0,
							},
							["healAbsorb"] = {
								["r"] = 0.68,
								["g"] = 0.47,
								["b"] = 1,
							},
							["aggro"] = {
								["r"] = 0.9,
								["g"] = 0,
								["b"] = 0,
							},
							["static"] = {
								["r"] = 0.7,
								["g"] = 0.2,
								["b"] = 0.9,
							},
							["friendly"] = {
								["r"] = 0.2,
								["g"] = 0.9,
								["b"] = 0.2,
							},
							["yellow"] = {
								["r"] = 0.93,
								["g"] = 0.93,
								["b"] = 0,
							},
							["incAbsorb"] = {
								["r"] = 0.93,
								["g"] = 0.75,
								["b"] = 0.09,
							},
							["tapped"] = {
								["r"] = 0.5,
								["g"] = 0.5,
								["b"] = 0.5,
							},
							["hostile"] = {
								["r"] = 0.9,
								["g"] = 0,
								["b"] = 0,
							},
							["green"] = {
								["r"] = 0.2,
								["g"] = 0.9,
								["b"] = 0.2,
							},
							["enemyUnattack"] = {
								["r"] = 0.6,
								["g"] = 0.2,
								["b"] = 0.2,
							},
							["offline"] = {
								["r"] = 0.5,
								["g"] = 0.5,
								["b"] = 0.5,
							},
							["inc"] = {
								["r"] = 0,
								["g"] = 0.35,
								["b"] = 0.23,
							},
							["red"] = {
								["r"] = 0.9,
								["g"] = 0,
								["b"] = 0,
							},
						},
						["xpColors"] = {
							["normal"] = {
								["r"] = 0.58,
								["g"] = 0,
								["b"] = 0.55,
							},
							["rested"] = {
								["r"] = 0,
								["g"] = 0.39,
								["b"] = 0.88,
							},
						},
						["locked"] = true,
						["auraIndicators"] = {
							["indicators"] = {
								["c"] = {
									["friendly"] = false,
									["hostile"] = false,
								},
								["19912"] = {
									["enabled"] = true,
									["anchorTo"] = "$parent",
									["friendly"] = true,
									["width"] = 24,
									["anchorPoint"] = "C",
									["x"] = 18,
									["hostile"] = true,
									["height"] = 24,
									["name"] = "Warning",
									["alpha"] = 1,
									["y"] = 2,
								},
							},
							["auras"] = {
								["171725"] = "{r=0;missing=false;indicator=\"19912\";g=0;duration=false;group=\"PvP Warn\";b=0;priority=100;icon=true;iconTexture=\"Interface\\\\Icons\\\\INV_Wand_02\";}",
								["168655"] = "{r=0;group=\"PvP Warn\";indicator=\"19912\";g=0;missing=false;b=0;priority=95;icon=true;iconTexture=\"Interface\\\\Icons\\\\inv_misc_enggizmos_38\";}",
							},
							["filters"] = {
								["19912"] = {
									["curable"] = {
									},
									["boss"] = {
									},
								},
							},
						},
						["positions"] = {
							["arenatarget"] = {
								["anchorPoint"] = "RT",
								["anchorTo"] = "$parent",
							},
							["mainassisttarget"] = {
								["anchorPoint"] = "RT",
								["anchorTo"] = "$parent",
							},
							["targettargettarget"] = {
								["y"] = 155.16018207877,
								["x"] = -0.26615512252997,
								["point"] = "BOTTOM",
								["relativePoint"] = "BOTTOM",
							},
							["arenatargettarget"] = {
								["anchorPoint"] = "RT",
								["anchorTo"] = "$parent",
							},
							["pet"] = {
								["y"] = 143.149395108223,
								["x"] = -252.943591356277,
								["point"] = "BOTTOM",
								["relativePoint"] = "BOTTOM",
							},
							["arenapet"] = {
								["anchorPoint"] = "RB",
								["anchorTo"] = "$parent",
							},
							["mainassisttargettarget"] = {
								["anchorPoint"] = "RT",
								["x"] = 150,
								["anchorTo"] = "$parent",
							},
							["party"] = {
								["y"] = 535.072981715202,
								["x"] = 47.2531983852387,
								["point"] = "TOPLEFT",
								["bottom"] = 381.166166826883,
								["top"] = 534.044288842641,
								["relativePoint"] = "BOTTOMLEFT",
							},
							["maintanktargettarget"] = {
								["anchorPoint"] = "RT",
								["x"] = 150,
								["anchorTo"] = "$parent",
							},
							["focus"] = {
								["y"] = -144.53919506073,
								["x"] = 296.027389883995,
								["point"] = "LEFT",
								["relativePoint"] = "LEFT",
							},
							["target"] = {
								["y"] = 132.030995488167,
								["x"] = 119.522795915604,
								["point"] = "BOTTOM",
								["relativePoint"] = "BOTTOM",
							},
							["raid"] = {
								["y"] = 761.610373973846,
								["x"] = 2.77959990501404,
								["point"] = "TOPLEFT",
								["bottom"] = 314.306452983108,
								["top"] = 761.126607547507,
								["relativePoint"] = "BOTTOMLEFT",
							},
							["battlegroundtarget"] = {
								["anchorPoint"] = "RT",
								["anchorTo"] = "$parent",
							},
							["partytargettarget"] = {
								["anchorPoint"] = "RT",
								["anchorTo"] = "$parent",
							},
							["arena"] = {
								["top"] = 387.02245228687,
								["x"] = 934.04201037253,
								["point"] = "BOTTOMLEFT",
								["relativePoint"] = "BOTTOMLEFT",
								["y"] = 230.22247532288,
								["bottom"] = 230.22247532288,
							},
							["battlegroundtargettarget"] = {
								["anchorPoint"] = "RT",
								["anchorTo"] = "$parent",
							},
							["bosstargettarget"] = {
								["anchorPoint"] = "RB",
								["anchorTo"] = "$parent",
							},
							["battlegroundpet"] = {
								["anchorPoint"] = "RB",
								["anchorTo"] = "$parent",
							},
							["bosstarget"] = {
								["anchorPoint"] = "RT",
								["anchorTo"] = "$parent",
							},
							["focustarget"] = {
								["y"] = -164.8197961545,
								["x"] = 315.89122700732,
								["point"] = "LEFT",
								["relativePoint"] = "LEFT",
							},
							["targettarget"] = {
								["y"] = 143.149395108223,
								["x"] = 252.943591356277,
								["point"] = "BOTTOM",
								["relativePoint"] = "BOTTOM",
							},
							["mainassist"] = {
								["anchorPoint"] = "C",
							},
							["player"] = {
								["y"] = 132.030995488167,
								["x"] = -119.522795915604,
								["point"] = "BOTTOM",
								["relativePoint"] = "BOTTOM",
							},
							["maintanktarget"] = {
								["anchorPoint"] = "RT",
								["anchorTo"] = "$parent",
							},
							["pettarget"] = {
								["y"] = 170.29999375343,
								["x"] = -0.39131941874356,
								["point"] = "BOTTOM",
								["relativePoint"] = "BOTTOM",
							},
							["raidpet"] = {
								["top"] = 450.13335446089,
								["x"] = 14.624999463558,
								["point"] = "BOTTOMLEFT",
								["relativePoint"] = "BOTTOMLEFT",
								["y"] = 346.12498730421,
								["bottom"] = 350.03335813253,
							},
							["maintank"] = {
								["top"] = 386.84463979085,
								["x"] = 329.59909419539,
								["point"] = "BOTTOMLEFT",
								["relativePoint"] = "BOTTOMLEFT",
								["y"] = 263.96462300618,
								["bottom"] = 263.96462300618,
							},
							["boss"] = {
								["y"] = 535.072981715202,
								["x"] = 1207.7361587286,
								["point"] = "TOPLEFT",
								["bottom"] = 379.761098076069,
								["top"] = 533.334077654752,
								["relativePoint"] = "BOTTOMLEFT",
							},
							["battleground"] = {
								["y"] = 514.225982427597,
								["x"] = 1207.7361587286,
								["point"] = "TOPLEFT",
								["bottom"] = 381.423700558316,
								["top"] = 514.84449599899,
								["relativePoint"] = "BOTTOMLEFT",
							},
						},
						["revision"] = 59,
						["castColors"] = {
							["cast"] = {
								["r"] = 1,
								["g"] = 0.7,
								["b"] = 0.3,
							},
							["finished"] = {
								["r"] = 0.1,
								["g"] = 1,
								["b"] = 0.1,
							},
							["channel"] = {
								["r"] = 0.25,
								["g"] = 0.25,
								["b"] = 1,
							},
							["uninterruptible"] = {
								["r"] = 0.71,
								["g"] = 0,
								["b"] = 1,
							},
							["interrupted"] = {
								["r"] = 1,
								["g"] = 0,
								["b"] = 0,
							},
						},
						["auras"] = {
							["borderType"] = "dark",
						},
						["loadedLayout"] = true,
						["hidden"] = {
							["playerAltPower"] = true,
							["raid"] = true,
						},
						["units"] = {
							["arenatarget"] = {
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["range"] = {
									["height"] = 0.5,
								},
								["width"] = 90,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["y"] = 0,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["enabled"] = false,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["height"] = 25,
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
							},
							["mainassisttarget"] = {
								["text"] = {
									{
										["text"] = "[(()afk() )][name]",
									}, -- [1]
									nil, -- [2]
									{
										["text"] = "[level( )][classification( )][perpp]",
									}, -- [3]
									nil, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 150,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auras"] = {
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
								},
								["height"] = 40,
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 1,
									["background"] = true,
									["order"] = 20,
								},
								["highlight"] = {
									["size"] = 10,
								},
							},
							["targettargettarget"] = {
								["enabled"] = false,
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "RIGHT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.7,
									["height"] = 0.5,
								},
								["width"] = 130,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["text"] = {
									{
										["width"] = 1,
									}, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									nil, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["y"] = 0,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["enabled"] = false,
										["size"] = 16,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["height"] = 24,
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
							},
							["partytarget"] = {
								["indicators"] = {
									["raidTarget"] = {
										["y"] = 0,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["enabled"] = false,
										["size"] = 16,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["width"] = 90,
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["height"] = 25,
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["fader"] = {
									["height"] = 0.5,
								},
							},
							["arenatargettarget"] = {
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 90,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auras"] = {
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
								},
								["height"] = 25,
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["highlight"] = {
									["size"] = 10,
								},
							},
							["battlegroundtarget"] = {
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["range"] = {
									["height"] = 0.5,
								},
								["width"] = 90,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["y"] = 0,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["enabled"] = false,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["height"] = 25,
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
							},
							["arenapet"] = {
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["range"] = {
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["width"] = 90,
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["combatText"] = {
									["height"] = 0.5,
								},
								["height"] = 25,
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["height"] = 0.5,
								},
							},
							["mainassisttargettarget"] = {
								["text"] = {
									{
										["text"] = "[(()afk() )][name]",
									}, -- [1]
									nil, -- [2]
									{
										["text"] = "[level( )][classification( )][perpp]",
									}, -- [3]
									nil, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 150,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auras"] = {
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
								},
								["height"] = 40,
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 1,
									["background"] = true,
									["order"] = 20,
								},
								["highlight"] = {
									["size"] = 10,
								},
							},
							["party"] = {
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["enabled"] = false,
										["size"] = 16,
									},
									["lfdRole"] = {
										["y"] = 1,
										["x"] = 30,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "LT",
										["size"] = 14,
									},
									["phase"] = {
										["y"] = 18,
										["x"] = -11,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "RC",
										["size"] = 14,
									},
									["masterLoot"] = {
										["anchorPoint"] = "TL",
										["x"] = 16,
										["anchorTo"] = "$parent",
										["y"] = -10,
										["enabled"] = false,
										["size"] = 12,
									},
									["leader"] = {
										["anchorPoint"] = "TL",
										["x"] = 2,
										["anchorTo"] = "$parent",
										["y"] = -13,
										["size"] = 16,
									},
									["role"] = {
										["anchorPoint"] = "TL",
										["x"] = 30,
										["anchorTo"] = "$parent",
										["y"] = -11,
										["enabled"] = false,
										["size"] = 14,
									},
									["ready"] = {
										["anchorPoint"] = "RC",
										["x"] = -12,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["resurrect"] = {
										["enabled"] = false,
										["x"] = -39,
										["anchorTo"] = "$parent",
										["y"] = -1,
										["anchorPoint"] = "C",
										["size"] = 20,
									},
									["status"] = {
										["anchorPoint"] = "LB",
										["x"] = 12,
										["anchorTo"] = "$parent",
										["y"] = -2,
										["size"] = 16,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
									["pvp"] = {
										["anchorPoint"] = "TR",
										["x"] = 11,
										["anchorTo"] = "$parent",
										["y"] = -21,
										["enabled"] = false,
										["size"] = 22,
									},
								},
								["portrait"] = {
									["fullBefore"] = 0,
									["fullAfter"] = 50,
									["order"] = 15,
									["isBar"] = false,
									["width"] = 0.22,
									["alignment"] = "LEFT",
									["height"] = 0.5,
									["type"] = "3D",
								},
								["showPlayer"] = false,
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["selfScale"] = 1,
										["anchorOn"] = false,
										["enlarge"] = {
											["SELF"] = false,
										},
										["anchorPoint"] = "TL",
										["x"] = 0,
										["y"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorOn"] = false,
										["y"] = -2,
										["anchorPoint"] = "TL",
										["x"] = 1,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["autoHide"] = false,
									["order"] = 60,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["incAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["hideAnyRaid"] = true,
								["incHeal"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["combatText"] = {
									["height"] = 0.5,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["order"] = 20,
									["background"] = true,
									["height"] = 0.7,
								},
								["fader"] = {
									["height"] = 0.5,
								},
								["offset"] = 0,
								["columnSpacing"] = 20,
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 2,
									["reactionType"] = "npc",
								},
								["hideSemiRaid"] = false,
								["unitsPerColumn"] = 5,
								["text"] = {
									{
										["text"] = "[(()afk() )][name]",
										["anchorPoint"] = "C",
										["x"] = 0,
									}, -- [1]
									{
										["text"] = "",
										["size"] = -5,
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["anchorPoint"] = "CRI",
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["size"] = -5,
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
										["size"] = -5,
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
										["size"] = -5,
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
										["size"] = -5,
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 191,
								["attribAnchorPoint"] = "LEFT",
								["sortOrder"] = "ASC",
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["enabled"] = false,
									["height"] = 0.4,
								},
								["sortMethod"] = "NAME",
								["height"] = 55,
								["healAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["highlight"] = {
									["height"] = 0.5,
									["debuff"] = false,
									["size"] = 10,
								},
								["attribPoint"] = "TOP",
							},
							["maintanktargettarget"] = {
								["text"] = {
									{
										["text"] = "[(()afk() )][name]",
									}, -- [1]
									nil, -- [2]
									{
										["text"] = "[classification( )][perpp]",
									}, -- [3]
									nil, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 150,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auras"] = {
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
								},
								["height"] = 40,
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 1,
									["background"] = true,
									["order"] = 20,
								},
								["highlight"] = {
									["size"] = 10,
								},
							},
							["focus"] = {
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["enabled"] = false,
										["size"] = 14,
									},
									["lfdRole"] = {
										["y"] = 14,
										["x"] = 3,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "BR",
										["size"] = 14,
									},
									["resurrect"] = {
										["enabled"] = false,
										["x"] = 37,
										["anchorTo"] = "$parent",
										["y"] = -1,
										["anchorPoint"] = "LC",
										["size"] = 28,
									},
									["masterLoot"] = {
										["y"] = -10,
										["x"] = 16,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "TL",
										["enabled"] = false,
										["size"] = 12,
									},
									["leader"] = {
										["y"] = -12,
										["x"] = 2,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "TL",
										["enabled"] = false,
										["size"] = 14,
									},
									["questBoss"] = {
										["y"] = 14,
										["x"] = 7,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "BR",
										["enabled"] = false,
										["size"] = 22,
									},
									["status"] = {
										["anchorPoint"] = "LB",
										["x"] = 12,
										["anchorTo"] = "$parent",
										["y"] = -2,
										["size"] = 16,
									},
									["height"] = 0.5,
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["role"] = {
										["y"] = -11,
										["x"] = 30,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "TL",
										["enabled"] = false,
										["size"] = 14,
									},
									["pvp"] = {
										["y"] = -21,
										["x"] = 11,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "TR",
										["enabled"] = false,
										["size"] = 22,
									},
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 60,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["vertical"] = false,
									["colorType"] = "type",
									["reverse"] = false,
									["order"] = 20,
									["background"] = true,
									["invert"] = false,
									["height"] = 0.2,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["reactionType"] = "npc",
									["background"] = true,
									["invert"] = false,
									["height"] = 1,
								},
								["incAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["text"] = {
									{
										["anchorPoint"] = "C",
									}, -- [1]
									{
										["text"] = "",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["portrait"] = {
									["type"] = "3D",
									["fullAfter"] = 50,
									["order"] = 15,
									["isBar"] = false,
									["width"] = 0.22,
									["alignment"] = "LEFT",
									["height"] = 0.5,
									["fullBefore"] = 0,
								},
								["width"] = 145,
								["fader"] = {
									["height"] = 0.5,
								},
								["incHeal"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["enabled"] = false,
									["height"] = 0.4,
								},
								["combatText"] = {
									["enabled"] = false,
									["height"] = 0.5,
								},
								["height"] = 35,
								["healAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
							},
							["target"] = {
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 10,
										["enabled"] = false,
										["size"] = 16,
									},
									["lfdRole"] = {
										["y"] = -11,
										["x"] = 18,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "TL",
										["enabled"] = true,
										["size"] = 14,
									},
									["resurrect"] = {
										["enabled"] = false,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 8,
										["anchorPoint"] = "C",
										["size"] = 20,
									},
									["masterLoot"] = {
										["anchorPoint"] = "TL",
										["x"] = 31,
										["anchorTo"] = "$parent",
										["y"] = -10,
										["enabled"] = false,
										["size"] = 12,
									},
									["leader"] = {
										["anchorPoint"] = "TL",
										["x"] = 3,
										["anchorTo"] = "$parent",
										["y"] = -12,
										["size"] = 16,
									},
									["questBoss"] = {
										["y"] = 9,
										["x"] = 38,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["enabled"] = false,
										["size"] = 20,
									},
									["status"] = {
										["y"] = 11,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["size"] = 24,
									},
									["height"] = 0.5,
									["class"] = {
										["anchorPoint"] = "RC",
										["x"] = 2,
										["anchorTo"] = "$parent",
										["y"] = 23,
										["size"] = 24,
									},
									["role"] = {
										["anchorPoint"] = "TL",
										["x"] = 42,
										["anchorTo"] = "$parent",
										["y"] = -11,
										["enabled"] = false,
										["size"] = 14,
									},
									["pvp"] = {
										["y"] = 0,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["enabled"] = false,
										["size"] = 24,
									},
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["perRow"] = 13,
										["selfScale"] = 1,
										["anchorOn"] = false,
										["enlarge"] = {
											["SELF"] = false,
										},
										["anchorPoint"] = "TR",
										["maxRows"] = 3,
										["x"] = 1,
										["timers"] = {
											["ALL"] = false,
										},
										["y"] = 0,
										["size"] = 18,
									},
									["buffs"] = {
										["enabled"] = true,
										["selfScale"] = 1,
										["anchorOn"] = false,
										["enlarge"] = {
											["REMOVABLE"] = true,
										},
										["perRow"] = 13,
										["anchorPoint"] = "BL",
										["maxRows"] = 1,
										["y"] = 4,
										["x"] = 0,
										["timers"] = {
											["ALL"] = false,
										},
										["size"] = 16,
									},
								},
								["castBar"] = {
									["enabled"] = true,
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = -5,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = -5,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = false,
									},
									["autoHide"] = true,
									["order"] = 60,
									["background"] = true,
									["icon"] = "LEFT",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.8,
									["reverse"] = false,
									["order"] = 20,
									["background"] = true,
									["invert"] = false,
									["vertical"] = false,
								},
								["healthBar"] = {
									["colorAggro"] = false,
									["order"] = 10,
									["colorType"] = "class",
									["reactionType"] = "npc",
									["reverse"] = false,
									["height"] = 2,
									["background"] = true,
									["invert"] = false,
									["vertical"] = false,
								},
								["comboPoints"] = {
									["height"] = 0.5,
									["order"] = 99,
								},
								["text"] = {
									{
										["text"] = "[( )afk][( )name]",
										["width"] = 0.8,
										["x"] = 5,
									}, -- [1]
									{
										["text"] = "[( )curmaxhp] [classcolor]|[close] [perhp]",
										["width"] = 1.1,
										["x"] = -5,
									}, -- [2]
									{
										["text"] = "[()level][classcolor][( )smartclass][close][( )race][( )classification]",
										["x"] = 5,
										["size"] = -4,
									}, -- [3]
									{
										["x"] = -5,
										["size"] = -4,
									}, -- [4]
									{
										["text"] = "[()level][( )afk][( )race][( )smartclass]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = 10,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.8,
										["y"] = -8,
										["x"] = -5,
										["name"] = "Right sub",
										["anchorPoint"] = "CRI",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.9,
										["y"] = -3,
										["x"] = 5,
										["name"] = "Left sub",
										["anchorPoint"] = "CLI",
										["size"] = -1,
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["y"] = -12,
										["x"] = 10,
										["name"] = "Subtext",
										["anchorPoint"] = "CLI",
										["size"] = -2,
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["text"] = "[( ()pvp:time())][( )classcolor]",
										["width"] = 0.5,
										["name"] = "Center text",
										["size"] = -1,
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.6,
										["x"] = -5,
										["name"] = "Right sub 2",
										["anchorPoint"] = "CRI",
										["size"] = -1,
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.9,
										["x"] = 5,
										["name"] = "Left sub 2",
										["anchorPoint"] = "CLI",
										["size"] = -1,
									}, -- [16]
								},
								["incAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["width"] = 270,
								["portrait"] = {
									["type"] = "3D",
									["fullAfter"] = 50,
									["order"] = 15,
									["isBar"] = false,
									["width"] = 0.22,
									["alignment"] = "RIGHT",
									["height"] = 0.5,
									["fullBefore"] = 0,
								},
								["incHeal"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["altPowerBar"] = {
									["vertical"] = false,
									["order"] = 80,
									["background"] = true,
									["invert"] = false,
									["height"] = 0.4,
								},
								["combatText"] = {
									["enabled"] = false,
									["height"] = 0.5,
								},
								["height"] = 62,
								["healAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["emptyBar"] = {
									["order"] = 95,
									["background"] = false,
									["height"] = 0.7,
									["class"] = false,
									["backgroundColor"] = {
										["r"] = 1,
										["g"] = 0.37254901960784,
										["b"] = 0.63529411764706,
									},
									["reactionType"] = "none",
								},
								["highlight"] = {
									["aggro"] = false,
									["height"] = 0.5,
									["mouseover"] = false,
									["size"] = 10,
								},
							},
							["raid"] = {
								["portrait"] = {
									["type"] = "2D",
									["fullAfter"] = 100,
									["order"] = 15,
									["isBar"] = false,
									["width"] = 0.22,
									["alignment"] = "LEFT",
									["height"] = 0.5,
									["fullBefore"] = 0,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["perRow"] = 8,
										["selfScale"] = 1,
										["anchorOn"] = false,
										["enlarge"] = {
											["SELF"] = false,
											["BOSS"] = false,
										},
										["show"] = {
											["boss"] = false,
										},
										["maxRows"] = 1,
										["x"] = -5,
										["timers"] = {
											["SELF"] = false,
											["BOSS"] = false,
										},
										["y"] = 20,
										["anchorPoint"] = "BR",
										["size"] = 8,
									},
									["buffs"] = {
										["selfScale"] = 1,
										["anchorOn"] = false,
										["y"] = -12,
										["x"] = 4,
										["anchorPoint"] = "BL",
										["maxRows"] = 1,
										["size"] = 12,
									},
								},
								["castBar"] = {
									["order"] = 40,
									["vertical"] = false,
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = false,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = false,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["height"] = 0.7,
									["background"] = true,
									["invert"] = false,
									["icon"] = "HIDE",
								},
								["frameSplit"] = false,
								["groupSpacing"] = 0,
								["powerBar"] = {
									["enabled"] = false,
									["order"] = 20,
									["onlyMana"] = false,
									["vertical"] = false,
									["reverse"] = false,
									["height"] = 0.9,
									["background"] = true,
									["invert"] = false,
									["colorType"] = "type",
								},
								["enabled"] = true,
								["healthBar"] = {
									["colorAggro"] = false,
									["order"] = 10,
									["vertical"] = false,
									["reactionType"] = "none",
									["reverse"] = false,
									["height"] = 10,
									["background"] = true,
									["invert"] = false,
									["colorType"] = "class",
								},
								["text"] = {
									{
										["width"] = 0.7,
										["anchorPoint"] = "C",
										["x"] = 0,
										["size"] = -3,
									}, -- [1]
									{
										["text"] = "",
										["y"] = 4,
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["y"] = -6,
										["x"] = -3,
										["name"] = "Right sub",
										["anchorPoint"] = "CRI",
										["size"] = -2,
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["maxColumns"] = 1,
								["altPowerBar"] = {
									["height"] = 1,
									["background"] = true,
									["enabled"] = false,
									["order"] = 100,
								},
								["height"] = 18,
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "TC",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = -10,
										["enabled"] = false,
										["size"] = 14,
									},
									["lfdRole"] = {
										["y"] = -8,
										["x"] = 16,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "TL",
										["size"] = 12,
									},
									["resurrect"] = {
										["y"] = -4,
										["x"] = 39,
										["anchorTo"] = "$parent",
										["enabled"] = false,
										["anchorPoint"] = "LC",
										["size"] = 10,
									},
									["masterLoot"] = {
										["anchorPoint"] = "TL",
										["x"] = 32,
										["anchorTo"] = "$parent",
										["y"] = -10,
										["enabled"] = false,
										["size"] = 11,
									},
									["leader"] = {
										["anchorPoint"] = "LC",
										["x"] = 18,
										["anchorTo"] = "$parent",
										["y"] = 8,
										["size"] = 14,
									},
									["role"] = {
										["anchorPoint"] = "TL",
										["x"] = 42,
										["anchorTo"] = "$parent",
										["y"] = -12,
										["enabled"] = false,
										["size"] = 14,
									},
									["ready"] = {
										["y"] = 0,
										["x"] = -12,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "RC",
										["size"] = 14,
									},
									["height"] = 0.5,
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["status"] = {
										["y"] = -4,
										["x"] = 29,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "LC",
										["size"] = 11,
									},
									["pvp"] = {
										["anchorPoint"] = "C",
										["x"] = -5,
										["anchorTo"] = "$parent",
										["y"] = 12,
										["enabled"] = false,
										["size"] = 20,
									},
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["incAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["columnSpacing"] = 0,
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["attribAnchorPoint"] = "LEFT",
								["showParty"] = false,
								["width"] = 106,
								["groupsPerRow"] = 8,
								["unitsPerColumn"] = 40,
								["fader"] = {
									["height"] = 0.5,
								},
								["combatText"] = {
									["y"] = -2,
									["height"] = 0.5,
								},
								["incHeal"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["healAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["auraIndicators"] = {
									["enabled"] = true,
									["Paladin"] = true,
									["Shaman"] = true,
									["Monk"] = true,
									["Mage"] = true,
									["filter-boss"] = true,
									["PvP Flags"] = true,
									["Druid"] = true,
									["height"] = 0.5,
									["Hellfire Citadel"] = true,
									["Priest"] = true,
									["Food"] = true,
									["filter-curable"] = true,
									["Warlock"] = true,
								},
								["highlight"] = {
									["debuff"] = false,
									["aggro"] = false,
									["attention"] = false,
									["height"] = 0.5,
									["mouseover"] = false,
									["alpha"] = 1,
									["size"] = 8,
								},
							},
							["partytargettarget"] = {
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["range"] = {
									["height"] = 0.5,
								},
								["width"] = 90,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["height"] = 25,
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
							},
							["arena"] = {
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["perRow"] = 9,
										["selfScale"] = 1,
										["enlarge"] = {
											["SELF"] = false,
										},
										["y"] = 0,
										["x"] = 0,
										["anchorPoint"] = "BL",
										["size"] = 16,
									},
									["buffs"] = {
										["selfScale"] = 1,
										["perRow"] = 9,
										["anchorPoint"] = "BL",
										["x"] = 0,
										["y"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 60,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.8,
									["background"] = true,
									["order"] = 20,
								},
								["offset"] = 5,
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["text"] = {
									nil, -- [1]
									nil, -- [2]
									{
										["text"] = "[perpp]",
									}, -- [3]
									nil, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["width"] = 170,
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["combatText"] = {
									["enabled"] = false,
									["height"] = 0.5,
								},
								["height"] = 45,
								["portrait"] = {
									["enabled"] = true,
									["type"] = "class",
									["alignment"] = "RIGHT",
									["fullAfter"] = 50,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["indicators"] = {
									["arenaSpec"] = {
										["anchorTo"] = "$parent",
										["anchorPoint"] = "LC",
										["size"] = 28,
									},
									["lfdRole"] = {
										["y"] = 14,
										["x"] = 3,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "BR",
										["size"] = 14,
									},
									["height"] = 0.5,
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
								},
								["attribPoint"] = "BOTTOM",
							},
							["battlegroundpet"] = {
								["highlight"] = {
									["size"] = 10,
								},
								["auras"] = {
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["width"] = 90,
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["height"] = 25,
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
							},
							["battlegroundtargettarget"] = {
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 90,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auras"] = {
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
								},
								["height"] = 25,
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["highlight"] = {
									["size"] = 10,
								},
							},
							["bosstargettarget"] = {
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 90,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auras"] = {
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
								},
								["height"] = 25,
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["highlight"] = {
									["size"] = 10,
								},
							},
							["pet"] = {
								["xpBar"] = {
									["order"] = 55,
									["background"] = true,
									["height"] = 0.25,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 2,
										["enabled"] = false,
										["size"] = 14,
									},
									["height"] = 0.5,
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 60,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["height"] = 0.2,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "none",
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 50,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["text"] = {
									{
										["width"] = 0.8,
										["anchorPoint"] = "C",
									}, -- [1]
									{
										["text"] = "",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["incAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["width"] = 110,
								["fader"] = {
									["height"] = 0.5,
								},
								["incHeal"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["combatText"] = {
									["enabled"] = false,
									["height"] = 0.5,
								},
								["height"] = 30,
								["healAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
							},
							["bosstarget"] = {
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.7,
									["height"] = 0.5,
								},
								["width"] = 90,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["height"] = 37,
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
							},
							["focustarget"] = {
								["indicators"] = {
									["raidTarget"] = {
										["y"] = 0,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["enabled"] = false,
										["size"] = 16,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["enabled"] = false,
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 117,
								["fader"] = {
									["height"] = 0.5,
								},
								["text"] = {
									{
										["anchorPoint"] = "C",
										["x"] = 0,
										["size"] = -4,
									}, -- [1]
									{
										["text"] = "",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["height"] = 30,
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "RIGHT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
							},
							["targettarget"] = {
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["width"] = 110,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["text"] = {
									{
										["anchorPoint"] = "C",
										["x"] = 0,
									}, -- [1]
									{
										["text"] = "",
									}, -- [2]
									{
										["text"] = "[perpp]",
									}, -- [3]
									{
										["text"] = "[( )curmaxpp]",
									}, -- [4]
									nil, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 5,
										["enabled"] = false,
										["size"] = 14,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["height"] = 30,
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["reverse"] = false,
									["order"] = 20,
									["background"] = true,
									["height"] = 0.4,
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "RIGHT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
							},
							["partypet"] = {
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["range"] = {
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.6,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["incAbsorb"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["text"] = {
									nil, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["width"] = 90,
								["fader"] = {
									["height"] = 0.5,
								},
								["incHeal"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["combatText"] = {
									["height"] = 0.5,
								},
								["height"] = 25,
								["healAbsorb"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
							},
							["mainassist"] = {
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["resurrect"] = {
										["y"] = -1,
										["x"] = 37,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "LC",
										["size"] = 28,
									},
									["masterLoot"] = {
										["anchorPoint"] = "TL",
										["x"] = 16,
										["anchorTo"] = "$parent",
										["y"] = -10,
										["size"] = 12,
									},
									["leader"] = {
										["anchorPoint"] = "TL",
										["x"] = 2,
										["anchorTo"] = "$parent",
										["y"] = -12,
										["size"] = 14,
									},
									["role"] = {
										["anchorPoint"] = "TL",
										["x"] = 30,
										["anchorTo"] = "$parent",
										["y"] = -11,
										["size"] = 14,
									},
									["ready"] = {
										["anchorPoint"] = "LC",
										["x"] = 35,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 24,
									},
									["height"] = 0.5,
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["status"] = {
										["anchorPoint"] = "LB",
										["x"] = 12,
										["anchorTo"] = "$parent",
										["y"] = -2,
										["size"] = 16,
									},
									["pvp"] = {
										["anchorPoint"] = "TR",
										["x"] = 11,
										["anchorTo"] = "$parent",
										["y"] = -21,
										["size"] = 22,
									},
								},
								["incHeal"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["range"] = {
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 60,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 50,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["incAbsorb"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 1,
									["background"] = true,
									["order"] = 20,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["offset"] = 5,
								["columnSpacing"] = 5,
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["attribAnchorPoint"] = "LEFT",
								["fader"] = {
									["height"] = 0.5,
								},
								["text"] = {
									{
										["text"] = "[(()afk() )][name]",
									}, -- [1]
									nil, -- [2]
									{
										["text"] = "[level( )][perpp]",
									}, -- [3]
									nil, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["width"] = 150,
								["maxColumns"] = 1,
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["combatText"] = {
									["height"] = 0.5,
								},
								["height"] = 40,
								["healAbsorb"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["unitsPerColumn"] = 5,
							},
							["player"] = {
								["portrait"] = {
									["type"] = "3D",
									["fullAfter"] = 50,
									["order"] = 15,
									["isBar"] = false,
									["width"] = 0.22,
									["alignment"] = "LEFT",
									["height"] = 0.5,
									["fullBefore"] = 0,
								},
								["runeBar"] = {
									["enabled"] = true,
									["background"] = false,
									["order"] = 70,
									["height"] = 0.4,
								},
								["castBar"] = {
									["enabled"] = true,
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = -5,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = -5,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = false,
									},
									["autoHide"] = true,
									["order"] = 60,
									["background"] = true,
									["icon"] = "LEFT",
									["height"] = 0.6,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["reverse"] = false,
									["height"] = 0.8,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["reverse"] = false,
									["order"] = 10,
									["background"] = true,
									["height"] = 2,
									["reactionType"] = "npc",
								},
								["druidBar"] = {
									["height"] = 0.4,
									["background"] = true,
									["order"] = 70,
								},
								["text"] = {
									{
										["text"] = "[name][( )afk]",
										["width"] = 1,
										["x"] = 10,
										["size"] = 3,
									}, -- [1]
									{
										["text"] = "[( )curmaxhp] [classcolor]|[close] [perhp]",
										["width"] = 1.7,
										["x"] = -5,
									}, -- [2]
									{
										["text"] = "[()level][shortclassification][( )race][classcolor][( )smartclass][close]",
										["x"] = 5,
										["size"] = -4,
									}, -- [3]
									{
										["x"] = -5,
										["size"] = -4,
									}, -- [4]
									{
										["text"] = "[()level][( )afk][( )race][( )smartclass]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$totemBar",
										["text"] = "[totem:timer]",
										["width"] = 1,
										["name"] = "Timer Text",
										["block"] = true,
									}, -- [7]
									{
										["anchorTo"] = "$runeBar",
										["text"] = "[rune:timer]",
										["width"] = 1,
										["name"] = "Timer Text",
										["block"] = true,
									}, -- [8]
									{
										["anchorTo"] = "$staggerBar",
										["text"] = "[monk:abs:stagger]",
										["width"] = 1,
										["name"] = "Text",
									}, -- [9]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.6,
										["y"] = -8,
										["x"] = -5,
										["name"] = "Right sub",
										["anchorPoint"] = "CRI",
									}, -- [10]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.9,
										["y"] = -7,
										["x"] = 5,
										["name"] = "Left sub",
										["anchorPoint"] = "CLI",
										["size"] = -1,
									}, -- [11]
									{
										["anchorTo"] = "$powerBar",
										["text"] = "[( ()pvp:time())][( )classcolor]",
										["width"] = 0.5,
										["name"] = "Center text",
										["size"] = -1,
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [13]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [14]
								},
								["priestBar"] = {
									["order"] = 70,
									["background"] = true,
									["height"] = 0.4,
								},
								["staggerBar"] = {
									["order"] = 70,
									["background"] = true,
									["height"] = 0.3,
								},
								["auraPoints"] = {
									["anchorTo"] = "$parent",
									["order"] = 60,
									["showAlways"] = true,
									["growth"] = "LEFT",
									["anchorPoint"] = "BR",
									["x"] = -3,
									["spacing"] = -4,
									["height"] = 0.4,
									["y"] = 8,
									["size"] = 14,
								},
								["xpBar"] = {
									["order"] = 55,
									["background"] = true,
									["height"] = 0.25,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 35,
										["anchorTo"] = "$parent",
										["y"] = 10,
										["enabled"] = false,
										["size"] = 24,
									},
									["lfdRole"] = {
										["y"] = -11,
										["x"] = 18,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "TL",
										["size"] = 14,
									},
									["resurrect"] = {
										["enabled"] = false,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 8,
										["anchorPoint"] = "C",
										["size"] = 20,
									},
									["masterLoot"] = {
										["anchorPoint"] = "TL",
										["x"] = 31,
										["anchorTo"] = "$parent",
										["y"] = -10,
										["enabled"] = false,
										["size"] = 12,
									},
									["leader"] = {
										["anchorPoint"] = "TL",
										["x"] = 3,
										["anchorTo"] = "$parent",
										["y"] = -12,
										["size"] = 16,
									},
									["role"] = {
										["anchorPoint"] = "TL",
										["x"] = 42,
										["anchorTo"] = "$parent",
										["y"] = -11,
										["enabled"] = false,
										["size"] = 14,
									},
									["status"] = {
										["anchorPoint"] = "TC",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = -17,
										["size"] = 24,
									},
									["ready"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = -2,
										["enabled"] = false,
										["size"] = 16,
									},
									["height"] = 0.5,
									["pvp"] = {
										["y"] = 4,
										["x"] = -16,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "RT",
										["size"] = 30,
									},
								},
								["totemBar"] = {
									["enabled"] = true,
									["order"] = 70,
									["background"] = false,
									["icon"] = false,
									["height"] = 0.4,
								},
								["incAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["comboPoints"] = {
									["anchorTo"] = "$parent",
									["order"] = 60,
									["showAlways"] = false,
									["growth"] = "RIGHT",
									["anchorPoint"] = "BR",
									["x"] = -3,
									["spacing"] = -4,
									["height"] = 0.4,
									["background"] = false,
									["y"] = 8,
									["size"] = 14,
								},
								["width"] = 270,
								["height"] = 62,
								["highlight"] = {
									["aggro"] = false,
									["height"] = 0.5,
									["mouseover"] = false,
									["size"] = 6,
								},
								["shamanBar"] = {
									["order"] = 70,
									["background"] = true,
									["height"] = 0.4,
								},
								["holyPower"] = {
									["anchorTo"] = "$parent",
									["order"] = 60,
									["showAlways"] = true,
									["growth"] = "LEFT",
									["anchorPoint"] = "BR",
									["x"] = -3,
									["spacing"] = -4,
									["height"] = 0.4,
									["y"] = 6,
									["size"] = 14,
								},
								["soulShards"] = {
									["anchorTo"] = "$parent",
									["order"] = 60,
									["showAlways"] = true,
									["growth"] = "LEFT",
									["anchorPoint"] = "BR",
									["x"] = -8,
									["spacing"] = -2,
									["height"] = 0.4,
									["y"] = 6,
									["size"] = 12,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["perRow"] = 12,
										["selfScale"] = 1,
										["anchorOn"] = true,
										["enlarge"] = {
											["SELF"] = false,
											["REMOVABLE"] = false,
										},
										["show"] = {
											["player"] = false,
										},
										["maxRows"] = 5,
										["y"] = 0,
										["anchorPoint"] = "TL",
										["x"] = 5,
										["size"] = 20,
									},
									["buffs"] = {
										["perRow"] = 12,
										["selfScale"] = 1.1,
										["anchorOn"] = false,
										["enlarge"] = {
											["REMOVABLE"] = true,
										},
										["temporary"] = false,
										["y"] = 0,
										["maxRows"] = 1,
										["anchorPoint"] = "TL",
										["x"] = 0,
										["size"] = 20,
									},
								},
								["chi"] = {
									["anchorTo"] = "$parent",
									["order"] = 60,
									["showAlways"] = true,
									["growth"] = "LEFT",
									["anchorPoint"] = "BR",
									["x"] = -3,
									["spacing"] = -4,
									["height"] = 0.4,
									["y"] = 6,
									["size"] = 14,
								},
								["altPowerBar"] = {
									["vertical"] = false,
									["reverse"] = false,
									["order"] = 80,
									["background"] = true,
									["invert"] = false,
									["height"] = 0.4,
								},
								["emptyBar"] = {
									["order"] = 95,
									["background"] = false,
									["height"] = 0.7,
									["class"] = false,
									["backgroundColor"] = {
										["r"] = 1,
										["g"] = 0.37254901960784,
										["b"] = 0.63529411764706,
									},
									["reactionType"] = "none",
								},
								["fader"] = {
									["height"] = 0.5,
									["combatAlpha"] = 1,
									["inactiveAlpha"] = 0.6,
								},
								["combatText"] = {
									["enabled"] = false,
									["height"] = 0.5,
								},
								["incHeal"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["healAbsorb"] = {
									["enabled"] = false,
									["cap"] = 1,
									["height"] = 0.5,
								},
								["arcaneCharges"] = {
									["anchorTo"] = "$parent",
									["order"] = 60,
									["showAlways"] = true,
									["growth"] = "LEFT",
									["anchorPoint"] = "BR",
									["x"] = -8,
									["spacing"] = -2,
									["height"] = 0.4,
									["y"] = 6,
									["size"] = 12,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
							},
							["maintanktarget"] = {
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["range"] = {
									["height"] = 0.5,
								},
								["width"] = 150,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["text"] = {
									{
										["text"] = "[(()afk() )][name]",
									}, -- [1]
									nil, -- [2]
									{
										["text"] = "[classification( )][perpp]",
									}, -- [3]
									nil, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["height"] = 40,
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 1,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
							},
							["pettarget"] = {
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["width"] = 130,
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["text"] = {
									{
										["width"] = 0.8,
									}, -- [1]
									{
										["text"] = "[curhp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["indicators"] = {
									["raidTarget"] = {
										["y"] = 0,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["enabled"] = false,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
								["height"] = 30,
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.3,
									["background"] = true,
									["order"] = 20,
								},
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
							},
							["raidpet"] = {
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["groupSpacing"] = 0,
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["order"] = 20,
									["background"] = true,
									["height"] = 0.3,
								},
								["offset"] = -7,
								["healthBar"] = {
									["colorType"] = "class",
									["colorAggro"] = false,
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "none",
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["maxColumns"] = 10,
								["sortOrder"] = "DESC",
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["height"] = 28,
								["attribPoint"] = "BOTTOM",
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auraIndicators"] = {
									["enabled"] = true,
									["Paladin"] = true,
									["Shaman"] = true,
									["Monk"] = true,
									["Mage"] = true,
									["filter-boss"] = true,
									["PvP Flags"] = true,
									["Druid"] = true,
									["height"] = 0.5,
									["Hellfire Citadel"] = true,
									["Priest"] = true,
									["Food"] = true,
									["filter-curable"] = true,
									["Warlock"] = true,
								},
								["attribAnchorPoint"] = "LEFT",
								["unitsPerColumn"] = 7,
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 10,
									},
									["height"] = 0.5,
								},
								["width"] = 61,
								["incAbsorb"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["columnSpacing"] = -7,
								["fader"] = {
									["height"] = 0.5,
								},
								["combatText"] = {
									["height"] = 0.5,
								},
								["incHeal"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["healAbsorb"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["groupsPerRow"] = 8,
								["text"] = {
									{
										["text"] = "[( )name]",
										["width"] = 5,
										["x"] = 2,
										["size"] = -2,
									}, -- [1]
									{
										["text"] = "[missinghp]",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
							},
							["maintank"] = {
								["height"] = 40,
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 50,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["unitsPerColumn"] = 3,
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 60,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["incAbsorb"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["powerBar"] = {
									["colorType"] = "type",
									["height"] = 0.8,
									["background"] = true,
									["order"] = 20,
								},
								["text"] = {
									{
										["text"] = "[(()afk() )][name]",
									}, -- [1]
									nil, -- [2]
									{
										["text"] = "[perpp]",
									}, -- [3]
									nil, -- [4]
									{
										["text"] = "[(()afk() )][name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["offset"] = -2,
								["columnSpacing"] = 3,
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 2,
									["reactionType"] = "npc",
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["fader"] = {
									["height"] = 0.5,
								},
								["attribAnchorPoint"] = "LEFT",
								["width"] = 158,
								["maxColumns"] = 1,
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["height"] = 0.4,
								},
								["combatText"] = {
									["enabled"] = false,
									["height"] = 0.5,
								},
								["incHeal"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["healAbsorb"] = {
									["height"] = 0.5,
									["cap"] = 1,
								},
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 12,
									},
									["resurrect"] = {
										["y"] = 0,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["size"] = 16,
									},
									["masterLoot"] = {
										["anchorPoint"] = "TL",
										["x"] = 16,
										["anchorTo"] = "$parent",
										["y"] = -10,
										["size"] = 12,
									},
									["leader"] = {
										["anchorPoint"] = "TL",
										["x"] = 4,
										["anchorTo"] = "$parent",
										["y"] = -12,
										["size"] = 14,
									},
									["role"] = {
										["anchorPoint"] = "TL",
										["x"] = 28,
										["anchorTo"] = "$parent",
										["y"] = -10,
										["size"] = 12,
									},
									["ready"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = -4,
										["size"] = 16,
									},
									["height"] = 0.5,
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["status"] = {
										["anchorPoint"] = "LB",
										["x"] = 12,
										["anchorTo"] = "$parent",
										["y"] = -2,
										["size"] = 16,
									},
									["pvp"] = {
										["anchorPoint"] = "TR",
										["x"] = 11,
										["anchorTo"] = "$parent",
										["y"] = -21,
										["size"] = 22,
									},
								},
								["attribPoint"] = "BOTTOM",
							},
							["boss"] = {
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["perRow"] = 8,
										["selfScale"] = 1,
										["enlarge"] = {
											["SELF"] = false,
										},
										["y"] = 0,
										["x"] = 0,
										["anchorPoint"] = "BL",
										["size"] = 16,
									},
									["buffs"] = {
										["selfScale"] = 1,
										["perRow"] = 8,
										["anchorPoint"] = "BL",
										["x"] = 0,
										["y"] = 0,
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 40,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["order"] = 20,
									["background"] = true,
									["height"] = 0.8,
								},
								["offset"] = -1,
								["healthBar"] = {
									["colorType"] = "class",
									["order"] = 10,
									["background"] = true,
									["height"] = 1.2,
									["reactionType"] = "npc",
								},
								["text"] = {
									{
										["anchorPoint"] = "C",
										["x"] = 0,
									}, -- [1]
									{
										["text"] = "",
									}, -- [2]
									{
										["text"] = "[perpp]",
									}, -- [3]
									nil, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 160,
								["portrait"] = {
									["type"] = "3D",
									["alignment"] = "LEFT",
									["fullAfter"] = 100,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = false,
									["height"] = 0.4,
								},
								["combatText"] = {
									["enabled"] = false,
									["height"] = 0.5,
								},
								["height"] = 45,
								["enabled"] = true,
								["indicators"] = {
									["raidTarget"] = {
										["anchorPoint"] = "C",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["enabled"] = false,
										["size"] = 16,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
								},
							},
							["battleground"] = {
								["highlight"] = {
									["height"] = 0.5,
									["size"] = 10,
								},
								["range"] = {
									["enabled"] = true,
									["oorAlpha"] = 0.5,
									["height"] = 0.5,
								},
								["auras"] = {
									["height"] = 0.5,
									["debuffs"] = {
										["perRow"] = 9,
										["anchorPoint"] = "BL",
										["y"] = 0,
										["x"] = 0,
										["size"] = 16,
									},
									["buffs"] = {
										["y"] = 0,
										["perRow"] = 9,
										["x"] = 0,
										["anchorPoint"] = "BL",
										["size"] = 16,
									},
								},
								["castBar"] = {
									["time"] = {
										["y"] = 0,
										["x"] = -1,
										["anchorTo"] = "$parent",
										["enabled"] = true,
										["anchorPoint"] = "CRI",
										["size"] = 0,
									},
									["name"] = {
										["y"] = 0,
										["x"] = 1,
										["anchorTo"] = "$parent",
										["size"] = 0,
										["enabled"] = true,
										["anchorPoint"] = "CLI",
										["rank"] = true,
									},
									["order"] = 60,
									["background"] = true,
									["icon"] = "HIDE",
									["height"] = 0.6,
								},
								["auraIndicators"] = {
									["height"] = 0.5,
								},
								["powerBar"] = {
									["enabled"] = false,
									["colorType"] = "type",
									["order"] = 20,
									["background"] = true,
									["height"] = 0.5,
								},
								["offset"] = 4,
								["healthBar"] = {
									["colorType"] = "class",
									["height"] = 1.2,
									["reverse"] = false,
									["order"] = 10,
									["background"] = true,
									["invert"] = false,
									["reactionType"] = "npc",
								},
								["text"] = {
									{
										["anchorPoint"] = "C",
										["x"] = 0,
									}, -- [1]
									{
										["text"] = "",
									}, -- [2]
									{
										["text"] = "",
									}, -- [3]
									{
										["text"] = "",
									}, -- [4]
									{
										["text"] = "[name]",
									}, -- [5]
									nil, -- [6]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["x"] = -3,
										["default"] = true,
										["name"] = "Subtext",
										["anchorPoint"] = "CRI",
									}, -- [7]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub",
									}, -- [8]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Empty left",
									}, -- [9]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Left text",
									}, -- [10]
									{
										["anchorTo"] = "$emptyBar",
										["width"] = 0.5,
										["name"] = "Right text",
									}, -- [11]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub",
									}, -- [12]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Subtext",
									}, -- [13]
									{
										["anchorTo"] = "$powerBar",
										["width"] = 0.5,
										["name"] = "Center text",
									}, -- [14]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Right sub 2",
									}, -- [15]
									{
										["anchorTo"] = "$healthBar",
										["width"] = 0.5,
										["name"] = "Left sub 2",
									}, -- [16]
								},
								["emptyBar"] = {
									["order"] = 0,
									["background"] = true,
									["height"] = 1,
									["reactionType"] = "none",
								},
								["width"] = 160,
								["portrait"] = {
									["type"] = "class",
									["alignment"] = "LEFT",
									["fullAfter"] = 50,
									["height"] = 0.5,
									["fullBefore"] = 0,
									["order"] = 15,
									["width"] = 0.22,
								},
								["altPowerBar"] = {
									["order"] = 100,
									["background"] = true,
									["enabled"] = false,
									["height"] = 0.4,
								},
								["combatText"] = {
									["enabled"] = false,
									["height"] = 0.5,
								},
								["height"] = 45,
								["enabled"] = true,
								["indicators"] = {
									["raidTarget"] = {
										["y"] = 0,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "C",
										["enabled"] = false,
										["size"] = 20,
									},
									["class"] = {
										["anchorPoint"] = "BL",
										["x"] = 0,
										["anchorTo"] = "$parent",
										["y"] = 0,
										["size"] = 16,
									},
									["height"] = 0.5,
									["pvp"] = {
										["y"] = -11,
										["x"] = 0,
										["anchorTo"] = "$parent",
										["anchorPoint"] = "RB",
										["enabled"] = false,
										["size"] = 32,
									},
								},
							},
						},
						["font"] = {
							["shadowX"] = 0.8,
							["name"] = "ABF",
							["extra"] = "",
							["shadowColor"] = {
								["a"] = 1,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
							["shadowY"] = -0.8,
							["color"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = 1,
								["b"] = 1,
							},
							["size"] = 16,
						},
						["wowBuild"] = 70200,
						["classColors"] = {
							["DEATHKNIGHT"] = {
								["a"] = 1,
								["r"] = 0.77,
								["g"] = 0.12,
								["b"] = 0.23,
							},
							["WARRIOR"] = {
								["a"] = 1,
								["r"] = 0.82352941176471,
								["g"] = 0.64705882352941,
								["b"] = 0.45490196078431,
							},
							["SHAMAN"] = {
								["a"] = 1,
								["r"] = 0.18823529411765,
								["g"] = 0.36470588235294,
								["b"] = 0.85882352941176,
							},
							["MAGE"] = {
								["a"] = 1,
								["r"] = 0.38039215686275,
								["g"] = 0.73725490196078,
								["b"] = 0.86666666666667,
							},
							["VEHICLE"] = {
								["a"] = 1,
								["r"] = 0.23137254901961,
								["g"] = 0.41176470588235,
								["b"] = 0.23137254901961,
							},
							["PRIEST"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = 1,
								["b"] = 1,
							},
							["PALADIN"] = {
								["a"] = 1,
								["r"] = 0.96078431372549,
								["g"] = 0.54901960784314,
								["b"] = 0.72941176470588,
							},
							["HUNTER"] = {
								["a"] = 1,
								["r"] = 0.70196078431373,
								["g"] = 0.86666666666667,
								["b"] = 0.47058823529412,
							},
							["WARLOCK"] = {
								["a"] = 1,
								["r"] = 0.63137254901961,
								["g"] = 0.55686274509804,
								["b"] = 0.85882352941176,
							},
							["DEMONHUNTER"] = {
								["r"] = 0.64,
								["g"] = 0.19,
								["b"] = 0.79,
							},
							["PET"] = {
								["a"] = 1,
								["r"] = 0.19607843137255,
								["g"] = 0.87843137254902,
								["b"] = 0.19607843137255,
							},
							["DRUID"] = {
								["a"] = 1,
								["r"] = 1,
								["g"] = 0.49,
								["b"] = 0.04,
							},
							["MONK"] = {
								["a"] = 1,
								["r"] = 0,
								["g"] = 0.86666666666667,
								["b"] = 0.50980392156863,
							},
							["ROGUE"] = {
								["a"] = 1,
								["r"] = 0.95294117647059,
								["g"] = 0.91372549019608,
								["b"] = 0.39607843137255,
							},
						},
						["backdrop"] = {
							["clip"] = 1,
							["edgeSize"] = 6,
							["tileSize"] = 1,
							["borderTexture"] = "None",
							["inset"] = 3,
							["backgroundTexture"] = "None",
							["backgroundColor"] = {
								["a"] = 0.75088295340538,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
							["borderColor"] = {
								["a"] = 0,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
						},
						["bars"] = {
							["spacing"] = -1.25,
							["backgroundAlpha"] = 0.5,
							["alpha"] = 1,
							["texture"] = "BantoBar",
						},
						["auraColors"] = {
							["removable"] = {
								["r"] = 1,
								["g"] = 1,
								["b"] = 1,
							},
						},
					},
				},
			}

			ShadowedUFDB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- Skinner --------------------
	if opt == "Skinner" then
		if SkinnerDB.profiles.Junior then
			SkinnerDB.profileKeys[name .. " - " .. realm] = "Junior"
		else
			SkinnerDB = {
				["namespaces"] = {
					["ViewPort"] = {
					},
					["MiddleFrames"] = {
						["profiles"] = {
							["Junior"] = {
								["mf1"] = {
									["yOfs"] = -488.758735656738,
									["xOfs"] = 0.121826171875,
									["height"] = 113,
									["width"] = 560,
								},
							},
						},
					},
					["TopFrame"] = {
					},
					["UIButtons"] = {
						["profiles"] = {
							["Junior"] = {
								["UIButtons"] = true,
								["Quality"] = {
									["texture"] = "None",
								},
							},
						},
					},
					["BottomFrame"] = {
						["profiles"] = {
							["Junior"] = {
								["width"] = 2064,
								["height"] = 142,
							},
						},
					},
					["UnitFrames"] = {
					},
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["BgUseTex"] = true,
						["Backdrop"] = {
							["a"] = 1,
						},
						["StatusBar"] = {
							["b"] = 0.501960784313726,
							["g"] = 0.501960784313726,
						},
						["MinimapIcon"] = {
							["hide"] = true,
						},
						["ObjectiveTracker"] = {
							["popups"] = false,
						},
						["BackdropBorder"] = {
							["a"] = 0.600000023841858,
							["r"] = 0.231372549019608,
							["g"] = 0.231372549019608,
							["b"] = 0.231372549019608,
						},
						["DisableAllAS"] = true,
						["Warnings"] = false,
						["Nameplates"] = false,
						["Delay"] = {
							["LoDs"] = 0,
							["Init"] = 0,
							["Addons"] = 0,
						},
						["MinimapButtons"] = {
							["skin"] = true,
						},
						["DisabledSkins"] = {
							["Bagnon"] = false,
							["Skada"] = false,
							["DetailsFramework"] = false,
							["Details"] = false,
							["SorhaQuestLog"] = false,
							["Rematch"] = false,
							["Dominos"] = false,
							["Auctionator"] = false,
							["Ace3"] = false,
							["Prat-3.0"] = false,
							["REFlex"] = false,
							["AdiBags"] = false,
						},
						["ChatTabsFade"] = false,
						["BdDefault"] = false,
						["BdBorderTexture"] = "None",
						["ChatTabs"] = true,
						["Errors"] = false,
						["ZoneAbility"] = false,
						["Tooltips"] = {
							["style"] = 3,
						},
						["BdEdgeSize"] = 0,
					},
				},
			}

			SkinnerDB.profileKeys[name .. " - " .. realm] = "Junior"
		end
	end
	-------------------- Toaster --------------------
	if opt == "Toaster" then
		ToasterSettings.global.display.anchor.y = 0
		ToasterSettings.global.display.anchor.x = 0
		ToasterSettings.global.display.anchor.point = "CENTER"
		ToasterSettings.global.display.text.normal.r = 1
		ToasterSettings.global.display.text.normal.g = 1
		ToasterSettings.global.display.text.normal.b = 1
		ToasterSettings.global.display.duration = 8
		ToasterSettings.global.general.minimap_icon.hide = true
	end
	-------------------- TokenPrice --------------------
	if opt == "TokenPrice" then
		TokenPriceDB.global.showPercentChange = false
	end
	-------------------- WorldQuestAssistant --------------------
	if opt == "WorldQuestAssistant" then
		WorldQuestAssistantDB.profiles.Default.doneBehavior = "leaveWhenFlying"
		WorldQuestAssistantDB.profiles.Default.usePopups.joinGroup = false
		WorldQuestAssistantDB.profiles.Default.usePopups.createGroup = false
	end
end

button:SetScript("OnClick", function(self, button)
	if button == "LeftButton" then

		for i, v in ipairs(addonList) do
			if IsAddOnLoaded(v) then
				CreateConfig(v)
			else
				print(v .. " not found. No configuration created for it.")
			end
		end

	print("Finished Settings Creation")
	print("Right-Click to Reload")

	elseif button == "RightButton" then
		DisableAddOn("Details_3DModelsPaths", name)
		DisableAddOn("Details_DmgRank", name)
		DisableAddOn("Details_DpsTuning", name)
		DisableAddOn("Details_EncounterDetails", name)
		DisableAddOn("Details_RaidCheck", name)
		DisableAddOn("Details_Streamer", name)
		DisableAddOn("Details_TimeAttack", name)
		DisableAddOn("Details_TinyThreat", name)
		DisableAddOn("Details_Vanguard", name)
		DisableAddOn("Details_RaidInfo-EmeraldNightmare", name)
		DisableAddOn("Details_RaidInfo-TrialOfValor", name)
		DisableAddOn("Details_RaidInfo-Nighthold", name)
		DisableAddOn("Details_RaidInfo-TombOfSargeras", name)
		m4xHideButton = true
		ReloadUI()
	end
end)