#==========#
# GregTech #
#==========#

#==================================================================#
#Imports
import minetweaker.item.IItemStack;
import mods.gregtech.AlloySmelter;
import mods.gregtech.ArcFurnace;
import mods.gregtech.Assembler;
import mods.gregtech.AssemblyLine;
import mods.gregtech.Autoclave;
import mods.gregtech.Canner;
import mods.gregtech.Centrifuge;
import mods.gregtech.ChemicalBath;
import mods.gregtech.ChemicalReactor;
import mods.gregtech.CuttingSaw;
import mods.gregtech.Electrolyzer;
import mods.gregtech.ForgeHammer;
import mods.gregtech.FormingPress;
import mods.gregtech.Mixer;
import mods.gregtech.PlasmaArcFurnace;
import mods.gregtech.PlateBender;
import mods.gregtech.WireAssembler;
import mods.nei.NEI;

print("Initializing 'GregTech.zs'...");

#==================================================================#
#Variables
var DiamondDust 			= <gregtech:gt.metaitem.01:2500>;
var nuggetIron 				= <gregtech:gt.metaitem.01:9032>;
var nuggetWIron 			= <gregtech:gt.metaitem.01:9304>;
var ingotWIron 				= <gregtech:gt.metaitem.01:11304>;
var MoldIngot 				= <gregtech:gt.metaitem.01:32306>;
var LVMotor 				= <gregtech:gt.metaitem.01:32600>;
var MVMotor 				= <gregtech:gt.metaitem.01:32601>;
var HVMotor 				= <gregtech:gt.metaitem.01:32602>;
var EVMotor 				= <gregtech:gt.metaitem.01:32603>;
var IVMotor 				= <gregtech:gt.metaitem.01:32604>;
var LUVMotor 				= <gregtech:gt.metaitem.01:32606>;
var ZPMMotor 				= <gregtech:gt.metaitem.01:32607>;
var UVMotor 				= <gregtech:gt.metaitem.01:32608>;
var pumpLV 				= <gregtech:gt.metaitem.01:32610>;
var pumpMV 				= <gregtech:gt.metaitem.01:32611>;
var pumpHV				= <gregtech:gt.metaitem.01:32612>;
var pumpEV				= <gregtech:gt.metaitem.01:32613>;
var pumpIV 				= <gregtech:gt.metaitem.01:32614>;
var pumpLUV 				= <gregtech:gt.metaitem.01:32620>;
var pumpZPM 				= <gregtech:gt.metaitem.01:32621>;
var moduleConveyorLV 			= <gregtech:gt.metaitem.01:32630>;
var moduleConveyorMV 			= <gregtech:gt.metaitem.01:32631>;
var moduleConveyorHV 			= <gregtech:gt.metaitem.01:32632>;
var moduleConveyorEV 			= <gregtech:gt.metaitem.01:32633>;
var moduleConveyorIV 			= <gregtech:gt.metaitem.01:32634>;
var moduleConveyorLUV 			= <gregtech:gt.metaitem.01:32636>;
var moduleConveyorZPM 			= <gregtech:gt.metaitem.01:32637>;
var moduleConveyorUV 			= <gregtech:gt.metaitem.01:32638>;
var pistonElectricLV 			= <gregtech:gt.metaitem.01:32640>;
var pistonElectricHV 			= <gregtech:gt.metaitem.01:32642>;
var pistonElectricEV 			= <gregtech:gt.metaitem.01:32643>;
var pistonElectricIV 			= <gregtech:gt.metaitem.01:32644>;
var robotArmLV 				= <gregtech:gt.metaitem.01:32650>;
var robotArmHV 				= <gregtech:gt.metaitem.01:32652>;
var robotArmEV 				= <gregtech:gt.metaitem.01:32653>;
var robotArmIV 				= <gregtech:gt.metaitem.01:32654>;
var FieldGeneratorHV 			= <gregtech:gt.metaitem.01:32672>;
var FieldGeneratorEV 			= <gregtech:gt.metaitem.01:32673>;
var fieldgenIV 				= <gregtech:gt.metaitem.01:32674>;
var fieldgenLUV 			= <gregtech:gt.metaitem.01:32675>;
var fieldgenZPM 			= <gregtech:gt.metaitem.01:32676>;
var emitterMV 				= <gregtech:gt.metaitem.01:32681>;
var emitterHV 				= <gregtech:gt.metaitem.01:32682>;
var emitterEV 				= <gregtech:gt.metaitem.01:32683>;
var emitterIV 				= <gregtech:gt.metaitem.01:32684>;
var emitterLUV 				= <gregtech:gt.metaitem.01:32685>;
var emitterZPM 				= <gregtech:gt.metaitem.01:32686>;
var sensorLV 				= <gregtech:gt.metaitem.01:32690>;
var sensorHV 				= <gregtech:gt.metaitem.01:32692>;
var sensorIV 				= <gregtech:gt.metaitem.01:32694>;
var sensorLUV 				= <gregtech:gt.metaitem.01:32695>;
var sensorZPM 				= <gregtech:gt.metaitem.01:32696>;
var fuelRodThorium 			= <gregtech:gt.Thoriumcell>;


