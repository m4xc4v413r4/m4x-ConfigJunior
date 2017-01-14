local button = CreateFrame("Button", "m4xConfigButton", UIParent);
local texture = button:CreateTexture(nil, "BACKGROUND");

button:SetFrameStrata("HIGH");
button:SetPoint("CENTER");
button:SetWidth(352);
button:SetHeight(176);
button:RegisterForClicks("LeftButtonUp", "RightButtonUp");
button:RegisterEvent("ADDON_LOADED");

texture:SetPoint("CENTER");
texture:SetWidth(512);
texture:SetHeight(256);
texture:SetTexture("Interface\\AddOns\\m4x-ConfigJunior\\junior.tga");

button:SetScript("OnEvent", function(self, event, arg1)
	if m4xhidebutton == nil and arg1 == "m4x-ConfigJunior" then
		button:Show();
	elseif m4xhidebutton == true and arg1 == "m4x-ConfigJunior" then
		button:Hide();
		print("Type '/nui' to show the Nutties UI button");
	end
end);

SLASH_NUTTIESUI1 = "/nui";
SlashCmdList["NUTTIESUI"] = function()
	button:Show();
	m4xhidebutton = nil;
end

local name, _ = UnitName("player");
local realm = GetRealmName();

local function OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_CURSOR");
	GameTooltip:SetText("Nutties UI");
	GameTooltip:AddLine(" ");
	GameTooltip:AddLine(string.format("Create configuration for %s-%s", name, realm));
	GameTooltip:AddLine(" ");
	GameTooltip:AddLine("Instructions:");
	GameTooltip:AddLine("1. Left-Click to Create Junior's Settings");
	GameTooltip:AddLine("2. Right-Click to Reload and Apply those Settings");
	GameTooltip:Show();
end

local function OnLeave(self)
	GameTooltip:Hide();
end

button:SetScript("OnClick", function(self, button)
	if button == "LeftButton" then

---------------------------------------- AuraFrames ----------------------------------------
if AuraFramesDB.profiles.Junior then
	AuraFramesDB.profileKeys[name .. " - " .. realm] = "Junior";
else
	AuraFramesDB = {
		["namespaces"] = {
			["LibDualSpec-1.0"] = {
			},
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
				["HUNTER"] = {
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
				["PALADIN"] = {
				},
			},
			["InternalCooldowns"] = {
			},
		},
		["profileKeys"] = {
		},
		["profiles"] = {
			["Junior"] = {
				["DbVersion"] = 235,
				["Containers"] = {
					["PlayerBuffs"] = {
						["Type"] = "ButtonContainer",
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
							["MiniBarTexture"] = "Blizzard",
							["DurationColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Direction"] = "LEFTDOWN",
							["DurationSize"] = 10,
							["CooldownDrawEdge"] = true,
							["CountFont"] = "Friz Quadrata TT",
							["MiniBarOffsetY"] = -25,
							["CountMonochrome"] = false,
							["DurationPosX"] = 0,
							["HorizontalSize"] = 8,
							["CountSize"] = 10,
							["MiniBarOffsetX"] = 0,
							["DurationFont"] = "Friz Quadrata TT",
							["TooltipShowClassification"] = false,
							["DurationAlignment"] = "CENTER",
							["MiniBarStyle"] = "HORIZONTAL",
							["ButtonSizeY"] = 36,
							["TooltipShowPrefix"] = false,
							["ShowCooldown"] = false,
							["TooltipShowAuraId"] = true,
							["DurationLayout"] = "ABBREVSPACE",
							["CooldownReverse"] = false,
							["CountPosY"] = -6,
							["ShowBorder"] = "DEBUFF",
							["ShowCount"] = true,
							["VerticalSize"] = 2,
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
							["ShowDuration"] = true,
						},
						["Id"] = "PlayerBuffs",
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
					},
					["PlayerDebuffs"] = {
						["Type"] = "ButtonContainer",
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
							["MiniBarTexture"] = "Blizzard",
							["DurationColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Direction"] = "LEFTDOWN",
							["DurationSize"] = 10,
							["CooldownDrawEdge"] = true,
							["CountFont"] = "Friz Quadrata TT",
							["MiniBarOffsetY"] = -25,
							["CountMonochrome"] = false,
							["DurationPosX"] = 0,
							["HorizontalSize"] = 8,
							["CountSize"] = 10,
							["MiniBarOffsetX"] = 0,
							["DurationFont"] = "Friz Quadrata TT",
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
							["VerticalSize"] = 2,
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
							["ShowDuration"] = true,
						},
						["Id"] = "PlayerDebuffs",
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
							},
							["Expert"] = false,
						},
						["Location"] = {
							["OffsetX"] = -242.853454589844,
							["OffsetY"] = -115.710105895996,
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
							["ShowDuration"] = true,
							["DurationColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["Direction"] = "RIGHTDOWN",
							["DurationSize"] = 12,
							["CountPosX"] = 10,
							["MiniBarColor"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["MiniBarOffsetY"] = -25,
							["DynamicSize"] = false,
							["MiniBarOffsetX"] = 0,
							["SpaceX"] = 0,
							["CountSize"] = 10,
							["MiniBarWidth"] = 8,
							["Scale"] = 1,
							["TooltipShowClassification"] = false,
							["VerticalSize"] = 1,
							["ShowCount"] = true,
							["ButtonSizeY"] = 36,
							["DurationAlignment"] = "CENTER",
							["ShowBorder"] = "DEBUFF",
							["CountPosY"] = -6,
							["DurationLayout"] = "ABBREVSPACE",
							["CooldownReverse"] = false,
							["TooltipShowAuraId"] = false,
							["ShowCooldown"] = false,
							["MiniBarStyle"] = "HORIZONTAL",
							["TooltipShowPrefix"] = false,
							["CooldownDisableOmniCC"] = true,
							["DurationPosX"] = 0,
							["TooltipShowCaster"] = true,
							["MiniBarEnabled"] = false,
							["CountMonochrome"] = false,
							["CooldownDrawEdge"] = true,
							["CountFont"] = "Friz Quadrata TT",
						},
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
								{
									{
										["Operator"] = "Equal",
										["Subject"] = "SpellId",
										["Args"] = {
											["SpellId"] = "32216",
										},
									}, -- [1]
								}, -- [1]
								{
									{
										["Operator"] = "Equal",
										["Subject"] = "SpellId",
										["Args"] = {
											["SpellId"] = "122510",
										},
									}, -- [1]
								}, -- [2]
								{
									{
										["Operator"] = "Equal",
										["Subject"] = "SpellId",
										["Args"] = {
											["SpellId"] = "190456",
										},
									}, -- [1]
								}, -- [3]
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
					},
				},
			},
		},
	};

	AuraFramesDB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- BagSync ----------------------------------------
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
	}

---------------------------------------- Bazooka ----------------------------------------
if BazookaDB.profiles.Junior then
	BazookaDB.profileKeys[name .. " - " .. realm] = "Junior";
