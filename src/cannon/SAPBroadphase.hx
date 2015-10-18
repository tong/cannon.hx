package cannon;

/**
	Sweep and prune broadphase along one axis.
*/
@:native("CANNON.SAPBroadphase")
extern class SAPBroadphase extends Broadphase {

	/**
		List of bodies currently in the broadphase.
	*/
	var axisList : Array<Dynamic>;

	/**
		The world to search in.
	*/
	//var world : World;

	/**
		Axis to sort the bodies along. Set to 0 for x axis, and 1 for y axis. For best performance, choose an axis that the bodies are spread out more on.
	*/
	var axisIndex : Float;

	function new( ?world : World ) : Void;

	/**
		Change the world
	*/
	override function setWorld( world : World ) : Void;

	static function insertionSortX( a : Array<Dynamic> ) : Array<Dynamic>;

	static function insertionSortY( a : Array<Dynamic> ) : Array<Dynamic>;

	static function insertionSortZ( a : Array<Dynamic> ) : Array<Dynamic>;

	/**
		Collect all collision pairs
	*/
	override function collisionPairs( world : World, p1 : Array<Dynamic>, p2 : Array<Dynamic> ) : Void;

	/**
		Check if the bounds of two bodies overlap, along the given SAP axis.
	*/
	static function checkBounds( bi : Body, bj : Body, axisIndex : Float ) : Bool;

	/**
		Computes the variance of the body positions and estimates the best
axis to use. Will automatically set property .axisIndex.
	*/
	function autoDetectAxis() : Void;

	/**
		Returns all the bodies within an AABB.
	*/
	override function aabbQuery( world : World, aabb : AABB, result : Array<Dynamic> ) : Array<Dynamic>;

}
