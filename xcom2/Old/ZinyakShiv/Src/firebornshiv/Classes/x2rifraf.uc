class X2rifraf extends X2Effect_SpawnUnit;
 
function OnSpawnComplete(const out EffectAppliedData ApplyEffectParameters, StateObjectReference NewUnitRef, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
    local XComGameState_Unit teslaGameState;
    teslaGameState = XComGameState_Unit(NewGameState.GetGameStateForObjectID(NewUnitRef.ObjectID));
	`log("wtf");

    teslaGameState.kAppearance.bGhostPawn = true;
}

function vector GetSpawnLocation(const out EffectAppliedData ApplyEffectParameters, XComGameState NewGameState)
{
	local Vector DropPosition;

	DropPosition = ApplyEffectParameters.AbilityInputContext.TargetLocations[0];

	if(ApplyEffectParameters.AbilityInputContext.TargetLocations.Length == 0)
	{
		`Redscreen("didnt work");
		return vect(0,0,0);
	}
	
	return DropPosition;
}

function ETeam GetTeam(const out EffectAppliedData ApplyEffectParameters)
{
	return GetSourceUnitsTeam(ApplyEffectParameters);
}

defaultproperties
{
	UnitToSpawnName="shiv_tesla"
	bKnockbackAffectsSpawnLocation=false
}

 