else
	BazookaDB = {
		["namespaces"] = {
			["LibDualSpec-1.0"] = {
			},
		},
		["profileKeys"] = {

		},
		["global"] = {
			["enableOpacityWorkaround"] = true,
		},
		["profiles"] = {
			["Junior"] = {
				["numBars"] = 3,
				["plugins"] = {
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
							["bar"] = 2,
							["pos"] = 20,
						},
						["Artifact"] = {
							["stripColors"] = false,
							["showIcon"] = false,
							["area"] = "cleft",
							["alignment"] = "LEFT",
							["showSuffix"] = true,
							["showValue"] = false,
							["pos"] = 1,
						},
						["Memory usage"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 13,
						},
						["Reputation"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 13,
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
							["bar"] = 3,
							["pos"] = 7,
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
							["bar"] = 2,
							["pos"] = 33,
						},
						["WoWToken"] = {
							["area"] = "left",
							["bar"] = 3,
							["pos"] = 20,
						},
						["SorhaQuestLog"] = {
							["enabled"] = false,
							["pos"] = 1,
						},
						["iMoney"] = {
							["area"] = "left",
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 25,
						},
						["WorldQuests"] = {
							["showIcon"] = false,
							["area"] = "left",
							["enabled"] = false,
							["pos"] = 1,
						},
						["Speed"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 31,
						},
						["Traffic"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 29,
						},
						["O Item Level"] = {
							["area"] = "center",
							["bar"] = 2,
							["pos"] = 1,
						},
						["FPS"] = {
							["area"] = "left",
							["bar"] = 2,
							["pos"] = 34,
						},
						["GPS"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 34,
						},
						["LDB_WhisperPop"] = {
							["pos"] = 23,
						},
						["Memory"] = {
							["manualTooltip"] = false,
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 1,
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
							["bar"] = 3,
							["pos"] = 29,
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
							["bar"] = 2,
							["pos"] = 20,
						},
						["Broker_GarrisonBuilding"] = {
							["enabled"] = false,
							["pos"] = 21,
						},
						["Achievements"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 9,
						},
						["Gold"] = {
							["useLabelAsTitle"] = false,
							["area"] = "left",
							["alignment"] = "LEFT",
							["bar"] = 2,
							["pos"] = 28,
						},
						["Surprise"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 12,
						},
						["Broker Currency"] = {
							["pos"] = 11,
						},
						["Details"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 4,
						},
						["Broker_MicroMenu"] = {
							["area"] = "left",
							["pos"] = 3,
						},
						["Follower"] = {
							["enabled"] = false,
							["pos"] = 40,
						},
						["XP"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 43,
						},
						["Equipment"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 44,
						},
						["DetailsStreamer"] = {
							["enabled"] = false,
							["bar"] = 3,
							["pos"] = 6,
						},
						["Archaeology"] = {
							["enabled"] = false,
							["pos"] = 14,
						},
						["IDs"] = {
							["enabled"] = false,
							["pos"] = 15,
						},
						["Increasing rate"] = {
							["enabled"] = false,
							["pos"] = 18,
						},
						["Quest Log"] = {
							["pos"] = 17,
						},
						["Tracking"] = {
							["enabled"] = false,
							["bar"] = 4,
							["pos"] = 18,
						},
						["Class Hall"] = {
							["enabled"] = false,
							["bar"] = 4,
							["pos"] = 28,
						},
						["Broker_GotMail"] = {
							["enabled"] = false,
							["pos"] = 24,
						},
						["Skada"] = {
							["enabled"] = false,
							["pos"] = 1,
						},
						["Mail"] = {
							["bar"] = 3,
							["pos"] = 26,
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
							["bar"] = 2,
							["pos"] = 22,
						},
						["BrokerMemory"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 18,
						},
						["Tanaan Jungle Dailies"] = {
							["enabled"] = false,
							["pos"] = 8,
						},
						["Framerate"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 11,
						},
						["GuildLog"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 25,
						},
						["Clock"] = {
							["enabled"] = false,
							["pos"] = 27,
						},
						["iMail"] = {
							["bar"] = 3,
							["pos"] = 21,
						},
						["ChatChannels"] = {
							["enabled"] = false,
							["pos"] = 39,
						},
						["iFriends"] = {
							["bar"] = 4,
							["pos"] = 19,
						},
						["Missions"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 37,
						},
						["Artifact Power"] = {
							["enabled"] = false,
							["bar"] = 4,
							["pos"] = 2,
						},
						["ClassSpecs"] = {
							["enabled"] = false,
							["pos"] = 23,
						},
						["Game Menu"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 24,
						},
						["Guild"] = {
							["pos"] = 5,
						},
						["IncentiveProgram"] = {
							["area"] = "left",
							["pos"] = 7,
						},
						["GC-Missions"] = {
							["pos"] = 18,
						},
						["Volume"] = {
							["enabled"] = false,
							["pos"] = 11,
						},
						["Garrison"] = {
							["enabled"] = false,
							["bar"] = 2,
							["pos"] = 32,
						},
						["System"] = {
							["bar"] = 4,
							["pos"] = 1,
						},
						["iGuild"] = {
							["bar"] = 4,
							["pos"] = 22,
						},
						["CurrencyTracking"] = {
							["showIcon"] = false,
							["showValue"] = false,
							["stripColors"] = false,
							["pos"] = 21,
						},
						["Artifact weapon"] = {
							["area"] = "left",
							["enabled"] = false,
						},
						["Friends"] = {
							["enabled"] = false,
							["pos"] = 30,
						},
						["Professions"] = {
							["enabled"] = false,
							["pos"] = 41,
						},
						["GC-WorkOrders"] = {
							["pos"] = 36,
						},
						["Stuff"] = {
							["enabled"] = false,
							["showText"] = false,
							["pos"] = 35,
						},
						["Durability"] = {
							["enabled"] = false,
							["pos"] = 3,
						},
					},
					["launcher"] = {
						["PitBull4"] = {
							["area"] = "right",
							["bar"] = 3,
							["pos"] = 1,
						},
						["AutoRoll"] = {
							["area"] = "right",
							["bar"] = 3,
							["pos"] = 3,
						},
						["Rematch"] = {
							["area"] = "right",
							["bar"] = 3,
							["pos"] = 5,
						},
						["Dominos"] = {
							["area"] = "right",
							["bar"] = 3,
							["pos"] = 2,
						},
						["Bazooka"] = {
							["enabled"] = false,
						},
						["SavedInstances"] = {
							["area"] = "right",
							["bar"] = 3,
							["pos"] = 4,
						},
						["Prat"] = {
							["enabled"] = false,
							["pos"] = 6,
						},
						["ChatAlerts"] = {
							["enabled"] = false,
							["pos"] = 7,
						},
						["MinimapButtonFrame"] = {
							["enabled"] = false,
							["pos"] = 5,
						},
						["Skinner"] = {
							["pos"] = 5,
						},
						["Masque"] = {
							["enabled"] = false,
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
							["b"] = 0.0823529411764706,
							["g"] = 0.0823529411764706,
							["r"] = 0.0823529411764706,
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
							["b"] = 0.0823529411764706,
							["g"] = 0.0823529411764706,
							["r"] = 0.0823529411764706,
						},
					}, -- [2]
					{
						["fadeAlpha"] = 0,
						["bgInset"] = 4,
						["y"] = 0.142159909009933,
						["relPoint"] = "TOPRIGHT",
						["frameWidth"] = 360,
						["pos"] = 0,
						["x"] = 0.00967439822852612,
						["point"] = "TOPRIGHT",
						["bgColor"] = {
							["b"] = 0.0823529411764706,
							["g"] = 0.0823529411764706,
							["r"] = 0.0823529411764706,
						},
						["frameHeight"] = 20.0000038146973,
						["fontSize"] = 16,
					}, -- [3]
				},
			},
		},
	}

	BazookaDB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- Broker_MicroMenu ----------------------------------------
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
}

	Broker_MicroMenuDB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- ConfirmSP ----------------------------------------
if ConfirmSP.profiles.Junior then
	ConfirmSP.profileKeys[name .. " - " .. realm] = "Junior";
