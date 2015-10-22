float x=200;
float y=200;
float globx=200;
float globy=200;
float agl=0;
int globclr=100;
int globsiz=0;
int colr=color(0,0,0,10);
Particle [] mini; 
public void setup()
{
	frameRate(30);
	size(400,400);

	mini=new Particle[20];
	for (int i=0;i<mini.length;i++){
	 mini[i]=new NormalParticle();
	 mini[1]=new OddballParticle();
	 mini[2]=new JumboParticle();
	}
}
interface Particle{
public void move();
public void show();
}

public void draw()
{
	noStroke();
	agl++;
	if(globclr<-1){
	globclr=100;
	globsiz=0;
	}
	else {
		globclr=globclr-1;
	}
	globsiz=globsiz+1;
	fill(colr);
	rect(0,0,400,400);
	for (int i=0;i<mini.length;i++){
	mini[i].show();
	mini[i].move();
}
}
class NormalParticle implements Particle 
{
	float myX;
	float myY;
	float myspd;
	float myagl;
	float mysiz;
	NormalParticle(){
	myX=x;
	myY=y;
	myagl=agl=0;
	myX=200;
	myY=200;
	mysiz=20;
	agl=(float)(Math.random()*2*PI)-PI;


	//outx=(float)Math.cos(agl);
	//outy=(float)Math.sin(agl);
	//outx++;
	//outy++;
	}
	public void show(){
		fill((float)Math.random()*255,(float)Math.random()*255,(float)Math.random()*255);
		ellipse(myX,myY,10,10);	
	}
	public void move(){
		//myspd=(int)(Math.random()*31)-15;
		//myspd=myspd+1;
		agl++;
		myX=myX+(float)Math.cos(agl)*mysiz;
		myY=myY+(float)Math.sin(agl)*mysiz;
	}
	//your code here
}


{

	//your code here
}
class OddballParticle implements Particle //uses an interface
{
	float oX=globx;
	float oY=globy;
	float ospd=50;
	float oagl=(float)PI;

	public void show(){
	fill(255);
	ellipse(oX-55,oY+20,10,10);
	}
	public void move(){
	oagl++;
	oX=oX+((float)Math.cos(oagl)*ospd)+((float)Math.cos(oagl)*ospd);
	oY=oY+((float)Math.sin(oagl)*ospd)+((float)Math.cos(oagl)*ospd);
	if(oX>400){
		oX=0;
		oY=0;
	}
	}
	//your code here
}
class JumboParticle extends NormalParticle//uses inheritance
{
	public void show(){
	fill(255,255,0,globclr);
	ellipse(200,200,globsiz,globsiz);
	}
	public void move(){
	myX=globx+100;
	myY=globy+80;
	}
	//your code here
}