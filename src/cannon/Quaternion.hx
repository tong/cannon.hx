package cannon;

/**
	A Quaternion describes a rotation in 3D space. The Quaternion is mathematically defined as Q = x*i + y*j + z*k + w, where (i,j,k) are imaginary basis vectors. (x,y,z) can be seen as a vector related to the axis of rotation, while the real multiplier, w, is related to the amount of rotation.
*/
@:native("CANNON.Quaternion")
extern class Quaternion {

	var x : Float;

	var y : Float;

	var z : Float;

	/**
		The multiplier of the real quaternion basis vector.
	*/
	var w : Float;

	function new( x : Float, y : Float, z : Float, w : Float ) : Void;

	/**
		Set the value of the quaternion.
	*/
	function set( x : Float, y : Float, z : Float, w : Float ) : Void;

	/**
		Convert to a readable format
	*/
	function toString() : String;

	/**
		Convert to an Array
	*/
	function toArray() : Array<Dynamic>;

	/**
		Set the quaternion components given an axis and an angle.
	*/
	function setFromAxisAngle( axis : Vec3, angle : Float ) : Void;

	/**
		Converts the quaternion to axis/angle representation.
	*/
	function toAxisAngle( targetAxis : Vec3 ) : Array<Dynamic>;

	/**
		Set the quaternion value given two vectors. The resulting rotation will be the needed rotation to rotate u to v.
	*/
	function setFromVectors( u : Vec3, v : Vec3 ) : Void;

	/**
		Quaternion multiplication
	*/
	function mult( q : Quaternion, target : Quaternion ) : Quaternion;

	/**
		Get the inverse quaternion rotation.
	*/
	function inverse( target : Quaternion ) : Quaternion;

	/**
		Get the quaternion conjugate
	*/
	function conjugate( target : Quaternion ) : Quaternion;

	/**
		Normalize the quaternion. Note that this changes the values of the quaternion.
	*/
	function normalize() : Void;

	/**
		Approximation of quaternion normalization. Works best when quat is already almost-normalized.
	*/
	function normalizeFast() : Void;

	/**
		Multiply the quaternion by a vector
	*/
	function vmult( v : Vec3, target : Vec3 ) : Vec3;

	/**
		Copies value of source to this quaternion.
	*/
	function copy( source : Quaternion ) : Quaternion;

	/**
		Convert the quaternion to euler angle representation. Order: YZX, as this page describes: http://www.euclideanspace.com/maths/standards/index.htm
	*/
	function toEuler( target : Vec3, string : String ) : Void;

	/**
		See http://www.mathworks.com/matlabcentral/fileexchange/20696-function-to-convert-between-dcm-euler-angles-quaternions-and-euler-vectors/content/SpinCalc.m
	*/
	function setFromEuler( x : Float, y : Float, z : Float, order : String ) : Void;

}