var HullLV 				= <gregtech:gt.blockmachines:11>;
var HullMV 				= <gregtech:gt.blockmachines:12>;
var HullHV 				= <gregtech:gt.blockmachines:13>;
var HullEV 				= <gregtech:gt.blockmachines:14>;
var HullIV 				= <gregtech:gt.blockmachines:15>;
var HullUV 				= <gregtech:gt.blockmachines:18>;
var uraniumEnriched 			= <IC2:itemUran>;

// radiation attention! - for tiny/small dusts, dusts, ingots, plates
var radioativeMaterialsAsOre = [
	<ore:dustPlutonium>,  <ore:dustUranium235>,  <ore:dustPlutonium241>,  <ore:dustNaquadahEnriched>,  <ore:dustNaquadria>,
	<ore:ingotPlutonium>, <ore:ingotUranium235>, <ore:ingotPlutonium241>, <ore:ingotNaquadahEnriched>, <ore:ingotNaquadria>,
	<ore:platePlutonium>, <ore:plateUranium235>, <ore:platePlutonium241>, <ore:plateNaquadahEnriched>, <ore:plateNaquadria>,
	<ore:dustTinyPlutonium>, <ore:dustTinyUranium235>, <ore:dustTinyPlutonium241>, <ore:dustTinyNaquadahEnriched>, 
	<ore:dustTinyNaquadria>, <ore:dustSmallPlutonium>, <ore:dustSmallUranium235>, <ore:dustSmallPlutonium241>, 
	<ore:dustSmallNaquadahEnriched>, <ore:dustSmallNaquadria>, <ore:crushedNaquadahEnriched>, <ore:crushedPurifiedNaquadahEnriched>,
	<ore:crushedCentrifugedNaquadahEnriched>, <ore:dustPureNaquadahEnriched>, <ore:dustImpureNaquadahEnriched>,
	<ore:nuggetNaquadahEnriched>, <ore:plateDoubleNaquadahEnriched>, <ore:blockNaquadahEnriched>,
	<ore:oreRedgraniteNaquadahEnriched>, <ore:oreBlackgraniteNaquadahEnriched>, <ore:oreNaquadahEnriched>, 
	<ore:oreBasaltNaquadahEnriched>, <ore:oreMarbleNaquadahEnriched>, <ore:oreEndstoneNaquadahEnriched>, 
	<ore:oreNetherrackNaquadahEnriched>,
] as minetweaker.oredict.IOreDictEntry[];

for i, item in radioativeMaterialsAsOre{
	item.addTooltip("Danger: " + format.red("Radioactive"));
}

var radioativeMaterialsAsItem = [
	<IC2:itemPlutonium>, <IC2:itemPlutoniumSmall>, <IC2:itemRTGPellet>, 
	<IC2:itemUran>, <IC2:itemUran235>, <IC2:itemUran235small>, <IC2:itemUran238>, <IC2:itemMOX>,
	<IC2:reactorMOXSimpledepleted>, <IC2:reactorMOXDualdepleted>, <IC2:reactorMOXQuaddepleted>,
	<IC2:reactorUraniumSimpledepleted>, <IC2:reactorUraniumDualdepleted>, <IC2:reactorUraniumQuaddepleted>,
	<gregtech:gt.ThoriumcellDep>, <gregtech:gt.Double_ThoriumcellDep>, <gregtech:gt.Quad_ThoriumcellDep>,
	<gregtech:gt.reactorUraniumSimple>, <gregtech:gt.reactorUraniumDual>, <gregtech:gt.reactorUraniumQuad>,
	<gregtech:gt.reactorMOXSimple>, <gregtech:gt.reactorMOXDual>, <gregtech:gt.reactorMOXQuad>,
	<gregtech:gt.Naquadahcell>, <gregtech:gt.Double_Naquadahcell>, <gregtech:gt.Quad_Naquadahcell>,
	<gregtech:gt.NaquadahcellDep>, <gregtech:gt.Double_NaquadahcellDep>, <gregtech:gt.Quad_NaquadahcellDep>
] as minetweaker.item.IItemStack[];

for i, item in radioativeMaterialsAsItem{
	item.addTooltip("Danger: " + format.red("Radioactive"));
}

