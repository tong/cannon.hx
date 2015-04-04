package cannon;

/**
	Naive broadphase implementation, used in lack of better ones.
*/
@:native("CANNON.NaiveBroadphase")
extern class NaiveBroadphase extends Broadphase {

	function new() : Void;

	/**
		Get all the collision pairs in the physics world
	*/
	override function collisionPairs( world : World, pairs1 : Array<Dynamic>, pairs2 : Array<Dynamic> ) : Void;

	/**
		Returns all the bodies within an AABB.
	*/
	override function aabbQuery( world : World, aabb : AABB, result : Array<Dynamic> ) : Array<Dynamic>;

}
