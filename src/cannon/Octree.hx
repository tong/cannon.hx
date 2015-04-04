package cannon;

/**
*/
@:native("CANNON.Octree")
extern class Octree extends OctreeNode {

	/**
		Maximum subdivision depth
	*/
	var maxDepth : Float;

	function new( aabb : AABB, ?options : Dynamic ) : Void;

	/**
		Insert data into this node
	*/
	function insert( aabb : AABB, elementData : Dynamic ) : Bool;

	/**
		Create 8 equally sized children nodes and put them in the .children array.
	*/
	function subdivide() : Void;

	/**
		Get all data, potentially within an AABB
	*/
	function aabbQuery( aabb : AABB, result : Array<Dynamic> ) : Array<Dynamic>;

	/**
		Get all data, potentially intersected by a ray.
	*/
	function rayQuery( ray : Ray, treeTransform : Transform, result : Array<Dynamic> ) : Array<Dynamic>;

	function removeEmptyNodes() : Void;

}
