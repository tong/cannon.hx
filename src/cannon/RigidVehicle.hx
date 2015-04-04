package cannon;

/**
	Simple vehicle helper class with spherical rigid body wheels.
*/
@:native("CANNON.RigidVehicle")
extern class RigidVehicle {

	var coordinateSystem : Vec3;

	var chassisBody : Body;

	var constraints : Array<Dynamic>;

	function new( ?options.chassisBody : Body ) : Void;

	/**
		Add a wheel
	*/
	function addWheel( options : Dynamic ) : Void;

	/**
		Set the steering value of a wheel.
	*/
	function setSteeringValue( value : Float, wheelIndex : Int ) : Void;

	/**
		Set the target rotational speed of the hinge constraint.
	*/
	function setMotorSpeed( value : Float, wheelIndex : Int ) : Void;

	/**
		Set the target rotational speed of the hinge constraint.
	*/
	function disableMotor( value : Float, wheelIndex : Int ) : Void;

	/**
		Set the wheel force to apply on one of the wheels each time step
	*/
	function setWheelForce( value : Float, wheelIndex : Int ) : Void;

	/**
		Apply a torque on one of the wheels.
	*/
	function applyWheelForce( value : Float, wheelIndex : Int ) : Void;

	/**
		Add the vehicle including its constraints to the world.
	*/
	function addToWorld( world : World ) : Void;

	/**
		Remove the vehicle including its constraints from the world.
	*/
	function removeFromWorld( world : World ) : Void;

	/**
		Get current rotational velocity of a wheel
	*/
	function getWheelSpeed( wheelIndex : Int ) : Void;

}
