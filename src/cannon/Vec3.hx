package cannon;

/**
	3-dimensional vector
*/
@:native("CANNON.Vec3")
extern class Vec3 {

	var x : Float;

	var y : Float;

	var z : Float;

	static var ZERO : Vec3;

	static var UNIT_X : Vec3;

	static var UNIT_Y : Vec3;

	static var UNIT_Z : Vec3;

	function new( ?x : Float, ?y : Float, ?z : Float ) : Void;

	/**
		Vector cross product
	*/
	function cross( v : Vec3, target : Vec3 ) : Vec3;

	/**
		Set the vectors' 3 elements
	*/
	function set( x : Float, y : Float, z : Float ) : Vec3;

	/**
		Set all components of the vector to zero.
	*/
	function setZero() : Void;

	/**
		Vector addition
	*/
	function vadd( v : Vec3, ?target : Vec3 ) : Vec3;

	/**
		Vector subtraction
	*/
	function vsub( v : Vec3, target : Vec3 ) : Vec3;

	/**
		Get the cross product matrix a_cross from a vector, such that a x b = a_cross * b = c
	*/
	function crossmat() : Mat3;

	/**
		Normalize the vector. Note that this changes the values in the vector.
	*/
	function normalize() : Float;

	/**
		Get the version of this vector that is of length 1.
	*/
	function unit( target : Vec3 ) : Vec3;

	/**
		Get the length of the vector
	*/
	function norm() : Float;

	/**
		Get the length of the vector
	*/
	function length() : Float;

	/**
		Get the squared length of the vector
	*/
	function norm2() : Float;

	/**
		Get the squared length of the vector.
	*/
	function lengthSquared() : Float;

	/**
		Get distance from this point to another point
	*/
	function distanceTo( p : Vec3 ) : Float;

	/**
		Get squared distance from this point to another point
	*/
	function distanceSquared( p : Vec3 ) : Float;

	/**
		Multiply all the components of the vector with a scalar.
	*/
	function mult( scalar : Float, target : Vec3 ) : Vec3;

	/**
		Multiply the vector with a scalar.
	*/
	function scale( scalar : Float, target : Vec3 ) : Vec3;

	/**
		Calculate dot product
	*/
	function dot( v : Vec3 ) : Float;

	function isZero() : Bool;

	/**
		Make the vector point in the opposite direction.
	*/
	function negate( target : Vec3 ) : Vec3;

	/**
		Compute two artificial tangents to the vector
	*/
	function tangents( t1 : Vec3, t2 : Vec3 ) : Void;

	/**
		Converts to a more readable format
	*/
	function toString() : String;

	/**
		Converts to an array
	*/
	function toArray() : Array<Dynamic>;

	/**
		Copies value of source to this vector.
	*/
	function copy( source : Vec3 ) : Vec3;

	/**
		Do a linear interpolation between two vectors
	*/
	function lerp( v : Vec3, t : Float, target : Vec3 ) : Void;

	/**
		Check if a vector equals is almost equal to another one.
	*/
	function almostEquals( v : Vec3, precision : Float ) : Bool;

	/**
		Check if a vector is almost zero
	*/
	function almostZero( precision : Float ) : Void;

	/**
		Check if the vector is anti-parallel to another vector.
	*/
	function isAntiparallelTo( v : Vec3, precision : Float ) : Bool;

	/**
		Clone the vector
	*/
	function clone() : Vec3;

}
