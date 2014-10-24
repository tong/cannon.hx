package cannon;

@:native("CANNON.Heightfield")
extern class Heightfield extends Shape {
	var data : Array<Array<Float>>;
	var elementSize : Float;
	var maxValue : Float;
	var minValue : Float;
	var pillarConvex : ConvexPolyhedron;
	var pillarOffset : Vec3;
	function new( data : Array<Array<Float>>, options : Dynamic ) : Void;
	function getConvexTrianglePillar( i : Int, j : Int, getUpperTriangle : Bool ) : Void;
	function getIndexOfPosition( x : Float, y : Float, result : Array<Float>, clamp : Bool ) : Void;
	function getRectMinMax( iMinX : Int, iMinY : Int, iMaxX : Int,  iMaxY : Int, ?result : Array<Float> ) : Void;
	function setHeightValueAtIndex( xi : Int, yi : Int, value : Float ) : Void;
	function update() : Void;
	function updateMaxValue() : Void;
	function updateMinValue() : Void;
}
