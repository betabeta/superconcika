package
{
	import org.flixel.FlxSprite;

	public class SupermanPunch extends FlxSprite
	{
		public function SupermanPunch(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super(X, Y, SimpleGraphic);
			height = 10;
			width = 10; 
			fixed = true;
			//visible = false;
			solid = true;
		}
		
		public function appear(X:Number, Y:Number):void
		{
			x = X;
			y = Y;
		}
		
	}
}