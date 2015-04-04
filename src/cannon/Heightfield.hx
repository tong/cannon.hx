package cannon;

/**
	Heightfield shape class. Height data is given as an array. These data points are spread out evenly with a given distance.
*/
@:native("CANNON.Heightfield")
extern class Heightfield extends Shape {

	/**
		An array of numbers, or height values, that are spread out along the x axis.
	*/
	var data : Array<Dynamic>;

	/**
		Max value of the data
	*/
	var maxValue : Float;

	/**
		Max value of the data
	*/
	var minValue : Float;

	/**
		The width of each element
	*/
	var elementSize : Float;

	function new( data : Array<Dynamic>, options : Dynamic ) : Void;

	/**
		Call whenever you change the data array.
	*/
	function update() : Void;

	/**
		Update the .minValue property
	*/
	function updateMinValue() : Void;

	/**
		Update the .maxValue property
	*/
	function updateMaxValue() : Void;

	/**
		Set the height value at an index. Don't forget to update maxValue and minValue after you're done.
	*/
	function setHeightValueAtIndex( xi : Int, yi : Int, value : Float ) : Void;

	/**
		Get max/min in a rectangle in the matrix data
	*/
	function getRectMinMax( iMinX : Int, iMinY : Int, iMaxX : Int, iMaxY : Int, result : Array<Dynamic> ) : Array<Dynamic>;

	/**
		Get the index of a local position on the heightfield. The indexes indicate the rectangles, so if your terrain is made of N x N height data points, you will have rectangle indexes ranging from 0 to N-1.
	*/
	function getIndexOfPosition( x : Float, y : Float, result : Array<Dynamic>, clamp : Bool ) : Bool;

	/**
		Get a triangle in the terrain in the form of a triangular convex shape.
	*/
	function getConvexTrianglePillar( i : Int, j : Int, getUpperTriangle : Bool ) : Void;

}
