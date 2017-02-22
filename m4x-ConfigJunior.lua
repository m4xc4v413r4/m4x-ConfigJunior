local button = CreateFrame("Button", "m4xConfigButton", UIParent);
local texture = button:CreateTexture(nil, "BACKGROUND");

local name, _ = UnitName("player");
local realm = GetRealmName();

local addonList = {
	"AuraFrames", "AutoRoll", "BagSync", "Bazooka",
	"Broker_MicroMenu", "ConfirmSP", "CurrencyTracking",
	"DBM-Core", "Dominos", "Kui_Nameplates", "Leatrix_Plus",
	"Masque", "MoveAnything", "PitBull4", "Prat-3.0",
	"Scrap", "SexyMap", "Skada", "Skinner", "SorhaQuestLog",
	"TokenPrice", "WorldQuestGroupFinder"
};

button:SetFrameStrata("HIGH");
button:SetPoint("CENTER");
button:SetWidth(490);
button:SetHeight(110);
button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
button:RegisterEvent("ADDON_LOADED");

texture:SetPoint("CENTER");
texture:SetWidth(512);
texture:SetHeight(256);
texture:SetTexture("Interface\\AddOns\\m4x-ConfigJunior\\junior.tga");

SLASH_NUTTIESUI1 = "/nui";
SlashCmdList["NUTTIESUI"] = function()
    if not m4xHideButton then
		button:Hide();
        m4xHideButton = true;
	elseif m4xHideButton then
		button:Show();
        m4xHideButton = nil;
	end
end

button:SetScript("OnEvent", function(self, event, addon)
	if not m4xHideButton and addon == "m4x-ConfigJunior" then
		button:Show();
	elseif m4xHideButton and addon == "m4x-ConfigJunior" then
		button:Hide();
	end
end);

button:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:SetText("Nutties UI");
	GameTooltip:AddLine(" ");
	GameTooltip:AddLine(string.format("Create configuration for %s-%s", name, realm));
	GameTooltip:AddLine(" ");
	GameTooltip:AddLine("Instructions:");
	GameTooltip:AddLine("1. Left-Click to Create Junior's Settings");
	GameTooltip:AddLine("2. Right-Click to Reload and Apply those Settings");
	GameTooltip:AddLine(" ");	
    GameTooltip:AddLine("Note: Type '/nui' to hide/show this button at any time");
    GameTooltip:Show();
end);

button:SetScript("OnLeave", function(self)
	GameTooltip:Hide();
end);

