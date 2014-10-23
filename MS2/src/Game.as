package 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author Rob
	 */
	public class Game extends Sprite
	{
		//assets
		private var sky:Sky;
		private var ground:Ground;
		private var city:City;
		private var turretBase:TurretBase;
		private var turretGun:TurretGun;
		private var car:MoveCar;
		private var cloud:MoveCloud;
		
		//Arrays
		private var cities:Array = [];
		private var turrets:Array = [];
		private var turretGuns:Array = [];
		private var missiles:Array = [];
		
		//scripts
		private var incomingMissile:Missile;
		//private var theTurret:Turret
		
		//integers
		private var totalCities:int = 6;
		private var totalTurrets:int = 3;
		private var totalTurretGuns:int = 3;
		private var missileStartPositionX:int;
		private var randomNumber:int;
		
		//Numbers
		private var rotateX:Number;
		private var rotateY:Number;
		
		//Timers
		private var missileTimer:TimerEvent;
		
		//vectors
		private var cars : Vector.<DisplayObject> = new Vector.<DisplayObject>();
	
	public function Game():void
	{
		stage.addEventListener(Event.ENTER_FRAME, update);
		stage.addEventListener(Event.ENTER_FRAME, checkMouse);
		
		//adds the sky to the game
		sky = new Sky();
		sky.scaleX = 3;
		sky.scaleY = 3;
		addChild(sky);
		
		//adds the background to the game
		ground = new Ground();
		ground.scaleX = 2;
		ground.y = 550;
		addChild(ground);
		
		//add the car to the game
		car = new MoveCar( -2.5, 0);
		car.x = 400;
		car.y = 590;
		addChild(car);
		
		//adds the cloud to the game
		cloud = new MoveCloud( -1, 0);
		cloud.x = 900;
		cloud.y = 300;
		addChild(cloud);
		
		//for loop for spawning the cities
		for (var i : int = 0; i < totalCities; i++ )
		{
			spawnCity(i);
		}
		
		//for loop for spawning the turretbases
		for (var i : int = 0; i < totalTurrets; i++ )
		{
			spawnTurret(i);
		}
		
		//for loop for spawning the turretguns
		for (var i : int = 0; i < totalTurretGuns; i++ )
		{
			spawnTurretGun(i);
		}
		
		//spawns a missile if none have been spawned
		var missileTimer = new Timer(2500, 0);
		missileTimer.addEventListener(TimerEvent.TIMER, spawnMissiles);
		missileTimer.start();
	}
	
	//adds the cities to the game
	private function spawnCity(i:int):void
		{
			var city : City = new City();
			city.scaleX = 0.3;
			city.scaleY = 0.3;
			city.x = stage.stageWidth / 6 * i + 65; 
			city.y = 565;
			addChild(city);
			cities.push(city);
		}
		
	//adds the turretbases to the game	
	private function spawnTurret(i:int):void
		{
			var turretBase : TurretBase = new TurretBase();
			turretBase.scaleX = 0.4;
			turretBase.scaleY = 0.4;
			turretBase.x = stage.stageWidth / 3 * i + 130; 
			turretBase.y = 565;
			addChild(turretBase);
			turrets.push(turretBase);
		}
		
	//adds the turretbases to the game	
	private function spawnTurretGun(i:int):void
		{
			var turretGun : TurretGun = new TurretGun();
			turretGun.scaleX = 0.4;
			turretGun.scaleY = 0.4;
			turretGun.x = stage.stageWidth / 3 * i + 130; 
			turretGun.y = 525;
			addChild(turretGun);
			turretGuns.push(turretGun);
		}
		
	//adds the missiles to the game
	private function spawnMissiles(e:TimerEvent):void
		{
			//assigns a target to the missile
			incomingMissile = new Missile(cities[Math.floor(Math.random() * cities.length)]);
		
			//chooses a random start position for the missile
			randomNumber = Math.floor((Math.random() * 6) + 1);
			if (randomNumber == 1)
			{
			missileStartPositionX = 130;
			}
		
			else if (randomNumber == 2)
			{
			missileStartPositionX = 260;
			}
		
			else if (randomNumber == 3)
			{
			missileStartPositionX = 390;
			}
			
			else if (randomNumber == 4)
			{
			missileStartPositionX = 520;
			}
			
			else if (randomNumber == 5)
			{
			missileStartPositionX = 650;
			}
			
			else if (randomNumber == 6)
			{
			missileStartPositionX = 780;
			}
		
			//gives the missile the position
			incomingMissile.x = missileStartPositionX;
			
			//adds the missile to the game
			addChild(incomingMissile);
			
			//puts the missiles in the 
			missiles.push(incomingMissile);
		
		}
	
	//the update
	private function update(E:Event):void
		{
			//updates the missiles
			for (var i:int = 0; i < missiles.length; i++) 
			{
				missiles[i].update();
			}
			
			//updates the car
			car.update(); 
			
			//updates the cloud
			cloud.update();
		}
	
	//the mouse rotation check
	private function checkMouse(E:Event):void
		{
			rotateX = mouseX - turretGun.x;
			rotateY = mouseY - turretGun.y;
			turretGun.rotation = (Math.atan2(rotateX, rotateY) * 180 / Math.PI);
		}
	
	}
	
}