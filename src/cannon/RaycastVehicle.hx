package cannon;

/**
	Vehicle helper class that casts rays from the wheel positions towards the ground and applies forces.
*/
@:native("CANNON.RaycastVehicle")
extern class RaycastVehicle {

	var chassisBody : Body;

	/**
		An array of WheelInfo objects.
	*/
	var wheelInfos : Array<Dynamic>;

	/**
		Will be set to true if the car is sliding.
	*/
	var sliding : Bool;

	var world : World;

	/**
		Index of the right axis, 0=x, 1=y, 2=z
	*/
	var indexRightAxis : Int;

	/**
		Index of the forward axis, 0=x, 1=y, 2=z
	*/
	var indexForwardAxis : Int;

	/**
		Index of the up axis, 0=x, 1=y, 2=z
	*/
	var indexUpAxis : Int;

	function new( ?options : Dynamic ) : Void;

	/**
		Add a wheel. For information about the options, see WheelInfo.
	*/
	function addWheel( options : Dynamic ) : Void;

	/**
		Set the steering value of a wheel.
	*/
	function setSteeringValue( value : Float, wheelIndex : Int ) : Void;

	/**
		Set the wheel force to apply on one of the wheels each time step
	*/
	function applyEngineForce( value : Float, wheelIndex : Int ) : Void;

	/**
		Set the braking force of a wheel
	*/
	function setBrake( brake : Float, wheelIndex : Int ) : Void;

	/**
		Add the vehicle including its constraints to the world.
	*/
	function addToWorld( world : World ) : Void;

	/**
		Get one of the wheel axles, world-oriented.
	*/
	function getVehicleAxisWorld( axisIndex : Int, result : Vec3 ) : Void;

	/**
		Remove the vehicle including its constraints from the world.
	*/
	function removeFromWorld( world : World ) : Void;

	/**
		Update one of the wheel transform.
Note when rendering wheels: during each step, wheel transforms are updated BEFORE the chassis; ie. their position becomes invalid after the step. Thus when you render wheels, you must update wheel transforms before rendering them. See raycastVehicle demo for an example.
	*/
	function updateWheelTransform( wheelIndex : Int ) : Void;

	/**
		Get the world transform of one of the wheels
	*/
	function getWheelTransformWorld( wheelIndex : Int ) : Transform;

}
