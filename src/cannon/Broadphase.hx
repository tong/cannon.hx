package cannon;

/**
	Base class for broadphase implementations
*/
@:native("CANNON.Broadphase")
extern class Broadphase {

	/**
		The world to search for collisions in.
	*/
	var world : World;

	/**
		If set to true, the broadphase uses bounding boxes for intersection test, else it uses bounding spheres.
	*/
	var useBoundingBoxes : Bool;

	/**
		Set to true if the objects in the world moved.
	*/
	var dirty : Bool;

	function new() : Void;

	/**
		Get the collision pairs from the world
	*/
	function collisionPairs( world : World, p1 : Array<Dynamic>, p2 : Array<Dynamic> ) : Void;

	/**
		Check if a body pair needs to be intersection tested at all.
	*/
	function needBroadphaseCollision( bodyA : Body, bodyB : Body ) : Bool;

	/**
		Check if the bounding volumes of two bodies intersect.
	*/
	function intersectionTest( bodyA : Body, bodyB : Body, pairs1 : Array<Dynamic>, pairs2 : Array<Dynamic> ) : Void;

	/**
		Check if the bounding spheres of two bodies are intersecting.
	*/
	function doBoundingSphereBroadphase( bodyA : Body, bodyB : Body, pairs1 : Array<Dynamic>, pairs2 : Array<Dynamic> ) : Void;

	/**
		Check if the bounding boxes of two bodies are intersecting.
	*/
	function doBoundingBoxBroadphase( bodyA : Body, bodyB : Body, pairs1 : Array<Dynamic>, pairs2 : Array<Dynamic> ) : Void;

	/**
		Removes duplicate pairs from the pair arrays.
	*/
	function makePairsUnique( pairs1 : Array<Dynamic>, pairs2 : Array<Dynamic> ) : Void;

	/**
		To be implemented by subcasses
	*/
	function setWorld( world : World ) : Void;

	/**
		Check if the bounding spheres of two bodies overlap.
	*/
	function boundingSphereCheck( bodyA : Body, bodyB : Body ) : Bool;

	/**
		Returns all the bodies within the AABB.
	*/
	function aabbQuery( world : World, aabb : AABB, result : Array<Dynamic> ) : Array<Dynamic>;

}
