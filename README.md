# Dynamics-Project
## Honors conversion project 

The goal of this project was to create a matlab function that could determine the X and Y
components of force required to move a particle along a given path.  The function (called
"motion") requires that you give it a time range, a function that gives the position of x,
a function that gives the position of y, and a mass of the particle *An explanation of
what each step of the function is doing can be seen directly in the matlab script *

Initially I gave these inputs: 

```
t= [0:5]
x=3t^3 = [0, 3, 24, 81, 192, 375]
y=4t^2 = [0, 4, 16, 36, 64, 100]
m=6
```

Using my knowledge on how to calculate velocity and acceleration based on position, I was assuming my outputs would look something like this:
      Vx = dx/dt = 9t^2 = [0,9,36,81,144,225] -- Since the derivative of a cubic function is a 2nd degree function, I expected this result
      Vy = dy/dt = 8t = [0,8,16,24,32,40] -- Since the derivate of a 2nd degree function is linear, I expected this result
      ax = dVx/dt = 18t = [0,18,36,54,72,90] -- The derivative of a 2nd degree function is linear, I expected this result
      ay = dVy/dt = 8 = [8,8,8,8,8,8] -- The derivative of a linear function is constant, I expected this result 
      Fx = m * ax = [0,108,216,324,432,540]
      Fy = m * ay = [48,48,48,48,48,48]
      
However, when running the function the actual outputs are: 
      Vx = [3,21,57,111,183] -- different
      Vy = [4,12,20,28,36] -- different
      ax = [0,18,36,54,72] -- same
      ay = [0,8,8,8,8] -- same
      Fx = [0,108,216,324,432] -- same
      Fy = [0,48,48,48,48] -- same
      
The reason for the discrepencies in the velocity vectors that are outputted is due to the "diff" function in matlab.  This function works by taking two neighboring values in a vector and subtracting them (taking the "difference" between them).  For example, the reason the Vx vector looks like it does is because when looking at the differences in the x vector you get: [3,21,57,111,183] divided by the differences in the time vector, or [1,1,1,1,1]

The solution to this is changing the time vector. 

Instead of having it be 5 seconds with one second difference between each entry,  it should be five seconds with a very small difference in time between each entry. 

To do this you use the function linspace(0,5,500) -- This creates a vector between 0 and 5 with 500 equally spaced entries (or .01 sec between each entry)
        - This results in a vector with values that are basically identical to what I initially expected (I'm not going to list them out, as it is name a 500 column matrix)
        - Example: In the 100th column of new Vx vector (~ 1 sec), the value is 8.95, compared to the expected value of 9. 
        -*This slight difference can be contributed to rounding that is done by matlab

The plot at the end of the function, is simply to show how the force is acting with respect to time.  In this case, the force is increasing linearly in the x direction and is constant in the y direction, just like what was seen earlier. 

Basically any input values can be given to the function and different results will be outputted.  However, here are some things to keep in mind when determining the inputs:
      1) If the x or y position function is not of 2nd order or higher, the Force required will be zero (second derivative of linear function is zero)
      2) The more values in the time matrix, the more accurate your results will be
      3) If position function is value of t, x, or y -- that variable must be defined earlier or the function will give an error
