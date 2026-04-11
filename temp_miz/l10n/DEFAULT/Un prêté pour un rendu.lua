-- Settings MOOSE
_SETTINGS:SetPlayerMenuOff()



-- RECOVERYTANKER
ArcoRoosevelt = RECOVERYTANKER:New(UNIT:FindByName("Roos"), "Tanker PA")
ArcoRoosevelt:SetRadio(271)
ArcoRoosevelt:SetAltitude(12000)
ArcoRoosevelt:SetSpeed(350)
ArcoRoosevelt:SetTACAN(15, "ARC")
ArcoRoosevelt:SetTakeoffHot()
ArcoRoosevelt:Start()

-- RESCUE HELO
RescueHeloRoosevelt = RESCUEHELO:New(UNIT:FindByName("Roos"), "Rescue")
RescueHeloRoosevelt:SetTakeoffHot()
RescueHeloRoosevelt:SetRescueOn()
RescueHeloRoosevelt:Start()


---RAT
 
RAT.ATCswitch = false

local Turk=RAT:New("RAT_Turk")
Turk:SetCoalition("sameonly")
Turk:SetTakeoffCold()
Turk:Spawn(2)


local Syrie=RAT:New("RAT_Syrie")
Syrie:SetCoalition("sameonly")
Syrie:SetTakeoffCold()
Syrie:Spawn(2)

local Syrie2=RAT:New("RAT_Syrie2")
Syrie2:SetCoalition("sameonly")
Syrie2:SetTakeoffCold()
Syrie2:Spawn(3)


--- CAP Red
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes( { "EWR Red" } )
DetectionSetGroup:FilterStart()



Detection = DETECTION_AREAS:New( DetectionSetGroup, 120000 )

-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )


-- Initialize the dispatcher, setting up a radius of 100km where any airborne friendly 
-- without an assignment within 100km radius from a detected target, will engage that target.
A2ADispatcher:SetEngageRadius( 120000 )



-- Test intercept.
A2ADispatcher:SetIntercept( 450 )


-- Setup the squadrons.

A2ADispatcher:SetSquadron( "Incirlik", AIRBASE.Syria.Incirlik, { "SQ CCCP F-16CM bl.50" }, 2 )
A2ADispatcher:SetSquadronCap( "Incirlik", ZONE:New( "PatrolZone" ), 4000, 8000, 600, 800, 1000, 1300 )
A2ADispatcher:SetSquadronCapInterval("Incirlik", 2, 30, 600, 1 ) 
A2ADispatcher:SetSquadronGci( "Incirlik", 900, 1200 )



A2ADispatcher:SetDefaultTakeoffFromParkingCold( "Incirlik" )
A2ADispatcher:SetDefaultFuelThreshold( 0.3 )
A2ADispatcher:SetDefaultTanker( "Tanker" )
 