//add Gregtech dye recipes
var GTDyeBlack         = <gregtech:gt.metaitem.02:32414>;
var GTDyeRed           = <gregtech:gt.metaitem.02:32415>;
var GTDyeGreen         = <gregtech:gt.metaitem.02:32416>;
var GTDyeBrown         = <gregtech:gt.metaitem.02:32417>;
var GTDyeBlue          = <gregtech:gt.metaitem.02:32418>;
var GTDyePurple        = <gregtech:gt.metaitem.02:32419>;
var GTDyeCyan          = <gregtech:gt.metaitem.02:32420>;
var GTDyeLGray         = <gregtech:gt.metaitem.02:32421>;
var GTDyeGray          = <gregtech:gt.metaitem.02:32422>;
var GTDyePink          = <gregtech:gt.metaitem.02:32423>;
var GTDyeLime          = <gregtech:gt.metaitem.02:32424>;
var GTDyeYellow        = <gregtech:gt.metaitem.02:32425>;
var GTDyeLBlue         = <gregtech:gt.metaitem.02:32426>;
var GTDyeMagenta       = <gregtech:gt.metaitem.02:32427>;
var GTDyeOrange        = <gregtech:gt.metaitem.02:32428>;
var GTDyeWhite         = <gregtech:gt.metaitem.02:32429>;

#==================================================================#

# Recipe Fixes


#==================================================================#
#Nuggets fix
recipes.removeShapeless(<ore:nuggetIron>);
recipes.removeShapeless(<ore:nuggetGold>);

#==================================================================#
#Diamond dust-gem fix
recipes.removeShapeless(DiamondDust * 9, [<minecraft:diamond_block>]);
recipes.removeShapeless(<minecraft:diamond> * 9, [<minecraft:diamond_block>]);

#==================================================================#
#Lignite dust fix
recipes.removeShapeless(<gregtech:gt.metaitem.01:2538> * 9, [<gregtech:gt.blockgem2:1>]);

#==================================================================#
#Charcoal dust fix
recipes.removeShapeless(<gregtech:gt.metaitem.01:2536> * 9, [<gregtech:gt.blockgem3:4>]);

#==================================================================#
#Nuggets
AlloySmelter.addRecipe(ingotWIron, nuggetWIron * 9, MoldIngot * 0, 200, 2);
AlloySmelter.addRecipe(<minecraft:iron_ingot>, nuggetIron * 9, MoldIngot * 0, 201, 2);

#==================================================================#
#Uranium Ingot
AlloySmelter.addRecipe(<IC2:itemMOX>, <ore:ingotUranium>.firstItem * 6, <ore:ingotPlutonium>.firstItem * 3, 100, 48);
AlloySmelter.addRecipe(uraniumEnriched, <ore:ingotUranium>.firstItem * 6, <ore:nuggetUranium235>.firstItem * 3, 100, 48);

#==================================================================#
#Mold
recipes.remove(<gregtech:gt.metaitem.01:32300>);
mods.tconstruct.Casting.addTableRecipe(<gregtech:gt.metaitem.01:32300>, <liquid:steel.molten> * 576, null, false, 80);
Assembler.addRecipe(<gregtech:gt.metaitem.01:32300>, <ore:plateSteel>*4, <gregtech:gt.integrated_circuit:4>*0, null, 40, 8);

recipes.removeShaped(<ore:ingotLead>, [
[<ore:nuggetLead>, <ore:nuggetLead>, <ore:nuggetLead>],
[<ore:nuggetLead>, <ore:nuggetLead>, <ore:nuggetLead>],
[<ore:nuggetLead>, <ore:nuggetLead>, <ore:nuggetLead>]]);

recipes.removeShaped(<ore:ingotGold>, [
[<ore:nuggetGold>, <ore:nuggetGold>, <ore:nuggetGold>],
[<ore:nuggetGold>, <ore:nuggetGold>, <ore:nuggetGold>],
[<ore:nuggetGold>, <ore:nuggetGold>, <ore:nuggetGold>]]);

#==================================================================#
#Stick Fix
recipes.removeShaped(<minecraft:stick>);
recipes.addShaped(<minecraft:stick>, [
		[<ore:craftingToolSaw>], 
		[<minecraft:tallgrass>]
	]
);
recipes.addShaped(<minecraft:stick>, [
		[<ore:craftingToolSaw>], 
		[<minecraft:deadbush>]
	]
);
recipes.addShaped(<minecraft:stick>, [
		[<ore:craftingToolSaw>], 
		[<ore:treeSapling>]
	]
);
recipes.addShaped(<minecraft:stick> * 2, [
		[<ore:craftingToolSaw>], 
		[<ore:stickLongWood>]
	]
);
recipes.addShaped(<minecraft:stick> * 2, [
		[<ore:plankWood>], 
		[<ore:plankWood>]
	]
);
recipes.addShaped(<minecraft:stick> * 4, [
		[<ore:craftingToolSaw>], 
		[<ore:plankWood>], 
		[<ore:plankWood>]
	]
);

