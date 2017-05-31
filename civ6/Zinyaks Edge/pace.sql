-----------------------------------------------
-- Technology cost
-----------------------------------------------
UPDATE Technologies SET Cost = Cost*2.0 WHERE EraType ='ERA_ANCIENT'; 
UPDATE Technologies SET Cost = Cost*2.0 WHERE EraType ='ERA_CLASSICAL';
UPDATE Technologies SET Cost = Cost*2.2	WHERE EraType ='ERA_MEDIEVAL';
UPDATE Technologies SET Cost = Cost*2.4	WHERE EraType ='ERA_RENAISSANCE';
UPDATE Technologies SET Cost = Cost*2.6	WHERE EraType ='ERA_INDUSTRIAL';
UPDATE Technologies SET Cost = Cost*3.5	WHERE EraType ='ERA_MODERN';
UPDATE Technologies SET Cost = Cost*4.0	WHERE EraType ='ERA_ATOMIC';
UPDATE Technologies SET Cost = Cost*4.5	WHERE EraType ='ERA_INFORMATION';

-- Civics cost
-----------------------------------------------
UPDATE Civics SET Cost = Cost*2.0 WHERE EraType ='ERA_ANCIENT'; 
UPDATE Civics SET Cost = Cost*2.5 WHERE EraType ='ERA_CLASSICAL';
UPDATE Civics SET Cost = Cost*4.0 WHERE EraType ='ERA_MEDIEVAL';
UPDATE Civics SET Cost = Cost*5.5 WHERE EraType ='ERA_RENAISSANCE';
UPDATE Civics SET Cost = Cost*7.0 WHERE EraType ='ERA_INDUSTRIAL';
UPDATE Civics SET Cost = Cost*8.5 WHERE EraType ='ERA_MODERN';
UPDATE Civics SET Cost = Cost*10.0 WHERE EraType ='ERA_ATOMIC';
UPDATE Civics SET Cost = Cost*11.5 WHERE EraType ='ERA_INFORMATION';

-----------------------------------------------
-- Building and Unit Cost
-----------------------------------------------
UPDATE Buildings SET Cost = Cost*0.5;
UPDATE Districts SET Cost = Cost*1.5;
UPDATE Units SET Cost = Cost*2.5;

-----------------------------------------------
-- Great people only by project 
-----------------------------------------------
UPDATE District_GreatPersonPoints SET PointsPerTurn = 0;
UPDATE Project_GreatPersonPoints SET Points = Points * 3;

------ 
---- ROADS
UPDATE Routes SET MovementCost = 0.75 WHERE RouteType = "ROUTE_ANCIENT_ROAD";
UPDATE Routes SET MovementCost = 0.50 WHERE RouteType = "ROUTE_MEDIEVAL_ROAD";
UPDATE Routes SET MovementCost = 0.25 WHERE RouteType = "ROUTE_INDUSTRIAL_ROAD";
UPDATE Routes SET MovementCost = 0.10 WHERE RouteType = "ROUTE_MODERN_ROAD";

------
---- PILLAGING 
UPDATE Improvements SET PlunderAmount = PlunderAmount * 10;
UPDATE Districts SET PlunderAmount = PlunderAmount * 20;
UPDATE Improvements SET DispersalGold = DispersalGold * 50 WHERE ImprovementType="IMPROVEMENT_BARBARIAN_CAMP";

----
----- Change expansion 

UPDATE DiplomaticActions SET InitiatorPrereqCivic = "CIVIC_EARLY_EMPIRE" WHERE DiplomaticActionType="DIPLOACTION_DECLARE_TERRITORIAL_WAR";

/*
------
-- border expansion 
-- Declare the new modifier type in the Types table. We'll call it "MODIFIER_ALL_CITIES_CHANGE_BORDER_EXPANSION_RATE".
INSERT INTO Types (Type, Kind)
VALUES ('MODIFIER_ALL_CITIES_CHANGE_BORDER_EXPANSION_RATE', 'KIND_MODIFIER');

-- Create the modifier type. The GameEffect we want is "EFFECT_ADJUST_CITY_CULTURE_BORDER_EXPANSION". We also want the modifier to apply to all cities, hence the CollectionType "COLLECTION_ALL_CITIES".
INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES ('MODIFIER_ALL_CITIES_CHANGE_BORDER_EXPANSION', 'COLLECTION_ALL_CITIES', 'EFFECT_ADJUST_CITY_CULTURE_BORDER_EXPANSION');

-- Create the modifier proper. We'll call it "CHANGE_BORDER_EXPANSION_RATE".
INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES ('CHANGE_BORDER_EXPANSION_RATE', 'MODIFIER_ALL_CITIES_CHANGE_BORDER_EXPANSION_RATE');

-- This specifies that we want the change to be 50%.
INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('CHANGE_BORDER_EXPANSION_RATE', 'Amount', '100');

-- Attach the modifier to the game.
INSERT INTO GameModifiers (ModifierId)
VALUES ('CHANGE_BORDER_EXPANSION_RATE');

*/
