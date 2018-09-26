int DIE_SIZE = 50;
int dies = 9;
PImage surface;

void setup()
{
	size(500, 500);
	noLoop();
	surface = loadImage("surface.jpg");
}
void draw()
{
	background(0);
	image(surface, 0, 0, width, height);
	translate(250, 250);
	rotate(PI / 4);
	for (int i = 0; i < dies; i++)
	{
		Die die1 = new Die(0, 0, (int)(Math.random() * 6) + 1);
		die1.show();
	}
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
		fill(255);
		rect(0 - halfDieSize, 0 - halfDieSize, DIE_SIZE, DIE_SIZE, DIE_SIZE / 5);
		fill(0);
		//middle: 1, 3, 5
		if (myDots == 1 || myDots == 3 || myDots == 5) 
		{
			ellipse(0, 0, dotSize, dotSize);
		}
		//top left and bottom right: 2, 3, 4, 5, 6
		if (myDots >= 2) 
		{
			ellipse(-2 * dotIncrement, -2 * dotIncrement, dotSize, dotSize);
			ellipse(2 * dotIncrement, 2 * dotIncrement, dotSize, dotSize);
		}
		//top right and bottom left: 4, 5, 6
		if (myDots >= 4) 
		{
			ellipse(2 * dotIncrement, -2 * dotIncrement, dotSize, dotSize);
			ellipse(-2 * dotIncrement, 2 * dotIncrement, dotSize, dotSize);
		}
		//middle left and right: 6
		if (myDots == 6) 
		{
			ellipse(-2 * dotIncrement, 0, dotSize, dotSize);
			ellipse(2 * dotIncrement, 0, dotSize, dotSize);
		}
	}
}
