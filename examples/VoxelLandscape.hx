
extern class VoxelLandscape {
	var boxes : Array<Dynamic>;
	var sx : Float;
	var sy : Float;
	var sz : Float;
	function new( world : cannon.World, nx : Float, ny : Float, nz : Float, sx : Float, sy : Float, sz : Float ) : Void;
	function setFilled( xi : Int, yi : Int, zi : Int , filled : Bool ) : Void;
	function update() : Void;
}
