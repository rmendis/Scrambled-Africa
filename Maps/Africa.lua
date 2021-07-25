-- Africa.lua
-- Author: blkbutterfly74
-- DateCreated: 5/6/2017 6:40:20 PM
-- Creates a standard & huge map shaped like real-world Africa 
-- based off Australia & Pangea map scripts
-- Thanks to Firaxis & HandyVac on how to obtain landstrip data from satellite images
--------------------------------------------------------------------------------------

include "MapEnums"
include "MapUtilities"
include "MountainsCliffs"
include "RiversLakes"
include "FeatureGenerator"
include "TerrainGenerator"
include "NaturalWonderGenerator"
include "ResourceGenerator"
include "AssignStartingPlots"

-- standard map data
local g_Minor = {
	centerX = 34,
	centerY = 32,
	width = 65,
	height = 66,
	xOffset = 1,
	yOffset = 1,
	landStrips = {
		{2, 24, 25},
		{3, 12, 12},
		{3, 16, 26},
		{4, 10, 26},
		{5, 9, 26},
		{6, 8, 29},
		{6, 34, 36},
		{7, 8, 30},
		{7, 33, 40},
		{7, 42, 44},
		{8, 8, 44},
		{9, 7, 44},
		{10, 5, 45},
		{11, 4, 46},
		{12, 3, 46},
		{13, 3, 47},
		{14, 2, 47},
		{15, 2, 48},
		{16, 1, 48},
		{17, 1, 48},
		{18, 1, 49},
		{19, 2, 50},
		{20, 1, 50},
		{21, 1, 51},
		{22, 1, 52},
		{23, 2, 53},
		{24, 2, 54},
		{24, 58, 60},
		{25, 3, 61},
		{26, 4, 60},
		{27, 5, 60},
		{28, 7, 59},
		{29, 8, 16},
		{29, 21, 58},
		{30, 22, 57},
		{31, 24, 56},
		{32, 24, 55},
		{33, 24, 54},
		{34, 24, 53},
		{35, 24, 52},
		{36, 25, 51},
		{37, 26, 50},
		{38, 26, 49},
		{39, 27, 49},
		{40, 27, 49},
		{41, 27, 50},
		{42, 27, 50},
		{43, 27, 51},
		{44, 27, 51},
		{45, 27, 51},
		{45, 58, 59},
		{46, 27, 51},
		{46, 57, 59},
		{47, 26, 51},
		{47, 56, 58},
		{48, 26, 50},
		{48, 54, 58},
		{49, 26, 48},
		{49, 54, 58},
		{50, 26, 47},
		{50, 54, 58},
		{51, 27, 46},
		{51, 54, 58},
		{52, 28, 46},
		{52, 53, 57},
		{53, 28, 46},
		{53, 53, 57},
		{54, 28, 46},
		{54, 54, 57},
		{55, 29, 46},
		{55, 54, 56},
		{56, 29, 44},
		{57, 30, 44},
		{58, 30, 43},
		{59, 31, 43},
		{60, 31, 42},
		{61, 32, 41},
		{62, 32, 39},
		{63, 33, 35}},
};