else
	ConfirmSP = {
		["profileKeys"] = {
		},
		["profiles"] = {
			["Junior"] = {
				["popups"] = {
					["ORDER_HALL_TALENT_RESEARCH"] = true,
					["RECOVER_CORPSE"] = true,
					["CONFIRM_PURCHASE_NONREFUNDABLE_ITEM"] = true,
					["CONFIRM_MAIL_ITEM_UNREFUNDABLE"] = true,
					["SPELL_CONFIRMATION_PROMPT"] = true,
					["CONFIRM_FOLLOWER_EQUIPMENT"] = true,
					["GOSSIP_CONFIRM"] = false,
					["REPLACE_ENCHANT"] = true,
					["TRANSMOG_APPLY_WARNING"] = true,
					["CONFIRM_RELIC_REPLACE"] = true,
					["DELETE_QUEST_ITEM"] = true,
					["RESURRECT_NO_TIMER"] = true,
					["DELETE_ITEM"] = true,
					["CONFIM_BEFORE_USE"] = true,
					["CONFIRM_BINDER"] = true,
					["SEND_MONEY"] = true,
					["BUYEMALL_CONFIRM"] = true,
					["CONFIRM_HIGH_COST_ITEM"] = true,
					["DELETE_GOOD_ITEM"] = true,
				},
				["version"] = "01-38 2016-10-30",
				["verbose"] = false,
			},
		},
	}

	ConfirmSP.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- CurrencyTracking ----------------------------------------
	CurrencyTrackingDB[realm][name]["options"]["show_currency"] = false;

---------------------------------------- DBM ----------------------------------------
	DBM_AllSavedOptions.Default.WarningPoint = "TOP";
	DBM_AllSavedOptions.Default.WarningX = 0;
	DBM_AllSavedOptions.Default.WarningY = -105.8515625;
	DBT_AllPersistentOptions.Default.DBM.TimerPoint = "RIGHT";
	DBT_AllPersistentOptions.Default.DBM.TimerX = -412.503204345703;
	DBT_AllPersistentOptions.Default.DBM.TimerY = 179.0244140625;
	DBT_AllPersistentOptions.Default.DBM.HugeTimerPoint = "LEFT";
	DBT_AllPersistentOptions.Default.DBM.HugeTimerX = 457.091339111328;
	DBT_AllPersistentOptions.Default.DBM.HugeTimerY = 179.328506469727;

---------------------------------------- Dominos ----------------------------------------
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
							["MAGE"] = {
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
						["numButtons"] = 12,
					}, -- [1]
					{
						["showInPetBattleUI"] = false,
						["point"] = "TOPLEFT",
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["padW"] = 2,
						["x"] = 37,
						["spacing"] = 4,
						["anchor"] = "8TC",
						["padH"] = 2,
						["numButtons"] = 12,
						["pages"] = {
							["DEATHKNIGHT"] = {
							},
							["WARRIOR"] = {
							},
							["MAGE"] = {
							},
							["HUNTER"] = {
							},
						},
					}, -- [2]
					{
						["showInPetBattleUI"] = false,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["anchor"] = "5TR",
						["padW"] = 2,
						["x"] = -56,
						["pages"] = {
							["DEATHKNIGHT"] = {
							},
							["WARRIOR"] = {
								["page2"] = 2,
							},
							["MAGE"] = {
							},
							["HUNTER"] = {
							},
						},
						["spacing"] = 0,
						["padH"] = 2,
						["y"] = 163,
						["numButtons"] = 12,
						["alpha"] = 0.9,
					}, -- [3]
					{
						["showInPetBattleUI"] = false,
						["point"] = "TOPLEFT",
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["padW"] = 2,
						["x"] = 37,
						["spacing"] = 4,
						["anchor"] = "encounterTL",
						["padH"] = 2,
						["numButtons"] = 12,
						["pages"] = {
							["DEATHKNIGHT"] = {
							},
							["WARRIOR"] = {
							},
							["MAGE"] = {
							},
							["HUNTER"] = {
							},
						},
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
							["MAGE"] = {
							},
							["HUNTER"] = {
							},
						},
						["numButtons"] = 12,
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
							["MAGE"] = {
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
						["x"] = 21,
						["spacing"] = 4,
						["anchor"] = "10TL",
						["padH"] = 2,
						["numButtons"] = 12,
						["pages"] = {
							["DEATHKNIGHT"] = {
							},
							["WARRIOR"] = {
							},
							["MAGE"] = {
							},
							["HUNTER"] = {
							},
						},
					}, -- [7]
					{
						["showInPetBattleUI"] = false,
						["point"] = "TOPLEFT",
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["padW"] = 2,
						["x"] = 21,
						["spacing"] = 4,
						["anchor"] = "10TR",
						["pages"] = {
							["DEATHKNIGHT"] = {
							},
							["WARRIOR"] = {
							},
							["MAGE"] = {
							},
							["HUNTER"] = {
							},
						},
						["numButtons"] = 12,
						["padH"] = 2,
					}, -- [8]
					{
						["showInPetBattleUI"] = false,
						["point"] = "TOPLEFT",
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["padW"] = 2,
						["x"] = 37,
						["spacing"] = 4,
						["anchor"] = "encounterTL",
						["padH"] = 2,
						["numButtons"] = 12,
						["pages"] = {
							["DEATHKNIGHT"] = {
							},
							["WARRIOR"] = {
							},
							["MAGE"] = {
							},
							["HUNTER"] = {
							},
						},
					}, -- [9]
					{
						["showInPetBattleUI"] = false,
						["point"] = "TOPLEFT",
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["padW"] = 2,
						["x"] = 23,
						["spacing"] = 4,
						["padH"] = 2,
						["numButtons"] = 12,
						["pages"] = {
							["DEATHKNIGHT"] = {
							},
							["WARRIOR"] = {
							},
							["MAGE"] = {
							},
							["HUNTER"] = {
							},
						},
					}, -- [10]
					["artifact"] = {
						["point"] = "TOPLEFT",
						["scale"] = 1,
						["lockMode"] = true,
						["padW"] = 2,
						["spacing"] = 1,
						["anchor"] = "2TL",
						["mode"] = "artifact",
						["numButtons"] = 20,
						["texture"] = "blizzard",
						["showInPetBattleUI"] = false,
						["columns"] = 20,
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["width"] = 1024,
						["font"] = "Friz Quadrata TT",
						["display"] = {
							["value"] = true,
							["bonus"] = true,
							["max"] = true,
							["label"] = true,
						},
						["height"] = 12,
						["alwaysShowText"] = true,
						["x"] = 37,
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
						["mode"] = "xp",
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
						["x"] = 345,
						["point"] = "TOPLEFT",
						["spacing"] = 2,
						["anchor"] = "2BR",
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["y"] = -40,
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
						["point"] = "TOPLEFT",
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["padW"] = 1,
						["font"] = "Friz Quadrata TT",
						["padH"] = 1,
						["display"] = {
							["icon"] = false,
							["border"] = true,
							["time"] = true,
						},
						["texture"] = "blizzard",
					},
					["menu"] = {
						["showInPetBattleUI"] = false,
						["point"] = "TOPLEFT",
						["scale"] = 1,
						["showInOverrideUI"] = false,
						["hidden"] = true,
						["y"] = -98,
						["fadeAlpha"] = 0,
						["spacing"] = 0,
						["anchor"] = "encounterTR",
					},
					["alerts"] = {
						["showInPetBattleUI"] = true,
						["point"] = "TOPLEFT",
						["columns"] = 1,
						["spacing"] = 2,
						["showInOverrideUI"] = true,
						["hidden"] = true,
						["alpha"] = 0.9,
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
						["point"] = "TOPLEFT",
						["spacing"] = 2,
						["showInOverrideUI"] = true,
						["hidden"] = true,
						["columns"] = 1,
					},
					["encounter"] = {
						["showInPetBattleUI"] = true,
						["x"] = 87,
						["point"] = "TOPLEFT",
						["showInOverrideUI"] = true,
						["hidden"] = true,
						["y"] = -135,
					},
				},
				["showgrid"] = true,
				["possessBar"] = 10,
			},
		},
	}
	DominosVersion = "7.1.4"

	DominosDB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- IncentiveProgram ----------------------------------------
	IncentiveProgramDB.settings.hideAlways = true;

---------------------------------------- KuiNamePlates ----------------------------------------

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

