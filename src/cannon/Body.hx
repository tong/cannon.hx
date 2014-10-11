package cannon;

typedef BodyOptions = Dynamic;
/*
{
	@:optional var position : vec3;
	@:optional var position : vec3;
	@:optional var position : vec3;
	@:optional var position : vec3;
};
*/

@:native("CANNON.Body")
extern class Body extends EventTarget {

	static var DYNAMIC(default,null) : Int;
	static var STATIC(default,null) : Int;
	static var KINEMATIC(default,null) : Int;
	static var AWAKE(default,null) : Int;
	static var SLEEPY(default,null) : Int;
	static var SLEEPING(default,null) : Int;

	var id : Int;
	var aabb : AABB;
	var aabbNeedsUpdate : Bool;
	var allowSleep : Bool;
	var angularDamping : Float;
	var angularVelocity : Vec3;
	var collisionFilterGroup : Int;
	var collisionFilterMask : Int;
	var collisionResponse : Bool;
	var fixedRotation : Bool;
	var linearDamping : Float;
	var force : Vec3;
	var inertia : Vec3;
	var initAngularVelocity : Vec3;
	var initPosition : Vec3;
	var initQuaternion : Quaternion;
	var initVelocity : Vec3;
	var invInertia : Vec3;
	var invInertiaSolve : Vec3;
	var invInertiaWorld : Mat3;
	var invInertiaWorldSolve : Mat3;
	var invMass : Float;
	var mass : Float;
	var material : Material;
	var position : Vec3;
	var previousPosition : Vec3;
	var quaternion : Quaternion;
	var shapeOffsets : Array<Vec3>;
	var shapeOrientations : Array<Quaternion>;
	var shapes : Array<Dynamic>;
	var sleepSpeedLimit : Float;
	var sleepState : Int;
	var sleepTimeLimit : Float;
	var type : Int;
	var tau : Vec3;
	var velocity : Vec3;
	var world : World;
	var preStep : Void->Void;
	var postStep : Void->Void;

	function new( options : BodyOptions ) : Void;

	function applyForce( force : Vec3, worldPoint : Vec3 ) : Void;
	function applyImpulse( impulse : Vec3, worldPoint : Vec3 ) : Void;
	function computeAABB() : Void;
	function getVelocityAtWorldPoint( worldPoint : Vec3, result : Vec3 ) : Vec3;
	function pointToLocalFrame( worldPoint : Vec3, ?result : Vec3 ) : Vec3;
	function pointToWorldFrame( localPoint : Vec3, ?result : Vec3 ) : Vec3;
	function sleep() : Void;
	function sleepTick( time : Float ) : Void;
	function updateBoundingRadius() : Void;
	function updateInertiaWorld( force : Dynamic ) : Void;
	function updateMassProperties() : Void;
	function updateSolveMassProperties() : Void;
	function wakeUp() : Void;

	function vectorToWorldFrame( localVector : Vec3, ?result : Vec3 ) : Vec3;
	function addShape( shape : Shape, ?offset : Vec3, ?orientation : Vec3 ) : Vec3;
}
