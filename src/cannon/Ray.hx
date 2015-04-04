package cannon;

/**
	A line in 3D space that intersects bodies and return points.
*/
@:native("CANNON.Ray")
extern class Ray {

	var from : Vec3;

	var to : Vec3;

	var _direction : Vec3;

	/**
		The precision of the ray. Used when checking parallelity etc.
	*/
	var precision : Float;

	/**
		Set to true if you want the Ray to take .collisionResponse flags into account on bodies and shapes.
	*/
	var checkCollisionResponse : Bool;

	/**
		If set to true, the ray skips any hits with normal.dot(rayDirection) < 0.
	*/
	var skipBackfaces : Bool;

	var collisionFilterMask : Float;

	var collisionFilterGroup : Float;

	/**
		The intersection mode. Should be Ray.ANY, Ray.ALL or Ray.CLOSEST.
	*/
	var mode : Float;

	/**
		Current result object.
	*/
	var result : RaycastResult;

	/**
		Will be set to true during intersectWorld() if the ray hit anything.
	*/
	var hasHit : Bool;

	/**
		Current, user-provided result callback. Will be used if mode is Ray.ALL.
	*/
	var callback : Void->Void;

	function new( from : Vec3, to : Vec3 ) : Void;

	/**
		Do itersection against all bodies in the given World.
	*/
	function intersectWorld( world : World, options : Dynamic ) : Bool;

	/**
		Shoot a ray at a body, get back information about the hit.
	*/
	function intersectBody( body : Body, result : RaycastResult ) : Void;

	function intersectBodies( bodies : Array<Dynamic>, result : RaycastResult ) : Void;

	/**
		Updates the _direction vector.
	*/
	function _updateDirection() : Void;

	function intersectShape( shape : Shape, quat : Quaternion, position : Vec3, body : Body ) : Void;

	function intersectBox( shape : Shape, quat : Quaternion, position : Vec3, body : Body ) : Void;

	function intersectPlane( shape : Shape, quat : Quaternion, position : Vec3, body : Body ) : Void;

	/**
		Get the world AABB of the ray.
	*/
	function getAABB( aabb : AABB ) : Void;

	function intersectHeightfield( shape : Shape, quat : Quaternion, position : Vec3, body : Body ) : Void;

	function intersectSphere( shape : Shape, quat : Quaternion, position : Vec3, body : Body ) : Void;

	function intersectConvex( shape : Shape, quat : Quaternion, position : Vec3, body : Body, options : Dynamic ) : Void;

	function intersectTrimesh( shape : Shape, quat : Quaternion, position : Vec3, body : Body, options : Dynamic ) : Void;

	function reportIntersection( normal : Vec3, hitPointWorld : Vec3, shape : Shape, body : Body ) : Bool;

}
