
-- Tree Grower Mod

local MaximumUses = 20

function SteamDetails()

  -- Setting of Steam details

  ModBase.SetSteamWorkshopDetails("Tree Grower Mod", [[
    Use some magic water to revitalize a tree stump back into a tree!

    Recipe:
    1x Log
    1x Stick

    Can be used 20 times before breaking. Watering takes 7.5 seconds.

    Usage:
    Go to a tree stump and water it
    It'll magically transform into a pine tree!

    Feel free to reach out
    Discord: TruthOrLie#6974
    
  ]], {"tree", "toolcompo"}, "test.png")
  
end

function Expose()

	-- Exposed variables
  ModBase.ExposeVariable("Maximum Uses", MaximumUses, MaxUseCallback, 0, 20)
  
end

function MaxUseCallback( param )

  MaximumUses = param

end

function Creation()
  
  -- Creation of any new custom objects like converters, food, holdables, buildings etc. go here
  
  ModTool.CreateTool("Tree Grower", {"Stick", "Log"}, {1, 1}, {"TreeStump"}, {}, {}, {}, 7.5, "Models/Tools/ToolWateringCan", false, TreeGrowerCallback, true)

end

function TreeGrowerCallback(UserUID, TileX, TileY, TargetUID, TargetType)

  ModDebug.Log("Tree Grower - Grew a new Tree!")
  ModBase.SpawnItem("TreePine", TileX, TileY)
  -- ModSound.PlayCustomSound("cymbal-crash")

end

function BeforeLoad()

  -- Before Load Function - Pre-loading of map calls go here
  ModVariable.AddRecipeToConverter("Workbench", "Tree Grower", 1)
  ModVariable.SetVariableForObjectAsInt("Tree Grower", "MaxUsage", MaximumUses)

end