package cannon;

/**
*/
@:native("CANNON.OctreeNode")
extern class OctreeNode {

	/**
		The root node
	*/
	var root : OctreeNode;

	/**
		Boundary of this node
	*/
	var aabb : AABB;

	/**
		Contained data at the current node level.
	*/
	var data : Array<Dynamic>;

	/**
		Children to this node
	*/
	var children : Array<Dynamic>;

	function new( ?options : Dynamic ) : Void;

}
