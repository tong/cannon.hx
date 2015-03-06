package cannon;

@:native("CANNON.RigidVehicle")
extern class RigidVehicle {
	var coordinateSystem : Vec3;
	var chassisBody : Body;
	var wheelBodies : Array<Body>;
	function new( options : Dynamic ) : Void;
	function addWheel( options : Dynamic ) : Void;
	function setSteeringValue( value : Float, wheelIndex : Int ) : Void;
	function setMotorSpeed( value : Float, wheelIndex : Int ) : Void;
	function disableMotor( wheelIndex : Int ) : Void;
	function setWheelForce( value : Float, wheelIndex : Int ) : Void;
	function applyWheelForce( value : Float, wheelIndex : Int ) : Void;
	function addToWorld( world : World ) : Void;
	function removeFromWorld( world : World ) : Void;
	function getWheelSpeed( wheelIndex : Int ) : Float;
}