#==================================================================#
#Clay ball
Autoclave.addRecipe(<minecraft:clay_ball>, <gregtech:gt.metaitem.01:2805>, <liquid:water> * 250, 10000, 20, 2);

#==================================================================#
#Dyes
recipes.addShapeless(GTDyeBlack,     [<ore:dyeBlack>         ]);
recipes.addShapeless(GTDyeRed,       [<ore:dyeRed>           ]);
recipes.addShapeless(GTDyeGreen,     [<ore:dyeGreen>         ]);
recipes.addShapeless(GTDyeBrown,     [<ore:dyeBrown>         ]);
recipes.addShapeless(GTDyeBlue,      [<ore:dyeBlue>          ]);
recipes.addShapeless(GTDyePurple,    [<ore:dyePurple>        ]);
recipes.addShapeless(GTDyeCyan,      [<ore:dyeCyan>          ]);
recipes.addShapeless(GTDyeLGray,     [<ore:dyeLightGray>     ]);
recipes.addShapeless(GTDyeGray,      [<ore:dyeGray>          ]);
recipes.addShapeless(GTDyePink,      [<ore:dyePink>          ]);
recipes.addShapeless(GTDyeLime,      [<ore:dyeLime>          ]);
recipes.addShapeless(GTDyeYellow,    [<ore:dyeYellow>        ]);
recipes.addShapeless(GTDyeLBlue,     [<ore:dyeLightBlue>     ]);
recipes.addShapeless(GTDyeMagenta,   [<ore:dyeMagenta>       ]);
recipes.addShapeless(GTDyeOrange,    [<ore:dyeOrange>        ]);
recipes.addShapeless(GTDyeWhite,     [<ore:dyeWhite>         ]);

#==================================================================#
#Wood Pulp
recipes.addShapeless(<gregtech:gt.metaitem.01:2809> * 2, [<ore:craftingToolMortar>, <ore:logWood>]);

#==================================================================#
#Brick Dust
recipes.addShapeless(<gregtech:gt.metaitem.01:1625>, [<ore:craftingToolMortar>, <minecraft:brick>]);

// --- Long Plastic Rood
//recipes.addShaped(<gregtech:gt.metaitem.02:22874>, [[<ore:stickPlastic>, <ore:craftingToolHardHammer>, <ore:stickPlastic>]]);

// --- Apatite Stick
//ForgeHammer.addRecipe(<gregtech:gt.metaitem.02:22530>, <ore:stickApatite>*2, 55, 16);
//recipes.addShaped(<gregtech:gt.metaitem.02:22530>, [[<ore:stickApatite>,<ore:craftingToolHardHammer>,<ore:stickApatite>]]);

//ForgeHammer.addRecipe(<gregtech:gt.metaitem.02:22526>, <ore:stickLapis>*2, 55, 16);
//recipes.addShaped(<gregtech:gt.metaitem.02:22526>, [[<ore:stickLapis>,<ore:craftingToolHardHammer>,<ore:stickLapis>]]);

#==================================================================#
#Flour
recipes.addShaped(<gregtech:gt.metaitem.01:2881>, [
		[<ore:cropBarley>, null, null],
		[<ore:craftingToolMortar>, null, null]
	]
);
recipes.addShaped(<gregtech:gt.metaitem.01:2881>, [
		[<ore:cropWheat>, null, null],
		[<ore:craftingToolMortar>, null, null]
	]
);
recipes.addShaped(<gregtech:gt.metaitem.01:2881>, [
		[<ore:cropRye>, null, null],
		[<ore:craftingToolMortar>, null, null]
	]
);
recipes.addShaped(<gregtech:gt.metaitem.01:2881>, [
		[<ore:cropOats>, null, null],
		[<ore:craftingToolMortar>, null, null]
	]
);

#==================================================================#
#Tantal
recipes.addShaped(<gregtech:gt.metaitem.01:32499>*2, [
		[null, <ore:foilManganese>, null], 
		[<ore:foilManganese>,<ore:dustTantalum>,<ore:foilManganese>], 
		[<ore:boltIron>,null,<ore:boltIron>]
	]
);

#==================================================================#

<gregtech:gt.blockmachines:12736>.displayName = "Mega Input Hatch";
<gregtech:gt.blockmachines:12737>.displayName = "Mega Output Hatch";

print("Initialized 'GregTech.zs'");