-- huge map data
local g_Major = {
	centerX = 61,
	centerY = 48,
	width = 98,
	height = 105,
	xOffset = 0,
	yOffset = 1,
	landStrips = {
		{2, 40, 40},
		{3, 31, 41},
		{4, 22, 22},
		{4, 29, 41},
		{5, 21, 41},
		{6, 20, 40},
		{7, 19, 41},
		{8, 18, 46},
		{8, 54, 56},
		{9, 17, 47},
		{9, 53, 58},
		{9, 66, 67},
		{10, 16, 50},
		{10, 53, 63},
		{10, 65, 67},
		{11, 15, 68},
		{12, 15, 68},
		{13, 6, 6},
		{13, 14, 69},
		{14, 8, 8},
		{14, 12, 70},
		{15, 11, 70},
		{16, 9, 71},
		{17, 9, 72},
		{18, 8, 72},
		{19, 7, 73},
		{20, 6, 73},
		{21, 6, 74},
		{22, 5, 75},
		{23, 5, 76},
		{24, 5, 76},
		{25, 5, 76},
		{26, 5, 77},
		{27, 5, 78},
		{28, 5, 79},
		{29, 4, 79},
		{30, 4, 79},
		{31, 4, 80},
		{32, 3, 82},
		{33, 3, 83},
		{34, 3, 84},
		{35, 3, 84},
		{36, 2, 85},
		{37, 3, 86},
		{37, 93, 95},
		{38, 4, 86},
		{38, 89, 95},
		{39, 5, 95},
		{40, 6, 95},
		{41, 7, 94},
		{42, 7, 94},
		{43, 7, 93},
		{44, 9, 93},
		{45, 10, 26},
		{45, 31, 93},
		{46, 11, 24},
		{46, 32, 93},
		{47, 13, 15},
		{47, 33, 92},
		{48, 39, 92},
		{49, 37, 37},
		{49, 39, 91},
		{50, 39, 90},
		{51, 39, 89},
		{52, 38, 87},
		{53, 34, 34},
		{53, 38, 86},
		{54, 38, 85},
		{55, 37, 85},
		{56, 38, 84},
		{57, 38, 83},
		{58, 39, 82},
		{59, 40, 82},
		{60, 41, 81},
		{61, 42, 80},
		{62, 42, 80},
		{63, 43, 81},
		{64, 43, 81},
		{65, 44, 81},
		{66, 44, 81},
		{67, 44, 81},
		{68, 44, 81},
		{69, 45, 82},
		{70, 46, 82},
		{71, 45, 82},
		{72, 44, 82},
		{72, 93, 93},
		{73, 43, 82},
		{73, 92, 93},
		{74, 43, 82},
		{74, 91, 93},
		{75, 43, 82},
		{75, 91, 93},
		{76, 42, 81},
		{76, 90, 93},
		{77, 42, 81},
		{77, 87, 92},
		{78, 42, 80},
		{78, 86, 92},
		{79, 42, 78},
		{79, 85, 92},
		{80, 42, 76},
		{80, 86, 92},
		{81, 43, 75},
		{81, 86, 91},
		{82, 43, 74},
		{82, 86, 91},
		{83, 44, 73},
		{83, 85, 90},
		{84, 44, 73},
		{84, 85, 90},
		{85, 45, 73},
		{85, 84, 89},
		{86, 46, 73},
		{86, 83, 89},
		{87, 46, 73},
		{87, 83, 88},
		{88, 46, 73},
		{88, 83, 88},
		{89, 46, 72},
		{89, 84, 87},
		{90, 46, 70},
		{90, 84, 86},
		{91, 46, 69},
		{92, 47, 69},
		{93, 46, 69},
		{94, 48, 68},
		{95, 49, 67},
		{96, 49, 65},
		{97, 50, 65},
		{98, 50, 65},
		{99, 50, 64},
		{100, 50, 62},
		{101, 51, 60},
		{102, 52, 53}},
};

local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local g_iNumTotalLandTiles = 0; 
local g_CenterX;
local g_CenterY;
local g_landStrips;
local g_xOffset = 0;
local g_yOffset = 0;
local variationFrac = nil;