---------------------------------------- LeatrixPlus ----------------------------------------
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
		["NoDuelRequests"] = "On",
		["StaticCoords"] = "Off",
		["AhExtras"] = "Off",
		["CoordsR"] = "TOPRIGHT",
		["NoMissionAlerts"] = "On",
		["QuestFontChange"] = "Off",
		["NoRaidRestrictions"] = "Off",
		["TipOffsetX"] = -4.99108982086182,
		["MusicZone"] = "World of Warcraft",
		["CooldownsOnPlayer"] = "Off",
		["AccountLootAtMouse"] = "On",
		["HideCleanupBtns"] = "Off",
		["ManageTradeGuild"] = "Off",
		["NoGuildInvites"] = "On",
		["NoPetAutomation"] = "Off",
		["BuffFrameScale"] = 1,
		["AutoRepairGuildFunds"] = "Off",
		["NoAutoResInCombat"] = "Off",
		["BuffFrameA"] = "TOPRIGHT",
		["AutoRelTolBarad"] = "On",
		["NoClassBar"] = "Off",
		["AccountAutoSelfCast"] = "On",
		["AutoSkipGossip"] = "On",
		["MaxCameraZoom"] = "On",
		["MainPanelX"] = 0,
		["MusicPanelA"] = "CENTER",
		["NoMapEmote"] = "Off",
		["ShowRaidToggle"] = "Off",
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
		["LeaPlusScaleValue"] = 1,
		["BlockBnetReq"] = "On",
		["ShowSpellIcons"] = "Off",
		["AutoRelBGs"] = "On",
		["NoAchieveAlerts"] = "On",
		["ShowSpellTips"] = "On",
		["AccountLossOfControl"] = "On",
		["ActionFocusOn"] = "Off",
		["SelectCompletedQuests"] = "On",
		["StaticCoordsLock"] = "Off",
		["ViewPortAlpha"] = 0,
		["AcceptPremades"] = "On",
		["ColorLocalChannels"] = "On",
		["ActionCamOn"] = "Off",
		["ManageBnetReq"] = "Off",
		["NoProfessionAlerts"] = "On",
		["CoordsX"] = -40.9997787475586,
		["CombatPlates"] = "Off",
		["SelectAvailableQuests"] = "On",
		["NoCommandBar"] = "On",
		["UnclampChat"] = "Off",
		["AutoRepairSummary"] = "On",
		["NoBagAutomation"] = "Off",
		["FadeMap"] = "Off",
		["HideMinimapZone"] = "Off",
		["ClassColFrames"] = "Off",
		["ShowMapMod"] = "On",
		["NoStickyChat"] = "Off",
		["MusicPanelR"] = "CENTER",
		["LeaPlusMailFontSize"] = 22,
		["AutoSelectQuests"] = "On",
		["NoSoundRested"] = "On",
		["NoConfirmLoot"] = "On",
		["NoFriendRequests"] = "Off",
		["HideCraftedNames"] = "Off",
		["MusicPanelY"] = 0,
		["ShowVolumeInFrame"] = "Off",
		["WorldMapCoords"] = "On",
		["DurabilityStatus"] = "Off",
		["NoChatButtons"] = "Off",
		["LockoutSharing"] = "Off",
		["ResThankYouEmote"] = "On",
		["ViewPortRight"] = 0,
		["TipShowRank"] = "Off",
		["AutomateGossip"] = "On",
		["PlusPanelAlpha"] = 0,
		["HideSubzoneText"] = "Off",
		["MoveChatEditBoxToTop"] = "Off",
		["PlayerChainMenu"] = 2,
		["RevealWorldMap"] = "On",
		["ViewPortEnable"] = "Off",
		["AutoAcceptRes"] = "On",
		["ShowVolume"] = "Off",
		["ViewPortResize"] = "Off",
		["ShowImportantErrors"] = "On",
		["SkipCinematics"] = "Off",
		["StaticCoordsTop"] = "Off",
		["ViewportResize"] = "Off",
		["HideMinimapTime"] = "Off",
		["SellJunkListing"] = "Off",
		["AutoAcceptSummon"] = "Off",
		["ShowQuestUpdates"] = "On",
		["AutoTurnInQuests"] = "On",
		["ShowPetSaveBtn"] = "Off",
		["CoordsA"] = "TOPRIGHT",
		["NoCombatLogTab"] = "Off",
		["ClassColTarget"] = "On",
		["ShowCooldowns"] = "Off",
		["MaxChatHstory"] = "On",
		["MailFontChange"] = "Off",
		["AutoRelWintergrasp"] = "On",
		["MinimapMod"] = "Off",
		["MainPanelA"] = "CENTER",
		["NoCharControls"] = "Off",
		["AutoConfirmRole"] = "On",
		["MinimapIconPos"] = -19.3443330500883,
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
		["ViewPortLeft"] = 0,
		["AccountWideOptions"] = "Off",
		["AutoEnName"] = "Off",
		["NoGarrisonAlerts"] = "On",
		["HideTalkingFrame"] = "Off",
		["TipOffsetY"] = 198.112609863281,
		["AutomateQuests"] = "On",
		["AutoAcceptDailys"] = "On",
		["AutoEnTotems"] = "On",
		["HideErrorFrameText"] = "On",
		["HideLevelUpDisplay"] = "Off",
		["SpellOnPlayer"] = "Off",
		["LeaPlusTipSize"] = 1.15,
		["PlusPanelScale"] = 1,
		["HideBossBanner"] = "Off",
		["ShowStartTag"] = "Off",
		["ActionHeadMove"] = "Off",
		["ManageRestedEmotes"] = "Off",
		["StaticCoordsBack"] = "Off",
		["AutoEnClassCol"] = "Off",
		["MainPanelY"] = 0,
		["AutoReleasePvP"] = "On",
		["ShowCooldownID"] = "On",
		["NoHitIndicators"] = "Off",
		["LeaPlusAlphaValue"] = 1,
		["ShowVanityButtons"] = "On",
		["Manageclasscolors"] = "Off",
		["AccountBlockGuildInvs"] = "On",
		["CoordsY"] = -199.200012207031,
		["FasterLooting"] = "On",
		["CooldownTips"] = "On",
		["ActionCamEnable"] = "Off",
		["AutoEnGuardians"] = "On",
		["MusicPanelX"] = 0,
	};

