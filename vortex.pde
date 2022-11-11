int diameter = 780;
int pz       = diameter/2;
int radius   = pz;
int qtPoints = 4321;
int mtpl     = 9;

float pi     = 3.1415926535897932384626f;
float radCl  = pi*2;
float points[] = new float [qtPoints];

void settings()
{
  size(diameter, diameter);
}

void setup()
{
  background(0);
  stroke(255);
  noFill();

  for (int point = 1; point<=qtPoints; point++)
  {
    points[point-1] = (radCl * point/qtPoints);
  }

  circle(pz, pz, diameter);

  stroke(247,122,236);
  strokeWeight(.1);
}

void draw()
{
  int   count          = 1;
  int   countFix       = 0;
  int   countFix_next  = 0;
  float nextX;
  float nextY;
  countFix      = 1;
  for (int i=0; i<=qtPoints+1; i++)
  {
    countFix_next = getNum(countFix*mtpl);
    nextX         = nextX(countFix_next);
    nextY         = nextY(countFix_next);
    line(  pz + radius * sin(points[countFix-1]), pz + radius * cos(points[countFix-1]), nextX, nextY );
    countFix *= mtpl;
    while (countFix >= qtPoints)
    {
      println("--", countFix);
      countFix = getNum(countFix);
    }
    println(countFix);
  }
  stop();
}

float nextX(int countFix)
{
  float position = pz + radius * sin(points[(countFix-1)]);
  return position;
}

float nextY(int countFix)
{
  float position = pz + radius * cos(points[(countFix-1)]);
  return position;
}

int getNum(int count)
{
  int mod   = (count%(qtPoints+1));
  int full  = (count/(qtPoints+1));
  int x     = full + mod;
  while (x > qtPoints)
  {
    x = getNum(x);
  }
  return x;
}

int next(int count)
{
  int r = getNum(count*mtpl);
  return r;
}
