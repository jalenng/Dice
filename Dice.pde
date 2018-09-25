int DIE_SIZE = 100;
void setup()
{
	size(500, 500);
	noLoop();
}
void draw()
{
	background(0);
	Die die1 = new Die(width / 2, height / 2, (int)(Math.random() * 5) + 1);
	die1.show();
}
void mousePressed()
{
	redraw();
}
class Die //models one single dice cube
{
	int myX, myY, myDots;
	int halfDieSize = (int)(DIE_SIZE / 2);
	int dotIncrement = (int)(DIE_SIZE / 7);
	int dotSize = (int)(DIE_SIZE / 5);
	
	Die(int x, int y, int dots) //constructor
	{
		myX = x;
		myY = y;
		myDots = dots;
	}
	void roll()
	{
		//your code here
	}
	void show()
	{
		rect(myX - halfDieSize, myY - halfDieSize, DIE_SIZE, DIE_SIZE, DIE_SIZE / 5);
		fill(0);
		//middle: 1, 3, 5
		if (myDots == 1 || myDots == 3 || myDots == 5) {
			ellipse(myX, myY, dotSize, dotSize);
		}
		//top left and bottom right: 2, 3, 4, 5, 6
		if (myDots) {
			ellipse(myX, myY, dotSize, dotSize);
		}
		//top right and bottom left: 4, 5, 6
		if (myDots >= 3) {
			ellipse(myX - 2 * dotIncrement, myY - 2 * dotIncrement, dotSize, dotSize);
			ellipse(myX + 2 * dotIncrement, myY + 2 * dotIncrement, dotSize, dotSize);
		}
		//middle left and right: 6
		if (myDots == 3) {
			ellipse(myX - 2 * dotIncrement, myY - 2 * dotIncrement, dotSize, dotSize);
			ellipse(myX, myY, dotIncrement, dotIncrement);
			ellipse(myX + 2 * dotIncrement, myY + 2 * dotIncrement, dotSize, dotSize);
		}
	}
}
