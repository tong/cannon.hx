package cannon;

/**
	Smoothed-particle hydrodynamics system
*/
@:native("CANNON.SPHSystem")
extern class SPHSystem {

	/**
		Density of the system (kg/m3).
	*/
	var density : Float;

	/**
		Distance below which two particles are considered to be neighbors.
It should be adjusted so there are about 15-20 neighbor particles within this radius.
	*/
	var smoothingRadius : Float;

	/**
		Viscosity of the system.
	*/
	var viscosity : Float;

	function new() : Void;

	/**
		Add a particle to the system.
	*/
	function add( particle : Body ) : Void;

	/**
		Remove a particle from the system.
	*/
	function remove( particle : Body ) : Void;

	/**
		Get neighbors within smoothing volume, save in the array neighbors
	*/
	function getNeighbors( particle : Body, neighbors : Array<Dynamic> ) : Void;

}
