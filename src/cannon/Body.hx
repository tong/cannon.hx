package cannon;

/**
	Base class for all body types.
*/
@:native("CANNON.Body")
extern class Body extends EventTarget {

	/**
		Reference to the world the body is living in
	*/
	var world : World;

	/**
		Callback function that is used BEFORE stepping the system. Use it to apply forces, for example. Inside the function, "this" will refer to this Body object.
	*/
	var preStep : Void->Void;

	/**
		Callback function that is used AFTER stepping the system. Inside the function, "this" will refer to this Body object.
	*/
	var postStep : Void->Void;

	var collisionFilterGroup : Float;

	var collisionFilterMask : Float;

	/**
		Whether to produce contact forces when in contact with other bodies. Note that contacts will be generated, but they will be disabled.
	*/
	var collisionResponse : Float;

	var position : Vec3;

	var previousPosition : Vec3;

	/**
		Initial position of the body
	*/
	var initPosition : Vec3;

	var velocity : Vec3;

	var initVelocity : Vec3;

	/**
		Linear force on the body
	*/
	var force : Vec3;

	var mass : Float;

	var invMass : Float;

	var material : Material;

	var linearDamping : Float;

	/**
		One of: Body.DYNAMIC, Body.STATIC and Body.KINEMATIC.
	*/
	var type : Float;

	/**
		If true, the body will automatically fall to sleep.
	*/
	var allowSleep : Bool;

	/**
		Current sleep state.
	*/
	var sleepState : Float;

	/**
		If the speed (the norm of the velocity) is smaller than this value, the body is considered sleepy.
	*/
	var sleepSpeedLimit : Float;

	/**
		If the body has been sleepy for this sleepTimeLimit seconds, it is considered sleeping.
	*/
	var sleepTimeLimit : Float;

	/**
		Rotational force on the body, around center of mass
	*/
	var torque : Vec3;

	/**
		Orientation of the body
	*/
	var quaternion : Quaternion;

	var initQuaternion : Quaternion;

	var angularVelocity : Vec3;

	var initAngularVelocity : Vec3;

	var shapes : Array<Dynamic>;

	var shapeOffsets : Array<Dynamic>;

	var shapeOrientations : Array<Dynamic>;

	var inertia : Vec3;

	var invInertia : Vec3;

	var invInertiaWorld : Mat3;

	var invInertiaSolve : Vec3;

	var invInertiaWorldSolve : Mat3;

	/**
		Set to true if you don't want the body to rotate. Make sure to run .updateMassProperties() after changing this.
	*/
	var fixedRotation : Bool;

	var angularDamping : Float;

	var aabb : AABB;

	/**
		Indicates if the AABB needs to be updated before use.
	*/
	var aabbNeedsUpdate : Bool;

	/**
		A dynamic body is fully simulated. Can be moved manually by the user, but normally they move according to forces. A dynamic body can collide with all body types. A dynamic body always has finite, non-zero mass.
	*/
	static var DYNAMIC : Float;

	/**
		A static body does not move during simulation and behaves as if it has infinite mass. Static bodies can be moved manually by setting the position of the body. The velocity of a static body is always zero. Static bodies do not collide with other static or kinematic bodies.
	*/
	static var STATIC : Float;

	/**
		A kinematic body moves under simulation according to its velocity. They do not respond to forces. They can be moved manually, but normally a kinematic body is moved by setting its velocity. A kinematic body behaves as if it has infinite mass. Kinematic bodies do not collide with other static or kinematic bodies.
	*/
	static var KINEMATIC : Float;

	static var AWAKE : Float;

	static var SLEEPY : Float;

	static var SLEEPING : Float;

	function new( ?options : Dynamic ) : Void;

	/**
		Wake the body up.
	*/
	function wakeUp() : Void;

	/**
		Force body sleep
	*/
	function sleep() : Void;

	/**
		Called every timestep to update internal sleep timer and change sleep state if needed.
	*/
	function sleepTick( time : Float ) : Void;

	/**
		If the body is sleeping, it should be immovable / have infinite mass during solve. We solve it by having a separate "solve mass".
	*/
	function updateSolveMassProperties() : Void;

	/**
		Convert a world point to local body frame.
	*/
	function pointToLocalFrame( worldPoint : Vec3, result : Vec3 ) : Vec3;

	/**
		Convert a world vector to local body frame.
	*/
	function vectorToLocalFrame( worldPoint : Vec3, result : Vec3 ) : Vec3;

	/**
		Convert a local body point to world frame.
	*/
	function pointToWorldFrame( localPoint : Vec3, result : Vec3 ) : Vec3;

	/**
		Convert a local body point to world frame.
	*/
	function vectorToWorldFrame( localVector : Vec3, result : Vec3 ) : Vec3;

	/**
		Add a shape to the body with a local offset and orientation.
	*/
	function addShape( shape : Shape, _offset : Vec3, _orientation : Quaternion ) : Body;

	/**
		Update the bounding radius of the body. Should be done if any of the shapes are changed.
	*/
	function updateBoundingRadius() : Void;

	/**
		Updates the .aabb
	*/
	function computeAABB() : Void;

	/**
		Update .inertiaWorld and .invInertiaWorld
	*/
	function updateInertiaWorld() : Void;

	/**
		Apply force to a world point. This could for example be a point on the Body surface. Applying force this way will add to Body.force and Body.torque.
	*/
	function applyForce( force : Vec3, worldPoint : Vec3 ) : Void;

	/**
		Apply force to a local point in the body.
	*/
	function applyLocalForce( force : Vec3, localPoint : Vec3 ) : Void;

	/**
		Apply impulse to a world point. This could for example be a point on the Body surface. An impulse is a force added to a body during a short period of time (impulse = force * time). Impulses will be added to Body.velocity and Body.angularVelocity.
	*/
	function applyImpulse( impulse : Vec3, worldPoint : Vec3 ) : Void;

	/**
		Apply locally-defined impulse to a local point in the body.
	*/
	function applyLocalImpulse( force : Vec3, localPoint : Vec3 ) : Void;

	/**
		Should be called whenever you change the body shape or mass.
	*/
	function updateMassProperties() : Void;

	/**
		Get world velocity of a point in the body.
	*/
	function getVelocityAtWorldPoint( worldPoint : Vec3, result : Vec3 ) : Vec3;

}
