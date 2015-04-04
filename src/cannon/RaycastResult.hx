package cannon;

/**
	Storage for Ray casting data.
*/
@:native("CANNON.RaycastResult")
extern class RaycastResult {

	var rayFromWorld : Vec3;

	var rayToWorld : Vec3;

	var hitNormalWorld : Vec3;

	var hitPointWorld : Vec3;

	var hasHit : Bool;

	/**
		The hit shape, or null.
	*/
	var shape : Shape;

	/**
		The hit body, or null.
	*/
	var body : Body;

	/**
		The index of the hit triangle, if the hit shape was a trimesh.
	*/
	var hitFaceIndex : Float;

	/**
		Distance to the hit. Will be set to -1 if there was no hit.
	*/
	var distance : Float;

	/**
		If the ray should stop traversing the bodies.
	*/
	var _shouldStop : Bool;

	function new() : Void;

	/**
		Reset all result data.
	*/
	function reset() : Void;

	function abort() : Void;

	function set( rayFromWorld : Vec3, rayToWorld : Vec3, hitNormalWorld : Vec3, hitPointWorld : Vec3, shape : Shape, body : Body, distance : Float ) : Void;

}
