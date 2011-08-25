package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class Cop2 extends FlxSprite
	{
		[Embed(source="../slikice/cop_stick.png")]
		private var imgcop2:Class;
		
		public function Cop2(X:Number=0, Y:Number=0)
		{
			super(X,Y);
			
			loadGraphic(imgcop2, true, false, 29, 25);
			addAnimation("walking right", [1,2], 6);
			addAnimation("walking left", [3,4], 6);
			addAnimation("normal", [0]);
			addAnimation("pendrek right", [5,6,7,8,8,8], 6, false);
			addAnimation("pendrek left", [9,10,11,12,12,12], 6, false);
			
			offset.x = 9;
			width = 12;
			facing = RIGHT;
			acceleration.y = 200;
			velocity.x = 50;
		}
		
		override public function update():void
		{
			
			if(x >= 300)
			{
				velocity.x = -50;
				facing = LEFT;
			}
			else if(x < 40)
			{
				velocity.x = 50;
				facing = RIGHT;
			}
			
			if (facing == LEFT)
			{
				play("walking left");
			}
			else
			{
				play("walking right");
			}
			
			super.update();
		} 

	}

}