-------------------------------------------------------------------------------
function GenerateMap()
	print("Generating Africa Map");
	local pPlot;

	-- Set globals
	g_iW, g_iH = Map.GetGridSize();
	g_iFlags = TerrainBuilder.GetFractalFlags();
	local temperature = 0;
	
	plotTypes = GeneratePlotTypes();
	terrainTypes = GenerateTerrainTypesAfrica(plotTypes, g_iW, g_iH, g_iFlags, true);

	for i = 0, (g_iW * g_iH) - 1, 1 do
		pPlot = Map.GetPlotByIndex(i);
		if (plotTypes[i] == g_PLOT_TYPE_HILLS) then
			terrainTypes[i] = terrainTypes[i] + 1;
		end
		TerrainBuilder.SetTerrainType(pPlot, terrainTypes[i]);
	end

	-- Temp
	AreaBuilder.Recalculate();
	local biggest_area = Areas.FindBiggestArea(false);
	print("After Adding Hills: ", biggest_area:GetPlotCount());
	
	-- Place lakes before rivers so they may act as sources
	local numLargeLakes = math.floor(GameInfo.Maps[Map.GetMapSize()].Continents * 0.5);
	AddLakes(numLargeLakes);

	-- River generation is affected by plot types, originating from highlands and preferring to traverse lowlands.
	AddRivers();

	AddFeatures();
	
	print("Adding cliffs");
	AddCliffs(plotTypes, terrainTypes);
	
	local args = {
		numberToPlace = GameInfo.Maps[Map.GetMapSize()].NumNaturalWonders,
	};

	local nwGen = NaturalWonderGenerator.Create(args);

	AreaBuilder.Recalculate();
	TerrainBuilder.AnalyzeChokepoints();
	TerrainBuilder.StampContinents();
	
	resourcesConfig = MapConfiguration.GetValue("resources");
	local args = {
		resources = resourcesConfig,
		LuxuriesPerRegion = 7,
	}
	local resGen = ResourceGenerator.Create(args);

	print("Creating start plot database.");
	-- START_MIN_Y and START_MAX_Y is the percent of the map ignored for major civs' starting positions.
	local startConfig = MapConfiguration.GetValue("start");-- Get the start config
	local args = {
		MIN_MAJOR_CIV_FERTILITY = 300,
		MIN_MINOR_CIV_FERTILITY = 50, 
		MIN_BARBARIAN_FERTILITY = 1,
		START_MIN_Y = 15,
		START_MAX_Y = 15,
		START_CONFIG = startConfig,
		LAND = true,
	};
	local start_plot_database = AssignStartingPlots.Create(args)

	local GoodyGen = AddGoodies(g_iW, g_iH);
end

-- Input a Hash; Export width, height, and wrapX
-- and init map data
function GetMapInitData(MapSize)
	local size = GameInfo.Maps[MapSize].MapSizeType;
	local WrapX = false;

	if (size == "MAPSIZE_DUEL" or size == "MAPSIZE_TINY" or size == "MAPSIZE_SMALL" or size == "MAPSIZE_STANDARD") then
		g_CenterX = g_Minor.centerX;
		g_CenterY = g_Minor.centerY;
		g_landStrips = g_Minor.landStrips;
		g_xOffset = g_Minor.xOffset;
		g_yOffset = g_Minor.yOffset;

		return {Width = g_Minor.width, Height = g_Minor.height, WrapX = WrapX}
	else
		g_CenterX = g_Major.centerX;
		g_CenterY = g_Major.centerY;
		g_landStrips = g_Major.landStrips;
		g_xOffset = g_Major.xOffset;
		g_yOffset = g_Major.yOffset;

		return {Width = g_Major.width, Height = g_Major.height, WrapX = WrapX}
	end
end
-------------------------------------------------------------------------------
function GeneratePlotTypes()
	print("Generating Plot Types");
	local plotTypes = {};

	-- Start with it all as water
	for x = 0, g_iW - 1 do
		for y = 0, g_iH - 1 do
			local i = y * g_iW + x;
			local pPlot = Map.GetPlotByIndex(i);
			plotTypes[i] = g_PLOT_TYPE_OCEAN;
			TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_OCEAN);
		end
	end

	-- Each land strip is defined by: Y, X Start, X End
	for i, v in ipairs(g_landStrips) do
		local y = g_iH - (v[1] + g_yOffset);   -- inverted 
		local xStart = v[2] + g_xOffset;
		local xEnd = v[3] + g_xOffset; 
		for x = xStart, xEnd do
			local i = y * g_iW + x;
			local pPlot = Map.GetPlotByIndex(i);
			plotTypes[i] = g_PLOT_TYPE_LAND;
			TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_DESERT);  -- temporary setting so can calculate areas
			g_iNumTotalLandTiles = g_iNumTotalLandTiles + 1;
		end
	end
		
	AreaBuilder.Recalculate();
	
	local args = {};
	args.world_age = 2;		-- old by default
	args.iW = g_iW;
	args.iH = g_iH
	args.iFlags = g_iFlags;
	args.blendRidge = 10;
	args.blendFract = 1;
	args.extra_mountains = 6;
	plotTypes = ApplyTectonics(args, plotTypes);

	return plotTypes;
