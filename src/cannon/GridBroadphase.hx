package cannon;

/**
	Axis aligned uniform grid broadphase.
*/
@:native("CANNON.GridBroadphase")
extern class GridBroadphase extends Broadphase {

	function new( aabbMin : Vec3, aabbMax : Vec3, nx : Float, ny : Float, nz : Float ) : Void;

	/**
		Get all the collision pairs in the physics world
	*/
	override function collisionPairs( world : World, pairs1 : Array<Dynamic>, pairs2 : Array<Dynamic> ) : Void;

}
