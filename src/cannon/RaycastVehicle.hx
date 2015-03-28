package cannon;

@:native("CANNON.RaycastVehicle")
extern class RaycastVehicle {
	var chassisBody : Body;
	var wheelInfos : Array<Dynamic>;

	function new( options : Dynamic ) : Void;
	function addWheel( options : Dynamic ) : Void;
	function setSteeringValue( value : Float, wheelIndex : Int ) : Void;
	function applyEngineForce( value : Float, wheelIndex : Int ) : Void;
	function setBrake( value : Float, wheelIndex : Int ) : Void;
	function addToWorld( world : World ) : Void;
	function getVehicleAxisWorld( axisIndex : Int, result : Vec3 ) : Void;
	function updateVehicle( timeStep : Float ) : Void;
	function updateSuspension( deltaTime : Float ) : Void;
	function removeFromWorld( world : World ) : Void;
	function castRay( wheel : Dynamic ) : Void;
	function updateWheelTransformWorld( wheel : Dynamic ) : Void;
	function updateWheelTransform( wheelIndex : Int ) : Void;
	function getWheelTransformWorld( wheelIndex : Int ) : Dynamic;
	function updateFriction( timeStep : Float ) : Void;
}