end

function InitFractal(args)

	if(args == nil) then args = {}; end

	local continent_grain = args.continent_grain or 2;
	local rift_grain = args.rift_grain or -1; -- Default no rifts. Set grain to between 1 and 3 to add rifts. - Bob
	local invert_heights = args.invert_heights or false;
	local polar = args.polar or true;
	local ridge_flags = args.ridge_flags or g_iFlags;

	local fracFlags = {};
	
	if(invert_heights) then
		fracFlags.FRAC_INVERT_HEIGHTS = true;
	end
	
	if(polar) then
		fracFlags.FRAC_POLAR = true;
	end
	
	if(rift_grain > 0 and rift_grain < 4) then
		local riftsFrac = Fractal.Create(g_iW, g_iH, rift_grain, {}, 6, 5);
		g_continentsFrac = Fractal.CreateRifts(g_iW, g_iH, continent_grain, fracFlags, riftsFrac, 6, 5);
	else
		g_continentsFrac = Fractal.Create(g_iW, g_iH, continent_grain, fracFlags, 6, 5);	
	end

	-- Use Brian's tectonics method to weave ridgelines in to the continental fractal.
	-- Without fractal variation, the tectonics come out too regular.
	--
	--[[ "The principle of the RidgeBuilder code is a modified Voronoi diagram. I 
	added some minor randomness and the slope might be a little tricky. It was 
	intended as a 'whole world' modifier to the fractal class. You can modify 
	the number of plates, but that is about it." ]]-- Brian Wade - May 23, 2009
	--
	local MapSizeTypes = {};
	for row in GameInfo.Maps() do
		MapSizeTypes[row.MapSizeType] = row.PlateValue;
	end
	local sizekey = Map.GetMapSize();

	local numPlates = MapSizeTypes[sizekey] or 4

	-- Blend a bit of ridge into the fractal.
	-- This will do things like roughen the coastlines and build inland seas. - Brian

	g_continentsFrac:BuildRidges(numPlates, {}, 1, 2);
end

function AddFeatures()
	print("Adding Features");

	-- Get Rainfall setting input by user.
	local rainfall = MapConfiguration.GetValue("rainfall");
	if rainfall == 4 then
		rainfall = 1 + TerrainBuilder.GetRandomNumber(3, "Random Rainfall - Lua");
	end
	
	local args = {rainfall = rainfall, iJunglePercent = 40, iMarshPercent = 4, iForestPercent = 25, iReefPercent = 10}	-- jungle & marsh max coverage
	local featuregen = FeatureGenerator.Create(args);

	featuregen:AddFeatures();
	
	-- remove Saharan jungle and forest
	for iX = 0, g_iW - 1 do
		for iY = 0, g_iH - 1 do
			local index = (iY * g_iW) + iX;
			local plot = Map.GetPlot(iX, iY);
			local iDistanceFromCenter = Map.GetPlotDistance(0, iY, 0, g_CenterY);	-- distance from equator
			local lat = -((g_iH/2) - iY)/(g_iH/2);		-- inverted

			if (lat > 0.25 and (plot:GetFeatureType() == g_FEATURE_FOREST or plot:GetFeatureType() == g_FEATURE_JUNGLE)) then
				-- Linear scale out
				if (TerrainBuilder.GetRandomNumber(60, "Resource Placement Score Adjust") >= iDistanceFromCenter) then
					TerrainBuilder.SetFeatureType(plot, -1);
				end
			end
		end
	end
end

------------------------------------------------------------------------------
function GenerateTerrainTypesAfrica(plotTypes, iW, iH, iFlags, bNoCoastalMountains)
	print("Generating Terrain Types");
	local terrainTypes = {};

	local fracXExp = -1;
	local fracYExp = -1;
	local grain_amount = 3;

	africa = Fractal.Create(iW, iH, 
									grain_amount, iFlags, 
									fracXExp, fracYExp);

	-- variation fractal for Sahara/Sub-Sahara division
	variationFrac = Fractal.Create(iW, iH,  
									grain_amount, iFlags, 
									fracXExp, fracYExp);

	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;
			if (plotTypes[index] == g_PLOT_TYPE_OCEAN) then
				if (IsAdjacentToLand(plotTypes, iX, iY)) then
					terrainTypes[index] = g_TERRAIN_TYPE_COAST;
				else
					terrainTypes[index] = g_TERRAIN_TYPE_OCEAN;
				end
			end
		end
	end

	if (bNoCoastalMountains == true) then
		plotTypes = RemoveCoastalMountains(plotTypes, terrainTypes);
	end

	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;

			local lat = GetLatitudeAtPlot(variationFrac, iX, iY);

			local africaVal = africa:GetHeight(iX, iY);

			-- Sahara desert
			if (lat > 0.25 and iY > g_CenterY) then													
				local iPlainsTop = africa:GetHeight(100);
				local iPlainsBottom = africa:GetHeight(90);
				
				local iDesertTop = africa:GetHeight(90);
				local iDesertBottom = africa:GetHeight(2);

				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;

					if ((africaVal >= iDesertBottom) and (africaVal <= iDesertTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT_MOUNTAIN;
					elseif ((africaVal >= iPlainsBottom) and (africaVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					end

				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS;

					if ((africaVal >= iDesertBottom) and (africaVal <= iDesertTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT;
					elseif ((africaVal >= iPlainsBottom) and (africaVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					end
				end

			-- Sub-Saharan jungle
			else 
				local iGrassTop = africa:GetHeight(100);
				local iGrassBottom = africa:GetHeight(55);
																		
				local iPlainsTop = africa:GetHeight(55);
				local iPlainsBottom = africa:GetHeight(10);

				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_DESERT_MOUNTAIN;

					if ((africaVal >= iPlainsBottom) and (africaVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					elseif ((africaVal >= iGrassBottom) and (africaVal <= iGrassTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;
					end

				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_DESERT;
		
					if ((africaVal >= iPlainsBottom) and (africaVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					elseif ((africaVal >= iGrassBottom) and (africaVal <= iGrassTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
					end
				end

			end
		end
	end

	local bExpandCoasts = true;

	if bExpandCoasts == false then
		return
	end

	print("Expanding coasts");
	for iI = 0, 2 do
		local shallowWaterPlots = {};
		for iX = 0, iW - 1 do
			for iY = 0, iH - 1 do
				local index = (iY * iW) + iX;
				if (terrainTypes[index] == g_TERRAIN_TYPE_OCEAN) then
					-- Chance for each eligible plot to become an expansion is 1 / iExpansionDiceroll.
					-- Default is two passes at 1/4 chance per eligible plot on each pass.
					if (IsAdjacentToShallowWater(terrainTypes, iX, iY) and TerrainBuilder.GetRandomNumber(4, "add shallows") == 0) then
						table.insert(shallowWaterPlots, index);
					end
				end
			end
		end
		for i, index in ipairs(shallowWaterPlots) do
			terrainTypes[index] = g_TERRAIN_TYPE_COAST;
		end
	end
	
	return terrainTypes; 
end
------------------------------------------------------------------------------
function FeatureGenerator:AddIceAtPlot(plot, iX, iY)
	return false;
end

------------------------------------------------------------------------------
function CustomGetMultiTileFeaturePlotList(pPlot, eFeatureType, aPlots)

	-- First check this plot itself
	if (not TerrainBuilder.CanHaveFeature(pPlot, eFeatureType, true)) then
		return false;
	else
		table.insert(aPlots, pPlot:GetIndex());
	end

	return false;
end

------------------------------------------------------------------------------
function FeatureGenerator:AddReefAtPlot(plot, iX, iY)
	--Reef Check. First see if it can place the feature.
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_REEF)) then
		self.iNumReefablePlots = self.iNumReefablePlots + 1;
		if(math.ceil(self.iReefCount * 100 / self.iNumReefablePlots) <= self.iReefMaxPercent) then
				--Weight based on adjacent plots
				local iScore  = 1.5 * math.abs(iY - self.iNumEquator);
				local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_REEF);

				if(iAdjacent == 0 ) then
					iScore = iScore + 100;
				elseif(iAdjacent == 1) then
					iScore = iScore + 125;
				elseif (iAdjacent == 2) then
					iScore = iScore  + 150;
				elseif (iAdjacent == 3 or iAdjacent == 4) then
					iScore = iScore + 175;
				else
					iScore = iScore + 10000;
				end

				if(TerrainBuilder.GetRandomNumber(200, "Resource Placement Score Adjust") >= iScore) then
					TerrainBuilder.SetFeatureType(plot, g_FEATURE_REEF);
					self.iReefCount = self.iReefCount + 1;
				end
		end
	end
end

-- override: southern forest bias
function FeatureGenerator:AddForestsAtPlot(plot, iX, iY)
	--Forest Check. First see if it can place the feature.
	
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_FOREST)) then
		if(math.ceil(self.iForestCount * 100 / self.iNumLandPlots) <= self.iForestMaxPercent) then
			--Weight based on adjacent plots if it has more than 3 start subtracting
			local iScore = 3 * (1 - iY/g_iH) * 100;
			local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_FOREST);

			if(iAdjacent == 0 ) then
				iScore = iScore;
			elseif(iAdjacent == 1) then
				iScore = iScore + 50;
			elseif (iAdjacent == 2 or iAdjacent == 3) then
				iScore = iScore + 150;
			elseif (iAdjacent == 4) then
				iScore = iScore - 50;
			else
				iScore = iScore - 200;
			end
				
			if(TerrainBuilder.GetRandomNumber(300, "Resource Placement Score Adjust") <= iScore) then
				TerrainBuilder.SetFeatureType(plot, g_FEATURE_FOREST);
				self.iForestCount = self.iForestCount + 1;
			end
		end
	end
end

-- override: more northern jungle
function FeatureGenerator:AddJunglesAtPlot(plot, iX, iY)
	--Jungle Check. First see if it can place the feature.
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_JUNGLE)) then
		if(math.ceil(self.iJungleCount * 100 / self.iNumLandPlots) <= self.iJungleMaxPercent) then

			--Weight based on adjacent plots if it has more than 3 start subtracting
			local iScore = 400 * iY;
			local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_JUNGLE);

			if(iAdjacent == 0 ) then
				iScore = iScore;
			elseif(iAdjacent == 1) then
				iScore = iScore + 50;
			elseif (iAdjacent == 2 or iAdjacent == 3) then
				iScore = iScore + 150;
			elseif (iAdjacent == 4) then
				iScore = iScore - 50;
			else
				iScore = iScore - 200;
			end

			if(TerrainBuilder.GetRandomNumber(100, "Resource Placement Score Adjust") <= iScore) then
				TerrainBuilder.SetFeatureType(plot, g_FEATURE_JUNGLE);
				local terrainType = plot:GetTerrainType();

				if(terrainType == g_TERRAIN_TYPE_PLAINS_HILLS or terrainType == g_TERRAIN_TYPE_GRASS_HILLS) then
					TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_PLAINS_HILLS);
				else
					TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_PLAINS);
				end

				self.iJungleCount = self.iJungleCount + 1;
				return true;
			end

		end
	end

	return false
end

