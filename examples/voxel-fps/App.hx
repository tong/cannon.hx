
import js.Browser.document;
import js.Browser.window;
import three.Three;

class App {

	static var camera : PerspectiveCamera;
	static var scene : Scene;
	static var renderer : WebGLRenderer;
	static var geometry : Geometry;
	static var material : MeshLambertMaterial;
	static var mesh : Mesh;
	static var boxMeshes : Array<Mesh>;

	static var world : cannon.World;
	static var sphereShape : cannon.Sphere;
	static var sphereBody : cannon.Body;
	static var physicsMaterial : cannon.Material;
	static var voxels : VoxelLandscape;
	static var groundBody : cannon.Body;

	static var controls : PointerLockControls;
	static var time = Date.now().getTime();

	static var balls : Array<cannon.Body>;
	static var ballMeshes : Array<Mesh>;

	static var dt = 1/60;

	static function initCannon() {

		world = new cannon.World();
		world.quatNormalizeSkip = 0;
		world.quatNormalizeFast = false;

		var solver = new cannon.GSSolver();

		world.defaultContactMaterial.contactEquationStiffness = 1e9;
		world.defaultContactMaterial.contactEquationRelaxation = 4;

		solver.iterations = 7;
		solver.tolerance = 0.1;
		var split = true;
		if( split )
		    world.solver = cast new cannon.SplitSolver( solver );
		else
		    world.solver = solver;

		world.gravity.set( 0, -20, 0 );
		world.broadphase = new cannon.NaiveBroadphase();

		// Create a slippery material (friction coefficient = 0.0)
		physicsMaterial = new cannon.Material( "slipperyMaterial" );
		var physicsContactMaterial = new cannon.ContactMaterial( physicsMaterial, physicsMaterial, {friction:0.0, restitution:0.3} );
		world.addContactMaterial( physicsContactMaterial );


		var nx = 50,
			ny = 8,
			nz = 50,
			sx = 0.5,
			sy = 0.5,
			sz = 0.5;

		// Create a sphere
		var mass = 5, radius = 1.3;
		sphereShape = new cannon.Sphere( radius );
		sphereBody = new cannon.Body({mass:mass,material:physicsMaterial});
		sphereBody.addShape( sphereShape );
		sphereBody.position.set( nx*sx*0.5, ny*sy+radius*2, nz*sz*0.5);
		sphereBody.linearDamping = 0.9;
		world.add( sphereBody );

		// Create a plane
		var groundShape = new cannon.Plane();
		groundBody = new cannon.Body({mass:0,material:physicsMaterial});
		groundBody.addShape(groundShape);
		groundBody.quaternion.setFromAxisAngle(new cannon.Vec3(1,0,0),-Math.PI/2);
		groundBody.position.set(0,0,0);
		world.add( groundBody );

		voxels = new VoxelLandscape( world, nx, ny, nz, sx, sy, sz );
		for( i in 0...nx ) {
			for( j in 0...ny ) {
				for( k in 0...nz ) {
					var filled = true;
					if( Math.sin(i*0.1)*Math.sin(k*0.1) < j/ny*2-1 )
						filled = false;
					voxels.setFilled(i,j,k,filled);
				}
			}
		}
		voxels.update();

		trace( voxels.boxes.length+" voxel physics bodies" );
	}

	static function init() {

		camera = new PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );

		scene = new Scene();
		scene.fog = new Fog( 0x000000, 0, 500 );

		var ambient = new AmbientLight( 0x111111, 1 );
		scene.add( ambient );

		var light = new SpotLight( 0xffffff );
		light.position.set( 10, 30, 20 );
		light.target.position.set( 0, 0, 0 );
		light.castShadow = true;
		light.shadowCameraNear = 20;
		light.shadowCameraFar = 50;//camera.far;
		light.shadowCameraFov = 40;
		light.shadowBias = 0.1;
		light.shadowDarkness = 0.7;
		light.shadowMapWidth = 2*512;
		light.shadowMapHeight = 2*512;
		scene.add( light );
		//scene.add( new three.CameraHelper( camera ) );

		controls = new PointerLockControls( camera, sphereBody );
		scene.add( controls.getObject() );

		// floor
		geometry = new PlaneGeometry( 300, 300, 50, 50 );
		geometry.applyMatrix( new Matrix4().makeRotationX( - Math.PI / 2 ) );

		material = new MeshLambertMaterial( { color: 0xdddddd } );

		boxMeshes = new Array();

		mesh = new Mesh( geometry, material );
		mesh.position.copy( cast groundBody.position );
		//TODO
		//mesh.castShadow = true;
		//mesh.receiveShadow = true;
		scene.add( mesh );

		for( i in 0...voxels.boxes.length ) {
			var b = voxels.boxes[i];
			var voxelGeometry = new BoxGeometry( voxels.sx*b.nx, voxels.sy*b.ny, voxels.sz*b.nz );
			var voxelMesh = new Mesh( voxelGeometry, material );
			voxelMesh.castShadow = true;
			voxelMesh.receiveShadow = true;
			scene.add( voxelMesh );
			boxMeshes.push( voxelMesh );
		}