local function CreateConfig(opt)
	------------------------------ AuraFrames ------------------------------
	if opt == "AuraFrames" then
		if AuraFramesDB.profiles.Junior then
			AuraFramesDB.profileKeys[name .. " - " .. realm] = "Junior";
		else
			AuraFramesDB = {
				["namespaces"] = {
					["LibDualSpec-1.0"] = {
					},
				},
				["profileKeys"] = {
				},
				["global"] = {
					["SpellCooldowns"] = {
						["DEATHKNIGHT"] = {
						},
						["WARRIOR"] = {
						},
						["SHAMAN"] = {
						},
						["MAGE"] = {
						},
						["PALADIN"] = {
						},
						["WARLOCK"] = {
						},
						["DEMONHUNTER"] = {
						},
						["ROGUE"] = {
						},
						["DRUID"] = {
						},
						["MONK"] = {
						},
						["HUNTER"] = {
						},
					},
					["InternalCooldowns"] = {
					},
				},
				["profiles"] = {
					["Junior"] = {
						["DbVersion"] = 235,
						["Containers"] = {
							["PlayerBuffs"] = {
								["Type"] = "ButtonContainer",
								["Animations"] = {
									["AuraNew"] = {
										["Enabled"] = true,
										["Duration"] = 0.5,
										["Animation"] = "FadeIn",
									},
									["AuraChanging"] = {
										["Enabled"] = true,
										["Duration"] = 0.3,
										["Scale"] = 2.5,
										["Animation"] = "Popup",
									},
									["AuraExpiring"] = {
										["Enabled"] = true,
										["Duration"] = 1,
										["Animation"] = "Flash",
										["Times"] = 3,
									},
									["ContainerVisibility"] = {
										["Enabled"] = true,
										["InvisibleAlpha"] = 0.6,
										["Animation"] = "Fade",
										["Duration"] = 0.5,
										["MouseEventsWhenInactive"] = false,
									},
								},
								["Layout"] = {
									["DurationOutline"] = "OUTLINE",
									["SpaceY"] = 15,
									["Scale"] = 1,
									["DurationMonochrome"] = false,
									["Clickable"] = true,
									["ShowTooltip"] = true,
									["SpaceX"] = 0,
									["MiniBarDirection"] = "HIGHSHRINK",
									["CountAlignment"] = "CENTER",
									["TooltipShowUnitName"] = false,
									["DynamicSize"] = false,
									["CountColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["MiniBarLength"] = 36,
									["DurationPosY"] = -25,
									["ButtonSizeX"] = 36,
									["CountOutline"] = "OUTLINE",
									["ShowDuration"] = true,
									["DurationColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Direction"] = "LEFTDOWN",
									["DurationSize"] = 10,
									["CountPosX"] = 10,
									["MiniBarColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["MiniBarOffsetY"] = -25,
									["CountMonochrome"] = false,
									["DurationPosX"] = 0,
									["HorizontalSize"] = 8,
									["CountSize"] = 10,
									["MiniBarWidth"] = 8,
									["DurationFont"] = "Friz Quadrata TT",
									["TooltipShowClassification"] = false,
									["VerticalSize"] = 2,
									["ShowCount"] = true,
									["ButtonSizeY"] = 36,
									["DurationAlignment"] = "CENTER",
									["ShowBorder"] = "DEBUFF",
									["CountPosY"] = -6,
									["DurationLayout"] = "ABBREVSPACE",
									["CooldownReverse"] = false,
									["TooltipShowAuraId"] = true,
									["ShowCooldown"] = false,
									["MiniBarStyle"] = "HORIZONTAL",
									["TooltipShowPrefix"] = false,
									["CooldownDisableOmniCC"] = true,
									["MiniBarOffsetX"] = 0,
									["TooltipShowCaster"] = true,
									["MiniBarEnabled"] = false,
									["CountFont"] = "Friz Quadrata TT",
									["CooldownDrawEdge"] = true,
									["MiniBarTexture"] = "Blizzard",
								},
								["Order"] = {
									["Expert"] = false,
									["Predefined"] = "NoTimeTimeLeftDesc",
									["Rules"] = {
										{
											["Args"] = {
												["Float"] = 0,
											},
											["Subject"] = "ExpirationTime",
											["Operator"] = "First",
										}, -- [1]
										{
											["Args"] = {
											},
											["Subject"] = "ExpirationTime",
											["Operator"] = "NumberDesc",
										}, -- [2]
									},
								},
								["Sources"] = {
									["player"] = {
										["WEAPON"] = true,
										["HELPFUL"] = true,
									},
								},
								["Colors"] = {
									["Expert"] = false,
									["DefaultColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Rules"] = {
										{
											["Color"] = {
												0.8, -- [1]
												0, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Unknown Debuff Type",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "None",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [1]
										{
											["Color"] = {
												0.2, -- [1]
												0.6, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Magic",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "Magic",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [2]
										{
											["Color"] = {
												0.6, -- [1]
												0, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Curse",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "Curse",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [3]
										{
											["Color"] = {
												0.6, -- [1]
												0.4, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Disease",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "Disease",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [4]
										{
											["Color"] = {
												0, -- [1]
												0.6, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Poison",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "Poison",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [5]
										{
											["Color"] = {
												1, -- [1]
												1, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Buff",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HELPFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
												}, -- [1]
											},
										}, -- [6]
										{
											["Color"] = {
												1, -- [1]
												1, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Weapon",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "WEAPON",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
												}, -- [1]
											},
										}, -- [7]
									},
								},
								["Filter"] = {
									["Groups"] = {
									},
									["Expert"] = false,
								},
								["Location"] = {
									["OffsetX"] = -242.852783203125,
									["OffsetY"] = -27.966739654541,
									["FramePoint"] = "TOPRIGHT",
									["RelativePoint"] = "TOPRIGHT",
								},
								["Name"] = "Player Buffs",
								["Visibility"] = {
									["AlwaysVisible"] = true,
									["VisibleWhen"] = {
									},
									["VisibleWhenNot"] = {
									},
								},
								["Id"] = "PlayerBuffs",
							},
							["NAMEME"] = {
								["Type"] = "ButtonContainer",
								["Order"] = {
									["Expert"] = false,
									["Predefined"] = "NoTimeTimeLeftDesc",
									["Rules"] = {
										{
											["Args"] = {
												["Float"] = 0,
											},
											["Subject"] = "ExpirationTime",
											["Operator"] = "First",
										}, -- [1]
										{
											["Args"] = {
											},
											["Subject"] = "ExpirationTime",
											["Operator"] = "NumberDesc",
										}, -- [2]
									},
								},
								["Layout"] = {
									["DurationOutline"] = "OUTLINE",
									["SpaceY"] = 15,
									["DurationFont"] = "Friz Quadrata TT",
									["DurationMonochrome"] = false,
									["Clickable"] = true,
									["ShowTooltip"] = true,
									["HorizontalSize"] = 16,
									["MiniBarDirection"] = "HIGHSHRINK",
									["CountAlignment"] = "CENTER",
									["TooltipShowUnitName"] = false,
									["MiniBarColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["CountColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["MiniBarLength"] = 36,
									["DurationPosY"] = -25,
									["ButtonSizeX"] = 36,
									["CountOutline"] = "OUTLINE",
									["MiniBarTexture"] = "Blizzard",
									["VerticalSize"] = 2,
									["Direction"] = "LEFTDOWN",
									["DurationSize"] = 10,
									["CooldownDrawEdge"] = true,
									["CountFont"] = "Friz Quadrata TT",
									["MiniBarOffsetY"] = -25,
									["DurationPosX"] = 0,
									["MiniBarWidth"] = 8,
									["DynamicSize"] = false,
									["CountSize"] = 10,
									["MiniBarOffsetX"] = 0,
									["Scale"] = 1,
									["TooltipShowClassification"] = false,
									["DurationAlignment"] = "CENTER",
									["MiniBarStyle"] = "HORIZONTAL",
									["ButtonSizeY"] = 36,
									["TooltipShowPrefix"] = false,
									["ShowCooldown"] = false,
									["TooltipShowAuraId"] = false,
									["DurationLayout"] = "ABBREVSPACE",
									["CooldownReverse"] = false,
									["CountPosY"] = -6,
									["ShowBorder"] = "ALWAYS",
									["ShowCount"] = true,
									["CountMonochrome"] = false,
									["CooldownDisableOmniCC"] = true,
									["DurationColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["TooltipShowCaster"] = true,
									["MiniBarEnabled"] = false,
									["ShowDuration"] = true,
									["CountPosX"] = 10,
									["SpaceX"] = 5,
								},
								["Id"] = "NAMEME",
								["Colors"] = {
									["Expert"] = false,
									["DefaultColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Rules"] = {
										{
											["Color"] = {
												0.8, -- [1]
												0, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Unknown Debuff Type",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "None",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [1]
										{
											["Color"] = {
												0.2, -- [1]
												0.6, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Magic",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "Magic",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [2]
										{
											["Color"] = {
												0.6, -- [1]
												0, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Curse",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "Curse",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [3]
										{
											["Color"] = {
												0.6, -- [1]
												0.4, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Disease",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "Disease",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [4]
										{
											["Color"] = {
												0, -- [1]
												0.6, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Poison",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "Poison",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [5]
										{
											["Color"] = {
												1, -- [1]
												1, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Buff",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HELPFUL",
														},
													}, -- [1]
												}, -- [1]
											},
										}, -- [6]
										{
											["Color"] = {
												1, -- [1]
												1, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Weapon",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "WEAPON",
														},
													}, -- [1]
												}, -- [1]
											},
										}, -- [7]
									},
								},
								["Filter"] = {
									["Groups"] = {
										{
										}, -- [1]
										{
										}, -- [2]
									},
									["Expert"] = true,
								},
								["Location"] = {
									["FramePoint"] = "CENTER",
									["OffsetY"] = 0,
									["OffsetX"] = 0,
									["RelativePoint"] = "CENTER",
								},
								["Name"] = "NAME ME",
								["Visibility"] = {
									["AlwaysVisible"] = true,
									["VisibleWhen"] = {
									},
									["VisibleWhenNot"] = {
									},
								},
								["Animations"] = {
									["ContainerVisibility"] = {
										["Enabled"] = true,
										["InvisibleAlpha"] = 0.6,
										["Animation"] = "Fade",
										["Duration"] = 0.5,
										["MouseEventsWhenInactive"] = false,
									},
									["AuraExpiring"] = {
										["Enabled"] = true,
										["Duration"] = 1,
										["Times"] = 3,
										["Animation"] = "Flash",
									},
									["AuraChanging"] = {
										["Enabled"] = true,
										["Duration"] = 0.3,
										["Scale"] = 2.5,
										["Animation"] = "Popup",
									},
									["AuraNew"] = {
										["Enabled"] = true,
										["Duration"] = 0.5,
										["Animation"] = "FadeIn",
									},
								},
							},
							["PlayerDebuffs"] = {
								["Type"] = "ButtonContainer",
								["Animations"] = {
									["AuraNew"] = {
										["Enabled"] = true,
										["Duration"] = 0.5,
										["Animation"] = "FadeIn",
									},
									["AuraChanging"] = {
										["Enabled"] = true,
										["Duration"] = 0.3,
										["Scale"] = 2.5,
										["Animation"] = "Popup",
									},
									["AuraExpiring"] = {
										["Enabled"] = true,
										["Duration"] = 1,
										["Animation"] = "Flash",
										["Times"] = 3,
									},
									["ContainerVisibility"] = {
										["Enabled"] = true,
										["InvisibleAlpha"] = 0.6,
										["Animation"] = "Fade",
										["Duration"] = 0.5,
										["MouseEventsWhenInactive"] = false,
									},
								},
								["Layout"] = {
									["DurationOutline"] = "OUTLINE",
									["SpaceY"] = 15,
									["Scale"] = 1,
									["DurationMonochrome"] = false,
									["Clickable"] = true,
									["ShowTooltip"] = true,
									["SpaceX"] = 0,
									["MiniBarDirection"] = "HIGHSHRINK",
									["CountAlignment"] = "CENTER",
									["TooltipShowUnitName"] = false,
									["DynamicSize"] = false,
									["CountColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["MiniBarLength"] = 36,
									["DurationPosY"] = -25,
									["ButtonSizeX"] = 36,
									["CountOutline"] = "OUTLINE",
									["ShowDuration"] = true,
									["DurationColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Direction"] = "LEFTDOWN",
									["DurationSize"] = 10,
									["CountPosX"] = 10,
									["MiniBarColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["MiniBarOffsetY"] = -25,
									["CountMonochrome"] = false,
									["DurationPosX"] = 0,
									["HorizontalSize"] = 8,
									["CountSize"] = 10,
									["MiniBarWidth"] = 8,
									["DurationFont"] = "Friz Quadrata TT",
									["TooltipShowClassification"] = false,
									["VerticalSize"] = 2,
									["ShowCount"] = true,
									["ButtonSizeY"] = 36,
									["DurationAlignment"] = "CENTER",
									["ShowBorder"] = "ALWAYS",
									["CountPosY"] = -6,
									["DurationLayout"] = "ABBREVSPACE",
									["CooldownReverse"] = false,
									["TooltipShowAuraId"] = false,
									["ShowCooldown"] = false,
									["MiniBarStyle"] = "HORIZONTAL",
									["TooltipShowPrefix"] = false,
									["CooldownDisableOmniCC"] = true,
									["MiniBarOffsetX"] = 0,
									["TooltipShowCaster"] = true,
									["MiniBarEnabled"] = false,
									["CountFont"] = "Friz Quadrata TT",
									["CooldownDrawEdge"] = true,
									["MiniBarTexture"] = "Blizzard",
								},
								["Order"] = {
									["Expert"] = false,
									["Predefined"] = "NoTimeTimeLeftDesc",
									["Rules"] = {
										{
											["Args"] = {
												["Float"] = 0,
											},
											["Subject"] = "ExpirationTime",
											["Operator"] = "First",
										}, -- [1]
										{
											["Args"] = {
											},
											["Subject"] = "ExpirationTime",
											["Operator"] = "NumberDesc",
										}, -- [2]
									},
								},
								["Sources"] = {
									["player"] = {
										["HARMFUL"] = true,
									},
								},
								["Colors"] = {
									["Expert"] = false,
									["DefaultColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Rules"] = {
										{
											["Color"] = {
												0.8, -- [1]
												0, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Unknown Debuff Type",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "None",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [1]
										{
											["Color"] = {
												0.2, -- [1]
												0.6, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Magic",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "Magic",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [2]
										{
											["Color"] = {
												0.6, -- [1]
												0, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Curse",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "Curse",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [3]
										{
											["Color"] = {
												0.6, -- [1]
												0.4, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Disease",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "Disease",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [4]
										{
											["Color"] = {
												0, -- [1]
												0.6, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Poison",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HARMFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
													{
														["Args"] = {
															["String"] = "Poison",
														},
														["Subject"] = "Classification",
														["Operator"] = "Equal",
													}, -- [2]
												}, -- [1]
											},
										}, -- [5]
										{
											["Color"] = {
												1, -- [1]
												1, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Buff",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "HELPFUL",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
												}, -- [1]
											},
										}, -- [6]
										{
											["Color"] = {
												1, -- [1]
												1, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Weapon",
											["Groups"] = {
												{
													{
														["Args"] = {
															["String"] = "WEAPON",
														},
														["Subject"] = "Type",
														["Operator"] = "Equal",
													}, -- [1]
												}, -- [1]
											},
										}, -- [7]
									},
								},
								["Filter"] = {
									["Groups"] = {
									},
									["Expert"] = false,
								},
								["Location"] = {
									["OffsetX"] = -242.852783203125,
									["OffsetY"] = -126.966667175293,
									["FramePoint"] = "TOPRIGHT",
									["RelativePoint"] = "TOPRIGHT",
								},
								["Name"] = "Player Debuffs",
								["Visibility"] = {
									["AlwaysVisible"] = true,
									["VisibleWhen"] = {
									},
									["VisibleWhenNot"] = {
									},
								},
								["Id"] = "PlayerDebuffs",
							},
							["Procs"] = {
								["Type"] = "ButtonContainer",
								["Id"] = "Procs",
								["Layout"] = {
									["DurationOutline"] = "OUTLINE",
									["SpaceY"] = 15,
									["DurationFont"] = "Friz Quadrata TT",
									["DurationMonochrome"] = false,
									["Clickable"] = true,
									["ShowTooltip"] = true,
									["HorizontalSize"] = 5,
									["MiniBarDirection"] = "HIGHSHRINK",
									["CountAlignment"] = "CENTER",
									["TooltipShowUnitName"] = false,
									["MiniBarTexture"] = "Blizzard",
									["CountColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["MiniBarLength"] = 36,
									["DurationPosY"] = 25,
									["ButtonSizeX"] = 36,
									["CountOutline"] = "OUTLINE",
									["CountFont"] = "Friz Quadrata TT",
									["DurationColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["ShowDuration"] = true,
									["DurationSize"] = 12,
									["CooldownDrawEdge"] = true,
									["CountMonochrome"] = false,
									["MiniBarOffsetY"] = -25,
									["DynamicSize"] = false,
									["MiniBarOffsetX"] = 0,
									["SpaceX"] = 0,
									["CountSize"] = 10,
									["DurationPosX"] = 0,
									["Scale"] = 1,
									["TooltipShowClassification"] = false,
									["TooltipShowPrefix"] = false,
									["MiniBarStyle"] = "HORIZONTAL",
									["ButtonSizeY"] = 36,
									["DurationAlignment"] = "CENTER",
									["ShowCooldown"] = false,
									["TooltipShowAuraId"] = false,
									["DurationLayout"] = "ABBREVSPACE",
									["CooldownReverse"] = false,
									["CountPosY"] = -6,
									["ShowBorder"] = "DEBUFF",
									["ShowCount"] = true,
									["VerticalSize"] = 1,
									["CooldownDisableOmniCC"] = true,
									["MiniBarWidth"] = 8,
									["TooltipShowCaster"] = true,
									["MiniBarEnabled"] = false,
									["MiniBarColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["CountPosX"] = 10,
									["Direction"] = "RIGHTDOWN",
								},
								["Order"] = {
									["Expert"] = false,
									["Predefined"] = "NoTimeTimeLeftDesc",
									["Rules"] = {
										{
											["Args"] = {
												["Float"] = 0,
											},
											["Subject"] = "ExpirationTime",
											["Operator"] = "First",
										}, -- [1]
										{
											["Args"] = {
											},
											["Subject"] = "ExpirationTime",
											["Operator"] = "NumberDesc",
										}, -- [2]
									},
								},
								["Sources"] = {
									["player"] = {
										["HELPFUL"] = true,
									},
								},
								["Colors"] = {
									["Expert"] = false,
									["DefaultColor"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Rules"] = {
										{
											["Color"] = {
												0.8, -- [1]
												0, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Unknown Debuff Type",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "None",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [1]
										{
											["Color"] = {
												0.2, -- [1]
												0.6, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Magic",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "Magic",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [2]
										{
											["Color"] = {
												0.6, -- [1]
												0, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Curse",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "Curse",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [3]
										{
											["Color"] = {
												0.6, -- [1]
												0.4, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Disease",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "Disease",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [4]
										{
											["Color"] = {
												0, -- [1]
												0.6, -- [2]
												0, -- [3]
												1, -- [4]
											},
											["Name"] = "Debuff Type Poison",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HARMFUL",
														},
													}, -- [1]
													{
														["Operator"] = "Equal",
														["Subject"] = "Classification",
														["Args"] = {
															["String"] = "Poison",
														},
													}, -- [2]
												}, -- [1]
											},
										}, -- [5]
										{
											["Color"] = {
												1, -- [1]
												1, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Buff",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "HELPFUL",
														},
													}, -- [1]
												}, -- [1]
											},
										}, -- [6]
										{
											["Color"] = {
												1, -- [1]
												1, -- [2]
												1, -- [3]
												1, -- [4]
											},
											["Name"] = "Weapon",
											["Groups"] = {
												{
													{
														["Operator"] = "Equal",
														["Subject"] = "Type",
														["Args"] = {
															["String"] = "WEAPON",
														},
													}, -- [1]
												}, -- [1]
											},
										}, -- [7]
									},
								},
								["Filter"] = {
									["Groups"] = {
										{
											{
												["Args"] = {
													["SpellId"] = "32216",
												},
												["Subject"] = "SpellId",
												["Operator"] = "Equal",
											}, -- [1]
										}, -- [1]
										{
											{
												["Args"] = {
													["SpellId"] = "122510",
												},
												["Subject"] = "SpellId",
												["Operator"] = "Equal",
											}, -- [1]
										}, -- [2]
										{
											{
												["Args"] = {
													["SpellId"] = "190456",
												},
												["Subject"] = "SpellId",
												["Operator"] = "Equal",
											}, -- [1]
										}, -- [3]
										{
										}, -- [4]
										{
										}, -- [5]
									},
									["Expert"] = true,
								},
								["Location"] = {
									["OffsetX"] = -174.333541870117,
									["OffsetY"] = 245.078765869141,
									["FramePoint"] = "BOTTOM",
									["RelativePoint"] = "BOTTOM",
								},
								["Name"] = "Procs",
								["Visibility"] = {
									["AlwaysVisible"] = true,
									["VisibleWhen"] = {
									},
									["VisibleWhenNot"] = {
									},
								},
								["Animations"] = {
									["ContainerVisibility"] = {
										["Enabled"] = true,
										["InvisibleAlpha"] = 0.6,
										["Animation"] = "Fade",
										["Duration"] = 0.5,
										["MouseEventsWhenInactive"] = false,
									},
									["AuraExpiring"] = {
										["Enabled"] = true,
										["Duration"] = 1,
										["Times"] = 3,
										["Animation"] = "Flash",
									},
									["AuraChanging"] = {
										["Enabled"] = true,
										["Duration"] = 0.3,
										["Scale"] = 2.5,
										["Animation"] = "Popup",
									},
									["AuraNew"] = {
										["Enabled"] = true,
										["Duration"] = 0.5,
										["Animation"] = "FadeIn",
									},
								},
							},
						},
					},
				},
			};

			AuraFramesDB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ AutoRoll ------------------------------
	if opt == "AutoRoll" then
		AutoRollDB.autoConfirmAll = true;
		AutoRollDB.autoRollAll = true;
	end
	------------------------------ BagSync ------------------------------
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
					["r"] = 0.956862745098039,
					["g"] = 0.643137254901961,
					["b"] = 0.376470588235294,
				},
				["guild"] = {
					["r"] = 0.396078431372549,
					["g"] = 0.72156862745098,
					["b"] = 0.752941176470588,
				},
				["cross"] = {
					["r"] = 1,
					["g"] = 0.490196078431373,
					["b"] = 0.0392156862745098,
				},
				["bnet"] = {
					["r"] = 0.207843137254902,
					["g"] = 0.533333333333333,
					["b"] = 1,
				},
				["first"] = {
					["r"] = 0.501960784313726,
					["g"] = 1,
					["b"] = 0,
				},
				["itemid"] = {
					["r"] = 0.32156862745098,
					["g"] = 0.827450980392157,
					["b"] = 0.525490196078431,
				},
				["second"] = {
					["r"] = 1,
					["g"] = 1,
					["b"] = 1,
				},
			},
			["enableTooltipGreenCheck"] = true,
			["enableBNetAccountItems"] = false,
			["enableRealmAstrickName"] = false,
			["enableTooltipSeperator"] = true,
			["enableRealmIDTags"] = true,
		};
	end
	------------------------------ Bazooka ------------------------------
	if opt == "Bazooka" then
		if BazookaDB.profiles.Junior then
			BazookaDB.profileKeys[name .. " - " .. realm] = "Junior";
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
						["plugins"] = {
							["launcher"] = {
								["PitBull4"] = {
									["area"] = "right",
									["pos"] = 1,
									["bar"] = 3,
								},
								["MinimapButtonFrame"] = {
									["enabled"] = false,
									["pos"] = 5,
								},
								["Rematch"] = {
									["area"] = "right",
									["pos"] = 5,
									["bar"] = 3,
								},
								["Bazooka"] = {
									["enabled"] = false,
								},
								["Prat"] = {
									["enabled"] = false,
									["pos"] = 6,
								},
								["BeanCounter"] = {
									["pos"] = 1,
								},
								["Skinner"] = {
									["pos"] = 5,
								},
								["SavedInstances"] = {
									["area"] = "right",
									["pos"] = 4,
									["bar"] = 3,
								},
								["TradeSkillMasterMinimapIcon"] = {
									["enabled"] = false,
									["pos"] = 1,
								},
								["Informant"] = {
									["pos"] = 7,
								},
								["RaidAchievement"] = {
									["pos"] = 6,
								},
								["ChatAlerts"] = {
									["enabled"] = false,
									["pos"] = 7,
								},
								["AutoRoll"] = {
									["area"] = "right",
									["pos"] = 3,
									["bar"] = 3,
								},
								["TradeSkillMaster"] = {
									["enabled"] = false,
									["pos"] = 4,
								},
								["AtlasLoot"] = {
									["pos"] = 6,
								},
								["Dominos"] = {
									["area"] = "right",
									["pos"] = 2,
									["bar"] = 3,
								},
								["Auc-Util-AutoMagic"] = {
									["pos"] = 6,
								},
								["LootAppraiser"] = {
									["pos"] = 6,
								},
								["Enchantrix"] = {
									["pos"] = 2,
								},
								["Auc-Util-SearchUI"] = {
									["pos"] = 4,
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
									["stripColors"] = false,
									["showIcon"] = false,
									["area"] = "cleft",
									["alignment"] = "LEFT",
									["pos"] = 1,
									["showValue"] = false,
									["showSuffix"] = true,
								},
								["Memory usage"] = {
									["enabled"] = false,
									["pos"] = 13,
									["bar"] = 2,
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
									["showIcon"] = false,
									["area"] = "left",
									["enabled"] = false,
									["pos"] = 1,
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
								["Gold"] = {
									["useLabelAsTitle"] = false,
									["area"] = "left",
									["alignment"] = "LEFT",
									["pos"] = 28,
									["bar"] = 2,
								},
								["Surprise"] = {
									["enabled"] = false,
									["pos"] = 12,
									["bar"] = 2,
								},
								["Broker Currency"] = {
									["pos"] = 11,
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
								["XP"] = {
									["enabled"] = false,
									["pos"] = 43,
									["bar"] = 2,
								},
								["Details"] = {
									["enabled"] = false,
									["pos"] = 4,
									["bar"] = 2,
								},
								["DetailsStreamer"] = {
									["enabled"] = false,
									["pos"] = 6,
									["bar"] = 3,
								},
								["Friends"] = {
									["enabled"] = false,
									["pos"] = 30,
								},
								["Artifact weapon"] = {
									["area"] = "left",
									["enabled"] = false,
								},
								["Equipment"] = {
									["enabled"] = false,
									["pos"] = 44,
									["bar"] = 2,
								},
								["Quest Log"] = {
									["pos"] = 17,
								},
								["Archaeology"] = {
									["enabled"] = false,
									["pos"] = 14,
								},
								["IDs"] = {
									["enabled"] = false,
									["pos"] = 15,
								},
								["ClassSpecs"] = {
									["enabled"] = false,
									["pos"] = 23,
								},
								["Broker_Wallet"] = {
									["pos"] = 1,
								},
								["Tracking"] = {
									["enabled"] = false,
									["pos"] = 18,
									["bar"] = 4,
								},
								["Class Hall"] = {
									["enabled"] = false,
									["pos"] = 28,
									["bar"] = 4,
								},
								["iGuild"] = {
									["pos"] = 22,
									["bar"] = 4,
								},
								["Skada"] = {
									["enabled"] = false,
									["pos"] = 1,
								},
								["CurrencyTracking"] = {
									["showIcon"] = false,
									["showValue"] = false,
									["stripColors"] = false,
									["pos"] = 21,
								},
								["BugSack"] = {
									["area"] = "left",
									["pos"] = 4,
								},
								["Frenemy"] = {
									["enabled"] = false,
									["pos"] = 26,
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
								["GuildLog"] = {
									["enabled"] = false,
									["pos"] = 25,
									["bar"] = 2,
								},
								["Framerate"] = {
									["enabled"] = false,
									["pos"] = 11,
									["bar"] = 2,
								},
								["GC-Missions"] = {
									["pos"] = 18,
								},
								["Volume"] = {
									["enabled"] = false,
									["pos"] = 11,
								},
								["iMail"] = {
									["pos"] = 21,
									["bar"] = 3,
								},
								["Clock"] = {
									["enabled"] = false,
									["pos"] = 27,
								},
								["iFriends"] = {
									["pos"] = 19,
									["bar"] = 4,
								},
								["ChatChannels"] = {
									["enabled"] = false,
									["pos"] = 39,
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
								["LootedItemValue"] = {
									["enabled"] = false,
									["pos"] = 22,
								},
								["IncentiveProgram"] = {
									["area"] = "left",
									["pos"] = 7,
								},
								["m4xArtifactBroker"] = {
									["showLabel"] = true,
									["showIcon"] = false,
									["area"] = "cleft",
									["showText"] = false,
									["showValue"] = true,
									["pos"] = 1,
								},
								["Missions"] = {
									["enabled"] = false,
									["pos"] = 37,
									["bar"] = 2,
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
								["Tanaan Jungle Dailies"] = {
									["enabled"] = false,
									["pos"] = 8,
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
								["Professions"] = {
									["enabled"] = false,
									["pos"] = 41,
								},
								["GC-WorkOrders"] = {
									["pos"] = 36,
								},
								["Follower"] = {
									["enabled"] = false,
									["pos"] = 40,
								},
								["Broker_MicroMenu"] = {
									["area"] = "left",
									["pos"] = 3,
								},
							},
						},
						["locked"] = true,
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
								["bgColor"] = {
									["r"] = 0.0823529411764706,
									["g"] = 0.0823529411764706,
									["b"] = 0.0823529411764706,
								},
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
								["bgColor"] = {
									["r"] = 0.0823529411764706,
									["g"] = 0.0823529411764706,
									["b"] = 0.0823529411764706,
								},
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
								["bgColor"] = {
									["r"] = 0.0823529411764706,
									["g"] = 0.0823529411764706,
									["b"] = 0.0823529411764706,
								},
								["frameHeight"] = 20.0000038146973,
								["fontSize"] = 16,
							}, -- [3]
						},
					},
				},
			};

			BazookaDB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ Broker_MicroMenu ------------------------------
	if opt == "Broker_MicroMenu" then
		if Broker_MicroMenuDB.profiles.Junior then
			Broker_MicroMenuDB.profileKeys[name .. " - " .. realm] = "Junior";
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
			};

			Broker_MicroMenuDB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ ConfirmSP ------------------------------
	if opt == "ConfirmSP" then
		if ConfirmSP.profiles.Junior then
			ConfirmSP.profileKeys[name .. " - " .. realm] = "Junior";
		else
			ConfirmSP = {
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["verbose"] = false,
						["popups"] = {
							["ORDER_HALL_TALENT_RESEARCH"] = true,
							["CONFIRM_PURCHASE_NONREFUNDABLE_ITEM"] = true,
							["CONFIRM_MAIL_ITEM_UNREFUNDABLE"] = true,
							["SPELL_CONFIRMATION_PROMPT"] = true,
							["CONFIRM_FOLLOWER_EQUIPMENT"] = true,
							["EQUIP_BIND_TRADEABLE"] = true,
							["DELETE_ITEM"] = true,
							["CONFIM_BEFORE_USE"] = true,
							["CONFIRM_RELIC_REPLACE"] = true,
							["RECOVER_CORPSE"] = true,
							["RESURRECT_NO_TIMER"] = true,
							["REPLACE_ENCHANT"] = true,
							["TRANSMOG_APPLY_WARNING"] = true,
							["CONFIRM_BINDER"] = true,
							["SEND_MONEY"] = true,
							["BUYEMALL_CONFIRM"] = true,
							["CONFIRM_HIGH_COST_ITEM"] = true,
							["DELETE_QUEST_ITEM"] = true,
							["DELETE_GOOD_ITEM"] = true,
						},
						["version"] = "01-40 2017-01-17",
					},
				},
			};

			ConfirmSP.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ CurrencyTracking ------------------------------
	if opt == "CurrencyTracking" then
		CurrencyTrackingDB[realm][name]["options"]["show_currency"] = false;
	end
	------------------------------ DBM ------------------------------
	if opt == "DBM-Core" then
		DBM_AllSavedOptions.Default.WarningPoint = "TOP";
		DBM_AllSavedOptions.Default.WarningX = 0;
		DBM_AllSavedOptions.Default.WarningY = -105.8515625;
		DBT_AllPersistentOptions.Default.DBM.TimerPoint = "RIGHT";
		DBT_AllPersistentOptions.Default.DBM.TimerX = -412.503204345703;
		DBT_AllPersistentOptions.Default.DBM.TimerY = 179.0244140625;
		DBT_AllPersistentOptions.Default.DBM.HugeTimerPoint = "LEFT";
		DBT_AllPersistentOptions.Default.DBM.HugeTimerX = 457.091339111328;
		DBT_AllPersistentOptions.Default.DBM.HugeTimerY = 179.328506469727;
		DBM_UsedProfile = "Default";
	end
	------------------------------ Dominos ------------------------------
	if opt == "Dominos" then
		if DominosDB.profiles.Junior then
			DominosDB.profileKeys[name .. " - " .. realm] = "Junior";
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
								["anchor"] = "expTC",
								["spacing"] = 0,
								["numButtons"] = 12,
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
									["DEMONHUNTER"] = {
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
									["HUNTER"] = {
										["page2"] = 1,
										["page5"] = 4,
										["page4"] = 3,
										["page3"] = 2,
										["page6"] = 5,
									},
								},
							}, -- [1]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["padH"] = 2,
								["spacing"] = 4,
								["anchor"] = "4BL",
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
									["DEMONHUNTER"] = {
									},
									["PALADIN"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["HUNTER"] = {
									},
								},
								["y"] = -216,
							}, -- [2]
							{
								["showInPetBattleUI"] = false,
								["point"] = "BOTTOMRIGHT",
								["scale"] = 1,
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["x"] = -56,
								["padH"] = 2,
								["spacing"] = 0,
								["anchor"] = "5TR",
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
									["DEMONHUNTER"] = {
									},
									["PALADIN"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["HUNTER"] = {
									},
								},
								["numButtons"] = 12,
								["y"] = 163,
							}, -- [3]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["anchor"] = "7BL",
								["spacing"] = 4,
								["padH"] = 2,
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
									["DEMONHUNTER"] = {
									},
									["PALADIN"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["HUNTER"] = {
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
									["DEMONHUNTER"] = {
									},
									["PALADIN"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["HUNTER"] = {
									},
								},
							}, -- [5]
							{
								["showInPetBattleUI"] = false,
								["point"] = "BOTTOM",
								["scale"] = 1.25,
								["showInOverrideUI"] = false,
								["y"] = 55,
								["showstates"] = "",
								["spacing"] = 0,
								["anchor"] = "1TL",
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
									["DEMONHUNTER"] = {
									},
									["PALADIN"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["HUNTER"] = {
									},
								},
							}, -- [6]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["y"] = -136,
								["spacing"] = 4,
								["padH"] = 2,
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
									["DEMONHUNTER"] = {
									},
									["PALADIN"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["HUNTER"] = {
									},
								},
								["numButtons"] = 12,
								["anchor"] = "8BL",
							}, -- [7]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["y"] = -96,
								["spacing"] = 4,
								["padH"] = 2,
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
									["DEMONHUNTER"] = {
									},
									["PALADIN"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["HUNTER"] = {
									},
								},
								["numButtons"] = 12,
								["anchor"] = "9BC",
							}, -- [8]
							{
								["showInPetBattleUI"] = false,
								["point"] = "TOPLEFT",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["padW"] = 2,
								["anchor"] = "10BC",
								["spacing"] = 4,
								["padH"] = 2,
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
									["DEMONHUNTER"] = {
									},
									["PALADIN"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["HUNTER"] = {
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
								["padW"] = 2,
								["spacing"] = 4,
								["padH"] = 2,
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
									["DEMONHUNTER"] = {
									},
									["PALADIN"] = {
									},
									["DRUID"] = {
									},
									["MONK"] = {
									},
									["HUNTER"] = {
									},
								},
								["anchor"] = "artifactBL",
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
								["y"] = -61,
								["alpha"] = 0.9,
								["point"] = "LEFT",
								["spacing"] = 2,
								["anchor"] = "encounterBL",
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["showInPetBattleUI"] = false,
							},
							["pet"] = {
								["y"] = 121,
								["point"] = "BOTTOM",
								["spacing"] = 6,
								["anchor"] = "6TC",
								["showInOverrideUI"] = false,
								["showInPetBattleUI"] = false,
							},
							["cast"] = {
								["showInPetBattleUI"] = false,
								["point"] = "LEFT",
								["w"] = 240,
								["scale"] = 1,
								["showInOverrideUI"] = false,
								["hidden"] = true,
								["font"] = "Friz Quadrata TT",
								["padW"] = 1,
								["h"] = 32,
								["display"] = {
									["time"] = true,
									["icon"] = false,
									["border"] = true,
								},
								["padH"] = 1,
								["anchor"] = "rollBL",
								["y"] = 6,
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
								["hidden"] = true,
								["y"] = 200,
								["spacing"] = 2,
								["anchor"] = "menuBL",
								["alpha"] = 0.9,
								["columns"] = 1,
							},
							["vehicle"] = {
								["y"] = -218,
								["x"] = -199,
								["point"] = "TOPRIGHT",
								["showInOverrideUI"] = false,
								["showInPetBattleUI"] = false,
							},
							["roll"] = {
								["showInPetBattleUI"] = true,
								["columns"] = 1,
								["point"] = "LEFT",
								["spacing"] = 2,
								["anchor"] = "alertsBL",
								["showInOverrideUI"] = true,
								["hidden"] = true,
								["y"] = 81,
							},
							["encounter"] = {
								["showInPetBattleUI"] = true,
								["point"] = "LEFT",
								["anchor"] = "castBL",
								["showInOverrideUI"] = true,
								["hidden"] = true,
								["y"] = -28,
							},
						},
						["showgrid"] = true,
						["possessBar"] = 10,
					},
				},
			};
			DominosVersion = "7.1.4"

			DominosDB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ KuiNamePlates ------------------------------
	if opt == "Kui_Nameplates" then
		KuiNameplatesCoreSaved = {
			["profiles"] = {
				["Junior"] = {
					["tankmode_force_enable"] = true,
					["target_arrows"] = true,
				},
			},
		};

		KuiNameplatesCoreCharacterSaved = {
			["profile"] = "Junior",
		};
	end
	------------------------------ LeatrixPlus ------------------------------
	if opt == "Leatrix_Plus" then
		SlashCmdList["Leatrix_Plus"]("nosave");

		LeaPlusDB = {
			["HotkeyMenu"] = 1,
			["ViewPortBottom"] = 0,
			["BuffFrameX"] = -205,
			["BuffFrameY"] = -13,
			["ManageBuffFrame"] = "Off",
			["AutoTurnInDailys"] = "On",
			["NoEncounterAlerts"] = "On",
			["MusicContinent"] = "Various",
			["ClassColPlayer"] = "On",
			["ShowMinimapIcon"] = "Off",
			["ViewPortTop"] = 0,
			["InvKey"] = "plus",
			["NoGryphons"] = "Off",
			["FrmEnabled"] = "Off",
			["PlusPanelAlphaCheck"] = "Off",
			["MinimapMouseZoom"] = "Off",
			["LeaStartPage"] = 3,
			["AutoQuestWeekly"] = "On",
			["MainPanelR"] = "CENTER",
			["ShowRevealBox"] = "Off",
			["InviteFromWhisper"] = "Off",
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
			["NoPetAutomation"] = "Off",
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
			["AutoGossipMenu"] = 1,
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
			["MaxChatHstory"] = "On",
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
			["AutomateQuests"] = "On",
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
		};
	end
	------------------------------ Masque ------------------------------
	if opt == "Masque" then
		if MasqueDB.profiles.Junior then
			MasqueDB.profileKeys[name .. " - " .. realm] = "Junior";
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
							["Dominos_Extra Bar"] = {
								["Colors"] = {
									["Pushed"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Highlight"] = {
										0.905882352941177, -- [1]
										0.929411764705882, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Backdrop"] = {
										0.262745098039216, -- [1]
										0.262745098039216, -- [2]
										0.262745098039216, -- [3]
										0.629999995231628, -- [4]
									},
									["Flash"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
								},
								["Backdrop"] = true,
							},
							["AuraFrames"] = {
								["Colors"] = {
									["Backdrop"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Normal"] = {
										0.254901960784314, -- [1]
										0.254901960784314, -- [2]
										0.254901960784314, -- [3]
										0.629999995231628, -- [4]
									},
								},
							},
							["Dominos_Action Bar"] = {
								["Colors"] = {
									["Normal"] = {
										0.254901960784314, -- [1]
										0.254901960784314, -- [2]
										0.254901960784314, -- [3]
										0.629999995231628, -- [4]
									},
									["Pushed"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Highlight"] = {
										0.905882352941177, -- [1]
										0.929411764705882, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Backdrop"] = {
										0.262745098039216, -- [1]
										0.262745098039216, -- [2]
										0.262745098039216, -- [3]
										0.629999995231628, -- [4]
									},
									["Flash"] = {
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
									["Pushed"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Highlight"] = {
										0.905882352941177, -- [1]
										0.929411764705882, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Backdrop"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0.629999995231628, -- [4]
									},
									["Flash"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
								},
								["Backdrop"] = true,
							},
							["Dominos_Bag Bar"] = {
								["Colors"] = {
									["Pushed"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Highlight"] = {
										0.905882352941177, -- [1]
										0.929411764705882, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Backdrop"] = {
										0.262745098039216, -- [1]
										0.262745098039216, -- [2]
										0.262745098039216, -- [3]
										0.629999995231628, -- [4]
									},
									["Flash"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
								},
								["Backdrop"] = true,
							},
							["Dominos_Pet Bar"] = {
								["Colors"] = {
									["Pushed"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Checked"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										0, -- [4]
									},
									["Highlight"] = {
										0.905882352941177, -- [1]
										0.929411764705882, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Backdrop"] = {
										0.262745098039216, -- [1]
										0.262745098039216, -- [2]
										0.262745098039216, -- [3]
										0.629999995231628, -- [4]
									},
									["Flash"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
								},
								["Backdrop"] = true,
							},
							["AuraFrames_PlayerDebuffs"] = {
								["Colors"] = {
									["Backdrop"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Normal"] = {
										0.254901960784314, -- [1]
										0.254901960784314, -- [2]
										0.254901960784314, -- [3]
										0.629999995231628, -- [4]
									},
								},
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
							["AuraFrames_PlayerBuffs"] = {
								["Colors"] = {
									["Backdrop"] = {
										1, -- [1]
										1, -- [2]
										1, -- [3]
										1, -- [4]
									},
									["Normal"] = {
										0.254901960784314, -- [1]
										0.254901960784314, -- [2]
										0.254901960784314, -- [3]
										0.629999995231628, -- [4]
									},
								},
							},
						},
					},
				},
			};

			MasqueDB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ MoveAnything ------------------------------
	if opt == "MoveAnything" then
		if MADB.profiles.Junior then
			MADB["characters"][realm .. " " .. name] = {["profile"] = "Junior"};
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
									-240.060791015625, -- [4]
									51.16650390625, -- [5]
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
									-16.7076705218223, -- [4]
									128.459259033203, -- [5]
								},
							},
							["WorldStateCaptureBar1"] = {
								["name"] = "WorldStateCaptureBar1",
								["pos"] = {
									"TOPRIGHT", -- [1]
									"MinimapCluster", -- [2]
									"BOTTOMRIGHT", -- [3]
									-46.94970703125, -- [4]
									-85.9595947265625, -- [5]
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
									-240.384765625, -- [4]
									-174.846557617188, -- [5]
								},
							},
							["MAOptions"] = {
								["orgPos"] = {
									"RIGHT", -- [1]
									"UIParent", -- [2]
									"RIGHT", -- [3]
									-326, -- [4]
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
									-0.947897029950353, -- [4]
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
									669.04090693066, -- [4]
									-584.870682843266, -- [5]
								},
							},
							["HelpOpenWebTicketButton"] = {
								["orgPos"] = {
									"CENTER", -- [1]
									"MainMenuMicroButton", -- [2]
									"TOPRIGHT", -- [3]
									-3, -- [4]
									-26.0000019073486, -- [5]
								},
								["name"] = "HelpOpenWebTicketButton",
								["pos"] = {
									"CENTER", -- [1]
									"MainMenuMicroButton", -- [2]
									"TOPRIGHT", -- [3]
									-3, -- [4]
									-26.0000305175781, -- [5]
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
									1733.79052734375, -- [4]
									-219.023132324219, -- [5]
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
			};

			MADB["characters"][realm .. " " .. name] = {["profile"] = "Junior"};
		end
	end
	------------------------------ PitBull4 ------------------------------
	if opt == "PitBull4" then
		if PitBull4DB.profiles.Junior then
			PitBull4DB.profileKeys[name .. " - " .. realm] = "Junior";
		else
			PitBull4DB = {
				["namespaces"] = {
					["LeaderIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Target of Target"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["LibDualSpec-1.0"] = {
					},
					["RangeFader"] = {
					},
					["CastBarLatency"] = {
					},
					["PhaseIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["position"] = 1.00001,
									},
									["Player"] = {
										["position"] = 1.00001,
									},
									["Basic"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
									["Target of Target"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
									["Boss"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
								},
							},
						},
					},
					["CombatIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Boss"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
									["Basic"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
									["Target of Target"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
									["Player"] = {
										["position"] = 1.00001,
									},
								},
							},
						},
					},
					["RoleIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["position"] = 1.00002,
									},
									["Player"] = {
										["position"] = 1.00002,
									},
									["Basic"] = {
										["position"] = 1.00002,
										["size"] = 1.95,
									},
									["Target of Target"] = {
										["enabled"] = false,
										["position"] = 1.00002,
									},
									["Boss"] = {
										["position"] = 1.00002,
										["size"] = 1.95,
									},
								},
							},
						},
					},
					["DogTagTexts"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["first"] = false,
										["elements"] = {
											["Druid mana"] = {
												["exists"] = true,
												["code"] = "[if not IsMana then FractionalDruidMP]",
												["location"] = "right",
												["attach_to"] = "DruidManaBar",
											},
											["Threat"] = {
												["exists"] = true,
												["code"] = "[PercentThreat:Round(1):Hide(0):Percent]",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Power"] = {
												["exists"] = true,
												["code"] = "[if HasMP then FractionalMP]",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Reputation"] = {
												["exists"] = true,
												["code"] = "[if IsMouseOver then ReputationName else if ReputationName then FractionalReputation ' ' PercentReputation:Percent:Paren]",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
											["PVPTimer"] = {
												["exists"] = true,
												["code"] = "[PvPDuration:FormatDuration:Red]",
												["location"] = "out_right_top",
											},
											["Cast"] = {
												["exists"] = true,
												["code"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Name"] = {
												["exists"] = true,
												["code"] = "[Name] [(AFK or DND):Angle]",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Class"] = {
												["exists"] = true,
												["code"] = "[Classification] [Level:DifficultyColor] [(if (IsPlayer or (IsEnemy and not IsPet)) then Class):ClassColor] [DruidForm:Paren] [SmartRace]",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Experience"] = {
												["exists"] = true,
												["code"] = "[FractionalXP] [PercentXP:Percent:Paren] [Concatenate('R: ', PercentRestXP:Hide(0):Percent)]",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Cast time"] = {
												["exists"] = true,
												["code"] = "[if not CastStopDuration then Concatenate(CastIsChanneling ? '-' ! '+', CastDelay:Abs:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Health"] = {
												["exists"] = true,
												["code"] = "[Status or (FractionalHP:Short ' || ' PercentHP:Percent)]",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
										},
									},
									["Player"] = {
										["first"] = false,
										["elements"] = {
											["Druid mana"] = {
												["exists"] = true,
												["code"] = "[if not IsMana then FractionalDruidMP]",
												["location"] = "right",
												["attach_to"] = "DruidManaBar",
											},
											["Threat"] = {
												["exists"] = true,
												["code"] = "[PercentThreat:Round(1):Hide(0):Percent]",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Power"] = {
												["exists"] = true,
												["code"] = "[if HasMP then FractionalMP]",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Reputation"] = {
												["exists"] = true,
												["code"] = "[if IsMouseOver then ReputationName else if ReputationName then FractionalReputation ' ' PercentReputation:Percent:Paren]",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
											["PVPTimer"] = {
												["exists"] = true,
												["code"] = "[PvPDuration:FormatDuration:Red]",
												["location"] = "out_right_top",
											},
											["Cast"] = {
												["exists"] = true,
												["code"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Name"] = {
												["exists"] = true,
												["code"] = "[Name] [(AFK or DND):Angle]",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Class"] = {
												["exists"] = true,
												["code"] = "[Classification] [Level:DifficultyColor] [(if (IsPlayer or (IsEnemy and not IsPet)) then Class):ClassColor] [DruidForm:Paren] [SmartRace]",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Experience"] = {
												["exists"] = true,
												["code"] = "[FractionalXP] [PercentXP:Percent:Paren] [Concatenate('R: ', PercentRestXP:Hide(0):Percent)]",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Cast time"] = {
												["exists"] = true,
												["code"] = "[if not CastStopDuration then Concatenate(CastIsChanneling ? '-' ! '+', CastDelay:Abs:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Health"] = {
												["exists"] = true,
												["code"] = "[Status or (FractionalHP:Short ' || ' PercentHP:Percent)]",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
										},
									},
									["Basic"] = {
										["first"] = false,
										["elements"] = {
											["Druid mana"] = {
												["exists"] = true,
												["code"] = "[if not IsMana then FractionalDruidMP]",
												["location"] = "right",
												["attach_to"] = "DruidManaBar",
											},
											["Threat"] = {
												["exists"] = true,
												["code"] = "[PercentThreat:Round(1):Hide(0):Percent]",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Power"] = {
												["exists"] = true,
												["code"] = "[if HasMP then FractionalMP]",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Reputation"] = {
												["exists"] = true,
												["code"] = "[if IsMouseOver then ReputationName else if ReputationName then FractionalReputation ' ' PercentReputation:Percent:Paren]",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
											["PVPTimer"] = {
												["exists"] = true,
												["code"] = "[PvPDuration:FormatDuration:Red]",
												["location"] = "out_right_top",
											},
											["Cast"] = {
												["exists"] = true,
												["code"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Name"] = {
												["exists"] = true,
												["code"] = "[Name] [(AFK or DND):Angle]",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Class"] = {
												["exists"] = true,
												["code"] = "[Classification] [Level:DifficultyColor] [(if (IsPlayer or (IsEnemy and not IsPet)) then Class):ClassColor] [DruidForm:Paren] [SmartRace]",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Experience"] = {
												["exists"] = true,
												["code"] = "[FractionalXP] [PercentXP:Percent:Paren] [Concatenate('R: ', PercentRestXP:Hide(0):Percent)]",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Cast time"] = {
												["exists"] = true,
												["code"] = "[if not CastStopDuration then Concatenate(CastIsChanneling ? '-' ! '+', CastDelay:Abs:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Health"] = {
												["exists"] = true,
												["code"] = "[Status or (FractionalHP:Short ' || ' PercentHP:Percent)]",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
										},
									},
									["Target"] = {
										["first"] = false,
										["elements"] = {
											["Druid mana"] = {
												["exists"] = true,
												["code"] = "[if not IsMana then FractionalDruidMP]",
												["location"] = "right",
												["attach_to"] = "DruidManaBar",
											},
											["Threat"] = {
												["exists"] = true,
												["code"] = "[PercentThreat:Round(1):Hide(0):Percent]",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Power"] = {
												["exists"] = true,
												["code"] = "[if HasMP then FractionalMP]",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Reputation"] = {
												["exists"] = true,
												["code"] = "[if IsMouseOver then ReputationName else if ReputationName then FractionalReputation ' ' PercentReputation:Percent:Paren]",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
											["PVPTimer"] = {
												["exists"] = true,
												["code"] = "[PvPDuration:FormatDuration:Red]",
												["location"] = "out_right_top",
											},
											["Cast"] = {
												["exists"] = true,
												["code"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Name"] = {
												["exists"] = true,
												["code"] = "[Name] [(AFK or DND):Angle]",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Class"] = {
												["exists"] = true,
												["code"] = "[Classification] [Level:DifficultyColor] [(if (IsPlayer or (IsEnemy and not IsPet)) then Class):ClassColor] [DruidForm:Paren] [SmartRace]",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Experience"] = {
												["exists"] = true,
												["code"] = "[FractionalXP] [PercentXP:Percent:Paren] [Concatenate('R: ', PercentRestXP:Hide(0):Percent)]",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Cast time"] = {
												["exists"] = true,
												["code"] = "[if not CastStopDuration then Concatenate(CastIsChanneling ? '-' ! '+', CastDelay:Abs:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Health"] = {
												["exists"] = true,
												["code"] = "[Status or (FractionalHP:Short ' || ' PercentHP:Percent)]",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
										},
									},
									["Target of Target"] = {
										["first"] = false,
										["elements"] = {
											["Druid mana"] = {
												["exists"] = true,
												["code"] = "[if not IsMana then FractionalDruidMP]",
												["location"] = "right",
												["attach_to"] = "DruidManaBar",
											},
											["Threat"] = {
												["exists"] = true,
												["code"] = "[PercentThreat:Round(1):Hide(0):Percent]",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Power"] = {
												["exists"] = true,
												["code"] = "[if HasMP then FractionalMP]",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Reputation"] = {
												["exists"] = true,
												["code"] = "[if IsMouseOver then ReputationName else if ReputationName then FractionalReputation ' ' PercentReputation:Percent:Paren]",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
											["PVPTimer"] = {
												["exists"] = true,
												["code"] = "[PvPDuration:FormatDuration:Red]",
												["location"] = "out_right_top",
											},
											["Cast"] = {
												["exists"] = true,
												["code"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Name"] = {
												["exists"] = true,
												["code"] = "[Name] [(AFK or DND):Angle]",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Class"] = {
												["exists"] = true,
												["code"] = "[Classification] [Level:DifficultyColor] [(if (IsPlayer or (IsEnemy and not IsPet)) then Class):ClassColor] [DruidForm:Paren] [SmartRace]",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Experience"] = {
												["exists"] = true,
												["code"] = "[FractionalXP] [PercentXP:Percent:Paren] [Concatenate('R: ', PercentRestXP:Hide(0):Percent)]",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Cast time"] = {
												["exists"] = true,
												["code"] = "[if not CastStopDuration then Concatenate(CastIsChanneling ? '-' ! '+', CastDelay:Abs:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Health"] = {
												["exists"] = true,
												["code"] = "[Status or (FractionalHP:Short ' || ' PercentHP:Percent)]",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
										},
									},
									["Boss"] = {
										["first"] = false,
										["elements"] = {
											["Druid mana"] = {
												["exists"] = true,
												["code"] = "[if not IsMana then FractionalDruidMP]",
												["location"] = "right",
												["attach_to"] = "DruidManaBar",
											},
											["Threat"] = {
												["exists"] = true,
												["code"] = "[PercentThreat:Round(1):Hide(0):Percent]",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Power"] = {
												["exists"] = true,
												["code"] = "[if HasMP then FractionalMP]",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Reputation"] = {
												["exists"] = true,
												["code"] = "[if IsMouseOver then ReputationName else if ReputationName then FractionalReputation ' ' PercentReputation:Percent:Paren]",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
											["PVPTimer"] = {
												["exists"] = true,
												["code"] = "[PvPDuration:FormatDuration:Red]",
												["location"] = "out_right_top",
											},
											["Cast"] = {
												["exists"] = true,
												["code"] = "[Alpha((-CastStopDuration or 0) + 1) CastStopMessage or (CastName ' ' CastTarget:Paren)]",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Name"] = {
												["exists"] = true,
												["code"] = "[Name] [(AFK or DND):Angle]",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Class"] = {
												["exists"] = true,
												["code"] = "[Classification] [Level:DifficultyColor] [(if (IsPlayer or (IsEnemy and not IsPet)) then Class):ClassColor] [DruidForm:Paren] [SmartRace]",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Experience"] = {
												["exists"] = true,
												["code"] = "[FractionalXP] [PercentXP:Percent:Paren] [Concatenate('R: ', PercentRestXP:Hide(0):Percent)]",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Cast time"] = {
												["exists"] = true,
												["code"] = "[if not CastStopDuration then Concatenate(CastIsChanneling ? '-' ! '+', CastDelay:Abs:Round(1):Hide(0)):Red ' ' [CastEndDuration >= 0 ? '%.1f':Format(CastEndDuration)]]",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Health"] = {
												["exists"] = true,
												["code"] = "[Status or (FractionalHP:Short ' || ' PercentHP:Percent)]",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
										},
									},
								},
							},
						},
					},
					["Shields"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Player"] = {
										["animated"] = true,
										["deficit"] = true,
										["side"] = "left",
										["first"] = false,
									},
									["Basic"] = {
										["first"] = false,
									},
									["Target"] = {
										["first"] = false,
									},
									["Target of Target"] = {
										["first"] = false,
									},
									["Boss"] = {
										["first"] = false,
									},
								},
							},
						},
					},
					["Aggro"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["enabled"] = false,
									},
									["Player"] = {
										["enabled"] = false,
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Target"] = {
										["enabled"] = false,
									},
									["Raid"] = {
										["enabled"] = false,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
									["Boss"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["SoulShards"] = {
					},
					["HostilityFader"] = {
						["profiles"] = {
							["Junior"] = {
								["global"] = {
									["enabled"] = false,
								},
							},
						},
					},
					["MasterLooterIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Target of Target"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["CombatText"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["enabled"] = false,
									},
									["Player"] = {
										["enabled"] = false,
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Target"] = {
										["enabled"] = false,
									},
									["Raid"] = {
										["enabled"] = false,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
									["Boss"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["ReadyCheckIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Boss"] = {
										["position"] = 1.00001,
									},
									["Basic"] = {
										["position"] = 1.00001,
									},
									["Target of Target"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
									["Player"] = {
										["position"] = 1.00001,
									},
								},
							},
						},
					},
					["HolyPower"] = {
					},
					["Totems"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Player"] = {
										["location"] = "out_left",
										["timer_text_side"] = "leftoutside",
									},
								},
							},
						},
					},
					["Chi"] = {
					},
					["Portrait"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Player"] = {
										["position"] = 3,
									},
								},
							},
						},
					},
					["ExperienceBar"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Boss"] = {
										["enabled"] = false,
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
									["Player"] = {
										["enabled"] = false,
										["position"] = 7,
									},
								},
							},
						},
					},
					["RaidTargetIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Player"] = {
										["position"] = 1.00001,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["Border"] = {
					},
					["Background"] = {
					},
					["ShieldsText"] = {
					},
					["CastBar"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["auto_hide"] = true,
									},
									["Player"] = {
										["auto_hide"] = true,
									},
									["Basic"] = {
										["auto_hide"] = true,
										["enabled"] = false,
									},
									["Target"] = {
										["auto_hide"] = true,
										["size"] = 3,
									},
									["Raid"] = {
										["auto_hide"] = true,
									},
									["Target of Target"] = {
										["auto_hide"] = true,
										["enabled"] = false,
									},
									["Boss"] = {
										["auto_hide"] = true,
										["enabled"] = false,
									},
								},
							},
						},
					},
					["RestIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Boss"] = {
										["enabled"] = false,
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["PvPIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["position"] = 1.00003,
									},
									["Player"] = {
										["position"] = 1.00003,
									},
									["Basic"] = {
										["enabled"] = false,
										["position"] = 1.00003,
									},
									["Raid"] = {
										["position"] = 1.00003,
									},
									["Target of Target"] = {
										["enabled"] = false,
										["position"] = 1.00003,
									},
									["Boss"] = {
										["enabled"] = false,
										["position"] = 1.00003,
									},
								},
							},
						},
					},
					["Aura"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["layout"] = {
											["buff"] = {
												["my_size"] = 21,
												["size"] = 20,
											},
										},
									},
									["Player"] = {
										["enabled_buffs"] = false,
										["layout"] = {
											["buff"] = {
												["my_size"] = 21,
												["size"] = 20,
											},
										},
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Raid"] = {
										["enabled"] = false,
										["layout"] = {
											["buff"] = {
												["my_size"] = 21,
												["size"] = 20,
											},
										},
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
									["Boss"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["Runes"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Player"] = {
										["location"] = "out_top_right",
										["position"] = 1.00001,
									},
								},
							},
						},
					},
					["DruidManaBar"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Player"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["PowerBar"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Boss"] = {
										["enabled"] = false,
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
									["Player"] = {
										["position"] = 5,
									},
								},
							},
						},
					},
					["HideBlizzard"] = {
						["profiles"] = {
							["Junior"] = {
								["global"] = {
									["runebar"] = false,
									["raid"] = true,
									["boss"] = true,
								},
							},
						},
					},
					["ReputationBar"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["enabled"] = false,
									},
									["Player"] = {
										["enabled"] = false,
										["position"] = 8,
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Target"] = {
										["enabled"] = false,
									},
									["Raid"] = {
										["enabled"] = false,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
									["Boss"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["Sounds"] = {
					},
					["HealthBar"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["size"] = 4,
									},
									["Player"] = {
										["position"] = 2,
										["size"] = 4,
									},
									["Basic"] = {
										["size"] = 4,
									},
									["Target"] = {
										["size"] = 4,
									},
									["Raid"] = {
										["size"] = 4,
									},
									["Target of Target"] = {
										["size"] = 4,
									},
									["Boss"] = {
										["size"] = 4,
									},
								},
							},
						},
					},
					["ArtifactPowerBar"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["enabled"] = false,
									},
									["Player"] = {
										["enabled"] = false,
										["position"] = 9,
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Target"] = {
										["enabled"] = false,
									},
									["Raid"] = {
										["enabled"] = false,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
									["Boss"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["QuestIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["position"] = 1.00001,
									},
									["Player"] = {
										["position"] = 1.00001,
									},
									["Basic"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
									["Raid"] = {
										["position"] = 1.00001,
									},
									["Target of Target"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
									["Boss"] = {
										["enabled"] = false,
										["position"] = 1.00001,
									},
								},
							},
						},
					},
					["VoiceIcon"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Boss"] = {
										["enabled"] = false,
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["VisualHeal"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Target of Target"] = {
										["enabled"] = false,
									},
								},
								["global"] = {
									["enabled"] = false,
								},
							},
						},
					},
					["Highlight"] = {
					},
					["CombatFader"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Player"] = {
										["out_of_combat_opacity"] = 1,
									},
								},
							},
						},
					},
					["BattlePet"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["position"] = 1.00002,
									},
									["Player"] = {
										["position"] = 1.00002,
									},
									["Basic"] = {
										["enabled"] = false,
										["position"] = 1.00002,
									},
									["Raid"] = {
										["position"] = 1.00002,
									},
									["Target of Target"] = {
										["enabled"] = false,
										["position"] = 1.00002,
									},
									["Boss"] = {
										["enabled"] = false,
										["position"] = 1.00002,
									},
								},
							},
						},
					},
					["AltPowerBar"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["position"] = 3.00001,
									},
									["Player"] = {
										["position"] = 6,
										["side"] = "left",
									},
									["Basic"] = {
										["enabled"] = false,
										["position"] = 3.00001,
									},
									["Target"] = {
										["position"] = 3.00001,
									},
									["Raid"] = {
										["position"] = 3.00001,
									},
									["Target of Target"] = {
										["enabled"] = false,
										["position"] = 3.00001,
									},
									["Boss"] = {
										["enabled"] = false,
										["position"] = 3.00001,
									},
								},
							},
						},
					},
					["BlankSpace"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["first"] = false,
										["elements"] = {
											["Default"] = {
												["exists"] = true,
												["position"] = 10.00001,
											},
										},
									},
									["Player"] = {
										["first"] = false,
										["elements"] = {
											["Default"] = {
												["exists"] = true,
												["position"] = 11,
											},
										},
									},
									["Basic"] = {
										["first"] = false,
										["elements"] = {
											["Default"] = {
												["exists"] = true,
											},
										},
									},
									["Target"] = {
										["first"] = false,
										["elements"] = {
											["Default"] = {
												["exists"] = true,
											},
										},
									},
									["Raid"] = {
										["first"] = false,
										["elements"] = {
											["Default"] = {
												["exists"] = true,
												["position"] = 10.00001,
											},
										},
									},
									["Target of Target"] = {
										["first"] = false,
										["elements"] = {
											["Default"] = {
												["exists"] = true,
											},
										},
									},
									["Boss"] = {
										["first"] = false,
										["elements"] = {
											["Default"] = {
												["exists"] = true,
											},
										},
									},
								},
							},
						},
					},
					["ThreatBar"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["enabled"] = false,
									},
									["Player"] = {
										["enabled"] = false,
										["position"] = 4,
									},
									["Basic"] = {
										["enabled"] = false,
									},
								},
								["global"] = {
									["enabled"] = false,
								},
							},
						},
					},
					["LuaTexts"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Normal"] = {
										["first"] = false,
										["elements"] = {
											["Lua:Artifact power"] = {
												["events"] = {
													["ARTIFACT_XP_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ArtifactPowerBar",
											},
											["Lua:Experience"] = {
												["events"] = {
													["PLAYER_XP_UPDATE"] = true,
													["UNIT_PET_EXPERIENCE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Lua:Name"] = {
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
													["UNIT_NAME_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Lua:Threat"] = {
												["events"] = {
													["UNIT_THREAT_LIST_UPDATE"] = true,
													["UNIT_THREAT_SITUATION_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Lua:Reputation"] = {
												["events"] = {
													["UNIT_FACTION"] = true,
													["UPDATE_FACTION"] = true,
												},
												["exists"] = true,
												["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
											["Lua:Druid mana"] = {
												["events"] = {
													["UNIT_DISPLAYPOWER"] = true,
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
												["location"] = "center",
												["attach_to"] = "AltManaBar",
											},
											["Lua:Alternate power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "AltPowerBar",
											},
											["Lua:Cast"] = {
												["events"] = {
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Lua:Health"] = {
												["events"] = {
													["UNIT_HEALTH"] = true,
													["UNIT_MAXHEALTH"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
											["Lua:PVPTimer"] = {
												["exists"] = true,
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
												},
												["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
												["location"] = "out_right_top",
											},
											["Lua:Class"] = {
												["events"] = {
													["UNIT_LEVEL"] = true,
													["UNIT_CLASSIFICATION_CHANGED"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Lua:Cast time"] = {
												["events"] = {
													["UNIT_SPELLCAST_SUCCEEDED"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Lua:Power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
										},
									},
									["Player"] = {
										["first"] = false,
										["elements"] = {
											["Lua:Artifact power"] = {
												["events"] = {
													["ARTIFACT_XP_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ArtifactPowerBar",
											},
											["Lua:Experience"] = {
												["events"] = {
													["PLAYER_XP_UPDATE"] = true,
													["UNIT_PET_EXPERIENCE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Lua:Power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Lua:Threat"] = {
												["events"] = {
													["UNIT_THREAT_LIST_UPDATE"] = true,
													["UNIT_THREAT_SITUATION_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Lua:Name"] = {
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
													["UNIT_NAME_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Lua:Cast time"] = {
												["events"] = {
													["UNIT_SPELLCAST_SUCCEEDED"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Lua:PVPTimer"] = {
												["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
												["exists"] = true,
												["position"] = 1.00004,
												["location"] = "edge_top_right",
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
												},
											},
											["Lua:Cast"] = {
												["events"] = {
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Lua:Health"] = {
												["events"] = {
													["UNIT_HEALTH"] = true,
													["UNIT_MAXHEALTH"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
											["Lua:Alternate power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "AltPowerBar",
											},
											["Lua:Class"] = {
												["events"] = {
													["UNIT_LEVEL"] = true,
													["UNIT_CLASSIFICATION_CHANGED"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Lua:Druid mana"] = {
												["events"] = {
													["UNIT_DISPLAYPOWER"] = true,
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
												["location"] = "center",
												["attach_to"] = "AltManaBar",
											},
											["Lua:Reputation"] = {
												["events"] = {
													["UNIT_FACTION"] = true,
													["UPDATE_FACTION"] = true,
												},
												["exists"] = true,
												["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
										},
									},
									["Basic"] = {
										["first"] = false,
										["elements"] = {
											["Lua:Artifact power"] = {
												["events"] = {
													["ARTIFACT_XP_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ArtifactPowerBar",
											},
											["Lua:Reputation"] = {
												["events"] = {
													["UNIT_FACTION"] = true,
													["UPDATE_FACTION"] = true,
												},
												["exists"] = true,
												["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
											["Lua:Power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Lua:Threat"] = {
												["events"] = {
													["UNIT_THREAT_LIST_UPDATE"] = true,
													["UNIT_THREAT_SITUATION_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Lua:Experience"] = {
												["events"] = {
													["PLAYER_XP_UPDATE"] = true,
													["UNIT_PET_EXPERIENCE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Lua:Druid mana"] = {
												["events"] = {
													["UNIT_DISPLAYPOWER"] = true,
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
												["location"] = "center",
												["attach_to"] = "AltManaBar",
											},
											["Lua:Alternate power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "AltPowerBar",
											},
											["Lua:Cast time"] = {
												["events"] = {
													["UNIT_SPELLCAST_SUCCEEDED"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Lua:Health"] = {
												["enabled"] = false,
												["events"] = {
													["UNIT_HEALTH"] = true,
													["UNIT_MAXHEALTH"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
											["Lua:PVPTimer"] = {
												["exists"] = true,
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
												},
												["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
												["location"] = "out_right_top",
											},
											["Lua:Class"] = {
												["events"] = {
													["UNIT_LEVEL"] = true,
													["UNIT_CLASSIFICATION_CHANGED"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Lua:Cast"] = {
												["events"] = {
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Lua:Name"] = {
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
													["UNIT_NAME_UPDATE"] = true,
												},
												["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
												["location"] = "center",
												["exists"] = true,
												["attach_to"] = "HealthBar",
												["size"] = 1.8,
											},
										},
									},
									["Target"] = {
										["first"] = false,
										["elements"] = {
											["Lua:Artifact power"] = {
												["events"] = {
													["ARTIFACT_XP_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ArtifactPowerBar",
											},
											["Lua:Experience"] = {
												["events"] = {
													["PLAYER_XP_UPDATE"] = true,
													["UNIT_PET_EXPERIENCE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Lua:Power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Lua:Threat"] = {
												["events"] = {
													["UNIT_THREAT_LIST_UPDATE"] = true,
													["UNIT_THREAT_SITUATION_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Lua:Name"] = {
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
													["UNIT_NAME_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Lua:Cast time"] = {
												["events"] = {
													["UNIT_SPELLCAST_SUCCEEDED"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Lua:PVPTimer"] = {
												["exists"] = true,
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
												},
												["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
												["location"] = "out_right_top",
											},
											["Lua:Cast"] = {
												["events"] = {
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Lua:Health"] = {
												["events"] = {
													["UNIT_HEALTH"] = true,
													["UNIT_MAXHEALTH"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
											["Lua:Alternate power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "AltPowerBar",
											},
											["Lua:Class"] = {
												["events"] = {
													["UNIT_LEVEL"] = true,
													["UNIT_CLASSIFICATION_CHANGED"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Lua:Druid mana"] = {
												["events"] = {
													["UNIT_DISPLAYPOWER"] = true,
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
												["location"] = "center",
												["attach_to"] = "AltManaBar",
											},
											["Lua:Reputation"] = {
												["events"] = {
													["UNIT_FACTION"] = true,
													["UPDATE_FACTION"] = true,
												},
												["exists"] = true,
												["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
										},
									},
									["Raid"] = {
										["first"] = false,
										["elements"] = {
											["Lua:Artifact power"] = {
												["events"] = {
													["ARTIFACT_XP_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ArtifactPowerBar",
											},
											["Lua:Reputation"] = {
												["events"] = {
													["UNIT_FACTION"] = true,
													["UPDATE_FACTION"] = true,
												},
												["exists"] = true,
												["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
											["Lua:Name"] = {
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
													["UNIT_NAME_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
												["location"] = "left",
												["attach_to"] = "HealthBar",
											},
											["Lua:Threat"] = {
												["events"] = {
													["UNIT_THREAT_LIST_UPDATE"] = true,
													["UNIT_THREAT_SITUATION_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Lua:Power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Lua:Cast time"] = {
												["events"] = {
													["UNIT_SPELLCAST_SUCCEEDED"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Lua:PVPTimer"] = {
												["exists"] = true,
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
												},
												["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
												["location"] = "out_right_top",
											},
											["Lua:Cast"] = {
												["events"] = {
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Lua:Health"] = {
												["events"] = {
													["UNIT_HEALTH"] = true,
													["UNIT_MAXHEALTH"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
											["Lua:Alternate power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "AltPowerBar",
											},
											["Lua:Class"] = {
												["events"] = {
													["UNIT_LEVEL"] = true,
													["UNIT_CLASSIFICATION_CHANGED"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Lua:Druid mana"] = {
												["events"] = {
													["UNIT_DISPLAYPOWER"] = true,
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
												["location"] = "center",
												["attach_to"] = "AltManaBar",
											},
											["Lua:Experience"] = {
												["events"] = {
													["PLAYER_XP_UPDATE"] = true,
													["UNIT_PET_EXPERIENCE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
										},
									},
									["Target of Target"] = {
										["first"] = false,
										["elements"] = {
											["Lua:Artifact power"] = {
												["events"] = {
													["ARTIFACT_XP_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ArtifactPowerBar",
											},
											["Lua:Experience"] = {
												["events"] = {
													["PLAYER_XP_UPDATE"] = true,
													["UNIT_PET_EXPERIENCE"] = true,
												},
												["exists"] = true,
												["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Lua:Power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Lua:Threat"] = {
												["events"] = {
													["UNIT_THREAT_LIST_UPDATE"] = true,
													["UNIT_THREAT_SITUATION_UPDATE"] = true,
												},
												["exists"] = true,
												["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Lua:Name"] = {
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
													["UNIT_NAME_UPDATE"] = true,
												},
												["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
												["location"] = "center",
												["exists"] = true,
												["attach_to"] = "HealthBar",
												["size"] = 1.8,
											},
											["Lua:Cast time"] = {
												["events"] = {
													["UNIT_SPELLCAST_SUCCEEDED"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Lua:PVPTimer"] = {
												["exists"] = true,
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
												},
												["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
												["location"] = "out_right_top",
											},
											["Lua:Cast"] = {
												["events"] = {
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["exists"] = true,
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Lua:Health"] = {
												["enabled"] = false,
												["events"] = {
													["UNIT_HEALTH"] = true,
													["UNIT_MAXHEALTH"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
											["Lua:Alternate power"] = {
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "AltPowerBar",
											},
											["Lua:Class"] = {
												["events"] = {
													["UNIT_LEVEL"] = true,
													["UNIT_CLASSIFICATION_CHANGED"] = true,
													["UNIT_AURA"] = true,
												},
												["exists"] = true,
												["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Lua:Druid mana"] = {
												["events"] = {
													["UNIT_DISPLAYPOWER"] = true,
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["exists"] = true,
												["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
												["location"] = "center",
												["attach_to"] = "AltManaBar",
											},
											["Lua:Reputation"] = {
												["events"] = {
													["UNIT_FACTION"] = true,
													["UPDATE_FACTION"] = true,
												},
												["exists"] = true,
												["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
										},
									},
									["Boss"] = {
										["first"] = false,
										["elements"] = {
											["Lua:Artifact power"] = {
												["exists"] = true,
												["events"] = {
													["ARTIFACT_XP_UPDATE"] = true,
												},
												["code"] = "local cur,max,points = ArtifactPower()\nif max > 0 then\n  if points > 0 then\n    return \"%s/%s (%d)\",cur,max,points\n  end\n  return \"%s/%s\",cur,max\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ArtifactPowerBar",
											},
											["Lua:Experience"] = {
												["exists"] = true,
												["events"] = {
													["PLAYER_XP_UPDATE"] = true,
													["UNIT_PET_EXPERIENCE"] = true,
												},
												["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
												["location"] = "center",
												["attach_to"] = "ExperienceBar",
											},
											["Lua:Power"] = {
												["exists"] = true,
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
												["location"] = "right",
												["attach_to"] = "PowerBar",
											},
											["Lua:Threat"] = {
												["exists"] = true,
												["events"] = {
													["UNIT_THREAT_LIST_UPDATE"] = true,
													["UNIT_THREAT_SITUATION_UPDATE"] = true,
												},
												["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
												["location"] = "center",
												["attach_to"] = "ThreatBar",
											},
											["Lua:Name"] = {
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
													["UNIT_NAME_UPDATE"] = true,
												},
												["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
												["location"] = "center",
												["exists"] = true,
												["attach_to"] = "HealthBar",
												["size"] = 1.8,
											},
											["Lua:Cast"] = {
												["exists"] = true,
												["events"] = {
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
												["location"] = "left",
												["attach_to"] = "CastBar",
											},
											["Lua:PVPTimer"] = {
												["events"] = {
													["PLAYER_FLAGS_CHANGED"] = true,
												},
												["exists"] = true,
												["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
												["location"] = "out_right_top",
											},
											["Lua:Cast time"] = {
												["exists"] = true,
												["events"] = {
													["UNIT_SPELLCAST_SUCCEEDED"] = true,
													["UNIT_SPELLCAST_INTERRUPTED"] = true,
													["UNIT_SPELLCAST_CHANNEL_START"] = true,
													["UNIT_SPELLCAST_DELAYED"] = true,
													["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
													["UNIT_SPELLCAST_START"] = true,
													["UNIT_SPELLCAST_STOP"] = true,
													["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
													["UNIT_SPELLCAST_FAILED"] = true,
												},
												["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "CastBar",
											},
											["Lua:Health"] = {
												["enabled"] = false,
												["exists"] = true,
												["events"] = {
													["UNIT_HEALTH"] = true,
													["UNIT_MAXHEALTH"] = true,
													["UNIT_AURA"] = true,
												},
												["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
												["location"] = "right",
												["attach_to"] = "HealthBar",
											},
											["Lua:Alternate power"] = {
												["exists"] = true,
												["events"] = {
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
												["location"] = "right",
												["attach_to"] = "AltPowerBar",
											},
											["Lua:Class"] = {
												["exists"] = true,
												["events"] = {
													["UNIT_LEVEL"] = true,
													["UNIT_CLASSIFICATION_CHANGED"] = true,
													["UNIT_AURA"] = true,
												},
												["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
												["location"] = "left",
												["attach_to"] = "PowerBar",
											},
											["Lua:Druid mana"] = {
												["exists"] = true,
												["events"] = {
													["UNIT_DISPLAYPOWER"] = true,
													["UNIT_MAXPOWER"] = true,
													["UNIT_POWER_FREQUENT"] = true,
												},
												["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
												["location"] = "center",
												["attach_to"] = "AltManaBar",
											},
											["Lua:Reputation"] = {
												["exists"] = true,
												["events"] = {
													["UNIT_FACTION"] = true,
													["UPDATE_FACTION"] = true,
												},
												["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode()\nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
												["location"] = "center",
												["attach_to"] = "ReputationBar",
											},
										},
									},
								},
							},
						},
					},
					["ComboPoints"] = {
						["profiles"] = {
							["Junior"] = {
								["layouts"] = {
									["Boss"] = {
										["enabled"] = false,
									},
									["Basic"] = {
										["enabled"] = false,
									},
									["Target of Target"] = {
										["enabled"] = false,
									},
								},
							},
						},
					},
					["ArcaneCharges"] = {
					},
				},
				["profileKeys"] = {
				},
				["global"] = {
					["config_version"] = 3,
				},
				["profiles"] = {
					["Junior"] = {
						["class_order"] = {
							"WARRIOR", -- [1]
							"DEATHKNIGHT", -- [2]
							"PALADIN", -- [3]
							"MONK", -- [4]
							"PRIEST", -- [5]
							"SHAMAN", -- [6]
							"DRUID", -- [7]
							"ROGUE", -- [8]
							"MAGE", -- [9]
							"WARLOCK", -- [10]
							"HUNTER", -- [11]
							"DEMONHUNTER", -- [12]
						},
						["layouts"] = {
							["Normal"] = {
								["strata"] = "LOW",
								["exists"] = true,
								["bar_texture"] = "BantoBar",
							},
							["Player"] = {
								["strata"] = "LOW",
								["opacity_min"] = 0,
								["exists"] = true,
								["size_x"] = 250,
								["bar_texture"] = "BantoBar",
							},
							["Basic"] = {
								["strata"] = "LOW",
								["exists"] = true,
								["bar_texture"] = "BantoBar",
							},
							["Target"] = {
								["strata"] = "LOW",
								["exists"] = true,
								["size_x"] = 250,
								["bar_texture"] = "BantoBar",
							},
							["Raid"] = {
								["strata"] = "LOW",
								["exists"] = true,
								["bar_texture"] = "BantoBar",
							},
							["Target of Target"] = {
								["strata"] = "LOW",
								["exists"] = true,
								["bar_texture"] = "BantoBar",
							},
							["Boss"] = {
								["strata"] = "LOW",
								["exists"] = true,
								["bar_texture"] = "BantoBar",
							},
						},
						["made_units"] = true,
						["units"] = {
							["Player's pet's target"] = {
								["position_x"] = -882.395645141602,
								["unit"] = "pettarget",
								["position_y"] = -223.386077880859,
							},
							["Player's pet"] = {
								["scale"] = 0.5,
								["unit"] = "pet",
								["enabled"] = true,
								["layout"] = "Target of Target",
								["position_x"] = -325.704406738281,
								["position_y"] = -336.598205566406,
							},
							["Target's target's target"] = {
								["position_x"] = 559.153625488281,
								["unit"] = "targettargettarget",
								["position_y"] = -192.817810058594,
							},
							["Focus's target"] = {
								["scale"] = 0.5,
								["unit"] = "focustarget",
								["enabled"] = true,
								["layout"] = "Basic",
								["position_x"] = -555.800537109375,
								["position_y"] = -68.0118713378906,
							},
							["Focus's target's target"] = {
								["position_x"] = -524.412780761719,
								["unit"] = "focustargettarget",
								["position_y"] = 361.770263671875,
							},
							["Player"] = {
								["position_x"] = -140.69384765625,
								["unit"] = "player",
								["enabled"] = true,
								["layout"] = "Player",
								["position_y"] = -337.872985839844,
							},
							["Focus"] = {
								["scale"] = 0.5,
								["unit"] = "focus",
								["enabled"] = true,
								["layout"] = "Basic",
								["position_x"] = -541.925506591797,
								["position_y"] = -104.851287841797,
							},
							["Target"] = {
								["position_x"] = 140.390563964844,
								["unit"] = "target",
								["enabled"] = true,
								["layout"] = "Target",
								["position_y"] = -337.718322753906,
							},
							["Target's target"] = {
								["scale"] = 0.55,
								["unit"] = "targettarget",
								["enabled"] = true,
								["layout"] = "Target of Target",
								["position_x"] = 329.796637141456,
								["position_y"] = -338.076839769311,
							},
						},
						["lock_movement"] = true,
						["groups"] = {
							["Party"] = {
								["scale"] = 0.7,
								["position_x"] = -909.216007568237,
								["enabled"] = true,
								["layout"] = "Basic",
								["exists"] = true,
								["position_y"] = 276.399361190017,
							},
							["Party pets"] = {
								["position_x"] = -450.897094726563,
								["use_pet_header"] = false,
								["unit_group"] = "partypet",
								["exists"] = true,
								["position_y"] = 291.301940917969,
								["show_when"] = {
									["party"] = false,
								},
							},
							["Raid"] = {
								["vertical_spacing"] = 5,
								["scale"] = 0.5,
								["position_x"] = -967.762881278992,
								["enabled"] = true,
								["layout"] = "Basic",
								["unit_group"] = "raid",
								["exists"] = true,
								["position_y"] = 536.724060058594,
								["size_y"] = 0.5,
								["show_when"] = {
									["party"] = false,
									["raid40"] = true,
									["raid10"] = true,
									["raid25"] = true,
									["raid"] = true,
									["raid20"] = true,
									["raid15"] = true,
								},
							},
							["Arena"] = {
								["scale"] = 0.6,
								["position_x"] = 756.827065707299,
								["enabled"] = true,
								["layout"] = "Basic",
								["unit_group"] = "arena",
								["exists"] = true,
								["position_y"] = 251.615578512808,
								["show_when"] = {
									["raid40"] = true,
									["raid25"] = true,
									["raid10"] = true,
									["raid"] = true,
									["raid20"] = true,
									["raid15"] = true,
								},
							},
							["Boss"] = {
								["scale"] = 0.6,
								["position_x"] = 756.823843050911,
								["enabled"] = true,
								["layout"] = "Boss",
								["unit_group"] = "boss",
								["exists"] = true,
								["position_y"] = 251.615944723761,
								["show_when"] = {
									["raid40"] = true,
									["solo"] = true,
									["raid10"] = true,
									["raid25"] = true,
									["raid"] = true,
									["raid20"] = true,
									["raid15"] = true,
								},
							},
						},
						["made_groups"] = true,
					},
				},
			};

			PitBull4DB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ Prat ------------------------------
	if opt == "Prat-3.0" then
		if Prat3DB.profiles.Junior then
			Prat3DB.profileKeys[name .. " - " .. realm] = "Junior";
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
										["xOffset"] = 0.00260383773944245,
										["width"] = 547.093139648438,
										["height"] = 192.116500854492,
										["yOffset"] = 0.023149462634683,
									}, -- [1]
									{
										["point"] = "BOTTOMLEFT",
										["xOffset"] = 0.00260383773944245,
										["yOffset"] = 0.023149462634683,
										["height"] = 168.116516113281,
										["width"] = 547.093139648438,
									}, -- [2]
									{
										["point"] = "BOTTOMLEFT",
										["height"] = 192.116500854492,
										["yOffset"] = 0.023149462634683,
										["xOffset"] = 0.00260383773944245,
										["width"] = 547.093139648438,
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
					},
					["Prat_Editbox"] = {
						["profiles"] = {
							["Junior"] = {
								["attach"] = "TOP",
								["borderColor"] = {
									["b"] = 0,
									["g"] = 0,
									["r"] = 0,
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
									["whisperincome"] = "{W From}",
									["bnwhisperincome"] = "{W From}",
									["say"] = "{S}",
									["partyguide"] = "{DG}",
									["channel2"] = "{2}",
									["channel1"] = "{1}",
									["officer"] = "{O}",
								},
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
									["GROUP_LEAD"] = "None",
									["RAID"] = "None",
									["GUILD"] = "Chime",
									["WHISPER"] = "None",
									["BN_WHISPER"] = "Xylo",
									["OFFICER"] = "None",
									["PARTY"] = "None",
								},
								["on"] = true,
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
					["Prat_ChannelSticky"] = {
						["profiles"] = {
							["Junior"] = {
								["bn_conversation"] = false,
								["smartgroup"] = false,
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
					["Prat_History"] = {
						["profiles"] = {
							["Junior"] = {
								["chatlinesframes"] = {
									["ChatFrame5"] = true,
									["ChatFrame4"] = true,
									["ChatFrame1"] = true,
									["ChatFrame3"] = true,
								},
								["chatlines"] = 5000,
								["scrollbacklen"] = 500,
								["delaygmotd"] = false,
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
					["Prat_Timestamps"] = {
						["profiles"] = {
							["Junior"] = {
								["timestampcolor"] = {
									["r"] = 0.219607843137255,
									["g"] = 0.631372549019608,
									["b"] = 0.192156862745098,
								},
								["formatpre"] = "",
								["formatcode"] = "%I:%M",
								["formatpost"] = "",
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
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["modules"] = {
							["TellTarget"] = 1,
							["Alias"] = 1,
							["ChatTabs"] = 3,
							["Search"] = 1,
							["PopupMessage"] = 1,
							["AltNames"] = 1,
							["Paragraph"] = 1,
							["KeyBindings"] = 1,
							["Bubbles"] = 1,
							["CopyChat"] = 1,
							["ChatLog"] = 1,
							["OriginalButtons"] = 1,
						},
					},
				},
			};

			Prat3DB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ Scrap ------------------------------
	if opt == "Scrap" then
		Scrap_Safe = false
		Scrap_Learn = true
	end
	------------------------------ SexyMap ------------------------------
	if opt == "SexyMap" then
		if SexyMap2DB.global then
			SexyMap2DB[name .. "-" .. realm] = "global";
		else
			SexyMap2DB = {
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
						["y"] = -39.0409851074219,
						["x"] = -27.9358673095703,
						["lock"] = true,
						["scale"] = 1.42,
						["shape"] = "SPELLS\\T_VFX_BORDER",
						["rightClickToConfig"] = true,
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
					["buttons"] = {
						["lockDragging"] = false,
						["radius"] = 10,
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
							["QueueStatusMinimapButton"] = -14.8605489558136,
							["MiniMapTracking"] = 18.0711845378894,
							["GuildInstanceDifficulty"] = -31.5445051689238,
							["GarrisonLandingPageMinimapButton"] = 2.24409634459895,
						},
						["TEMP"] = true,
						["controlVisibility"] = true,
					},
				},
				["presets"] = {
				},
			};

			SexyMap2DB[name .. "-" .. realm] = "global";
		end
	end
	------------------------------ Skada ------------------------------
	if opt == "Skada" then
		if SkadaDB.profiles.Junior then
			SkadaDB.profileKeys[name .. " - " .. realm] = "Junior";
		else
			SkadaDB = {
				["namespaces"] = {
					["LibDualSpec-1.0"] = {
					},
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["modeclicks"] = {
							["Healing"] = 1,
						},
						["windows"] = {
							{
								["classicons"] = false,
								["barslocked"] = true,
								["y"] = 20.7526435852051,
								["x"] = -2.0465087890625,
								["title"] = {
									["color"] = {
										["a"] = 0.924419581890106,
										["b"] = 0.180392156862745,
										["g"] = 0.180392156862745,
										["r"] = 0.180392156862745,
									},
								},
								["background"] = {
									["height"] = 88.4571380615235,
								},
								["point"] = "BOTTOMRIGHT",
								["barfontsize"] = 18,
								["mode"] = "Damage",
								["barwidth"] = 272.746276855469,
								["name"] = "Damage",
							}, -- [1]
							{
								["titleset"] = true,
								["barheight"] = 18,
								["color"] = {
									["a"] = 0.6,
									["b"] = 0.3,
									["g"] = 0.3,
									["r"] = 0.3,
								},
								["issolidbackdrop"] = false,
								["classicons"] = false,
								["barslocked"] = true,
								["useframe"] = true,
								["clickthrough"] = false,
								["wipemode"] = "",
								["set"] = "current",
								["hidden"] = false,
								["y"] = 20.7529468536377,
								["barfont"] = "Accidental Presidency",
								["name"] = "Healing",
								["display"] = "bar",
								["barfontflags"] = "",
								["isusingelvuiskin"] = true,
								["strata"] = "LOW",
								["classcolortext"] = false,
								["isonnewline"] = false,
								["barbgcolor"] = {
									["a"] = 0.6,
									["b"] = 0.3,
									["g"] = 0.3,
									["r"] = 0.3,
								},
								["barcolor"] = {
									["a"] = 1,
									["b"] = 0.8,
									["g"] = 0.3,
									["r"] = 0.3,
								},
								["barfontsize"] = 18,
								["returnaftercombat"] = false,
								["height"] = 30,
								["title"] = {
									["textcolor"] = {
										["a"] = 1,
										["b"] = 0.9,
										["g"] = 0.9,
										["r"] = 0.9,
									},
									["color"] = {
										["a"] = 0.920000001788139,
										["b"] = 0.180392156862745,
										["g"] = 0.180392156862745,
										["r"] = 0.180392156862745,
									},
									["bordercolor"] = {
										["a"] = 1,
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
									["font"] = "Accidental Presidency",
									["fontsize"] = 13,
									["fontflags"] = "",
									["height"] = 20,
									["borderthickness"] = 2,
									["bordertexture"] = "None",
									["texture"] = "Armory",
								},
								["snapto"] = true,
								["roleicons"] = false,
								["barorientation"] = 1,
								["mode"] = "Healing",
								["version"] = 1,
								["enabletitle"] = true,
								["modeincombat"] = "",
								["textcolor"] = {
									["b"] = 0.9,
									["g"] = 0.9,
									["r"] = 0.9,
								},
								["bartexture"] = "BantoBar",
								["buttons"] = {
									["report"] = true,
									["menu"] = true,
									["mode"] = true,
									["segment"] = true,
									["reset"] = true,
								},
								["barwidth"] = 274.793090820313,
								["barspacing"] = 0,
								["reversegrowth"] = false,
								["width"] = 600,
								["fixedbarwidth"] = false,
								["scale"] = 1,
								["background"] = {
									["color"] = {
										["a"] = 0.4,
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
									["bordertexture"] = "Blizzard Party",
									["borderthickness"] = 1,
									["tile"] = false,
									["height"] = 88.4571075439453,
									["bordercolor"] = {
										["a"] = 1,
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
									["tilesize"] = 0,
									["texture"] = "Solid",
								},
								["classcolorbars"] = true,
								["isusingclasscolors"] = true,
								["showself"] = true,
								["x"] = -277.051025390625,
								["point"] = "BOTTOMRIGHT",
							}, -- [2]
						},
						["versions"] = {
							["1.6.3"] = true,
							["1.6.4"] = true,
						},
						["reset"] = {
							["instance"] = 2,
							["join"] = 2,
						},
					},
				},
			};

			SkadaDB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ Skinner ------------------------------
	if opt == "Skinner" then
		if SkinnerDB.profiles.Junior then
			SkinnerDB.profileKeys[name .. " - " .. realm] = "Junior";
		else
			SkinnerDB = {
				["namespaces"] = {
					["ViewPort"] = {
					},
					["MiddleFrames"] = {
						["profiles"] = {
							["Junior"] = {
								["mf1"] = {
									["height"] = 113,
									["xOfs"] = 0.121826171875,
									["yOfs"] = -488.758735656738,
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
						["Minimap"] = {
							["gloss"] = true,
							["skin"] = true,
						},
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
						["BackdropBorder"] = {
							["a"] = 0.600000023841858,
							["b"] = 0.231372549019608,
							["g"] = 0.231372549019608,
							["r"] = 0.231372549019608,
						},
						["Warnings"] = false,
						["Nameplates"] = false,
						["Delay"] = {
							["LoDs"] = 0,
							["Addons"] = 0,
							["Init"] = 0,
						},
						["MinimapButtons"] = {
							["skin"] = true,
						},
						["ChatTabsFade"] = false,
						["DisabledSkins"] = {
							["Dominos"] = true,
							["Skada"] = true,
							["SorhaQuestLog"] = true,
							["Bagnon"] = false,
							["Rematch"] = false,
						},
						["BdDefault"] = false,
						["BdBorderTexture"] = "None",
						["ChatTabs"] = true,
						["Errors"] = false,
						["Tooltips"] = {
							["style"] = 3,
						},
						["BdEdgeSize"] = 0,
						["ZoneAbility"] = false,
					},
				},
			};

			SkinnerDB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ SorhaQuestLog ------------------------------
	if opt == "SorhaQuestLog" then
		if SorhaQuestLogDB.profiles.Junior then
			SorhaQuestLogDB.profileKeys[name .. " - " .. realm] = "Junior";
		else
			SorhaQuestLogDB = {
				["namespaces"] = {
					["QuestTracker"] = {
						["char"] = {
						},
						["profiles"] = {
							["Junior"] = {
								["MinionWidth"] = 240,
								["Colours"] = {
									["HeaderColour"] = {
										["b"] = 0.764705882352941,
										["g"] = 0.52156862745098,
										["r"] = 0.266666666666667,
									},
									["ObjectiveTitleColour"] = {
										["b"] = 0.729411764705882,
										["g"] = 0.870588235294118,
										["r"] = 0.827450980392157,
									},
									["InfoColour"] = {
										["g"] = 0.741176470588235,
										["b"] = 0.372549019607843,
									},
									["Objective50PlusColour"] = {
										["b"] = 0.305882352941177,
										["g"] = 0.596078431372549,
										["r"] = 0.901960784313726,
									},
									["Objective00PlusColour"] = {
										["b"] = 0.0313725490196078,
										["r"] = 0.619607843137255,
									},
									["MinionBackGroundColour"] = {
										["a"] = 0.76264925301075,
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
									["Objective25PlusColour"] = {
										["b"] = 0.105882352941176,
										["g"] = 0.282352941176471,
										["r"] = 0.811764705882353,
									},
									["ObjectiveTooltipTextColour"] = {
										["b"] = 0.741176470588235,
										["g"] = 0.749019607843137,
										["r"] = 0.184313725490196,
									},
									["MinionBorderColour"] = {
										["a"] = 1,
										["r"] = 0,
										["g"] = 0,
										["b"] = 0,
									},
								},
								["MinionLocation"] = {
									["Y"] = 249.860198974609,
									["X"] = -20.1165676116943,
									["Point"] = "RIGHT",
									["RelativePoint"] = "RIGHT",
								},
								["sink20OutputSink"] = "None",
								["MinionLocked"] = true,
								["UseStatusBars"] = false,
								["MinionCollapseToLeft"] = true,
								["Notifications"] = {
									["DisableToasts"] = true,
								},
								["ClickBinds"] = {
									["AbandonQuest"] = "RIGHT_CLICK",
									["HideShowQuest"] = "LEFT_ALT_CTRL_CLICK",
								},
								["Fonts"] = {
									["QuestFontShadowed"] = false,
									["HeaderFontSize"] = 13,
									["MinionTitleFontSize"] = 13,
									["QuestFontSize"] = 13,
									["ObjectiveFontShadowed"] = false,
									["ObjectiveFontSize"] = 13,
									["MinionTitleFontShadowed"] = false,
									["HeaderFontShadowed"] = false,
								},
							},
						},
					},
					["AchievementTracker"] = {
						["profiles"] = {
							["Junior"] = {
								["MinionWidth"] = 240,
								["MinionLocked"] = true,
								["Fonts"] = {
									["AchievementTitleFontSize"] = 13,
									["MinionTitleFontSize"] = 13,
									["AchievementObjectiveFontSize"] = 13,
								},
								["PaddingAfterAchievement"] = 0,
								["AutoHideTitle"] = true,
								["MinionParent"] = "SQLRemoteQuestsMinionBottom",
								["MinionLocation"] = {
									["Y"] = 47.073169708252,
									["X"] = -139.173004150391,
								},
								["Colours"] = {
									["MinionBackGroundColour"] = {
										["a"] = 0.610000014305115,
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
								},
							},
						},
					},
					["RemoteQuestsTracker"] = {
						["profiles"] = {
							["Junior"] = {
								["MinionLocked"] = true,
								["Fonts"] = {
									["MinionTitleFontSize"] = 13,
								},
								["AutoHideTitle"] = true,
								["MinionLocation"] = {
									["Y"] = 116.659507751465,
									["X"] = -7.16335439682007,
								},
								["Colours"] = {
									["MinionBackGroundColour"] = {
										["a"] = 0.610000014305115,
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
									["MinionBorderColour"] = {
										["a"] = 0.83657568693161,
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
								},
								["MinionParent"] = "SQLQuestMinionBottom",
							},
						},
					},
					["ScenarioTracker"] = {
						["profiles"] = {
							["Junior"] = {
								["MinionLocked"] = true,
								["Fonts"] = {
									["ScenarioHeaderFontSize"] = 13,
									["ScenarioObjectiveFontSize"] = 13,
									["MinionTitleFontSize"] = 13,
									["ScenarioTaskFontSize"] = 13,
								},
								["AutoHideTitle"] = true,
								["MinionLocation"] = {
									["Y"] = 95.1695785522461,
									["X"] = -199.548583984375,
								},
								["Colours"] = {
									["MinionBackGroundColour"] = {
										["a"] = 0.610000014305115,
										["b"] = 0,
										["g"] = 0,
										["r"] = 0,
									},
								},
								["MinionParent"] = "SQLRemoteQuestsMinionBottom",
							},
						},
					},
				},
				["profileKeys"] = {
				},
				["profiles"] = {
					["Junior"] = {
						["StatusBarTexture"] = "Empty",
						["BackgroundTexture"] = "Skinner Inactive Tab",
						["BorderTexture"] = "Skinner Border",
						["AutoHide"] = {
							["OnBattleground"] = "Hide",
							["OnInstance"] = "Show",
							["OnEnterCombat"] = "Hide",
							["OnExitPetBattle"] = "Show",
							["OnLeaveCombat"] = "Show",
							["OnRaid"] = "Show",
							["OnArena"] = "Hide",
							["OnEnterPetBattle"] = "Hide",
						},
					},
				},
			};

			SorhaQuestLogDB.profileKeys[name .. " - " .. realm] = "Junior";
		end
	end
	------------------------------ TokenPrice ------------------------------
	if opt == "TokenPrice" then
		TokenPriceDB.global.showPercentChange = false;
	end
	------------------------------ WorldQuestGroupFinder ------------------------------
	if opt == "WorldQuestGroupFinder" then
		WorldQuestGroupFinderConfig = {
			["autoLeaveGroup"] = true,
			["hideLoginMessage"] = true,
			["autoAcceptInvites"] = true,
			["autoinvite"] = false,
		};
	end
end;

button:SetScript("OnClick", function(self, button)
	if button == "LeftButton" then

		for i, v in ipairs(addonList) do
			if IsAddOnLoaded(v) then
				CreateConfig(v);
			else
				print(v .. "not found, no configuration created for it.")
			end
		end
	
	print("Finished Settings Creation");
	print("Right-Click to Reload");

	elseif button == "RightButton" then
		m4xHideButton = true;
		ReloadUI();
	end
end);