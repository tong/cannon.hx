package cannon;

@:native("CANNON.RigidBody")
extern class RigidBody extends Particle {
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
}