---------------------------------------- Masque ----------------------------------------
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
					["Dominos_Action Bar"] = {
						["Backdrop"] = true,
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
					},
					["Kaliel's Tracker"] = {
						["Backdrop"] = true,
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
					},
					["Kaliel's Tracker_Active Button"] = {
						["Backdrop"] = true,
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
					},
					["Dominos"] = {
						["Backdrop"] = true,
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
					["Dominos_Bag Bar"] = {
						["Backdrop"] = true,
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
					["Dominos_Extra Bar"] = {
						["Backdrop"] = true,
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
					},
					["Kaliel's Tracker_Quest Item Button"] = {
						["Backdrop"] = true,
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
					["Dominos_Pet Bar"] = {
						["Backdrop"] = true,
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
					},
				},
			},
		},
	}

	MasqueDB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- MoveAnything ----------------------------------------
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
					["DurabilityFrame"] = {
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
						["name"] = "TalkingHeadFrame",
						["scale"] = 0.538603657268611,
						["pos"] = {
							"BOTTOM", -- [1]
							"UIParent", -- [2]
							"BOTTOM", -- [3]
							966.134744571612, -- [4]
							1386.3994140625, -- [5]
						},
					},
					["BonusRollLootWonFrame"] = {
						["name"] = "BonusRollLootWonFrame",
						["pos"] = {
							"TOP", -- [1]
							"UIParent", -- [2]
							"TOP", -- [3]
							5.99090576171875, -- [4]
							-725.733062744141, -- [5]
						},
					},
					["BonusRollFrame"] = {
						["name"] = "BonusRollFrame",
						["pos"] = {
							"TOP", -- [1]
							"UIParent", -- [2]
							"TOP", -- [3]
							8.94412231445313, -- [4]
							-733.452758789063, -- [5]
						},
					},
					["TooltipMover"] = {
						["name"] = "TooltipMover",
						["scale"] = 1.30699971516927,
						["pos"] = {
							"TOP", -- [1]
							"UIParent", -- [2]
							"TOP", -- [3]
							669.04090693066, -- [4]
							-584.870682843266, -- [5]
						},
					},
					["MainMenuBarVehicleLeaveButton"] = {
						["name"] = "MainMenuBarVehicleLeaveButton",
						["pos"] = {
							"TOPLEFT", -- [1]
							"UIParent", -- [2]
							"TOPLEFT", -- [3]
							1733.79052734375, -- [4]
							-219.023132324219, -- [5]
						},
					},
					["ZoneAbilityFrame"] = {
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
						["name"] = "BagsMover",
						["scale"] = 1.16373215970857,
						["pos"] = {
							"BOTTOMRIGHT", -- [1]
							"UIParent", -- [2]
							"BOTTOMRIGHT", -- [3]
							-16.7076705218223, -- [4]
							128.459259033203, -- [5]
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
						["name"] = "OverrideActionBarExpBar",
						["pos"] = {
							"TOP", -- [1]
							"OverrideActionBarBG", -- [2]
							"TOP", -- [3]
							-6.1035156250e-005, -- [4]
							27.0000076293945, -- [5]
						},
					},
					["VehicleSeatIndicator"] = {
						["name"] = "VehicleSeatIndicator",
						["pos"] = {
							"TOPRIGHT", -- [1]
							"MinimapCluster", -- [2]
							"BOTTOMRIGHT", -- [3]
							-240.060791015625, -- [4]
							51.16650390625, -- [5]
						},
					},
				},
			},
		},
		["frameListRows"] = 18,
		["noBags"] = false,
		["playSound"] = false,
		["closeGUIOnEscape"] = false,
	}

	MADB["characters"][realm .. " " .. name] = {["profile"] = "Junior"};
end

