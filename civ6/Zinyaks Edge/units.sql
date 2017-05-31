-----------------------------------------------
-- Range units
-----------------------------------------------

update Units set
	FormationClass='FORMATION_CLASS_SUPPORT'
where 
	UnitType in ('UNIT_SLINGER', 'UNIT_ARCHER', 'UNIT_CROSSBOWMAN', 'UNIT_FIELD_CANNON', 'UNIT_MACHINE_GUN')
	or UnitType in ('UNIT_CATAPULT', 'UNIT_BOMBARD', 'UNIT_ARTILLERY', 'UNIT_ROCKET_ARTILLERY')
	or UnitType in ('UNIT_HORSEMAN', 'UNIT_CAVALRY', 'UNIT_HELICOPTER');


update Units set
	FormationClass='FORMATION_CLASS_CIVILIAN'
where 
	UnitType in ('UNIT_MEDIC', 'UNIT_MILITARY_ENGINEER');


update Units set
--	RangedCombat = RangedCombat * 0.5,
	Combat = Combat * 0.5
where 
	RangedCombat <> 0;


-- Faster civilians
update Units set 
	BaseMoves = BaseMoves + 2
where 
	FormationClass='FORMATION_CLASS_CIVILIAN';


--- military engineers 
update Units set
	BuildCharges = 5
where 
	UnitType in ('UNIT_MILITARY_ENGINEER');