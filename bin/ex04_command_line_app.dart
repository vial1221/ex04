import 'dart:math';

// Question1
// Fibonacci serie: 0 1 1 2 3 5 8 13  21  34  55 .... 
// Function returns a string with the fibonacci serie
// function parameter n = number to calculate fibonacci (type integer) 
String fibonacci(int n) {
   var fibn_1 = 1;                // variable used to store f(n-1)
   var fibn_2 = 0;                // variable used to store f(n-2)
   var fibn = 0;                  // variable used to calculated f(n) = f(n-1)+f(n-2)
   String serie;
   
   switch (n){
     case 0:  serie = '0' ;                   // particular case n=0               
              break;
     case 1:  serie = '0 1' ;                 // particular case n=1
              break;        
     default:   serie ='0 1';                 // General case n>=2
                fibn_1=1;                     // Initialize f(n-1) = 1; 
                fibn_2=0;                     // Initialize f(n-2) = 0;
                for (var i=2;i<=n;i++) {
                  fibn=fibn_1+fibn_2;         // f(n) = f(n-1)+f(n-2)
                  fibn_2=fibn_1;              // for next iteration f(n-1) becomes f(n-2) 
                  fibn_1=fibn;                // for next iteration f(n) becomes f(n-1)
                  serie = '$serie $fibn';     // Appendx f(n) to string containing the serie
                }                
   }   
   
   return serie;
}

// Question2
// width parameter: rectangle width
// height parameter: rectangle height
// line_length parameter: length of the line (center point as reference)
// angle parameter: angle of the line
// function returns a string with the line end point coordinates (nortwest corner as reference)
String calcul_line_coordinates(num width, num height, num line_length, num angle){
  var x = 0;
  var y = 0;
  x = (width/2+ line_length*cos(angle*PI/180)).toStringAsFixed(2);
  y = (height/2+ line_length*sin(angle*PI/180)).toStringAsFixed(2);
  return '($x, $y)';
}

//Question 3
// Parameter date1 type DateTime is the birthday
String date_difference(DateTime birthday, DateTime today) {
  int years=0;                                                                // variable used to calculate the number of years elapsed
  int months=0;                                                               // variable used to calculate the number of months elapsed
  int days=0;                                                                 // variable used to calculate the number of days elapsed
  Duration elapsedtime = today.difference(birthday);                          // Duration type variable used to calculate the duration between two dates    
  years= elapsedtime.inDays ~/365.25;                                         // Calculates the number of years elapsed 
  months= (elapsedtime.inDays-365.25*years)~/30.4;                            // Calculates the number of months elapsed from last year
  days = (elapsedtime.inDays-years*365.25 - 30.4*months).toInt();             // Calculates the numner of days elapsed from last month
  return '${years} years ${months} months ${days} days';                      // returns the time elapsed in the required format
}

//Question 4
// rate parameter: interest rate per year (0%-100%)
// years parameter: number of years
// capital parameter: Amount to be used to caculate compound interest
// Function returns a double with total amount of interest for the number of years parameter
double calculinterest(double rate,int years, double capital){
  double futurevalue = 0.0;                     // variable used to calculate the future value of the money
  futurevalue= capital * pow(1  +rate / 100, years);  // FV=PV*(i+1)^n
  
  return futurevalue-capital;                  // return total interest = Future Value - Present Value of money
}

// Question5
// a paramemter: a times table to be calculated
// n parameter: number of terms to be calculated
// function return a string with the a table for the n first parameters
String timetables(int a, int n){
  var result='';
  for(int i=1; i<=n; i++) {
    result='$result $a x $i = ${a*i}\n';
  }
  return result;
}

// main only call function and print results
void main() {
  print('Ex04 Question1 Fibonacci(10): ${fibonacci(10)}');
  print('Ex04 Question2 line end point coordinates (x,y): ${calcul_line_coordinates(800,600,160,45)}');
  print('Ex04 Question3 Elapsed Time from birthday: ${date_difference(new DateTime(1985,12,21),new DateTime.now())}');
  print('Ex04 Question4 compound interest = ${calculinterest(4.8,5,1000.0).toStringAsFixed(2)}');
  print('Ex04 Question5 8 times table 16 first terms: \n ${timetables(8,16)}');
}