package  
{
	import flash.display.Sprite;

	/**
	 * ...
	 * @author Rob
	 */
	public class MoveCar extends Sprite
	{
		private var _car:Car = new Car;
		private var _carVelocityX:Number;
		private var _carVelocityY:Number;
		
		public function MoveCar(carVelocityX:Number, carVelocityY:Number):void
		{
			_carVelocityX = carVelocityX;
			_carVelocityY = carVelocityY;
			addChild(_car);
		}
		
			public function update():void
		{
			if(x < -100)
			{
				_carVelocityX = Math.abs(_carVelocityX);
			}
			else if(x > 900)
			{
				_carVelocityX = -Math.abs(_carVelocityX); 
			}
			
			if(_carVelocityX > 0)
			{
				scaleX = 1;
			}
			else
			{
				scaleX = -1;
			}
			
			x += _carVelocityX;
			y += _carVelocityY;
		}
		
	}

}