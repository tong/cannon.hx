package cannon;

/**
	A 3x3 matrix.
*/
@:native("CANNON.Mat3")
extern class Mat3 {

	/**
		A vector of length 9, containing all matrix elements
	*/
	var elements : Array<Dynamic>;

	function new( array : Dynamic ) : Void;

	/**
		Sets the matrix to identity
	*/
	function identity() : Void;

	/**
		Set all elements to zero
	*/
	function setZero() : Void;

	/**
		Sets the matrix diagonal elements from a Vec3
	*/
	function setTrace( vec3 : Vec3 ) : Void;

	/**
		Gets the matrix diagonal elements
	*/
	function getTrace() : Vec3;

	/**
		Matrix-Vector multiplication
	*/
	function vmult( v : Vec3, target : Vec3 ) : Void;

	/**
		Matrix-scalar multiplication
	*/
	function smult( s : Float ) : Void;

	/**
		Matrix multiplication
	*/
	function mmult( m : Mat3 ) : Mat3;

	/**
		Scale each column of the matrix
	*/
	function scale( v : Vec3 ) : Mat3;

	/**
		Solve Ax=b
	*/
	function solve( b : Vec3, target : Vec3 ) : Vec3;

	/**
		Get an element in the matrix by index. Index starts at 0, not 1!!!
	*/
	function e( row : Float, column : Float, value : Float ) : Float;

	/**
		Copy another matrix into this matrix object.
	*/
	function copy( source : Mat3 ) : Mat3;

	/**
		Returns a string representation of the matrix.
	*/
	function toString() : String;

	/**
		reverse the matrix
	*/
	function reverse( target : Mat3 ) : Mat3;

	/**
		Set the matrix from a quaterion
	*/
	function setRotationFromQuaternion( q : Quaternion ) : Void;

	/**
		Transpose the matrix
	*/
	function transpose( target : Mat3 ) : Mat3;

}