---------------------------------------- PitBull4 ----------------------------------------
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
							["Target of Target"] = {
								["enabled"] = false,
								["position"] = 1.00001,
							},
							["Basic"] = {
								["enabled"] = false,
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
			["Aggro"] = {
			},
			["SoulShards"] = {
			},
			["HostilityFader"] = {
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
							["Target of Target"] = {
								["enabled"] = false,
								["position"] = 1.00001,
							},
							["Basic"] = {
								["position"] = 1.00001,
							},
						},
					},
				},
			},
			["Totems"] = {
				["profiles"] = {
					["Default"] = {
						["layouts"] = {
							["Player"] = {
								["totem_direction"] = "v",
								["hide_inactive"] = true,
								["attach_to"] = "HealthBar",
								["timer_text_side"] = "topinside",
							},
						},
					},
				},
			},
			["HolyPower"] = {
			},
			["Portrait"] = {
			},
			["ExperienceBar"] = {
				["profiles"] = {
					["Junior"] = {
						["layouts"] = {
							["Boss"] = {
								["enabled"] = false,
							},
							["Player"] = {
								["enabled"] = false,
							},
							["Target of Target"] = {
								["enabled"] = false,
							},
							["Basic"] = {
								["enabled"] = false,
							},
						},
					},
				},
			},
			["RaidTargetIcon"] = {
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
			["Chi"] = {
			},
			["Border"] = {
			},
			["Background"] = {
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
							["Target of Target"] = {
								["enabled"] = false,
							},
							["Basic"] = {
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
								["enabled"] = false,
								["layout"] = {
									["buff"] = {
										["my_size"] = 21,
										["size"] = 20,
									},
								},
							},
							["Player"] = {
								["enabled"] = false,
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
			},
			["PowerBar"] = {
				["profiles"] = {
					["Junior"] = {
						["layouts"] = {
							["Boss"] = {
								["enabled"] = false,
							},
							["Target of Target"] = {
								["enabled"] = false,
							},
							["Basic"] = {
								["enabled"] = false,
							},
						},
					},
				},
			},
			["HideBlizzard"] = {
				["profiles"] = {
					["Junior"] = {
						["global"] = {
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
							["Target of Target"] = {
								["enabled"] = false,
							},
							["Basic"] = {
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
								["position"] = 3.00001,
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
										["position"] = 10.00001,
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
			},
			["LuaTexts"] = {
				["profiles"] = {
					["Junior"] = {
						["layouts"] = {
							["Normal"] = {
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
											["UNIT_PET_EXPERIENCE"] = true,
											["PLAYER_XP_UPDATE"] = true,
										},
										["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
										["location"] = "center",
										["attach_to"] = "ExperienceBar",
									},
									["Lua:Name"] = {
										["exists"] = true,
										["events"] = {
											["PLAYER_FLAGS_CHANGED"] = true,
											["UNIT_NAME_UPDATE"] = true,
										},
										["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
										["location"] = "left",
										["attach_to"] = "HealthBar",
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
									["Lua:Cast time"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_SUCCEEDED"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
										["location"] = "right",
										["attach_to"] = "CastBar",
									},
									["Lua:Health"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_HEALTH"] = true,
											["UNIT_AURA"] = true,
											["UNIT_MAXHEALTH"] = true,
										},
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
									["Lua:Cast"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
										["location"] = "left",
										["attach_to"] = "CastBar",
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
								},
							},
							["Player"] = {
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
											["UNIT_PET_EXPERIENCE"] = true,
											["PLAYER_XP_UPDATE"] = true,
										},
										["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
										["location"] = "center",
										["attach_to"] = "ExperienceBar",
									},
									["Lua:Power"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
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
										["exists"] = true,
										["events"] = {
											["PLAYER_FLAGS_CHANGED"] = true,
											["UNIT_NAME_UPDATE"] = true,
										},
										["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
										["location"] = "left",
										["attach_to"] = "HealthBar",
									},
									["Lua:Cast"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
										["location"] = "left",
										["attach_to"] = "CastBar",
									},
									["Lua:PVPTimer"] = {
										["exists"] = true,
										["events"] = {
											["PLAYER_FLAGS_CHANGED"] = true,
										},
										["position"] = 1.00002,
										["location"] = "edge_top_right",
										["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
									},
									["Lua:Cast time"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_SUCCEEDED"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
										["location"] = "right",
										["attach_to"] = "CastBar",
									},
									["Lua:Health"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_HEALTH"] = true,
											["UNIT_AURA"] = true,
											["UNIT_MAXHEALTH"] = true,
										},
										["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
										["location"] = "right",
										["attach_to"] = "HealthBar",
									},
									["Lua:Alternate power"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
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
							["Basic"] = {
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
									["Lua:Experience"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_PET_EXPERIENCE"] = true,
											["PLAYER_XP_UPDATE"] = true,
										},
										["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
										["location"] = "center",
										["attach_to"] = "ExperienceBar",
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
									["Lua:Cast"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
										["location"] = "left",
										["attach_to"] = "CastBar",
									},
									["Lua:Health"] = {
										["enabled"] = false,
										["exists"] = true,
										["events"] = {
											["UNIT_HEALTH"] = true,
											["UNIT_AURA"] = true,
											["UNIT_MAXHEALTH"] = true,
										},
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
									["Lua:Cast time"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_SUCCEEDED"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
										["location"] = "right",
										["attach_to"] = "CastBar",
									},
									["Lua:Name"] = {
										["exists"] = true,
										["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
										["location"] = "center",
										["events"] = {
											["PLAYER_FLAGS_CHANGED"] = true,
											["UNIT_NAME_UPDATE"] = true,
										},
										["attach_to"] = "HealthBar",
										["size"] = 1.8,
									},
								},
							},
							["Target"] = {
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
											["UNIT_PET_EXPERIENCE"] = true,
											["PLAYER_XP_UPDATE"] = true,
										},
										["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
										["location"] = "center",
										["attach_to"] = "ExperienceBar",
									},
									["Lua:Power"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
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
										["exists"] = true,
										["events"] = {
											["PLAYER_FLAGS_CHANGED"] = true,
											["UNIT_NAME_UPDATE"] = true,
										},
										["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
										["location"] = "left",
										["attach_to"] = "HealthBar",
									},
									["Lua:Cast"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
										["location"] = "left",
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
									["Lua:Cast time"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_SUCCEEDED"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
										["location"] = "right",
										["attach_to"] = "CastBar",
									},
									["Lua:Health"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_HEALTH"] = true,
											["UNIT_AURA"] = true,
											["UNIT_MAXHEALTH"] = true,
										},
										["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
										["location"] = "right",
										["attach_to"] = "HealthBar",
									},
									["Lua:Alternate power"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
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
							["Raid"] = {
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
									["Lua:Name"] = {
										["exists"] = true,
										["events"] = {
											["PLAYER_FLAGS_CHANGED"] = true,
											["UNIT_NAME_UPDATE"] = true,
										},
										["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
										["location"] = "left",
										["attach_to"] = "HealthBar",
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
									["Lua:Power"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
										},
										["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
										["location"] = "right",
										["attach_to"] = "PowerBar",
									},
									["Lua:Cast"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
										["location"] = "left",
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
									["Lua:Cast time"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_SUCCEEDED"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
										["location"] = "right",
										["attach_to"] = "CastBar",
									},
									["Lua:Health"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_HEALTH"] = true,
											["UNIT_AURA"] = true,
											["UNIT_MAXHEALTH"] = true,
										},
										["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
										["location"] = "right",
										["attach_to"] = "HealthBar",
									},
									["Lua:Alternate power"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
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
									["Lua:Experience"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_PET_EXPERIENCE"] = true,
											["PLAYER_XP_UPDATE"] = true,
										},
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
											["UNIT_PET_EXPERIENCE"] = true,
											["PLAYER_XP_UPDATE"] = true,
										},
										["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
										["location"] = "center",
										["attach_to"] = "ExperienceBar",
									},
									["Lua:Power"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
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
										["exists"] = true,
										["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
										["location"] = "center",
										["events"] = {
											["PLAYER_FLAGS_CHANGED"] = true,
											["UNIT_NAME_UPDATE"] = true,
										},
										["attach_to"] = "HealthBar",
										["size"] = 1.8,
									},
									["Lua:Cast"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell\n  end\nend\nreturn ConfigMode()",
										["location"] = "left",
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
									["Lua:Cast time"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_SPELLCAST_SUCCEEDED"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
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
											["UNIT_AURA"] = true,
											["UNIT_MAXHEALTH"] = true,
										},
										["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
										["location"] = "right",
										["attach_to"] = "HealthBar",
									},
									["Lua:Alternate power"] = {
										["exists"] = true,
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
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
							["Boss"] = {
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
											["UNIT_PET_EXPERIENCE"] = true,
											["PLAYER_XP_UPDATE"] = true,
										},
										["exists"] = true,
										["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
										["location"] = "center",
										["attach_to"] = "ExperienceBar",
									},
									["Lua:Power"] = {
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
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
										["exists"] = true,
										["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
										["location"] = "center",
										["events"] = {
											["PLAYER_FLAGS_CHANGED"] = true,
											["UNIT_NAME_UPDATE"] = true,
										},
										["attach_to"] = "HealthBar",
										["size"] = 1.8,
									},
									["Lua:Cast time"] = {
										["events"] = {
											["UNIT_SPELLCAST_SUCCEEDED"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
											["UNIT_SPELLCAST_FAILED"] = true,
										},
										["exists"] = true,
										["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
										["location"] = "right",
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
									["Lua:Cast"] = {
										["events"] = {
											["UNIT_SPELLCAST_DELAYED"] = true,
											["UNIT_SPELLCAST_CHANNEL_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
											["UNIT_SPELLCAST_START"] = true,
											["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
											["UNIT_SPELLCAST_STOP"] = true,
											["UNIT_SPELLCAST_INTERRUPTED"] = true,
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
											["UNIT_AURA"] = true,
											["UNIT_MAXHEALTH"] = true,
										},
										["exists"] = true,
										["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
										["location"] = "right",
										["attach_to"] = "HealthBar",
									},
									["Lua:Alternate power"] = {
										["events"] = {
											["UNIT_POWER_FREQUENT"] = true,
											["UNIT_MAXPOWER"] = true,
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
							["Target of Target"] = {
								["enabled"] = false,
							},
							["Basic"] = {
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
			["config_version"] = 2,
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
						["exists"] = true,
						["bar_texture"] = "BantoBar",
					},
					["Player"] = {
						["opacity_min"] = 0,
						["exists"] = true,
						["size_x"] = 250,
						["bar_texture"] = "BantoBar",
					},
					["Basic"] = {
						["exists"] = true,
						["bar_texture"] = "BantoBar",
					},
					["Target"] = {
						["size_x"] = 250,
						["exists"] = true,
						["bar_texture"] = "BantoBar",
					},
					["Raid"] = {
						["exists"] = true,
						["bar_texture"] = "BantoBar",
					},
					["Target of Target"] = {
						["exists"] = true,
						["bar_texture"] = "BantoBar",
					},
					["Boss"] = {
						["exists"] = true,
						["bar_texture"] = "BantoBar",
					},
				},
				["made_groups"] = true,
				["units"] = {
					["targettargettarget"] = {
						["enabled"] = false,
						["position_x"] = 559.153625488281,
						["position_y"] = -192.817810058594,
					},
					["focustarget"] = {
						["position_x"] = -555.800537109375,
						["scale"] = 0.5,
						["position_y"] = -68.0118713378906,
						["layout"] = "Basic",
					},
					["targettarget"] = {
						["position_x"] = 329.796637141456,
						["scale"] = 0.55,
						["position_y"] = -338.076839769311,
						["layout"] = "Target of Target",
					},
					["player"] = {
						["position_x"] = -140.69384765625,
						["position_y"] = -337.872985839844,
						["layout"] = "Player",
					},
					["focus"] = {
						["position_x"] = -541.925506591797,
						["scale"] = 0.5,
						["position_y"] = -104.851287841797,
						["layout"] = "Basic",
					},
					["target"] = {
						["position_x"] = 140.390563964844,
						["position_y"] = -337.718322753906,
						["layout"] = "Target",
					},
					["pettarget"] = {
						["enabled"] = false,
						["position_x"] = -882.395645141602,
						["position_y"] = -223.386077880859,
					},
					["focustargettarget"] = {
						["enabled"] = false,
						["position_x"] = -524.412780761719,
						["position_y"] = 361.770263671875,
					},
					["pet"] = {
						["position_x"] = -325.704406738281,
						["scale"] = 0.5,
						["position_y"] = -336.598205566406,
						["layout"] = "Target of Target",
					},
				},
				["groups"] = {
					["Party"] = {
						["position_x"] = -808.482085576473,
						["scale"] = 0.7,
						["enabled"] = true,
						["layout"] = "Basic",
						["exists"] = true,
						["position_y"] = 246.179184592488,
					},
					["Raid"] = {
						["vertical_spacing"] = 5,
						["position_x"] = -918.017288208008,
						["scale"] = 0.5,
						["enabled"] = true,
						["size_y"] = 0.5,
						["unit_group"] = "raid",
						["exists"] = true,
						["position_y"] = 532.817810058594,
						["layout"] = "Basic",
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
					["Boss"] = {
						["position_x"] = 843.167204758138,
						["scale"] = 0.6,
						["enabled"] = true,
						["layout"] = "Boss",
						["unit_group"] = "boss",
						["exists"] = true,
						["position_y"] = 225.712936211593,
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
				["lock_movement"] = true,
				["frame_snap"] = false,
			},
		},
	}

	PitBull4DB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- Prat ----------------------------------------
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
						["brackets"] = "None",
						["level"] = false,
					},
				},
			},
			["Prat_Frames"] = {
				["profiles"] = {
					["Junior"] = {
						["minchatwidthdefault"] = 296,
						["maxchatwidthdefault"] = 608.000061035156,
						["framemetrics"] = {
							{
								["point"] = "BOTTOMLEFT",
								["xOffset"] = 0.00156216651827438,
								["yOffset"] = 0.0231492192964755,
								["height"] = 192.116500854492,
								["width"] = 546.069763183594,
							}, -- [1]
						},
						["initialized"] = true,
						["maxchatheightdefault"] = 400,
						["rememberframepositions"] = true,
					},
				},
			},
			["Prat_ChannelColorMemory"] = {
			},
			["Prat_Editbox"] = {
				["profiles"] = {
					["Junior"] = {
						["attach"] = "TOP",
						["border"] = "None",
						["borderColor"] = {
							["r"] = 0,
							["g"] = 0,
							["b"] = 0,
						},
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
						["on"] = false,
						["fontsize"] = 18,
					},
				},
			},
			["Prat_Paragraph"] = {
			},
			["Prat_UrlCopy"] = {
				["profiles"] = {
					["Junior"] = {
						["color"] = {
							["g"] = 0.698039215686275,
							["r"] = 0.686274509803922,
						},
						["bracket"] = false,
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
						["on"] = true,
						["incoming"] = {
							["PARTY"] = "None",
							["RAID"] = "None",
							["GUILD"] = "Chime",
							["WHISPER"] = "None",
							["BN_WHISPER"] = "Xylo",
							["OFFICER"] = "None",
							["GROUP_LEAD"] = "None",
						},
					},
				},
			},
			["Prat_Timestamps"] = {
				["profiles"] = {
					["Junior"] = {
						["formatpost"] = "",
						["formatcode"] = "%I:%M",
						["timestampcolor"] = {
							["b"] = 0.192156862745098,
							["g"] = 0.631372549019608,
							["r"] = 0.219607843137255,
						},
						["formatpre"] = "",
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
						["delaygmotd"] = false,
						["chatlines"] = 5000,
						["scrollbacklen"] = 500,
						["chatlinesframes"] = {
							["ChatFrame5"] = true,
							["ChatFrame4"] = true,
							["ChatFrame3"] = true,
							["ChatFrame1"] = true,
						},
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
						["showminimize"] = false,
						["showMenu"] = false,
					},
				},
			},
			["Prat_ServerNames"] = {
				["profiles"] = {
					["Junior"] = {
						["randomclr"] = false,
						["autoabbreviate"] = false,
					},
				},
			},
			["Prat_ChannelNames"] = {
				["profiles"] = {
					["Junior"] = {
						["shortnames"] = {
							["guild"] = "{G}",
							["bnwhisper"] = "[{W To}",
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
							["instanceleader"] = "{IL}",
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
					["PopupMessage"] = 1,
					["CopyChat"] = 1,
					["AltNames"] = 1,
					["ChatLog"] = 1,
					["OriginalButtons"] = 1,
					["TellTarget"] = 1,
					["Search"] = 1,
					["Paragraph"] = 1,
					["Bubbles"] = 1,
					["ChatTabs"] = 3,
					["Alias"] = 1,
					["KeyBindings"] = 1,
				},
			},
		},
	}

	Prat3DB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- SexyMap ----------------------------------------
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
			["buttons"] = {
				["TEMP2"] = true,
				["radius"] = 10,
				["lockDragging"] = false,
				["allowDragging"] = true,
				["visibilitySettings"] = {
					["LibDBIcon10_AutoRoll"] = "never",
					["LibDBIcon10_PitBull4"] = "never",
					["LibDBIcon10_Skinner"] = "never",
					["LibDBIcon10_SavedInstances"] = "never",
					["MiniMapInstanceDifficulty"] = "hover",
					["MinimapZoneTextButton"] = "always",
					["MiniMapMailFrame"] = "never",
					["TimeManagerClockButton"] = "always",
					["LibDBIcon10_Dominos"] = "never",
					["MiniMapWorldMapButton"] = "never",
					["MinimapZoomOut"] = "never",
					["QueueStatusMinimapButton"] = "always",
					["LibDBIcon10_DetailsStreamer"] = "never",
					["DBMMinimapButton"] = "never",
					["GarrisonLandingPageMinimapButton"] = "hover",
					["LibDBIcon10_Details"] = "never",
					["GuildInstanceDifficulty"] = "hover",
					["MinimapZoomIn"] = "never",
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
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["fontColor"] = {
				},
				["borderColor"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
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
						["r"] = 0.0823529411764706,
						["g"] = 0.0823529411764706,
						["b"] = 0.0823529411764706,
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
						["r"] = 0.290196078431373,
						["g"] = 0.215686274509804,
						["b"] = 0.207843137254902,
					},
					["scale"] = 1.25,
				},
				["hideBlizzard"] = true,
			},
			["zonetext"] = {
				["bgColor"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["fontColor"] = {
				},
				["borderColor"] = {
					["a"] = 1,
					["b"] = 0,
					["g"] = 0,
					["r"] = 0,
				},
				["xOffset"] = 0,
				["yOffset"] = 0,
				["fontsize"] = 7,
				["width"] = 142,
			},
			["core"] = {
				["clamp"] = false,
				["point"] = "TOPRIGHT",
				["relpoint"] = "TOPRIGHT",
				["autoZoom"] = 5,
				["northTag"] = true,
				["y"] = -37.5997161865234,
				["x"] = -23.6122894287109,
				["lock"] = false,
				["scale"] = 1.42,
				["shape"] = "SPELLS\\T_VFX_BORDER",
				["rightClickToConfig"] = true,
			},
		},
		["presets"] = {
		},
	}

	SexyMap2DB[name .. "-" .. realm] = "global";
end

---------------------------------------- Skada ----------------------------------------
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
				["windows"] = {
					{
						["classicons"] = false,
						["barslocked"] = true,
						["y"] = 20.7526435852051,
						["x"] = -2.0465087890625,
						["name"] = "Damage",
						["point"] = "BOTTOMRIGHT",
						["barfontsize"] = 18,
						["background"] = {
							["borderthickness"] = 1,
							["height"] = 88.4571380615235,
						},
						["mode"] = "Damage",
						["barwidth"] = 272.746276855469,
						["title"] = {
							["color"] = {
								["a"] = 0.924419581890106,
								["r"] = 0.180392156862745,
								["g"] = 0.180392156862745,
								["b"] = 0.180392156862745,
							},
						},
					}, -- [1]
					{
						["titleset"] = true,
						["barheight"] = 18,
						["color"] = {
							["a"] = 0.6,
							["r"] = 0.3,
							["g"] = 0.3,
							["b"] = 0.3,
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
						["point"] = "BOTTOMRIGHT",
						["barbgcolor"] = {
							["a"] = 0.6,
							["r"] = 0.3,
							["g"] = 0.3,
							["b"] = 0.3,
						},
						["barcolor"] = {
							["a"] = 1,
							["r"] = 0.3,
							["g"] = 0.3,
							["b"] = 0.8,
						},
						["x"] = -277.051025390625,
						["barfontsize"] = 18,
						["showself"] = true,
						["title"] = {
							["textcolor"] = {
								["a"] = 1,
								["r"] = 0.9,
								["g"] = 0.9,
								["b"] = 0.9,
							},
							["color"] = {
								["a"] = 0.920000001788139,
								["r"] = 0.180392156862745,
								["g"] = 0.180392156862745,
								["b"] = 0.180392156862745,
							},
							["bordercolor"] = {
								["a"] = 1,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
							["font"] = "Accidental Presidency",
							["fontsize"] = 13,
							["height"] = 20,
							["fontflags"] = "",
							["bordertexture"] = "None",
							["borderthickness"] = 2,
							["texture"] = "Armory",
						},
						["mode"] = "Healing",
						["roleicons"] = false,
						["barorientation"] = 1,
						["snapto"] = true,
						["background"] = {
							["height"] = 88.4571075439453,
							["bordercolor"] = {
								["a"] = 1,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
							["borderthickness"] = 1,
							["tile"] = false,
							["color"] = {
								["a"] = 0.4,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
							["bordertexture"] = "Blizzard Party",
							["tilesize"] = 0,
							["texture"] = "Solid",
						},
						["scale"] = 1,
						["fixedbarwidth"] = false,
						["textcolor"] = {
							["r"] = 0.9,
							["g"] = 0.9,
							["b"] = 0.9,
						},
						["buttons"] = {
							["report"] = true,
							["menu"] = true,
							["mode"] = true,
							["segment"] = true,
							["reset"] = true,
						},
						["bartexture"] = "BantoBar",
						["barwidth"] = 274.793090820313,
						["barspacing"] = 0,
						["reversegrowth"] = false,
						["width"] = 600,
						["modeincombat"] = "",
						["enabletitle"] = true,
						["version"] = 1,
						["classcolorbars"] = true,
						["isusingclasscolors"] = true,
						["height"] = 30,
						["returnaftercombat"] = false,
						["isonnewline"] = false,
					}, -- [2]
				},
				["reset"] = {
					["join"] = 2,
				},
			},
		},
	}

	SkadaDB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- Skinner ----------------------------------------
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
					["r"] = 0.231372549019608,
					["g"] = 0.231372549019608,
					["b"] = 0.231372549019608,
				},
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
				["ChatTabsFade"] = false,
				["DisabledSkins"] = {
					["Dominos"] = true,
					["Skada"] = true,
					["SorhaQuestLog"] = true,
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
	}

	SkinnerDB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- SorhaQuestLog ----------------------------------------
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
						["sink20OutputSink"] = "None",
						["Colours"] = {
							["Objective25PlusColour"] = {
								["r"] = 0.811764705882353,
								["g"] = 0.282352941176471,
								["b"] = 0.105882352941176,
							},
							["InfoColour"] = {
								["g"] = 0.741176470588235,
								["b"] = 0.372549019607843,
							},
							["HeaderColour"] = {
								["r"] = 0.266666666666667,
								["g"] = 0.52156862745098,
								["b"] = 0.764705882352941,
							},
							["Objective50PlusColour"] = {
								["r"] = 0.901960784313726,
								["g"] = 0.596078431372549,
								["b"] = 0.305882352941177,
							},
							["ObjectiveTitleColour"] = {
								["r"] = 0.827450980392157,
								["g"] = 0.870588235294118,
								["b"] = 0.729411764705882,
							},
							["Objective00PlusColour"] = {
								["r"] = 0.619607843137255,
								["b"] = 0.0313725490196078,
							},
							["ObjectiveTooltipTextColour"] = {
								["r"] = 0.184313725490196,
								["g"] = 0.749019607843137,
								["b"] = 0.741176470588235,
							},
							["MinionBackGroundColour"] = {
								["a"] = 0.611806064844132,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
						},
						["UseStatusBars"] = false,
						["Fonts"] = {
							["QuestFontShadowed"] = false,
							["HeaderFontShadowed"] = false,
							["ObjectiveFontShadowed"] = false,
							["MinionTitleFontSize"] = 13,
							["ObjectiveFontSize"] = 13,
							["QuestFontSize"] = 13,
							["MinionTitleFontShadowed"] = false,
							["HeaderFontSize"] = 13,
						},
						["Notifications"] = {
							["DisableToasts"] = true,
						},
						["MinionLocation"] = {
							["Y"] = 249.860198974609,
							["X"] = -20.1165676116943,
							["Point"] = "RIGHT",
							["RelativePoint"] = "RIGHT",
						},
						["MinionCollapseToLeft"] = true,
						["MinionLocked"] = true,
					},
				},
			},
			["ScenarioTracker"] = {
				["profiles"] = {
					["Junior"] = {
						["Fonts"] = {
							["ScenarioHeaderFontSize"] = 13,
							["ScenarioTaskFontSize"] = 13,
							["MinionTitleFontSize"] = 13,
							["ScenarioObjectiveFontSize"] = 13,
						},
						["AutoHideTitle"] = true,
						["Colours"] = {
							["MinionBackGroundColour"] = {
								["a"] = 0.610000014305115,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
						},
						["MinionParent"] = "SQLRemoteQuestsMinionBottom",
						["MinionLocation"] = {
							["Y"] = 95.1695785522461,
							["X"] = -199.548583984375,
						},
						["MinionLocked"] = true,
					},
				},
			},
			["RemoteQuestsTracker"] = {
				["profiles"] = {
					["Junior"] = {
						["Fonts"] = {
							["MinionTitleFontSize"] = 13,
						},
						["AutoHideTitle"] = true,
						["Colours"] = {
							["MinionBackGroundColour"] = {
								["a"] = 0.610000014305115,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
						},
						["MinionParent"] = "SQLQuestMinionBottom",
						["MinionLocation"] = {
							["Y"] = 116.659507751465,
							["X"] = -7.16335439682007,
						},
						["MinionLocked"] = true,
					},
				},
			},
			["AchievementTracker"] = {
				["profiles"] = {
					["Junior"] = {
						["MinionWidth"] = 240,
						["PaddingAfterAchievement"] = 0,
						["AutoHideTitle"] = true,
						["MinionLocation"] = {
							["Y"] = 47.073169708252,
							["X"] = -139.173004150391,
						},
						["MinionLocked"] = true,
						["MinionParent"] = "SQLRemoteQuestsMinionBottom",
						["Colours"] = {
							["MinionBackGroundColour"] = {
								["a"] = 0.610000014305115,
								["r"] = 0,
								["g"] = 0,
								["b"] = 0,
							},
						},
						["Fonts"] = {
							["MinionTitleFontSize"] = 13,
							["AchievementObjectiveFontSize"] = 13,
							["AchievementTitleFontSize"] = 13,
						},
					},
				},
			},
		},
		["profileKeys"] = {
		},
		["profiles"] = {
			["Junior"] = {
				["StatusBarTexture"] = "Empty",
				["BackgroundTexture"] = "Blizzard Dialog Background Dark",
				["AutoHide"] = {
					["OnRaid"] = "Show",
					["OnBattleground"] = "Hide",
					["OnInstance"] = "Show",
					["OnArena"] = "Hide",
					["OnEnterPetBattle"] = "Hide",
					["OnEnterCombat"] = "Hide",
					["OnExitPetBattle"] = "Hide",
					["OnLeaveCombat"] = "Show",
				},
				["BorderTexture"] = "None",
			},
		},
	}

	SorhaQuestLogDB.profileKeys[name .. " - " .. realm] = "Junior";
end

---------------------------------------- TokenPrice ----------------------------------------
	TokenPriceDB.global.showPercentChange = false;

---------------------------------------- WorldQuestGroupFinder ----------------------------------------
	WorldQuestGroupFinderConfig = {
		["autoLeaveGroup"] = true,
		["hideLoginMessage"] = true,
		["autoAcceptInvites"] = true,
		["autoinvite"] = false,
	}

--------------------------------------------------------------------------------
	
	print("Settings Applied");
	print("Right-Click to Reload");

	elseif button == "RightButton" then
		m4xhidebutton = true;
		ReloadUI();
	end
end);

button:SetScript("OnEnter", OnEnter);
button:SetScript("OnLeave", OnLeave);