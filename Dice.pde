int DIE_SIZE = 50;
int numberOfDice = 10;
int[] data = new int[5 * numberOfDice];
int speed;
int total;
PImage surface;

void setup()
{
	size(500, 500);
	surface = loadImage("surface.jpg");
}
void draw()
{
	image(surface, 0, 0, width, height);
	initiateDice();
	animate();
}
void initiateDice() 
{
	for (int i = 0; i < numberOfDice; i++)
	{
		resetMatrix();
		int x = data[(5 * i)];
		int y = data[(5 * i) + 1];
		int dots = data[(5 * i) + 2];
		int rotation = data[(5 * i) + 3];
		int size = data[(5 * i) + 4];
		Die die1 = new Die(x, y, dots, rotation, size);
		die1.show();
		resetMatrix();
	}
}
void roll()
{
	total = 0;
	speed = 30;
	for(int i = 0; i < numberOfDice; i++)
	{
		data[(5 * i)] = (int)(Math.random() * 11) * ((width - DIE_SIZE) / 10) + (DIE_SIZE / 2); //x
		data[(5 * i) + 1] = (int)(Math.random() * 11) * ((height - DIE_SIZE) / 10) + (DIE_SIZE / 2); //y
		data[(5 * i) + 2] = (int)(Math.random() * 6) + 1; //dots
		total += data[(5 * i) + 2]; //counts dots
		data[(5 * i) + 3] = (int)(Math.random() * 360); //rotation
		data[(5 * i) + 4] = DIE_SIZE * 10; //size
	}
}
void animate()
{
	for(int i = 0; i < numberOfDice; i++)
	{
		data[(5 * i) + 3] += speed; //rotation
		data[(5 * i) + 4] -= speed; //size
	}
	if (speed > 0)
	{
		speed -= 1;
	}
	else
	{
		fill(255, 255, 255, 220);
		if (total != 0)
		{
			textSize(20);
			text(numberOfDice + " dice", 5, height - 45);
			text("total: " + total, 5, height - 25);
			text("click to roll again", 5, height - 5);
		}
		else
		{
			textSize(32);
			text("click to roll", width / 2 - 80, height / 2 + 16);	
		}
	}
}
void mousePressed()
{
	roll();
}
class Die //models one single dice cube
{
	int myX, myY, myDots, myRotation, mySize;
	int halfDieSize, dotIncrement, dotSize;
	
	Die(int x, int y, int dots, int rotation, int size) //constructor
	{
		myX = x;
		myY = y;
		myDots = dots;
		myRotation = rotation;
		mySize = size;
		halfDieSize = (int)(mySize / 2);
		dotIncrement = (int)(mySize / 7);
		dotSize = (int)(mySize / 5);
	}
	void show()
	{
		translate(myX, myY);
		rotate(myRotation * 0.0174532925);
		fill(255);
		rect(0 - halfDieSize, 0 - halfDieSize, mySize, mySize, mySize / 5);
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