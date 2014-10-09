package cannon;

@:native("CANNON.Particle")
extern class Particle extends Shape {
	function new() : Void;
	//function calculateLocalInertia() : Void;
}

/*
@:native("CANNON.Particle")
extern class Particle extends Body {
	var position : Vec3;
	var initPosition : Vec3;
	var velocity : Vec3;
	var initVelocity : Vec3;
	var force : Vec3;
	var mass : Float;
	var invMass : Float;
	var material : Material;
	var linearDamping : Float;
	var motionstate : Int;
	var allowSleep : Bool;
	var sleepState : Int;
	var sleepSpeedLimit : Float;
	var sleepTimeLimit : Float;
	var timeLastSleepy : Float;
	function new( mass : Float, material : Material ) : Void;
	function isAwake() : Bool;
	function isSleepy() : Bool;
	function isSleeping() : Bool;
	function wakeUp() : Void;
	function sleep() : Void;
	function sleepTick( time : Float ) : Void;
}
*/
