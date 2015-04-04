package cannon;

/**
	Axis aligned bounding box class.
*/
@:native("CANNON.AABB")
extern class AABB {

	/**
		The lower bound of the bounding box.
	*/
	var lowerBound : Vec3;

	/**
		The upper bound of the bounding box.
	*/
	var upperBound : Vec3;

	function new( ?options : Dynamic ) : Void;

	/**
		Set the AABB bounds from a set of points.
	*/
	function setFromPoints( points : Array<Dynamic>, position : Vec3, quaternion : Quaternion, skinSize : Float ) : AABB;

	/**
		Copy bounds from an AABB to this AABB
	*/
	function copy( aabb : AABB ) : AABB;

	/**
		Clone an AABB
	*/
	function clone() : Void;

	/**
		Extend this AABB so that it covers the given AABB too.
	*/
	function extend( aabb : AABB ) : Void;

	/**
		Returns true if the given AABB overlaps this AABB.
	*/
	function overlaps( aabb : AABB ) : Bool;

	/**
		Returns true if the given AABB is fully contained in this AABB.
	*/
	function contains( aabb : AABB ) : Bool;

	function getCorners( a : Vec3, b : Vec3, c : Vec3, d : Vec3, e : Vec3, f : Vec3, g : Vec3, h : Vec3 ) : Void;

	/**
		Get the representation of an AABB in another frame.
	*/
	function toLocalFrame( frame : Transform, target : AABB ) : AABB;

	/**
		Get the representation of an AABB in the global frame.
	*/
	function toWorldFrame( frame : Transform, target : AABB ) : AABB;

}
