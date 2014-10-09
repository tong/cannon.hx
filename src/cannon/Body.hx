package cannon;

typedef BodyOptions = Dynamic;

@:native("CANNON.Body")
extern class Body extends EventTarget {

	static var DYNAMIC(default,null) : Int;
	static var STATIC(default,null) : Int;
	static var KINEMATIC(default,null) : Int;
	static var AWAKE(default,null) : Int;
	static var SLEEPY(default,null) : Int;
	static var SLEEPING(default,null) : Int;

	var id : Int;
	var velocity : Vec3;
	var angularVelocity : Vec3;
	var angularDamping : Float;
	var position : Vec3;
	var quaternion : Quaternion;
	var linearDamping : Float;

	function new( options : BodyOptions ) : Void;

	function wakeUp() : Void;
	function sleep() : Void;
	function sleepTick( time : Float ) : Void;
	function updateSolveMassProperties() : Void;
	function pointToLocalFrame( worldPoint : Vec3, ?result : Vec3 ) : Vec3;
	function pointToWorldFrame( localPoint : Vec3, ?result : Vec3 ) : Vec3;
	function vectorToWorldFrame( localVector : Vec3, ?result : Vec3 ) : Vec3;
	function addShape( shape : Shape, ?offset : Vec3, ?orientation : Vec3 ) : Vec3;
	function updateBoundingRadius() : Void;
	function computeAABB() : Void;
	function updateInertiaWorld( force : Dynamic ) : Void;
	function applyForce( force : Dynamic, worldPoint : Vec3 ) : Void;
	function applyImpulse( impulse : Dynamic, worldPoint : Vec3 ) : Void;
	function updateMassProperties() : Void;
	function getVelocityAtWorldPoint( worldPoint : Vec3, result : Vec3 ) : Vec3;
	

	/*
	var tau : Vec3;
	var quaternion : Quaternion;
	var initQuaternion : Quaternion;
	var angularVelocity : Vec3;
	var initAngularVelocity : Vec3;
	var shape : Shape;
	var inertia : Vec3;
	var inertiaWorld : Vec3;
	var inertiaWorldAutoUpdate : Bool;
	var angularDamping : Float;
	var aabbmin : Vec3;
	var aabbmax : Vec3;
	var aabbNeedsUpdate : Bool;
	var wlambda : Vec3;
	function new( mass : Float, shape : Shape, ?material : Material ) : Void;
	function computeAABB() : Void;
	function applyForce( force : Vec3, worldPoint : Vec3 ) : Void;
	function applyImpulse( impulse : Vec3, worldPoint : Vec3 ) : Void;
	*/
}