		renderer = new WebGLRenderer();
		renderer.shadowMap.enabled = true;
        //renderer.shadowMapSoft = true;
		renderer.setSize( window.innerWidth, window.innerHeight );
		renderer.setClearColor( scene.fog.color, 1 );
		document.body.appendChild( renderer.domElement );

		window.addEventListener( 'resize', onWindowResize, false );
	}

	static function animate( ?_time : Float ) {

		window.requestAnimationFrame( animate );

		if( controls.enabled ) {

			world.step( dt );

			for( i in 0...balls.length ) {
				ballMeshes[i].position.copy( untyped balls[i].position);
                ballMeshes[i].quaternion.copy( untyped balls[i].quaternion);
			}

			for( i in 0...voxels.boxes.length ) {
				boxMeshes[i].position.copy( untyped voxels.boxes[i].position );
				boxMeshes[i].quaternion.copy( untyped voxels.boxes[i].quaternion );
			}
		}

		controls.update( Date.now().getTime() - time );
		renderer.render( scene, camera );
		time = Date.now().getTime();
	}

	static function onWindowResize(e) {
		camera.aspect = window.innerWidth / window.innerHeight;
		camera.updateProjectionMatrix();
		renderer.setSize( window.innerWidth, window.innerHeight );
	}

	static function main() {

		window.onload = function(_) {

			var blocker = document.getElementById( 'blocker' );
			var instructions = document.getElementById( 'instructions' );

			var havePointerLock = untyped __js__("'pointerLockElement' in document || 'mozPointerLockElement' in document || 'webkitPointerLockElement' in document");
			if( havePointerLock ) {
				var element = document.body;
				var pointerlockchange = function(event) {
					if( untyped document.pointerLockElement == element ||
						untyped document.mozPointerLockElement == element ||
						untyped document.webkitPointerLockElement == element ) {
					    controls.enabled = true;
					    blocker.style.display = 'none';
					} else {
					    controls.enabled = false;
					    blocker.style.display = '-webkit-box';
					    blocker.style.display = '-moz-box';
					    blocker.style.display = 'box';
					    instructions.style.display = '';
					}
				}
				var pointerlockerror = function(event) {
					instructions.style.display = '';
				}

				document.addEventListener( 'pointerlockchange', pointerlockchange, false );
				document.addEventListener( 'mozpointerlockchange', pointerlockchange, false );
				document.addEventListener( 'webkitpointerlockchange', pointerlockchange, false );

				document.addEventListener( 'pointerlockerror', pointerlockerror, false );
				document.addEventListener( 'mozpointerlockerror', pointerlockerror, false );
				document.addEventListener( 'webkitpointerlockerror', pointerlockerror, false );

				instructions.addEventListener( 'click', function(event) {
					instructions.style.display = 'none';
					untyped __js__('element.requestPointerLock = element.requestPointerLock || element.mozRequestPointerLock || element.webkitRequestPointerLock');
					element.requestPointerLock();
				});
			} else {
				instructions.innerHTML = 'Your browser doesn\'t seem to support Pointer Lock API';
			}

			balls = [];
			ballMeshes = [];

			var ballShape = new cannon.Sphere(0.2);
			var ballGeometry = new SphereGeometry( ballShape.radius );
			var shootDirection = new Vector3();
            var shootVelo = 15;

			function getShootDir( targetVec : Vector3 ) {
				var vector = targetVec;
		        targetVec.set(0,0,1);
				vector.unproject( camera );
		        var ray = new three.Ray( untyped sphereBody.position, vector.sub( untyped sphereBody.position ).normalize() );
		        targetVec.x = ray.direction.x;
		        targetVec.y = ray.direction.y;
		        targetVec.z = ray.direction.z;
		    }

			window.addEventListener( "click", function(e){
				if( controls.enabled ) {
					var x = sphereBody.position.x;
					var y = sphereBody.position.y;
					var z = sphereBody.position.z;
					var ballBody = new cannon.Body({ mass: 1 });
					ballBody.addShape(ballShape);
					var ballMesh = new Mesh( ballGeometry, material );
					world.add(ballBody);
					scene.add(ballMesh);
					ballMesh.castShadow = true;
					ballMesh.receiveShadow = true;
					balls.push(ballBody);
					ballMeshes.push(ballMesh);
					getShootDir(shootDirection);
					ballBody.velocity.set(  shootDirection.x * shootVelo,
											shootDirection.y * shootVelo,
											shootDirection.z * shootVelo);
					// Move the ball outside the player sphere
					x += shootDirection.x * (sphereShape.radius*1.02 + ballShape.radius);
					y += shootDirection.y * (sphereShape.radius*1.02 + ballShape.radius);
					z += shootDirection.z * (sphereShape.radius*1.02 + ballShape.radius);
					ballBody.position.set(x,y,z);
					ballMesh.position.set(x,y,z);
				}
			});

			initCannon();
			init();
			animate();

		}
	}

}
