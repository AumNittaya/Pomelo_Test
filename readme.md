# How to execute automated script

## Installation Guide

1. Install Python from this site https://www.python.org/downloads/
2. Install Visual Studio Code or other code editor
3. Install list of robotframework libraries by follow this command below
```
pip install -r (your location)/Pomelo/requirements.txt
```

## Execute Automated Script Instruction

1. Open your code editor then open the project folder
2. Open InitialVariable.example.robot file
3. Change {{youremail}} to your email of your membership on Pomelo site
4. Change {{yourpassword}} to your password of your membership on Pomelo site
5. Save InitialVariable.example.robot file
6. Run this command below
```
robot --outputdir .\Results .\Test\Pomelo.robot
```
7. View the result of test case execution from Test Result sheet from Test_Case.xlsx after finish execution
