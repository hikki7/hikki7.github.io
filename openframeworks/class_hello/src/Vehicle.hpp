//
//  Vehicle.hpp
//  class_hello
//
//  Created by 引田祐樹 on 2018/10/14.
//

#ifndef Vehicle_hpp
#define Vehicle_hpp

#include <stdio.h>
#include <ofMain.h>
#include <stddef.h>

class Vehicle{
    
private:
    ofVec2f location;
    ofVec2f velocity;
    ofVec2f acceleration;
    static const float r=6;
    static const float maxForce=10;
    static const float maxSpeed=0.3;
    static const float d=100;
    
public:
    //コンストラクタ
    Vehicle(float x,float y);
    void update();
    void applyForce(ofVec2f force);
    void bounding();
    void display();
};

#endif /* Vehicle_hpp */
